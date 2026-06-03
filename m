Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED42CD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 18:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85474112253;
	Wed,  3 Jun 2026 18:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBZTW3A8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19605112253
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780511287; x=1812047287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/Js0epXAdLBaSlcMPv/uZAzRqTYv0esIYybzqpvVDZc=;
 b=lBZTW3A8y6V5LlYIAgWK7GDURPYkBiAjXZpT0RdkcnArN8IWQHux6nWa
 mjUOYAW609UBQ7dTUNm35hWuHe182hH73hB2yJw+oknfO175DafcJZH0C
 y8w9fr8Iup6omBMDaev4mYQadIftPQZeqc3+TgcXDfGDpfki3YuuShZsf
 PmMbZ6pOzjjpXGrTyBTX+2+RZRkSv3kUCrqtnAWw9pvbIoSZbRSo6S4aa
 AGWm8oNqeu9JA5J+xvASlngO6fTlwEPYOVp30grta00pqqYT0S1efX8pn
 Bx7IMQ32UxOkDmEykZ4IwZqUPw8waT9iJifdTz/5uAP1TP6SixhSq/1J2 Q==;
X-CSE-ConnectionGUID: 7/ikzrgaQTK6Y8TD29/K7w==
X-CSE-MsgGUID: tS1dlZRuRZaUklHrDAHJRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92815916"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="92815916"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 11:28:07 -0700
X-CSE-ConnectionGUID: R3hWOP7FSD2/T5le24+d+A==
X-CSE-MsgGUID: 5GNrZY8yRxCx6PQYi7XbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="267976175"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.40])
 by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2026 11:28:06 -0700
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] lib: replace libprocps/libproc2 with /proc-based process
 enumeration
Date: Wed,  3 Jun 2026 18:28:00 +0000
Message-ID: <20260603182801.900747-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
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

The previous code used compile-time #ifdef HAVE_LIBPROCPS / HAVE_LIBPROC2
to select between two incompatible APIs, requiring separate builds for
Ubuntu 22.04 (libprocps) and Ubuntu 24.04 (libproc2).
Replace the platform-specific code with internal static helpers in
igt_aux.c that read /proc/<pid>/status directly, requiring no external
library and working identically across distro versions.
The libprocps/libproc2 meson dependencies have been removed entirely.

Cc: Zongyao Bai <zongyao.bai@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 lib/igt_aux.c   | 203 +++++++++++++++++++++++++++++++-----------------
 lib/meson.build |   6 --
 meson.build     |  13 +---
 3 files changed, 131 insertions(+), 91 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 87c0593a4..0d250ae2f 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -53,12 +53,6 @@
 #include <assert.h>
 #include <grp.h>
 
-#ifdef HAVE_LIBPROCPS
-#  include <proc/readproc.h>
-#elif HAVE_LIBPROC2
-#  include <libproc2/pids.h>
-#endif
-
 #include <dirent.h>
 #ifdef __linux__
 #  include <libudev.h>
@@ -1285,93 +1279,156 @@ void igt_unlock_mem(void)
 	locked_mem = NULL;
 }
 
+/*
+ * Internal /proc-based process iterator.  Reads /proc/<pid>/status directly
+ * so there is no dependency on libprocps or libproc2.
+ *
+ * /proc/<pid>/status fields used:
+ *   Name:  <comm>  - command name (kernel escapes spaces, so %s is safe)
+ *   Pid:   <pid>
+ *   Uid:   ruid euid suid fsuid
+ *   Gid:   rgid egid sgid fsgid
+ */
+struct procps_iter {
+	DIR   *procdir;
+	char   comm[64];
+	pid_t  tid;
+	uid_t  euid;
+	gid_t  egid;
+};
+
+static struct procps_iter *procps_open(void)
+{
+	struct procps_iter *iter = calloc(1, sizeof(*iter));
+
+	if (!iter)
+		return NULL;
+
+	iter->procdir = opendir("/proc");
+	if (!iter->procdir) {
+		free(iter);
+		return NULL;
+	}
+
+	return iter;
+}
+
+static bool procps_next(struct procps_iter *iter,
+			pid_t *tid, uid_t *euid, gid_t *egid,
+			const char **comm)
+{
+	struct dirent *ent;
+
+	if (!iter || !iter->procdir)
+		return false;
+
+	while ((ent = readdir(iter->procdir))) {
+		char path[64];
+		FILE *f;
+		pid_t _tid = 0;
+		uid_t _euid = 0;
+		gid_t _egid = 0;
+		char _comm[64] = "";
+		int fields = 0;   /* bit 0=Name, 1=Pid, 2=Uid, 3=Gid */
+		char line[256];
+
+		if (ent->d_name[0] < '1' || ent->d_name[0] > '9')
+			continue;
+
+		snprintf(path, sizeof(path), "/proc/%.20s/status", ent->d_name);
+
+		f = fopen(path, "r");
+		if (!f)
+			continue;
+
+		while (fields != 0xf && fgets(line, sizeof(line), f)) {
+			if (!(fields & 0x1) && strncmp(line, "Name:", 5) == 0) {
+				if (sscanf(line + 5, " %63s", _comm) == 1)
+					fields |= 0x1;
+			} else if (!(fields & 0x2) && strncmp(line, "Pid:", 4) == 0) {
+				if (sscanf(line + 4, " %d", &_tid) == 1)
+					fields |= 0x2;
+			} else if (!(fields & 0x4) && strncmp(line, "Uid:", 4) == 0) {
+				/* skip ruid, read euid */
+				unsigned int _e;
+
+				if (sscanf(line + 4, " %*u %u", &_e) == 1) {
+					_euid = (uid_t)_e;
+					fields |= 0x4;
+				}
+			} else if (!(fields & 0x8) && strncmp(line, "Gid:", 4) == 0) {
+				/* skip rgid, read egid */
+				unsigned int _e;
+
+				if (sscanf(line + 4, " %*u %u", &_e) == 1) {
+					_egid = (gid_t)_e;
+					fields |= 0x8;
+				}
+			}
+		}
+
+		fclose(f);
+
+		if (_tid <= 0)
+			continue;
+
+		iter->tid  = _tid;
+		iter->euid = _euid;
+		iter->egid = _egid;
+		snprintf(iter->comm, sizeof(iter->comm), "%s", _comm);
+
+		*tid  = iter->tid;
+		*euid = iter->euid;
+		*egid = iter->egid;
+		*comm = iter->comm;
+		return true;
+	}
+
+	return false;
+}
+
+static void procps_close(struct procps_iter *iter)
+{
+	if (!iter)
+		return;
+
+	if (iter->procdir)
+		closedir(iter->procdir);
+
+	free(iter);
+}
+
 struct igt_process {
-#ifdef HAVE_LIBPROCPS
-	PROCTAB * proc;
-	proc_t *proc_info;
-#elif HAVE_LIBPROC2
-	struct pids_info *info;
-	struct pids_stack *stack;
-#endif
+	struct procps_iter *iter;
 	pid_t tid;
-	pid_t euid;
-	pid_t egid;
-	char *comm;
+	uid_t euid;
+	gid_t egid;
+	const char *comm;
 };
 
 static void open_process(struct igt_process *prcs)
 {
-#ifdef HAVE_LIBPROCPS
-	prcs->proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
-	igt_assert_f(prcs->proc != NULL, "procps open failed\n");
-	prcs->proc_info = NULL;
-#elif HAVE_LIBPROC2
-	enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID, PIDS_CMD };
-	int err;
-
-	prcs->info = NULL;
-	err = procps_pids_new(&prcs->info, Items, 4);
-	igt_assert_f(err >= 0, "procps-ng open failed\n");
-	prcs->stack = NULL;
-#endif
+	prcs->iter = procps_open();
+	igt_assert_f(prcs->iter, "procps open failed (no /proc filesystem?)\n");
 	prcs->tid = 0;
 	prcs->comm = NULL;
 }
 
 static void close_process(struct igt_process *prcs)
 {
-#ifdef HAVE_LIBPROCPS
-	if (prcs->proc_info)
-		freeproc(prcs->proc_info);
-
-	closeproc(prcs->proc);
-	prcs->proc_info = NULL;
-	prcs->proc = NULL;
-#elif HAVE_LIBPROC2
-	procps_pids_unref(&prcs->info);
-	prcs->info = NULL;
-#endif
+	procps_close(prcs->iter);
+	prcs->iter = NULL;
 	prcs->tid = 0;
 	prcs->comm = NULL;
 }
 
 static bool get_process_ids(struct igt_process *prcs)
 {
-#ifdef HAVE_LIBPROCPS
-	if (prcs->proc_info)
-		freeproc(prcs->proc_info);
-
-	prcs->tid = 0;
-	prcs->comm = NULL;
-	prcs->proc_info = readproc(prcs->proc, NULL);
-
-	if (prcs->proc_info) {
-		prcs->tid = prcs->proc_info->tid;
-		prcs->euid = prcs->proc_info->euid;
-		prcs->egid = prcs->proc_info->egid;
-		prcs->comm = prcs->proc_info->cmd;
-	}
-#elif HAVE_LIBPROC2
-	enum rel_items { EU_PID, EU_EUID, EU_EGID, EU_CMD }; // order at open
-
 	prcs->tid = 0;
 	prcs->comm = NULL;
-	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
-	if (prcs->stack) {
-#if defined(HAVE_LIBPROC2_POST_4_0_5_API)
-		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack);
-		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack);
-		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack);
-		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack);
-#else
-		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
-		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
-		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
-		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
-#endif
-	}
-#endif
-	return prcs->tid != 0;
+	return procps_next(prcs->iter,
+			   &prcs->tid, &prcs->euid, &prcs->egid,
+			   &prcs->comm);
 }
 
 /**
diff --git a/lib/meson.build b/lib/meson.build
index a8d6566ae..f25ecd8b2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -257,12 +257,6 @@ if build_xe_eudebug
 	lib_sources += 'xe/xe_eudebug.c'
 endif
 
-if libprocps.found()
-	lib_deps += libprocps
-else
-	lib_deps += libproc2
-endif
-
 if get_option('srcdir') != ''
     srcdir = join_paths(get_option('srcdir'), 'tests')
 else
diff --git a/meson.build b/meson.build
index e750f7a51..4def24cbc 100644
--- a/meson.build
+++ b/meson.build
@@ -133,18 +133,7 @@ build_info += 'With libdrm: ' + ','.join(libdrm_info)
 
 pciaccess = dependency('pciaccess', version : '>=0.10')
 libkmod = dependency('libkmod')
-libprocps = dependency('libprocps', required : false)
-libproc2 = dependency('libproc2', required : false)
-if libprocps.found()
-  config.set('HAVE_LIBPROCPS', 1)
-elif libproc2.found()
-  config.set('HAVE_LIBPROC2', 1)
-  if libproc2.version().version_compare('>= 4.0.5')
-    config.set('HAVE_LIBPROC2_POST_4_0_5_API', 1)
-  endif
-else
-  error('Either libprocps or libproc2 is required')
-endif
+# igt_procps.c reads /proc directly; libprocps and libproc2 are not needed.
 
 libunwind = dependency('libunwind', required : get_option('libunwind'))
 if libunwind.found()
-- 
2.43.0

