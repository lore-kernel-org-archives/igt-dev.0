Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB126112B95
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 07:28:12 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 May 2022 09:28:02 +0200
Message-Id: <20220517072803.186989-9-mauro.chehab@linux.intel.com>
In-Reply-To: <20220517072803.186989-1-mauro.chehab@linux.intel.com>
References: <20220517072803.186989-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 8/9] lib/igt_kmod: properly handle
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

Tested on ADL-N with Fedora 35 and wireplumber:

	IGT-Version: 1.26-g982672f3 (x86_64) (Linux: 5.18.0-rc7-drm-ad75b5b819c9+ x86_64)
	Starting subtest: unbind-rebind
	process 585 (alsactl) is using audio device. Should be terminated.
	process 11932 (pipewire) is using audio device. Should be terminated.
	process 11937 (pipewire-pulse) is using audio device. Should be requested to stop using them.
	Preventing pipewire-pulse to use the audio drivers
	Device Audio0 can not be acquired: Success
	reserve acquired
	Unloaded audio driver snd_hda_intel
	Realoading snd_hda_intel
	Subtest unbind-rebind: SUCCESS (2.603s)

Reviewed-by Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_aux.c  | 175 ++++++++++++++++++++++++++++++++++++++++++-------
 lib/igt_aux.h  |   4 +-
 lib/igt_kmod.c |  17 ++++-
 3 files changed, 171 insertions(+), 25 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 0d90ebb5b6ec..ff0d948361fd 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1435,12 +1435,120 @@ static void pulseaudio_unload_module(proc_t *proc_info)
 	igt_waitchildren();
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
+		/*
+		 * pw-reserve will run in background. It will only exit when
+		 * igt_kill_children() is called later on. So, it shouldn't
+		 * call igt_waitchildren(). Instead, just exit with the return
+		 * code from pw-reserve.
+		 */
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
+	igt_kill_children(SIGTERM);
+}
+
 /**
  * __igt_lsof_audio_and_kill_proc() - check if a given process is using an
  *	audio device. If so, stop or prevent them to use such devices.
  *
  * @proc_info: process struct, as returned by readproc()
  * @proc_path: path of the process under procfs
+ * @pipewire_pulse_pid: PID of pipewire-pulse process
  *
  * No processes can be using an audio device by the time it gets removed.
  * This function checks if a process is using an audio device from /dev/snd.
@@ -1448,10 +1556,15 @@ static void pulseaudio_unload_module(proc_t *proc_info)
  * 	- if the process is pulseaudio, it can't be killed, as systemd will
  * 	  respawn it. So, instead, send a request for it to stop bind the
  * 	  audio devices.
+ *	- if the process is pipewire-pulse, it can't be killed, as systemd will
+ *	  respawn it. So, instead, the caller should call pw-reserve, remove
+ *	  the kernel driver and then stop pw-reserve. On such case, this
+ *	  function returns the PID of pipewire-pulse, but won't touch it.
  * If the check fails, it means that the process can simply be killed.
  */
 static int
-__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
+__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path,
+			       int *pipewire_pulse_pid)
 {
 	const char *audio_dev = "/dev/snd/";
 	char path[PATH_MAX * 2];
@@ -1460,8 +1573,43 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
 	char *fd_lnk;
 	int fail = 0;
 	ssize_t read;
+	DIR *dp;
 
-	DIR *dp = opendir(proc_path);
+	/*
+	 * Terminating pipewire-pulse require an special procedure, which
+	 * is only available at version 0.3.50 and upper. Just trying to
+	 * kill pipewire will start a race between IGT and systemd. If IGT
+	 * wins, the audio driver will be unloaded before systemd tries to
+	 * reload it, but if systemd wins, the audio device will be re-opened
+	 * and used before IGT has a chance to remove the audio driver.
+	 * Pipewire version 0.3.50 should bring a standard way:
+	 *
+	 * 1) start a thread running:
+	 *	 pw-reserve -n Audio0 -r
+	 * 2) unload/unbind the the audio driver(s);
+	 * 3) stop the pw-reserve thread.
+	 */
+	if (!strcmp(proc_info->cmd, "pipewire-pulse")) {
+		igt_info("process %d (%s) is using audio device. Should be requested to stop using them.\n",
+			 proc_info->tid, proc_info->cmd);
+		*pipewire_pulse_pid = proc_info->tid;
+		return 0;
+	}
+	/*
+	 * pipewire-pulse itself doesn't hook into a /dev/snd device. Instead,
+	 * the actual binding happens at the Pipewire Session Manager, e.g.
+	 * either wireplumber or pipewire media-session.
+	 *
+	 * Just killing such processes won't produce any effect, as systemd
+	 * will respawn them. So, just ignore here, they'll honor pw-reserve,
+	 * when the time comes.
+	 */
+	if (!strcmp(proc_info->cmd, "pipewire-media-session"))
+		return 0;
+	if (!strcmp(proc_info->cmd, "wireplumber"))
+		return 0;
+
+	dp = opendir(proc_path);
 	igt_assert(dp);
 
 	while ((d = readdir(dp))) {
@@ -1497,24 +1645,6 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
 			break;
 		}
 
-		/*
-		 * FIXME: terminating pipewire-pulse is not that easy, as
-		 * pipewire there's no standard way up to pipewire version
-		 * 0.3.49. Just trying to kill pipewire will start a race
-		 * between IGT and systemd. If IGT wins, the audio driver
-		 * will be unloaded before systemd tries to reload it, but
-		 * if systemd wins, the audio device will be re-opened and
-		 * used before IGT has a chance to remove the audio driver.
-		 * Pipewire version 0.3.50 should bring a standard way:
-		 *
-		 * 1) start a thread running:
-		 *	 pw-reserve -n Audio0 -r
-		 * 2) unload/unbind the the audio driver(s);
-		 * 3) stop the pw-reserve thread.
-		 *
-		 * We should add support for it once distros start shipping it.
-		 */
-
 		/* For all other processes, just kill them */
 		igt_info("process %d (%s) is using audio device. Should be terminated.\n",
 				proc_info->tid, proc_info->cmd);
@@ -1544,7 +1674,7 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
  * daemons are respanned if they got killed.
  */
 int
-igt_lsof_kill_audio_processes(void)
+igt_lsof_kill_audio_processes(int *pipewire_pulse_pid)
 {
 	char path[PATH_MAX];
 	proc_t *proc_info;
@@ -1553,12 +1683,13 @@ igt_lsof_kill_audio_processes(void)
 
 	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
 	igt_assert(proc != NULL);
+	*pipewire_pulse_pid = 0;
 
 	while ((proc_info = readproc(proc, NULL))) {
 		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1)
 			fail++;
 		else
-			fail += __igt_lsof_audio_and_kill_proc(proc_info, path);
+			fail += __igt_lsof_audio_and_kill_proc(proc_info, path, pipewire_pulse_pid);
 
 		freeproc(proc_info);
 	}
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
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 329878aaeaf0..1f967b6b5d3e 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -392,6 +392,7 @@ igt_i915_driver_load(const char *opts)
 
 static int igt_always_unload_audio_driver(char **who)
 {
+	int pipewire_pulse_pid;
 	int ret;
 	const char *sound[] = {
 		"snd_hda_intel",
@@ -414,7 +415,7 @@ static int igt_always_unload_audio_driver(char **who)
 				*who = strdup(*m);
 			}
 
-			ret = igt_lsof_kill_audio_processes();
+			ret = igt_lsof_kill_audio_processes(&pipewire_pulse_pid);
 			if (ret) {
 				igt_warn("Could not stop %d audio process(es)\n", ret);
 				igt_kmod_list_loaded();
@@ -422,8 +423,12 @@ static int igt_always_unload_audio_driver(char **who)
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
@@ -568,6 +573,7 @@ int igt_audio_driver_unload(char **who)
 {
 	const char *drm_driver = "i915";
 	unsigned int num_mod, i, j;
+	int pipewire_pulse_pid = 0;
 	struct module_ref *mod;
 	int pos = -1;
 	int ret = 0;
@@ -613,12 +619,19 @@ int igt_audio_driver_unload(char **who)
 		 * first, in order to make it possible to unload the driver
 		 */
 		if (strstr(mod[pos].name, "snd")) {
-			if (igt_lsof_kill_audio_processes()) {
+			if (igt_lsof_kill_audio_processes(&pipewire_pulse_pid)) {
 				ret = EACCES;
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
2.36.1
