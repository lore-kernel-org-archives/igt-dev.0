Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4891210EBD1
 for <igt-dev@lists.freedesktop.org>; Wed,  4 May 2022 07:29:03 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Wed,  4 May 2022 09:28:37 +0200
Message-Id: <20220504072837.2136657-7-mauro.chehab@linux.intel.com>
In-Reply-To: <20220504072837.2136657-1-mauro.chehab@linux.intel.com>
References: <20220504072837.2136657-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] lib/igt_kmod: properly handle
 pipewire-pulse
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

Newer distributions like Fedora and openSUSE thumbweed are now
coming with pipewire-pulse instead of pulseaudio - either as
default or as an optional audio stack.

That adds a new requirement when unloading sound drivers,
which, in turn, is needed when the DRM driver is bound into
it.

Add the needed logic to work properly in case pipewire-pulse
is detected.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_aux.c  | 122 +++++++++++++++++++++++++++++++++++++++++++++----
 lib/igt_aux.h  |   4 +-
 lib/igt_core.c |   7 +++
 lib/igt_core.h |   1 +
 lib/igt_kmod.c |  17 ++++++-
 5 files changed, 140 insertions(+), 11 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 15fe87839567..a0da1d042ab4 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1434,8 +1434,109 @@ static void pulseaudio_unload_module(proc_t *proc_info)
 	}
 }
 
+static void pipewire_reserve_wait(int pipewire_pulse_pid)
+{
+	char xdg_dir[PATH_MAX];
+	const char *homedir;
+	struct passwd *pw;
+	proc_t *proc_info;
+	PROCTAB *proc;
+
+	igt_fork(child, 1) {
+		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
+
+		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
+		igt_assert(proc != NULL);
+
+		while ((proc_info = readproc(proc, NULL))) {
+			if (pipewire_pulse_pid == proc_info->tid)
+				break;
+			freeproc(proc_info);
+		}
+		closeproc(proc);
+
+		/* Sanity check: if it can't find the process, it means it has gone */
+		if (pipewire_pulse_pid != proc_info->tid)
+			exit(0);
+
+		pw = getpwuid(proc_info->euid);
+		homedir = pw->pw_dir;
+		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
+		setgid(proc_info->egid);
+		setuid(proc_info->euid);
+		clearenv();
+		setenv("HOME", homedir, 1);
+		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
+		freeproc(proc_info);
+
+		exit(system("pw-reserve -n Audio0 -r"));
+	}
+}
+
+static int pipewire_pw_reserve_pid = 0;
+
+/* Maximum time waiting for pw-reserve to start running */
+#define PIPEWIRE_RESERVE_MAX_TIME 1000 /* milisseconds */
+
+int pipewire_pulse_start_reserve(int pipewire_pulse_pid)
+{
+	bool is_pw_reserve_running = false;
+	proc_t *proc_info;
+	int attempts = 0;
+	PROCTAB *proc;
+
+	if (!pipewire_pulse_pid)
+		return 0;
+
+	pipewire_reserve_wait(pipewire_pulse_pid);
+
+	/*
+	 * Note: using pw-reserve to stop using audio only works with
+	 * pipewire version 0.3.50 or upper.
+	 */
+	for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME; attempts++) {
+		usleep(1000);
+		proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
+		igt_assert(proc != NULL);
+
+		while ((proc_info = readproc(proc, NULL))) {
+			if (!strcmp(proc_info->cmd, "pw-reserve")) {
+				is_pw_reserve_running = true;
+				pipewire_pw_reserve_pid = proc_info->tid;
+				freeproc(proc_info);
+				break;
+			}
+			freeproc(proc_info);
+		}
+		closeproc(proc);
+		if (is_pw_reserve_running)
+			break;
+	}
+	if (!is_pw_reserve_running) {
+		igt_warn("Failed to remove audio drivers from pipewire\n");
+		return 1;
+	}
+	/* Let's grant some time for pw_reserve to notify pipewire via D-BUS */
+	usleep(50000);
+
+	/*
+	 * pw-reserve is running, and should have stopped using the audio
+	 * drivers. We can now remove the driver.
+	 */
+
+	return 0;
+}
+
+void pipewire_pulse_stop_reserve(int pipewire_pulse_pid)
+{
+	if (!pipewire_pulse_pid)
+		return;
+
+	igt_killchildren(SIGTERM);
+}
+
 static int
-__igt_lsof_kill_proc(proc_t *proc_info, char *proc_path)
+__igt_lsof_kill_proc(proc_t *proc_info, char *proc_path, int *pipewire_pulse_pid)
 {
 	const char *audio_dev = "/dev/snd/";
 	char path[PATH_MAX * 2];
@@ -1482,9 +1583,9 @@ __igt_lsof_kill_proc(proc_t *proc_info, char *proc_path)
 		}
 
 		/*
-		 * FIXME: terminating pipewire-pulse is not that easy, as
-		 * pipewire there's no standard way up to pipewire version
-		 * 0.3.49. Just trying to kill pipewire will start a race
+		 * Terminating pipewire-pulse require an special procedure,
+		 * which is only available at version 0.3.50 and upper.
+		 * Just trying to kill pipewire will start a race
 		 * between IGT and systemd. If IGT wins, the audio driver
 		 * will be unloaded before systemd tries to reload it, but
 		 * if systemd wins, the audio device will be re-opened and
@@ -1495,9 +1596,13 @@ __igt_lsof_kill_proc(proc_t *proc_info, char *proc_path)
 		 *	 pw-reserve -n Audio0 -r
 		 * 2) unload/unbind the the audio driver(s);
 		 * 3) stop the pw-reserve thread.
-		 *
-		 * We should add support for it once distros start shipping it.
 		 */
+		if (!strcmp(proc_info->cmd, "pipewire-pulse")) {
+			igt_info("process %d (%s) is using audio device. Should be requested to stop using them.\n",
+				 proc_info->tid, proc_info->cmd);
+			*pipewire_pulse_pid = proc_info->tid;
+			break;
+		}
 
 		/* For all other processes, just kill them */
 		igt_info("process %d (%s) is using audio device. Should be terminated.\n",
@@ -1528,7 +1633,7 @@ __igt_lsof_kill_proc(proc_t *proc_info, char *proc_path)
  * daemons are respanned if they got killed.
  */
 int
-igt_lsof_kill_audio_processes(void)
+igt_lsof_kill_audio_processes(int *pipewire_pulse_pid)
 {
 	char path[PATH_MAX];
 	proc_t *proc_info;
@@ -1537,12 +1642,13 @@ igt_lsof_kill_audio_processes(void)
 
 	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
 	igt_assert(proc != NULL);
+	*pipewire_pulse_pid = 0;
 
 	while ((proc_info = readproc(proc, NULL))) {
 		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1) {
 			fail++;
 		} else {
-			fail += __igt_lsof_kill_proc(proc_info, path);
+			fail += __igt_lsof_kill_proc(proc_info, path, pipewire_pulse_pid);
 		}
 
 		freeproc(proc_info);
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index bb96d1afb777..d8b05088f0ba 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -306,7 +306,9 @@ bool igt_allow_unlimited_files(void);
 int igt_is_process_running(const char *comm);
 int igt_terminate_process(int sig, const char *comm);
 void igt_lsof(const char *dpath);
-int igt_lsof_kill_audio_processes(void);
+int igt_lsof_kill_audio_processes(int *pipewire_pulse_pid);
+int pipewire_pulse_start_reserve(int pipewire_pulse_pid);
+void pipewire_pulse_stop_reserve(int pipewire_pulse_pid);
 
 #define igt_hweight(x) \
 	__builtin_choose_expr(sizeof(x) == 8, \
diff --git a/lib/igt_core.c b/lib/igt_core.c
index 6dad3c84858f..10b3e37656bd 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2427,6 +2427,13 @@ static void igt_alarm_killchildren(int signal)
 	kill_children();
 }
 
+void igt_killchildren(int signal)
+{
+	igt_info("Timed out waiting for children\n");
+
+	kill_children();
+}
+
 /**
  * igt_waitchildren_timeout:
  * @seconds: timeout in seconds to wait
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 78dc6202ced4..c62a31e016af 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1103,6 +1103,7 @@ bool __igt_fork(void);
 int __igt_waitchildren(void);
 void igt_waitchildren(void);
 void igt_waitchildren_timeout(int seconds, const char *reason);
+void igt_killchildren(int signal);
 
 /**
  * igt_helper_process:
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d1d0662f3706..5a6af050c272 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -392,6 +392,7 @@ igt_i915_driver_load(const char *opts)
 
 static int igt_always_unload_audio_driver(const char **who)
 {
+	int pipewire_pulse_pid;
 	int ret;
 	const char *sound[] = {
 		"snd_hda_intel",
@@ -410,15 +411,19 @@ static int igt_always_unload_audio_driver(const char **who)
 		if (igt_kmod_is_loaded(*m)) {
 			if (who)
 				*who = *m;
-			if (igt_lsof_kill_audio_processes()) {
+			if (igt_lsof_kill_audio_processes(&pipewire_pulse_pid)) {
 				igt_warn("Could not stop audio process(es)\n");
 				igt_kmod_list_loaded();
 				igt_lsof("/dev/snd");
 				return 0;
 			}
 
+			ret = pipewire_pulse_start_reserve(pipewire_pulse_pid);
+			if (ret)
+				igt_warn("Failed to notify pipewire_pulse\n");
 			kick_snd_hda_intel();
 			ret = igt_kmod_unload(*m, 0);
+			pipewire_pulse_stop_reserve(pipewire_pulse_pid);
 			if (ret) {
 				igt_warn("Could not unload audio driver %s\n", *m);
 				igt_kmod_list_loaded();
@@ -564,6 +569,7 @@ int igt_audio_driver_unload(const char **who)
 {
 	const char *drm_driver = "i915";
 	unsigned int num_mod, i, j;
+	int pipewire_pulse_pid = 0;
 	struct module_ref *mod;
 	int pos = -1;
 	int ret = 0;
@@ -607,12 +613,19 @@ int igt_audio_driver_unload(const char **who)
 		 * the driver.
 		 */
 		if (strstr(mod[pos].name, "snd")) {
-			if (igt_lsof_kill_audio_processes()) {
+			if (igt_lsof_kill_audio_processes(&pipewire_pulse_pid)) {
 				ret = 1;
 				goto ret;
 			}
 		}
+
+		ret = pipewire_pulse_start_reserve(pipewire_pulse_pid);
+		if (ret)
+			igt_warn("Failed to notify pipewire_pulse\n");
 		ret = igt_unload_driver(mod, num_mod, pos);
+		pipewire_pulse_stop_reserve(pipewire_pulse_pid);
+		if (ret)
+			break;
 	}
 
 ret:
-- 
2.35.1
