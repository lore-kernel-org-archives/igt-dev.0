Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B02DD6004C
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 07:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544A410E5E0;
	Tue, 19 Nov 2024 07:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhJ5P4Eg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1466A10E5E0
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732002861; x=1763538861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+p1jhgmhUab7FFfpgRfxqAhl+m1jUophsm6UHuhjHA=;
 b=VhJ5P4Eg4GU0IXNl3WZkTvuBOFgXOawOmCOq1pDMHpQ3L5gcgF8H8OQX
 kOCjeg9wF0ycfBJ673w59QkA4jPPtx453AJHIj5vvMoelqwEdORDJ/5jY
 wI9xRXh1z2PCdCdxtSk/UcVp+3zCNktg6kh+4j7//MeLD6cSstzGX5L86
 IX3RJ0ekHkBmWHBMhVFWuRHLLxUkvBlkJYNuYLHt51v+MoK7QAbrwxx+C
 WtvfjpMwq3aAUZuXJ1QHCn4lPklR3G/pjsgdF0phhQm5Rh8wqfuaMc3Fe
 ls4qve8R72fWi5SAyrQG3buZvzIAmdxbanDsFjT0HqOepTLI2V1WN4V4r Q==;
X-CSE-ConnectionGUID: 7RigbkDxRreUKaSUzjOLVg==
X-CSE-MsgGUID: Goqd1LWXQF6oJXgt68OTnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32136141"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32136141"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 23:54:21 -0800
X-CSE-ConnectionGUID: vmQtXcWwTr2nYnP0iqYzmg==
X-CSE-MsgGUID: NCoqzTCzQn2JqMhq5YdEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="90278724"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 23:54:19 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: [PATCH 4/5] lib: update fopen() to accomodate imgdir
Date: Tue, 19 Nov 2024 13:22:58 +0530
Message-ID: <20241119075259.3048734-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
References: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
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

From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>

Update fopen() to accomodate imgage directory path. Tests like kms_3d
use this function while creating fb from png image.

Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_core.c | 17 +++++++++++++++--
 lib/igt_core.h |  4 ++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b551..8dae8f51d 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3306,10 +3306,11 @@ void igt_reset_timeout(void)
 }
 
 FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename)
+		       const char* igt_imgdir, const char* filename)
 {
 	char path[PATH_MAX];
 	FILE *fp;
+	char *abpath;
 
 	snprintf(path, sizeof(path), "%s/%s", igt_datadir, filename);
 	fp = fopen(path, "r");
@@ -3317,8 +3318,20 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
 		snprintf(path, sizeof(path), "%s/%s", igt_srcdir, filename);
 		fp = fopen(path, "r");
 	}
+
+	if (!fp) {
+		snprintf(path, sizeof(path), "%s/%s", igt_imgdir, filename);
+		fp = fopen(path, "r");
+        }
+
+	if (!fp) {
+		abpath = getenv("IMGDIR");
+                snprintf(path, sizeof(path), "%s/%s", abpath, filename);
+                fp = fopen(path, "r");
+        }
+
 	if (!fp) {
-		snprintf(path, sizeof(path), "./%s", filename);
+		snprintf(path, sizeof(path), "./data/%s", filename);
 		fp = fopen(path, "r");
 	}
 
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 90f57402f..5b058a8d0 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1457,7 +1457,7 @@ static inline uint32_t igt_seconds_elapsed(struct timespec *start)
 void igt_reset_timeout(void);
 
 FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename);
+		       const char* igt_imgdir, const char* filename);
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

