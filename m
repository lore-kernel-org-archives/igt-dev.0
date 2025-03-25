Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E666CC3600D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 21:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE8310E602;
	Tue, 25 Mar 2025 21:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXRxhsYT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DEE10E602
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742936535; x=1774472535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z17KjfQhst5XFMWtmYgL0u5/3PFkX1LiJT60iZ4kYgE=;
 b=iXRxhsYTPlvp7xz2FpT8M4dtme9aXrPvTWN0Hs7omk8qAH8wWgOmfZhN
 QSyf3CogvwIipTaDN1QJ15BVanwrqZQ8zp33kdUgR/6WPx1O3uM8iJqQ/
 l1KDYhsrxXMNFXnfpSHlyiGNHWaO6T9ap9Wx8er7B9shOLQO2yHrCl3gY
 1ZMjSmjebhrwpW4YFOkiemttzylmeumq6TXLplhuQMfqo0Y0M4sFRBkCN
 RzK+oWTvVrMru5pWB7iCpxdBEgxxMFpDQNaccD/eccypPIHXBwSavES/b
 yBT8P6f16xfo4qFYa0uI8BHSVnCgZol6UsKY0dNi2AGHWlgid+1KX1gmL Q==;
X-CSE-ConnectionGUID: xVoOKNnrTymOisGDII+EkA==
X-CSE-MsgGUID: oJUKTCyiTtqVr4FuXL5vAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55584504"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="55584504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:02:14 -0700
X-CSE-ConnectionGUID: soqmRXabQnGHUSeSac5eWw==
X-CSE-MsgGUID: xCD8yt5pSfGoWZ9KqIHJSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129164701"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:02:13 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 4/5] lib/igt_core: Enhance __igt_fopen_data to
 support additional directories
Date: Wed, 26 Mar 2025 02:31:45 +0530
Message-ID: <20250325210146.3338454-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
References: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
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

Add an additional parameter for the image directory. Refactor the
function to use an array of directories to iterate through, reducing
redundancy.

v2: Fix review comments.   (Santhosh, Kamil)
v3: Update env variable name. (Kamil)
v4: Fix review comments. (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_core.c | 36 ++++++++++++++++++++++++------------
 lib/igt_core.h |  6 +++---
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index dca26a8d3..520a3675f 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3309,21 +3309,33 @@ void igt_reset_timeout(void)
 	igt_set_timeout(0, NULL);
 }
 
-FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename)
+/**
+ * __igt_fopen_data:
+ * @igt_srcdir:  Directory path for source files.
+ * @igt_datadir: Directory path for data files
+ * @igt_imgdir: Directory path for image files.
+ * @filename: Name of the file to be opened.
+ *
+ * This function attempts to open a data file from a list of specified
+ * directories. A file pointer to the opened file. If the file cannot
+ * be opened, it returns NULL and logs a critical error message.
+ *
+ */
+FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
+		       const char *igt_imgdir, const char *filename)
 {
 	char path[PATH_MAX];
 	FILE *fp;
-
-	snprintf(path, sizeof(path), "%s/%s", igt_datadir, filename);
-	fp = fopen(path, "r");
-	if (!fp) {
-		snprintf(path, sizeof(path), "%s/%s", igt_srcdir, filename);
-		fp = fopen(path, "r");
-	}
-	if (!fp) {
-		snprintf(path, sizeof(path), "./%s", filename);
-		fp = fopen(path, "r");
+	const char *dirs[] = {igt_datadir, igt_srcdir, igt_imgdir,
+			      getenv("IGT_DATA_PATH"), "./data"};
+
+	for (int i = 0; i < ARRAY_SIZE(dirs); i++) {
+		if (dirs[i]) {
+			snprintf(path, sizeof(path), "%s/%s", dirs[i], filename);
+			fp = fopen(path, "r");
+			if (fp)
+				break;
+		}
 	}
 
 	if (!fp)
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 0f2af950b..fbf6a90fa 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1456,8 +1456,8 @@ static inline uint32_t igt_seconds_elapsed(struct timespec *start)
 
 void igt_reset_timeout(void);
 
-FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename);
+FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
+		       const char *igt_imgdir, const char *filename);
 /**
  * igt_fopen_data:
  * @filename: filename to open.
@@ -1466,7 +1466,7 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
  * then from build directory, and finally from current directory.
  */
 #define igt_fopen_data(filename) \
-	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, filename)
+	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
 
 int igt_system(const char *command);
 int igt_system_quiet(const char *command);
-- 
2.43.0

