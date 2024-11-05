Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ADCD1CA37
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C6910E529;
	Tue,  5 Nov 2024 06:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFp75mU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A78310E51C
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787557; x=1762323557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N1qa/4nnzs792fWFz+uvel2WgjZTSLS8JXaky9HTmSs=;
 b=UFp75mU5qePqt01AZO/TyrhNdDgkL+g+/DE6neYJuHUuVYOs3bw2O+XB
 QQhryCKiiPRvkozBHbpoR09GFQeVjSrB7kPrZUCLPaE99zHoz9V52bnvG
 AxhM1g2z6glDL2zuZIZPkCokFaC83Npje64a4FSSXQrZxCzwwhQOgVFDr
 yX44QZT7QikGQrW/yXmoFU7n3GfIuytyhm5ieNHfhOYtcqQJEpKNTLpf5
 xgJm5yEjaURU7ROcjSR+gbGzYo0azuUAJHPO1XLFjq5Rma+L5zkYftJcN
 izFdD4OMpxMpzDDrdgjc8tiIh2px9NFzeoFRDYf5bHkXna5ylgWB/TQVV g==;
X-CSE-ConnectionGUID: QznSFHVBRqud0M5Bp/QIdQ==
X-CSE-MsgGUID: 254hRPCoRm+ULVlX1mvrkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133570"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133570"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: cr/29ccgRcye7IZsBIUqwA==
X-CSE-MsgGUID: PBda3WBvQNmajenCsll+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781740"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 7/9] lib: Remove unused audio-related helpers
Date: Mon,  4 Nov 2024 22:18:43 -0800
Message-ID: <20241105061845.2486557-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105061845.2486557-1-lucas.demarchi@intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Now that xe and i915 are just doing unbind + rmmod, remove all the dead
code trying to workaround interaction with the sound modules.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_aux.c  | 284 -------------------------------------------------
 lib/igt_aux.h  |   3 -
 lib/igt_kmod.c | 119 ---------------------
 lib/igt_kmod.h |   2 -
 4 files changed, 408 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 3407cc4f2..64dbe61a2 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1653,290 +1653,6 @@ igt_lsof(const char *dpath)
 	free(sanitized);
 }
 
-static void pulseaudio_unload_module(const uid_t euid, const gid_t egid)
-{
-	struct igt_helper_process pa_proc = {};
-	char xdg_dir[PATH_MAX];
-	const char *homedir;
-	struct passwd *pw;
-
-	igt_fork_helper(&pa_proc) {
-		pw = getpwuid(euid);
-		homedir = pw->pw_dir;
-		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", euid);
-
-		igt_info("Request pulseaudio to stop using audio device\n");
-
-		setgid(egid);
-		setuid(euid);
-		clearenv();
-		setenv("HOME", homedir, 1);
-		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
-
-		system("for i in $(pacmd list-sources|grep module:|cut -d : -f 2); do pactl unload-module $i; done");
-	}
-	igt_wait_helper(&pa_proc);
-}
-
-static int pipewire_pulse_pid = 0;
-static int pipewire_pw_reserve_pid = 0;
-static struct igt_helper_process pw_reserve_proc = {};
-
-
-static void pipewire_reserve_wait(void)
-{
-	char xdg_dir[PATH_MAX];
-	const char *homedir;
-	struct passwd *pw;
-	int tid = 0, euid, egid;
-
-	igt_fork_helper(&pw_reserve_proc) {
-		struct igt_process pc;
-
-		igt_info("Preventing pipewire-pulse to use the audio drivers\n");
-		open_process(&pc);
-		while (get_process_ids(&pc)) {
-			tid = pc.tid;
-			euid = pc.euid;
-			egid = pc.egid;
-			if (pipewire_pulse_pid == tid)
-				break;
-		}
-		close_process(&pc);
-
-		/* Sanity check: if it can't find the process, it means it has gone */
-		if (pipewire_pulse_pid != tid)
-			exit(0);
-
-		pw = getpwuid(euid);
-		homedir = pw->pw_dir;
-		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", euid);
-		setgid(egid);
-		setuid(euid);
-		clearenv();
-		setenv("HOME", homedir, 1);
-		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
-
-		/*
-		 * pw-reserve will run in background. It will only exit when
-		 * igt_kill_children() is called later on. So, it shouldn't
-		 * call igt_waitchildren(). Instead, just exit with the return
-		 * code from pw-reserve.
-		 */
-		exit(system("pw-reserve -n Audio0 -r"));
-	}
-}
-
-/* Maximum time waiting for pw-reserve to start running */
-#define PIPEWIRE_RESERVE_MAX_TIME 1000 /* milisseconds */
-
-int pipewire_pulse_start_reserve(void)
-{
-	bool is_pw_reserve_running = false;
-	int attempts = 0;
-
-	if (!pipewire_pulse_pid)
-		return 0;
-
-	pipewire_reserve_wait();
-
-	/*
-	 * Note: using pw-reserve to stop using audio only works with
-	 * pipewire version 0.3.50 or upper.
-	 */
-	for (attempts = 0; attempts < PIPEWIRE_RESERVE_MAX_TIME; attempts++) {
-		struct igt_process pc;
-
-		usleep(1000);
-		open_process(&pc);
-		while (get_process_ids(&pc)) {
-			if (!strcmp(pc.comm, "pw-reserve")) {
-				is_pw_reserve_running = true;
-				pipewire_pw_reserve_pid = pc.tid;
-				break;
-			}
-		}
-		close_process(&pc);
-
-		if (is_pw_reserve_running)
-			break;
-	}
-	if (!is_pw_reserve_running) {
-		igt_warn("Failed to remove audio drivers from pipewire\n");
-		return 1;
-	}
-	/* Let's grant some time for pw_reserve to notify pipewire via D-BUS */
-	usleep(50000);
-
-	/*
-	 * pw-reserve is running, and should have stopped using the audio
-	 * drivers. We can now remove the driver.
-	 */
-
-	return 0;
-}
-
-void pipewire_pulse_stop_reserve(void)
-{
-	if (!pipewire_pulse_pid)
-		return;
-
-	igt_stop_helper(&pw_reserve_proc);
-}
-
-/**
- * __igt_lsof_audio_and_kill_proc() - check if a given process is using an
- *	audio device. If so, stop or prevent them to use such devices.
- *
- * @proc_info: process struct, as returned by readproc()
- * @proc_path: path of the process under procfs
- * @pipewire_pulse_pid: PID of pipewire-pulse process
- *
- * No processes can be using an audio device by the time it gets removed.
- * This function checks if a process is using an audio device from /dev/snd.
- * If so, it will check:
- * 	- if the process is pulseaudio, it can't be killed, as systemd will
- * 	  respawn it. So, instead, send a request for it to stop bind the
- * 	  audio devices.
- *	- if the process is pipewire-pulse, it can't be killed, as systemd will
- *	  respawn it. So, instead, the caller should call pw-reserve, remove
- *	  the kernel driver and then stop pw-reserve. On such case, this
- *	  function returns the PID of pipewire-pulse, but won't touch it.
- * If the check fails, it means that the process can simply be killed.
- */
-static int
-__igt_lsof_audio_and_kill_proc(const pid_t tid, const char *cmd, const uid_t euid, const gid_t egid, char *proc_path)
-{
-	const char *audio_dev = "/dev/snd/";
-	char path[PATH_MAX * 2];
-	struct dirent *d;
-	struct stat st;
-	char *fd_lnk;
-	int fail = 0;
-	ssize_t read;
-	DIR *dp;
-
-	/*
-	 * Terminating pipewire-pulse require an special procedure, which
-	 * is only available at version 0.3.50 and upper. Just trying to
-	 * kill pipewire will start a race between IGT and systemd. If IGT
-	 * wins, the audio driver will be unloaded before systemd tries to
-	 * reload it, but if systemd wins, the audio device will be re-opened
-	 * and used before IGT has a chance to remove the audio driver.
-	 * Pipewire version 0.3.50 should bring a standard way:
-	 *
-	 * 1) start a thread running:
-	 *	 pw-reserve -n Audio0 -r
-	 * 2) unload/unbind the the audio driver(s);
-	 * 3) stop the pw-reserve thread.
-	 */
-	if (!strcmp(cmd, "pipewire-pulse")) {
-		igt_info("process %d (%s) is using audio device. Should be requested to stop using them.\n",
-			 tid, cmd);
-		pipewire_pulse_pid = tid;
-		return 0;
-	}
-	/*
-	 * pipewire-pulse itself doesn't hook into a /dev/snd device. Instead,
-	 * the actual binding happens at the Pipewire Session Manager, e.g.
-	 * either wireplumber or pipewire media-session.
-	 *
-	 * Just killing such processes won't produce any effect, as systemd
-	 * will respawn them. So, just ignore here, they'll honor pw-reserve,
-	 * when the time comes.
-	 */
-	if (!strcmp(cmd, "pipewire-media-session"))
-		return 0;
-	if (!strcmp(cmd, "wireplumber"))
-		return 0;
-
-	dp = opendir(proc_path);
-	if (!dp && errno == ENOENT)
-		return 0;
-	if (!dp)
-		return 1;
-
-	while ((d = readdir(dp))) {
-		if (*d->d_name == '.')
-			continue;
-
-		memset(path, 0, sizeof(path));
-		snprintf(path, sizeof(path), "%s/%s", proc_path, d->d_name);
-
-		if (lstat(path, &st) == -1)
-			continue;
-
-		fd_lnk = malloc(st.st_size + 1);
-
-		igt_assert((read = readlink(path, fd_lnk, st.st_size + 1)));
-		fd_lnk[read] = '\0';
-
-		if (strncmp(audio_dev, fd_lnk, strlen(audio_dev))) {
-			free(fd_lnk);
-			continue;
-		}
-
-		free(fd_lnk);
-
-		/*
-		 * In order to avoid racing against pa/systemd, ensure that
-		 * pulseaudio will close all audio files. This should be
-		 * enough to unbind audio modules and won't cause race issues
-		 * with systemd trying to reload it.
-		 */
-		if (!strcmp(cmd, "pulseaudio")) {
-			pulseaudio_unload_module(euid, egid);
-			break;
-		}
-
-		/* For all other processes, just kill them */
-		igt_info("process %d (%s) is using audio device. Should be terminated.\n",
-				tid, cmd);
-
-		if (kill(tid, SIGTERM) < 0) {
-			igt_info("Fail to terminate %s (pid: %d) with SIGTERM\n",
-				cmd, tid);
-			if (kill(tid, SIGABRT) < 0) {
-				fail++;
-				igt_info("Fail to terminate %s (pid: %d) with SIGABRT\n",
-					cmd, tid);
-			}
-		}
-
-		break;
-	}
-
-	closedir(dp);
-	return fail;
-}
-
-/*
- * This function identifies each process running on the machine that is
- * opening an audio device and tries to stop it.
- *
- * Special care should be taken with pipewire and pipewire-pulse, as those
- * daemons are respanned if they got killed.
- */
-int
-igt_lsof_kill_audio_processes(void)
-{
-	char path[PATH_MAX];
-	int fail = 0;
-	struct igt_process pc;
-
-	open_process(&pc);
-	pipewire_pulse_pid = 0;
-	while (get_process_ids(&pc)) {
-		if (snprintf(path, sizeof(path), "/proc/%d/fd", pc.tid) < 1)
-			fail++;
-		else
-			fail += __igt_lsof_audio_and_kill_proc(pc.tid, pc.comm, pc.euid, pc.egid, path);
-	}
-	close_process(&pc);
-
-	return fail;
-}
-
 static struct igt_siglatency {
 	timer_t timer;
 	struct timespec target;
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index bfd83adca..8bc0106d2 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -317,9 +317,6 @@ bool igt_allow_unlimited_files(void);
 int igt_is_process_running(const char *comm);
 int igt_terminate_process(int sig, const char *comm);
 void igt_lsof(const char *dpath);
-int igt_lsof_kill_audio_processes(void);
-int pipewire_pulse_start_reserve(void);
-void pipewire_pulse_stop_reserve(void);
 
 #define igt_hweight(x) \
 	__builtin_choose_expr(sizeof(x) == 8, \
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 972dc490d..3944669e7 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -459,15 +459,6 @@ igt_kmod_list_loaded(void)
 	kmod_module_unref_list(list);
 }
 
-static void *strdup_realloc(char *origptr, const char *strdata)
-{
-	size_t nbytes = strlen(strdata) + 1;
-	char *newptr = realloc(origptr, nbytes);
-
-	memcpy(newptr, strdata, nbytes);
-	return newptr;
-}
-
 /**
  * igt_intel_driver_load:
  * @opts: options to pass to Intel driver
@@ -495,116 +486,6 @@ igt_intel_driver_load(const char *opts, const char *driver)
 	return 0;
 }
 
-/**
- * kick_snd_hda_intel:
- *
- * This function unbinds the snd_hda_intel driver so the module can be
- * unloaded.
- *
- */
-static void kick_snd_hda_intel(void)
-{
-	DIR *dir;
-	struct dirent *snd_hda;
-	int fd; size_t len;
-
-	const char *dpath = "/sys/bus/pci/drivers/snd_hda_intel";
-	const char *path = "/sys/bus/pci/drivers/snd_hda_intel/unbind";
-	const char *devid = "0000:";
-
-	fd = open(path, O_WRONLY);
-	if (fd < 0) {
-		return;
-	}
-
-	dir = opendir(dpath);
-	if (!dir)
-		goto out;
-
-	len = strlen(devid);
-	while ((snd_hda = readdir(dir))) {
-		struct stat st;
-		char fpath[PATH_MAX];
-
-		if (*snd_hda->d_name == '.')
-			continue;
-
-		snprintf(fpath, sizeof(fpath), "%s/%s", dpath, snd_hda->d_name);
-		if (lstat(fpath, &st))
-			continue;
-
-		if (!S_ISLNK(st.st_mode))
-			continue;
-
-		if (!strncmp(devid, snd_hda->d_name, len)) {
-			igt_ignore_warn(write(fd, snd_hda->d_name,
-					strlen(snd_hda->d_name)));
-		}
-	}
-
-	closedir(dir);
-out:
-	close(fd);
-}
-
-static int igt_always_unload_audio_driver(char **who)
-{
-	int ret;
-	const char *sound[] = {
-		"snd_hda_intel",
-		"snd_hdmi_lpe_audio",
-		NULL,
-	};
-
-	/*
-	 * With old Kernels, the dependencies between audio and DRM drivers
-	 * are not shown. So, it may not be mandatory to remove the audio
-	 * driver before unload/unbind the DRM one. So, let's print warnings,
-	 * but return 0 on errors, as, if the dependency is mandatory, this
-	 * will be detected later when trying to unbind/unload the DRM driver.
-	 */
-	for (const char **m = sound; *m; m++) {
-		if (igt_kmod_is_loaded(*m)) {
-			if (who)
-				*who = strdup_realloc(*who, *m);
-
-			ret = igt_lsof_kill_audio_processes();
-			if (ret) {
-				igt_warn("Could not stop %d audio process(es)\n", ret);
-				igt_kmod_list_loaded();
-				igt_lsof("/dev/snd");
-				return 0;
-			}
-
-			ret = pipewire_pulse_start_reserve();
-			if (ret)
-				igt_warn("Failed to notify pipewire_pulse\n");
-			kick_snd_hda_intel();
-			ret = igt_kmod_unload(*m);
-			pipewire_pulse_stop_reserve();
-			if (ret) {
-				igt_warn("Could not unload audio driver %s\n", *m);
-				igt_kmod_list_loaded();
-				igt_lsof("/dev/snd");
-				return 0;
-			}
-		}
-	}
-	return 0;
-}
-
-int igt_audio_driver_unload(char **who)
-{
-	/*
-	 * Currently, there's no way to check if the audio driver binds into the
-	 * DRM one. So, always remove audio drivers that  might be binding.
-	 * This may change in future, once kernel/module gets fixed. So, let's
-	 * keep this boilerplace, in order to make easier to add the new code,
-	 * once upstream is fixed.
-	 */
-	return igt_always_unload_audio_driver(who);
-}
-
 /*
  * Unbind driver from devices. Currently supports only PCI bus
  */
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 67ae6833f..152606a60 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -38,8 +38,6 @@ int igt_kmod_unload(const char *mod_name);
 
 int igt_kmod_unbind(const char *mod_name);
 
-int igt_audio_driver_unload(char **whom);
-
 int igt_intel_driver_load(const char *opts, const char *driver);
 int igt_intel_driver_unload(const char *driver);
 
-- 
2.47.0

