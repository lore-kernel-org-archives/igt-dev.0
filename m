Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED117CA5FAD
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 23:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A110E3E2;
	Tue, 29 Sep 2026 23:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5byopE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3620610E2FA
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 23:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790725633; x=1822261633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aLIGaldhi9FX9UsS0ijlT9wPfafVEqbz+3lcRYIUpV8=;
 b=B5byopE5ZkGvl69nohOqAPpeMnjL/DSw4ABmdwvtasWFwa1yxTGTxAiH
 H9CEm1DTH5vdjMtgweN00WRRXihvY4n2r6T5oCsHLEgbBny1gOC4cmpeG
 54hr6kD/hLJLimLT0sOcrvkPHqkMD5ieWdcJFe00hSlcyf+euKd9iyG6N
 cKEij7VdLO5El8hCDIU7xMCFCVP1AD+IuT4mjtNpuWHzWE3AfnGHm4SoG
 rCdTk4zHfm3G25ovXdQSBxlmTV5zFJOY55D/GmCrKhrsgGCRyYCGlFqu5
 OGiwX6oKXFX9FwAFgMv8+YzoXlNelOVs2QyZeM2iTfSr4J27ifHuR3rlP Q==;
X-CSE-ConnectionGUID: o52P+BVLRYavBLgAkF5cUA==
X-CSE-MsgGUID: 7dOrhQKaSgGACottsrg8rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="79021453"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="79021453"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 16:47:13 -0700
X-CSE-ConnectionGUID: sqlVBoW2RKWZhT5yTvu0eA==
X-CSE-MsgGUID: kywoLFeZTPa7BDfvxeo0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="305021739"
Received: from mdroper-desk1.fm.intel.com ([10.121.64.167])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 16:47:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] lib/igt_core: Don't rely on debugfs for tracefs access
Date: Tue, 29 Sep 2026 16:47:01 -0700
Message-ID: <20260929234700.1244647-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.55.0
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

Tracefs became a dedicated filesystem, independent of debugfs, in early
2015 and is expected to be mounted independently now (usually at
/sys/kernel/tracing).  For transitional compatibility, trying to access
the old debugfs location ($debugfs/tracing) will automatically mount
another copy of tracefs at that location.  However as of kernel commit
9ba817fb7c6a ("tracing: Deprecate auto-mounting tracefs in debugfs"),
this transitional automounting is deprecated; it currently prints a
message in dmesg at WARN log level (which IGT will treat as a test
failure) and will likely be removed entirely at some point in the
future.

Stop relying on debugfs for access to tracing.  Instead scan
/proc/mounts to find the real location where tracefs is mounted (this
will usually be /sys/kernel/tracing, but that isn't guaranteed).  If
tracefs isn't already mounted, attempt to manually mount it.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_core.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index d5dc5324d..cfb33863e 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -34,6 +34,7 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
+#include <sys/mount.h>
 #include <string.h>
 #include <sys/mman.h>
 #include <signal.h>
@@ -704,14 +705,60 @@ void igt_kmsg(const char *format, ...)
 	fclose(file);
 }
 
+static void cleanup_fclose(FILE **f)
+{
+	if (*f)
+		fclose(*f);
+}
+
+static const char *__igt_tracefs_mount(void)
+{
+	FILE *f __attribute__((__cleanup__(cleanup_fclose))) = NULL;
+	char line[1024];
+
+	f = fopen("/proc/mounts", "r");
+	if (!f)
+		return NULL;
+
+	while (fgets(line, sizeof(line), f)) {
+		char *dev, *dir, *save;
+
+		dev = strtok_r(line, " ", &save);
+		dir = strtok_r(NULL, " ", &save);
+
+		if (strcmp(dev, "tracefs") == 0)
+			return strdup(dir);
+	}
+
+	/* Doesn't appear to be mounted yet; try to mount it manually */
+	if (mount("tracefs", "/sys/kernel/tracing", "tracefs", 0, 0) == 0)
+		return "/sys/kernel/tracing";
+
+	return NULL;
+}
+
+static const char *igt_tracefs_mount(void)
+{
+	static const char *path;
+
+	if (!path)
+		path = __igt_tracefs_mount();
+
+	return path;
+}
+
 void igt_trace(const char *format, ...)
 {
 	char path[128];
+	const char *tracefs;
 	va_list ap;
 	FILE *file;
 
-	snprintf(path, sizeof(path), "%s/tracing/trace_marker",
-		 igt_debugfs_mount());
+	tracefs = igt_tracefs_mount();
+	if (!tracefs)
+		return;
+
+	snprintf(path, sizeof(path), "%s/trace_marker", tracefs);
 
 	file = fopen(path, "w");
 	if (file == NULL)
-- 
2.55.0

