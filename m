Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4706010E216
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 12:44:55 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 May 2022 14:44:47 +0200
Message-Id: <20220517124447.211014-10-mauro.chehab@linux.intel.com>
In-Reply-To: <20220517124447.211014-1-mauro.chehab@linux.intel.com>
References: <20220517124447.211014-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 9/9] lib/igt_aux: get rid of passing
 pipewire-pulse pid on functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The logic already stores pw-reserve PID on a static var. Store
also the pipewire-pulse pid, in order to keep passing the arguments
on all functions.

Suggested-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_aux.c  | 24 ++++++++++++------------
 lib/igt_aux.h  |  6 +++---
 lib/igt_kmod.c | 14 ++++++--------
 3 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index ff0d948361fd..755bffbc6d56 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1435,7 +1435,10 @@ static void pulseaudio_unload_module(proc_t *proc_info)
 	igt_waitchildren();
 }
 
-static void pipewire_reserve_wait(int pipewire_pulse_pid)
+static int pipewire_pulse_pid = 0;
+static int pipewire_pw_reserve_pid = 0;
+
+static void pipewire_reserve_wait(void)
 {
 	char xdg_dir[PATH_MAX];
 	const char *homedir;
@@ -1480,12 +1483,10 @@ static void pipewire_reserve_wait(int pipewire_pulse_pid)
 	}
 }
 
-static int pipewire_pw_reserve_pid = 0;
-
 /* Maximum time waiting for pw-reserve to start running */
 #define PIPEWIRE_RESERVE_MAX_TIME 1000 /* milisseconds */
 
-int pipewire_pulse_start_reserve(int pipewire_pulse_pid)
+int pipewire_pulse_start_reserve(void)
 {
 	bool is_pw_reserve_running = false;
 	proc_t *proc_info;
@@ -1495,7 +1496,7 @@ int pipewire_pulse_start_reserve(int pipewire_pulse_pid)
 	if (!pipewire_pulse_pid)
 		return 0;
 
-	pipewire_reserve_wait(pipewire_pulse_pid);
+	pipewire_reserve_wait();
 
 	/*
 	 * Note: using pw-reserve to stop using audio only works with
@@ -1534,7 +1535,7 @@ int pipewire_pulse_start_reserve(int pipewire_pulse_pid)
 	return 0;
 }
 
-void pipewire_pulse_stop_reserve(int pipewire_pulse_pid)
+void pipewire_pulse_stop_reserve(void)
 {
 	if (!pipewire_pulse_pid)
 		return;
@@ -1563,8 +1564,7 @@ void pipewire_pulse_stop_reserve(int pipewire_pulse_pid)
  * If the check fails, it means that the process can simply be killed.
  */
 static int
-__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path,
-			       int *pipewire_pulse_pid)
+__igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path)
 {
 	const char *audio_dev = "/dev/snd/";
 	char path[PATH_MAX * 2];
@@ -1592,7 +1592,7 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path,
 	if (!strcmp(proc_info->cmd, "pipewire-pulse")) {
 		igt_info("process %d (%s) is using audio device. Should be requested to stop using them.\n",
 			 proc_info->tid, proc_info->cmd);
-		*pipewire_pulse_pid = proc_info->tid;
+		pipewire_pulse_pid = proc_info->tid;
 		return 0;
 	}
 	/*
@@ -1674,7 +1674,7 @@ __igt_lsof_audio_and_kill_proc(proc_t *proc_info, char *proc_path,
  * daemons are respanned if they got killed.
  */
 int
-igt_lsof_kill_audio_processes(int *pipewire_pulse_pid)
+igt_lsof_kill_audio_processes(void)
 {
 	char path[PATH_MAX];
 	proc_t *proc_info;
@@ -1683,13 +1683,13 @@ igt_lsof_kill_audio_processes(int *pipewire_pulse_pid)
 
 	proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
 	igt_assert(proc != NULL);
-	*pipewire_pulse_pid = 0;
+	pipewire_pulse_pid = 0;
 
 	while ((proc_info = readproc(proc, NULL))) {
 		if (snprintf(path, sizeof(path), "/proc/%d/fd", proc_info->tid) < 1)
 			fail++;
 		else
-			fail += __igt_lsof_audio_and_kill_proc(proc_info, path, pipewire_pulse_pid);
+			fail += __igt_lsof_audio_and_kill_proc(proc_info, path);
 
 		freeproc(proc_info);
 	}
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index d8b05088f0ba..16a9785cd6df 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -306,9 +306,9 @@ bool igt_allow_unlimited_files(void);
 int igt_is_process_running(const char *comm);
 int igt_terminate_process(int sig, const char *comm);
 void igt_lsof(const char *dpath);
-int igt_lsof_kill_audio_processes(int *pipewire_pulse_pid);
-int pipewire_pulse_start_reserve(int pipewire_pulse_pid);
-void pipewire_pulse_stop_reserve(int pipewire_pulse_pid);
+int igt_lsof_kill_audio_processes(void);
+int pipewire_pulse_start_reserve(void);
+void pipewire_pulse_stop_reserve(void);
 
 #define igt_hweight(x) \
 	__builtin_choose_expr(sizeof(x) == 8, \
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index fe2b792b306f..dfdcfcc546b0 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -401,7 +401,6 @@ igt_i915_driver_load(const char *opts)
 
 static int igt_always_unload_audio_driver(char **who)
 {
-	int pipewire_pulse_pid;
 	int ret;
 	const char *sound[] = {
 		"snd_hda_intel",
@@ -421,7 +420,7 @@ static int igt_always_unload_audio_driver(char **who)
 			if (who)
 				*who = strdup_realloc(*who, *m);
 
-			ret = igt_lsof_kill_audio_processes(&pipewire_pulse_pid);
+			ret = igt_lsof_kill_audio_processes();
 			if (ret) {
 				igt_warn("Could not stop %d audio process(es)\n", ret);
 				igt_kmod_list_loaded();
@@ -429,12 +428,12 @@ static int igt_always_unload_audio_driver(char **who)
 				return 0;
 			}
 
-			ret = pipewire_pulse_start_reserve(pipewire_pulse_pid);
+			ret = pipewire_pulse_start_reserve();
 			if (ret)
 				igt_warn("Failed to notify pipewire_pulse\n");
 			kick_snd_hda_intel();
 			ret = igt_kmod_unload(*m, 0);
-			pipewire_pulse_stop_reserve(pipewire_pulse_pid);
+			pipewire_pulse_stop_reserve();
 			if (ret) {
 				igt_warn("Could not unload audio driver %s\n", *m);
 				igt_kmod_list_loaded();
@@ -579,7 +578,6 @@ int igt_audio_driver_unload(char **who)
 {
 	const char *drm_driver = "i915";
 	unsigned int num_mod, i, j;
-	int pipewire_pulse_pid = 0;
 	struct module_ref *mod;
 	int pos = -1;
 	int ret = 0;
@@ -623,17 +621,17 @@ int igt_audio_driver_unload(char **who)
 		 * first, in order to make it possible to unload the driver
 		 */
 		if (strstr(mod[pos].name, "snd")) {
-			if (igt_lsof_kill_audio_processes(&pipewire_pulse_pid)) {
+			if (igt_lsof_kill_audio_processes()) {
 				ret = EACCES;
 				goto ret;
 			}
 		}
 
-		ret = pipewire_pulse_start_reserve(pipewire_pulse_pid);
+		ret = pipewire_pulse_start_reserve();
 		if (ret)
 			igt_warn("Failed to notify pipewire_pulse\n");
 		ret = igt_unload_driver(mod, num_mod, pos);
-		pipewire_pulse_stop_reserve(pipewire_pulse_pid);
+		pipewire_pulse_stop_reserve();
 		if (ret)
 			break;
 	}
-- 
2.36.1
