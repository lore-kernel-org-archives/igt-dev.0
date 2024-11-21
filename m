Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74309D6ED32
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 13:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B9810E95B;
	Thu, 21 Nov 2024 13:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HX9ZY+rV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7E10E95B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732196480; x=1763732480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+p1jhgmhUab7FFfpgRfxqAhl+m1jUophsm6UHuhjHA=;
 b=HX9ZY+rVeXAdyAA//8698BVY/CuB0Y7w+hMI8+qz2f5ATdlbA3xvanS0
 57od3qhTayvGpU3EfbSA16BZ/K6We7FB4oLAufJe6OS3xuT/XwxyxU7PY
 Quus+JFZGRbMnNkp0XkcMzpRfcUk6Bk9alTSmqYfdLAbJmEGw7Bmbd6qp
 6XNUxz/X3hdxRnctP1V/wtq16G5AqQLiYIA6oqm0qjCi1MPEiD9PSod+c
 81o13Snak3kwFu4SuEoCMmkDtNRM47HLPzjVMf/lZAZzeuBBj79AiWUDR
 iJbH2ziAn/6o4ENV3IZUofKs5J8A/I+xNUeuHa/N+Pr3j/17hJkDPV+GK w==;
X-CSE-ConnectionGUID: mRzpabrQSzuCNRYs3A8M3g==
X-CSE-MsgGUID: o1TKVtcNQXKBfeB/1ZZ3rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54809155"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="54809155"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 05:41:20 -0800
X-CSE-ConnectionGUID: lQFOxV6nSWu8t4AgDNcYdg==
X-CSE-MsgGUID: JK/MDceMS82DP4GWc9KyMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90192552"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 05:41:19 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 4/5] lib: update fopen() to accomodate imgdir
Date: Thu, 21 Nov 2024 19:09:57 +0530
Message-ID: <20241121133958.3382633-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
References: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
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

