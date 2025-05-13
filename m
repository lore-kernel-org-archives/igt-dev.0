Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F219C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 14:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F144010E39F;
	Tue, 13 May 2025 14:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JY3lc1lZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF8710E39F
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 14:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747145125; x=1778681125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJ7pJz9YAMv0Rh3IQlDOwXEAg9/e7WbovdNf5GRaGY0=;
 b=JY3lc1lZNzagvo5iPN7JtyZ1gyrnOexO9+6UJgcwT95Fe4rUj2xM2zAp
 Tx2fth/2wpVvF68GKtgjFmea+P50GxSr2vux0irTFwS0ubQE7k2w/4jJs
 vRuv2LIEjY/oFXTz6ckcLv13Y/3anU0BnVhF+KNJmyIu4JffAzgHgp1pZ
 MrMJXtgruEF91tel0fknQxoO9cJcR7vMsLDNNJrvu5oRa83sJPiG+gvuz
 w+KVMGCmsDcJ1SRBEzWPe3W++DxQdX4ZhhK/BtCMC5kKtf9usVeTIgULM
 w+deIDdtY5iwx4LKGQ9CG8BVFSo7KokMqnEOLdnuiiMEJB60q4xA7t+Dw Q==;
X-CSE-ConnectionGUID: P1TuvYCSSkiimKjry2OM/w==
X-CSE-MsgGUID: f8t/qYrOS2yVKmaz99CbAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48102381"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48102381"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:05:24 -0700
X-CSE-ConnectionGUID: U0Htfr5lScmhSw1ooAlD/Q==
X-CSE-MsgGUID: OH12PFkmTk+L3L3EbwZ5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="137583543"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:05:20 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t v3 1/5] lib/igt_aux: Move is_mountpoint() to igt_aux
Date: Tue, 13 May 2025 19:58:21 +0530
Message-ID: <20250513142827.1129334-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513142827.1129334-1-riana.tauro@intel.com>
References: <20250513142827.1129334-1-riana.tauro@intel.com>
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

