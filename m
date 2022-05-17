Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E3B112B8C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 07:28:12 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 May 2022 09:27:55 +0200
Message-Id: <20220517072803.186989-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20220517072803.186989-1-mauro.chehab@linux.intel.com>
References: <20220517072803.186989-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/9] tests/core_hotunplug: properly
 finish processes using audio devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Before unloading or unbinding an audio driver, all processes
that are using it must be terminated. The current logic seeks
only for alsactl, but ignore other processes, including
pulseaudio.

Make the logic more general, extending it to any processes that
could have an open device under /dev/snd.

It should be noticed that some distros like Fedora and openSUSE
are now migrating from pulseaudio into pipewire-pulse. Right
now, there's no standard distribution-agnostic way to request
pipewire-pulse to stop using audio devices, but there's a new
patch upstream that will make things easier:

	https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/6ad6300ec657c88322a8cd6f3548261d3dc05359

Which should be available for pipewire-pulse versions 0.3.50 and
upper.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_aux.c          | 157 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_aux.h          |   1 +
 lib/igt_kmod.c         |  53 ++++++++------
 lib/igt_kmod.h         |   2 +
 tests/core_hotunplug.c |  11 +--
 5 files changed, 196 insertions(+), 28 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 03cc38c93e5c..f56b5a06f100 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -31,6 +31,7 @@
 #endif
 #include <stdio.h>
 #include <fcntl.h>
+#include <pwd.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <string.h>
@@ -1410,6 +1411,162 @@ igt_lsof(const char *dpath)
 	free(sanitized);
 }
 
+static void pulseaudio_unload_module(proc_t *proc_info)
+{
+	char xdg_dir[PATH_MAX];
+	const char *homedir;
+	struct passwd *pw;
+
+	igt_fork(child, 1) {
+		pw = getpwuid(proc_info->euid);
+		homedir = pw->pw_dir;
+		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
+
+		igt_info("Ask pulseaudio to stop using audio device\n");
+
+		setgid(proc_info->egid);
+		setuid(proc_info->euid);
+		clearenv();
+		setenv("HOME", homedir, 1);
+		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
+
+		system("for i in $(pacmd list-sources|grep module:|cut -d : -f 2); do pactl unload-module $i; done");
+	}
+	igt_waitchildren();
+}
+
+/**
+ * __igt_lsof_audio_and_kill_proc() - check if a given process is using an
+ *	audio device. If so, stop or prevent them to use such devices.
+ *
+ * @proc_info: process struct, as returned by readproc()
+ * @proc_path: path of the process under procfs
+ *
+ * No processes can be using an audio device by the time it gets removed.
+ * This function checks if a process is using an audio device from /dev/snd.
+ * If so, it will check:
+ * 	- if the process is pulseaudio, it can't be killed, as systemd will
+ * 	  respawn it. So, instead, send a request for it to stop bind the
+ * 	  audio devices.
+ * If the check fails, it means that the process can simply be killed.
+ */
+static int
+__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
+{
+	const char *audio_dev = "/dev/snd/";
+	char path[PATH_MAX * 2];
+	struct dirent *d;
+	struct stat st;
+	char *fd_lnk;
+	int fail = 0;
+	ssize_t read;
+
+	DIR *dp = opendir(proc_path);
+	igt_assert(dp);
+
+	while ((d = readdir(dp))) {
+		if (*d->d_name == '.')
+			continue;
+
+		memset(path, 0, sizeof(path));
+		snprintf(path, sizeof(path), "%s/%s", proc_path, d->d_name);
+
+		if (lstat(path, &st) == -1)
+			continue;
+
+		fd_lnk = malloc(st.st_size + 1);
+
+		igt_assert((read = readlink(path, fd_lnk, st.st_size + 1)));
+		fd_lnk[read] = '\0';
+
+		if (strncmp(audio_dev, fd_lnk, strlen(audio_dev))) {
+			free(fd_lnk);
+			continue;
+		}
+
+		free(fd_lnk);
+
+		/*
+		 * In order to avoid racing against pa/systemd, ensure that
+		 * pulseaudio will close all audio files. This should be
+		 * enough to unbind audio modules and won't cause race issues
+		 * with systemd trying to reload it.
+		 */
+		if (!strcmp(proc_info->cmd, "pulseaudio")) {
+			pulseaudio_unload_module(proc_info);
+			break;
+		}
+
+		/*
+		 * FIXME: terminating pipewire-pulse is not that easy, as
+		 * pipewire there's no standard way up to pipewire version
+		 * 0.3.49. Just trying to kill pipewire will start a race
+		 * between IGT and systemd. If IGT wins, the audio driver
+		 * will be unloaded before systemd tries to reload it, but
+		 * if systemd wins, the audio device will be re-opened and
+		 * used before IGT has a chance to remove the audio driver.
+		 * Pipewire version 0.3.50 should bring a standard way:
+		 *
+		 * 1) start a thread running:
+		 *	 pw-reserve -n Audio0 -r
+		 * 2) unload/unbind the the audio driver(s);
+		 * 3) stop the pw-reserve thread.
+		 *
+		 * We should add support for it once distros start shipping it.
+		 */
+
+		/* For all other processes, just kill them */
+		igt_info("process %d (%s) is using audio device. Should be terminated.\n",
+				proc_info->tid, proc_info->cmd);
+
+		if (kill(proc_info->tid, SIGTERM) < 0) {
+			igt_info("Fail to terminate %s (pid: %d) with SIGTERM\n",
+				proc_info->cmd, proc_info->tid);
+			if (kill(proc_info->tid, SIGABRT) < 0) {
+				fail++;
+				igt_info("Fail to terminate %s (pid: %d) with SIGABRT\n",
+					proc_info->cmd, proc_info->tid);
+			}
+		}
+
+		break;
+	}
+
+	closedir(dp);
+	return fail;
+}
+
+/*
+ * This function identifies each process running on the machine that is
+ * opening an audio device and tries to stop it.
+ *
+ * Special care should be taken with pipewire and pipewire-pulse, as those
+ * daemons are respanned if they got killed.
+ */
+int
+igt_lsof_kill_audio_processes(void)
+{
+	char path[PATH_MAX];
+	proc_t *proc_info;
+	PROCTAB *proc;
+	int fail = 0;
+
+	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
+	igt_assert(proc != NULL);
+
+	while ((proc_info = readproc(proc, NULL))) {
+		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1)
+			fail++;
+		else
+			fail += __igt_lsof_audio_and_kill_proc(proc_info, path);
+
+		freeproc(proc_info);
+	}
+	closeproc(proc);
+
+	return fail;
+}
+
 static struct igt_siglatency {
 	timer_t timer;
 	struct timespec target;
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 9f2588aeca90..bb96d1afb777 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -306,6 +306,7 @@ bool igt_allow_unlimited_files(void);
 int igt_is_process_running(const char *comm);
 int igt_terminate_process(int sig, const char *comm);
 void igt_lsof(const char *dpath);
+int igt_lsof_kill_audio_processes(void);
 
 #define igt_hweight(x) \
 	__builtin_choose_expr(sizeof(x) == 8, \
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index f252535d5a3a..133d19048a9b 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -389,7 +389,7 @@ igt_i915_driver_load(const char *opts)
 	return 0;
 }
 
-int __igt_i915_driver_unload(const char **who)
+int igt_audio_driver_unload(const char **who)
 {
 	int ret;
 	const char *sound[] = {
@@ -398,6 +398,27 @@ int __igt_i915_driver_unload(const char **who)
 		NULL,
 	};
 
+	for (const char **m = sound; *m; m++) {
+		if (igt_kmod_is_loaded(*m)) {
+			if (igt_lsof_kill_audio_processes())
+				return EACCES;
+
+			kick_snd_hda_intel();
+			ret = igt_kmod_unload(*m, 0);
+			if (ret) {
+				if (who)
+					*who = *m;
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+int __igt_i915_driver_unload(const char **who)
+{
+	int ret;
+
 	const char *aux[] = {
 		/* gen5: ips uses symbol_get() so only a soft module dependency */
 		"intel_ips",
@@ -411,27 +432,19 @@ int __igt_i915_driver_unload(const char **who)
 	/* unbind vt */
 	bind_fbcon(false);
 
-	for (const char **m = sound; *m; m++) {
-		if (igt_kmod_is_loaded(*m)) {
-			igt_terminate_process(SIGTERM, "alsactl");
-			kick_snd_hda_intel();
-			ret = igt_kmod_unload(*m, 0);
-			if (ret) {
-				if (who)
-					*who = *m;
-				return ret;
-			}
-		}
-	}
+	ret = igt_audio_driver_unload(who);
+	if (ret)
+		return ret;
 
 	for (const char **m = aux; *m; m++) {
-		if (igt_kmod_is_loaded(*m)) {
-			ret = igt_kmod_unload(*m, 0);
-			if (ret) {
-				if (who)
-					*who = *m;
-				return ret;
-			}
+		if (!igt_kmod_is_loaded(*m))
+			continue;
+
+		ret = igt_kmod_unload(*m, 0);
+		if (ret) {
+			if (who)
+				*who = *m;
+			return ret;
 		}
 	}
 
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 0898122b3efe..15f0be31e8e4 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -36,6 +36,8 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
 int igt_kmod_load(const char *mod_name, const char *opts);
 int igt_kmod_unload(const char *mod_name, unsigned int flags);
 
+int igt_audio_driver_unload(const char **whom);
+
 int igt_i915_driver_load(const char *opts);
 int igt_i915_driver_unload(void);
 int __igt_i915_driver_unload(const char **whom);
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 02eae19e1e16..18e37ec8feba 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -152,19 +152,14 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
 	 * safest and easiest way out.
 	 */
 	if (priv->snd_unload) {
-		igt_terminate_process(SIGTERM, "alsactl");
-
-		/* unbind snd_hda_intel */
-		kick_snd_hda_intel();
-
-		if (igt_kmod_unload("snd_hda_intel", 0)) {
+		if (igt_audio_driver_unload(NULL)) {
 			priv->snd_unload = false;
-			igt_warn("Could not unload snd_hda_intel\n");
+			igt_warn("Could not unload audio driver\n");
 			igt_kmod_list_loaded();
 			igt_lsof("/dev/snd");
 			igt_skip("Audio is in use, skipping\n");
 		} else {
-			igt_info("Preventively unloaded snd_hda_intel\n");
+			igt_info("Preventively unloaded audio driver\n");
 		}
 	}
 
-- 
2.36.1
