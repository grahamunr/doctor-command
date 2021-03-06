Feature: Check whether plugins are up to date

  Scenario: Verify check description
    Given an empty directory

    When I run `wp doctor list --fields=name,description`
    Then STDOUT should be a table containing rows:
      | name                       | description                                                                    |
      | plugin-update              | Warns when there are plugin updates available.                                 |

  Scenario: Plugins are up to date
    Given a WP install
    And I run `wp plugin update --all`

    When I run `wp doctor check plugin-update`
    Then STDOUT should be a table containing rows:
      | name          | status  | message                                 |
      | plugin-update | success | Plugins are up to date.                 |

  Scenario: One plugin has an update available
    Given a WP install
    And I run `wp plugin install akismet --version=3.1.10 --force`

    When I run `wp doctor check plugin-update`
    Then STDOUT should be a table containing rows:
      | name          | status  | message                                 |
      | plugin-update | warning | 1 plugin has an update available.       |

  Scenario: One plugin has an update available with recommendation field
    Given a WP install
    And I run `wp plugin install akismet --version=3.1.10 --force`

    When I run `wp doctor check --fields=name,status,message,recommendation plugin-update`
    Then STDOUT should be a table containing rows:
      | name          | status  | message                                 | recommendation  |
      | plugin-update | warning | 1 plugin has an update available.       | Update the akismet plugin. |

  Scenario: One plugin has an update available and the failure_status is 'error'
    Given a WP install
    And a config.yml file:
      """
      plugin-update:
        check: Plugin_Update
        options:
          status_for_failure: error
      """
    And I run `wp plugin install akismet --version=3.1.10 --force`

    When I run `wp doctor check plugin-update --config=config.yml`
    Then STDOUT should be a table containing rows:
      | name          | status  | message                                 |
      | plugin-update | error | 1 plugin has an update available.       |
