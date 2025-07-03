Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EADC83F04
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 07:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2E510E7DC;
	Thu,  3 Jul 2025 07:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsuW66VH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E4210E7DC
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751529225; x=1783065225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LICgDn9ZLT2vxjS5FvDrvz0S7cwnMXHCmoi/F4qanCc=;
 b=AsuW66VHWjorHIjZeH4z5GrYSVp2bmiQFlmBOajSDxqaIdwg7qW8i8GU
 AvASPiXKHfryBxqXeHbpQeZN2FZB4gia74vit3jdQ1cqam7MmQYPucfzj
 ZxeA5G3qw6lvE2oTwfR+gUNd8bJzYzKfw/vk96vbtBXvEXRnyMFp0eEIS
 ZMBLv6KdihiTxKeS1boYUDRmdgV7HcM3Ht68ydDW1Nsb/yO9RHO6WvvID
 OSWBCumn57QqJYAQIysjlAixoRwTfsc/nez8mnU/tNaAph9/yNeq5tj7f
 JyfpXpQvCUDMhgboTkvogZxdhxmUSZdr9raZe8BzU0pPnJQQhdhAyxtkI A==;
X-CSE-ConnectionGUID: Dw7iQTmgTTWa91G8vXwNYw==
X-CSE-MsgGUID: Jd5lqA6WQvaH365ccKlJmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71279220"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="71279220"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:45 -0700
X-CSE-ConnectionGUID: 5He5KzmpTGGbPPOIAGFTZg==
X-CSE-MsgGUID: wwGnmGxgQpSdnzPS6peoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153732183"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:43 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 3/4] lib/igt_core: Enhance __igt_fopen_data to
 support additional directories
Date: Thu,  3 Jul 2025 13:23:43 +0530
Message-ID: <20250703075344.95774-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
References: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 36 ++++++++++++++++++++++++------------
 lib/igt_core.h |  6 +++---
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index c2674a272..629177764 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3336,21 +3336,33 @@ void igt_reset_timeout(void)
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
index 2db579423..73f7137d9 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1459,8 +1459,8 @@ static inline uint32_t igt_seconds_elapsed(struct timespec *start)
 
 void igt_reset_timeout(void);
 
-FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename);
+FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
+		       const char *igt_imgdir, const char *filename);
 /**
  * igt_fopen_data:
  * @filename: filename to open.
@@ -1469,7 +1469,7 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
  * then from build directory, and finally from current directory.
  */
 #define igt_fopen_data(filename) \
-	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, filename)
+	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
 
 int igt_system(const char *command);
 int igt_system_quiet(const char *command);
-- 
2.43.0

