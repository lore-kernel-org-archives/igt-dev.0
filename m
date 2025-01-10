Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FB0E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 19:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F92D10E52B;
	Fri, 10 Jan 2025 19:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvORvcw4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6B10E52B
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736538359; x=1768074359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2OG9g2W1/JAiP5u3CU6rDsndglvfIuCWFWycXDdweIk=;
 b=HvORvcw4vSYX+jHnrDJ3PSeJwy+ocBGmjVjL1RCP9xVDSaTKffVmAj9Y
 wJPPvv//wXe/vcc6rz76+1HkehE7Kms3a5c8tSTSMCg//vHIKMESPxppW
 T2d4Wf7Biu2Rd9PIh8529tHo/g2OYNMXWOktNF6/KcBGljKLer00NtAVQ
 pssVQGawlKW7QRa28x5kL9Vq/CbQF0X5zxeB0U4Vf6H2jntN54/jwPMlA
 utS/vmWQRkQT+YJtJ83W+jrRp1xelAujDKK1qvQs98gl/RjOY7iifHeAE
 jRQdrTc8jJUzEN8mTSd7AUaL8fXdcpsbOKpM39cX+KZm/tRpcel7CEMcx g==;
X-CSE-ConnectionGUID: LCYbGTNYS7uM3LSbMNL4iw==
X-CSE-MsgGUID: GYcHgunwSD6X/Q8d3bCjJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47419805"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="47419805"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:59 -0800
X-CSE-ConnectionGUID: JYfxBk/ZRVyDi8cKrk6IHQ==
X-CSE-MsgGUID: PgaEk2KFQYaeBOgaUvit7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="104334432"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:57 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/8] lib/igt_core: Enhance __igt_fopen_data to support
 additional directories
Date: Sat, 11 Jan 2025 01:20:56 +0530
Message-Id: <20250110195100.150301-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250110195100.150301-1-swati2.sharma@intel.com>
References: <20250110195100.150301-1-swati2.sharma@intel.com>
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

From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Add an additional parameter for the image directory. Refactor the
function to use an array of directories to iterate through, reducing
redundancy. Include a check for the "IGT_RUNNER_DATA" environment
variable.

v2: Fix review comments.   (Santhosh, Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_core.c | 31 +++++++++++++++----------------
 lib/igt_core.h |  6 +++---
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b551..cd43d276a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3305,27 +3305,26 @@ void igt_reset_timeout(void)
 	igt_set_timeout(0, NULL);
 }
 
-FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
-		       const char* filename)
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
+	size_t i;
+	const char *dirs[] = {igt_datadir, igt_srcdir, igt_imgdir,
+				     getenv("IGT_RUNNER_DATA"), "./data"};
+
+	for (i = 0; i < ARRAY_SIZE(dirs); i++) {
+		if (dirs[i]) {
+			snprintf(path, sizeof(path), "%s/%s", dirs[i], filename);
+			fp = fopen(path, "r");
+			if (fp)
+				return fp;
+		}
 	}
 
-	if (!fp)
-		igt_critical("Could not open data file \"%s\": %m\n", filename);
-
-	return fp;
+	igt_critical("Could not open data file \"%s\": %m\n", filename);
+	return NULL;
 }
 
 static void log_output(int *fd, enum igt_log_level level)
diff --git a/lib/igt_core.h b/lib/igt_core.h
index f0ba1a381..05134a104 100644
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
2.25.1

