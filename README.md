# Slack & GitLab Status Updater

A Raycast script that randomly updates your Slack and GitLab status with funny work-life messages.

## Features

- Randomly selects from 30+ witty status messages
- Updates both Slack and GitLab simultaneously
- Automatic status expiration (Slack: 5:30 PM, GitLab: 8 hours)
- Avoids recently used statuses
- Easy Raycast integration

## Sample Statuses

- 🔥 "Putting out fires since 9am"
- 🎯 "Missing targets like a Stormtrooper"
- ☕ "Fueled by coffee and compromises"
- 🎲 "Rolling the dice on features"
- 💀 "Survived another standup"
- 🌊 "Drowning in user feedback"

## Requirements

- Python 3.x
- [Raycast](https://raycast.com/) (for macOS)
- Slack workspace with user token
- GitLab account with personal access token

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/jnwrnr/slack-gitlab-status-updater.git
cd slack-gitlab-status-updater
```

### 2. Install dependencies

```bash
pip3 install -r requirements.txt
```

Or install manually:

```bash
pip3 install requests python-dotenv
```

### 3. Configure your tokens

Copy the example environment file and add your tokens:

```bash
cp .env.example .env
```

Edit `.env` and add your tokens:

```
SLACK_USER_TOKEN=xoxp-your-slack-token-here
GITLAB_TOKEN=glpat-your-gitlab-token-here
GITLAB_URL=https://gitlab.com
```

#### Getting a Slack User Token

1. Go to [Slack Apps](https://api.slack.com/apps)
2. Create a new app or select an existing one
3. Go to "OAuth & Permissions"
4. Add the `users.profile:write` scope
5. Install/reinstall the app to your workspace
6. Copy the "User OAuth Token" (starts with `xoxp-`)

#### Getting a GitLab Personal Access Token

1. Go to [GitLab User Settings → Access Tokens](https://gitlab.com/-/user_settings/personal_access_tokens)
2. Create a new token with the `api` scope
3. Copy the token (starts with `glpat-`)

### 4. Set up Raycast

1. Open Raycast
2. Go to Extensions → Script Commands
3. Click "+" → "Add Script Directory"
4. Select the folder containing `update-weekly-status.sh`
5. The command will appear as "Update Weekly Status"

## Usage

### Via Raycast

1. Open Raycast (Cmd+Space or your custom hotkey)
2. Type "Update Weekly Status"
3. Press Enter
4. Your Slack and GitLab status will be updated with a random message

### Via Command Line

You can also run the script directly:

```bash
python3 update_status.py
```

## Customization

### Adding Your Own Statuses

Edit `statuses.json` to add your own messages:

```json
{
  "emoji": ":your_emoji:",
  "text": "Your custom status message",
  "gitlab_emoji": "🎯"
}
```

**Note:**
- `emoji` uses Slack emoji format (`:emoji_name:`)
- `gitlab_emoji` uses the actual emoji character

### Adjusting Expiration Times

Edit `update_status.py`:

- **Slack expiration:** Modify the `get_expiration_timestamp()` function
- **GitLab expiration:** Change `"clear_status_after"` in `update_gitlab_status()`

## How It Works

1. Loads status messages from `statuses.json`
2. Checks `.status_history` to avoid recent duplicates
3. Randomly selects a new status
4. Updates Slack via the Web API
5. Updates GitLab via the REST API
6. Saves the selection to history

## Troubleshooting

### "SLACK_USER_TOKEN not configured"

Make sure you've created a `.env` file with your Slack token.

### "GitLab error: 401"

Your GitLab token may be expired or invalid. Create a new one.

### Raycast can't find the script

Ensure `update-weekly-status.sh` is executable:

```bash
chmod +x update-weekly-status.sh
```

## License

MIT License - feel free to use and modify!

## Contributing

Pull requests are welcome! Feel free to add more funny statuses or improve the code.

## Credits

Created for fun to make status updates more entertaining.
