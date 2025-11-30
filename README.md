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

---

## For the Non-Technical Folks (aka "I Just Want It to Work")

Hey there! 👋 So your tech-savvy colleague sent you this link and you're thinking "What is all this terminal gibberish?" Don't worry, I got you. Let's break this down like you're explaining it to your grandma (no offense to tech-savvy grandmas out there).

### Wait, what even IS this thing?

You know how you can set a status on Slack like "In a meeting" or "On vacation"? And GitLab has something similar? Well, this little tool picks a random funny status from a list and sets it for you automatically. That's it. Magic. ✨

### Do I need to know how to code?

Nope! You just need to:
1. Copy some files
2. Paste some secret codes (tokens)
3. Click a button in Raycast

If you can copy-paste and click buttons, you're overqualified.

### Okay, but what's Raycast?

Think of it as Spotlight (that thing you open with Cmd+Space) but on steroids. It's a free Mac app that lets you do stuff faster. [Download it here](https://raycast.com/) if you don't have it yet.

### And what's a "token"?

It's basically a super-secret password that lets this script talk to Slack and GitLab on your behalf. Think of it like giving your assistant a key to your office - they can go in and update stuff for you, but they can't do anything dangerous (hopefully).

### The "I'm Scared of the Terminal" Guide

**Step 1: Get this code on your computer**

Open Terminal (yes, that scary black window). Don't worry, it won't bite. Copy and paste this:

```bash
cd ~/Downloads
git clone https://github.com/jnwrnr/slack-gitlab-status-updater.git
```

Press Enter. Boom, files downloaded.

**Step 2: Install the Python stuff**

Python is probably already on your Mac. Let's install the extra bits this needs:

```bash
cd slack-gitlab-status-updater
pip3 install -r requirements.txt
```

If it says "command not found", try this instead:
```bash
python3 -m pip install -r requirements.txt
```

**Step 3: Get your Slack token (the slightly annoying part)**

1. Go to https://api.slack.com/apps
2. Click "Create New App" → "From scratch"
3. Name it something fun like "Status Bot"
4. Choose your workspace
5. Click "OAuth & Permissions" in the sidebar
6. Scroll down to "Scopes" → "User Token Scopes"
7. Click "Add an OAuth Scope" and add `users.profile:write`
8. Scroll up and click "Install to Workspace"
9. Click "Allow" (yes, you're allowing yourself to update your own status, weird I know)
10. Copy that long token that starts with `xoxp-`

Still with me? Great! You're doing amazing! 🌟

**Step 4: Get your GitLab token (easier than Slack, I promise)**

1. Go to https://gitlab.com/-/user_settings/personal_access_tokens
2. Click "Add new token"
3. Name it "Status Updater" or whatever
4. Check the box that says `api`
5. Pick an expiration date (or don't, live dangerously)
6. Click "Create personal access token"
7. Copy that token (starts with `glpat-`)

**Step 5: Put your tokens in the right place**

In Terminal, still in that folder, type:

```bash
cp .env.example .env
open .env
```

This will open a file. Replace `your-slack-token-here` with your actual Slack token, and `your-gitlab-token-here` with your actual GitLab token. Save and close.

**Step 6: Add it to Raycast**

1. Open Raycast (Cmd+Space, type "Raycast")
2. Type "Script Commands" and press Enter
3. Click the little "+" button
4. Click "Add Script Directory"
5. Navigate to `Downloads/slack-gitlab-status-updater` and select it
6. You're done! 🎉

**Step 7: Actually use the thing**

1. Open Raycast (Cmd+Space or whatever you set it to)
2. Type "Update Weekly Status"
3. Press Enter
4. Check your Slack/GitLab status and feel the dopamine hit

### FAQ (Frequently Asked Confusions)

**Q: Will this mess up my computer?**
A: No. It just updates your Slack and GitLab status. That's literally all it does.

**Q: Can my boss see I'm using this?**
A: These statuses are meant to be humorous, not to hide the fact you're working. Use responsibly. Maybe don't use it during your performance review.

**Q: I did everything and it doesn't work. Help?**
A: Check these things:
- Did you actually save the `.env` file with your real tokens?
- Are your tokens still valid? (They can expire)
- Did you run `pip3 install -r requirements.txt`?
- Are you running it from the right folder?

**Q: Can I add my own funny statuses?**
A: YES! Open `statuses.json` in any text editor and add your own. Just follow the same format as the existing ones.

**Q: This seems complicated. Is there an easier way?**
A: Not really, but think of it this way: you're now "technical enough" to impress people at parties. You installed a script! You used the Terminal! You're basically a hacker now! 🎩

**Q: I broke something.**
A: Just delete the folder and start over. That's the beauty of software - you can always delete it and try again. Unlike that text you sent to your ex.

### Still Confused?

That's okay! Technology is confusing. If you got this far and it's not working, grab a developer friend, buy them a coffee, and have them help you. They'll probably enjoy feeling useful for 5 minutes.

And remember: Every developer you ask for help has, at some point, spent 3 hours debugging something only to realize they forgot to plug it in. We're all just figuring it out as we go.

Good luck! May your statuses be random and your standups survivable. 💪
