Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2300C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 09:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702A910E552;
	Tue, 22 Apr 2025 09:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbhALpNW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C398E10E552
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 09:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745314405; x=1776850405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJ7pJz9YAMv0Rh3IQlDOwXEAg9/e7WbovdNf5GRaGY0=;
 b=BbhALpNWjwgyGT/QS8cvxStKdd7q6bqVSKOqhNGZn3s/1Sm1YYu0blVE
 fMtGiPAT1D7fgEDE/DILMWVcyeD4l48dmkUqkhpEFu3NLGmTZ/rXFCRpk
 lfvK7Eb3J242TJXQSgO2N0P+oH+dQqwPPMhG4Y+r/uUAxzWTSee2j8y5h
 gvuJQEA1F96j71tqscv2vY2yMHwbnkiV6h0Mewe5ZA8BBAJj0C0BKj4lH
 /05rAMHIyouu0lgZAeGsibYQ11qUlYnfbwMUe2/j/Bz/UVj+gGx99wbbs
 ZsZbZaZDn1U8G+GZeVU3lbR8oFsGm0/VaAY88q4pL2YWOiRzNBdlvStUP g==;
X-CSE-ConnectionGUID: G5cx/MrbSPGA/OM90DdZqw==
X-CSE-MsgGUID: ExP2svrXSuGXOqnSZsLOww==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58232838"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="58232838"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:33:25 -0700
X-CSE-ConnectionGUID: cXs6lLRlSzmammITqvt5Xg==
X-CSE-MsgGUID: rrHWs1EfRIiWWxfTxiw6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131874778"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:33:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t 1/5] lib/igt_aux: Move is_mountpoint() to igt_aux
Date: Tue, 22 Apr 2025 15:25:57 +0530
Message-ID: <20250422095602.55041-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250422095602.55041-1-riana.tauro@intel.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: José Expósito <jose.exposito89@gmail.com>

Rename is_mountpoint() to igt_is_mountpoint() and make it available in
igt_aux.h/c.

Refactor, no functional change.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Jim Shargo <jshargo@chromium.org>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_aux.c     | 31 +++++++++++++++++++++++++++++++
 lib/igt_aux.h     |  2 ++
 lib/igt_debugfs.c | 29 ++---------------------------
 3 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index f5bf48da6..2905824a5 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1374,6 +1374,37 @@ static bool get_process_ids(struct igt_process *prcs)
 	return prcs->tid != 0;
 }
 
+/**
+ * igt_is_mountpoint() - Check if a path is a mounted filesystem
+ * @path: Root directory to test
+ *
+ * Returns: true if @path is the root of a mounted filesystem
+ */
+bool igt_is_mountpoint(const char *path)
+{
+	char buf[strlen(path) + 4];
+	struct stat st;
+	dev_t dev;
+
+	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/.", path), sizeof(buf));
+	if (stat(buf, &st))
+		return false;
+
+	if (!S_ISDIR(st.st_mode))
+		return false;
+
+	dev = st.st_dev;
+
+	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/..", path), sizeof(buf));
+	if (stat(buf, &st))
+		return false;
+
+	if (!S_ISDIR(st.st_mode))
+		return false;
+
+	return dev != st.st_dev;
+}
+
 /**
  * igt_is_process_running:
  * @comm: Name of process in the form found in /proc/pid/comm (limited to 15
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index bfd83adca..e8a1788b2 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -314,6 +314,8 @@ double igt_stop_siglatency(struct igt_mean *result);
 
 bool igt_allow_unlimited_files(void);
 
+bool igt_is_mountpoint(const char *path);
+
 int igt_is_process_running(const char *comm);
 int igt_terminate_process(int sig, const char *comm);
 void igt_lsof(const char *dpath);
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 8ac215a76..210a9cea0 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -67,37 +67,12 @@
  * General debugfs helpers
  */
 
-static bool is_mountpoint(const char *path)
-{
-	char buf[strlen(path) + 4];
-	struct stat st;
-	dev_t dev;
-
-	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/.", path), sizeof(buf));
-	if (stat(buf, &st))
-		return false;
-
-	if (!S_ISDIR(st.st_mode))
-		return false;
-
-	dev = st.st_dev;
-
-	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/..", path), sizeof(buf));
-	if (stat(buf, &st))
-		return false;
-
-	if (!S_ISDIR(st.st_mode))
-		return false;
-
-	return dev != st.st_dev;
-}
-
 static const char *__igt_debugfs_mount(void)
 {
-	if (is_mountpoint("/sys/kernel/debug"))
+	if (igt_is_mountpoint("/sys/kernel/debug"))
 		return "/sys/kernel/debug";
 
-	if (is_mountpoint("/debug"))
+	if (igt_is_mountpoint("/debug"))
 		return "/debug";
 
 	if (mount("debug", "/sys/kernel/debug", "debugfs", 0, 0))
-- 
2.47.1

