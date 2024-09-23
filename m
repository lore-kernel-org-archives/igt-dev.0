Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0876BCF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4E510E390;
	Mon, 23 Sep 2024 07:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2XN0ro8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C4A10E390
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727075274; x=1758611274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GMe9ySxmHIOoKVnKsRuRBW5H8U8IqfA6YAzigZnOgaI=;
 b=a2XN0ro8vCdLW9qJJpE1c/nYzdD9yEzTBqr3TgNB1Um7wsOQ3Rv914jV
 fAMMjlC7Ps0mRfQXktXSf4PBzU3tVsx7n+Jygh4XnMu/AWb1V+KqYtQKW
 xPib3eI7bnK+8WcI7P6eRMuts84kim0tskzYDeunLuhWmnm5sHJ/HbQjP
 OQPpfeUWhkUNvfWsYKnCP/hsFifR9zFO0znpZnrIwfx2jlJh8UTfvQcEf
 IwYg/98ena7tsJtBiXV2oF9/lKLHe06ELBDGRpnj+AHIvTW9MwL74yPDB
 VNx7AoskAHZfkR3Wbh3mFFPGny3msDcGrjyhb2Uv9eInoFkiARYoqHrch g==;
X-CSE-ConnectionGUID: UtvaCBjNTq6lo9XyRUSYBA==
X-CSE-MsgGUID: b8wYE6pSQs+XL5sZ4pjaIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25956131"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25956131"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:07:53 -0700
X-CSE-ConnectionGUID: TONQC7tgSFWiLS9SeuBr1A==
X-CSE-MsgGUID: bhztH+PvQyKNXLy/9DjXCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71799139"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 00:07:52 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/6] lib: update fopen() to accomodate imgdir
Date: Mon, 23 Sep 2024 12:40:19 +0530
Message-Id: <20240923071023.1170127-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923071023.1170127-1-swati2.sharma@intel.com>
References: <20240923071023.1170127-1-swati2.sharma@intel.com>
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
 lib/igt_core.c | 10 ++++++++--
 lib/igt_core.h |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b551..1a7798d92 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3306,7 +3306,7 @@ void igt_reset_timeout(void)
 }
 
 FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename)
+		       const char* igt_imgdir, const char* filename)
 {
 	char path[PATH_MAX];
 	FILE *fp;
@@ -3317,8 +3317,14 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
 		snprintf(path, sizeof(path), "%s/%s", igt_srcdir, filename);
 		fp = fopen(path, "r");
 	}
+
+	if (!fp) {
+		snprintf(path, sizeof(path), "%s/%s", igt_imgdir, filename);
+		fp = fopen(path, "r");
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
2.25.1

