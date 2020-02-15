### Slack files remover
* Delete files before 30 days

## Base source code
* https://gist.github.com/jamescmartinez/909401b19c0f779fc9c1

## Slack API
* [files.delete](https://api.slack.com/methods/files.delete)
* [files.list](https://api.slack.com/methods/files.list)
* Note: [all method](https://api.slack.com/methods)

## How to Setup in Slack
* Access [Apps of Slack](https://api.slack.com/apps) page
* Create an App
  * App Name: slack-files-remover(modifiable)
  * Development Slack Workspace: your-work-space-name
* Set Permissions and Install App
  * Scopes > User Token Access > Add OAuth Scope
    * Add 'files:read' and 'files:write'
  * Click 'Install Apps to Workspace'
    * Get OAuth Access Token and Set in 'files-remover.rb'.
    * Note: Token starts with 'xoxp-'

## How to Setup Gems
* $ `bundle install`
* $ `echo 'TOKEN=xoxp-your-slack-token-hogehoge' > .env`

## How to execute
* $ `bundle exec ruby files-remover.rb`

## License
* MIT
