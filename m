Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A085E77198
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0162510E78E;
	Tue,  7 Jan 2025 20:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEy53DDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC0310E78C
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736280492; x=1767816492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0NgsgEw+eUcAZImg8A39ldUUtFmc8FSH4wUc6fT3v8c=;
 b=OEy53DDgGWIlTg2F/Iqxf8hvmzsMGiRHw5W7FLDnppOjfTGsLgI6U350
 ntD1tvsiPtFd7jBneXGpo+qKo03QDHxjDofvcty6Dww+atIY814N8uUvR
 WJnEFiQY3EJPyHUGLqDj6BxxtHwb1oi+pDIS8tYITFgUTmFji3goJ1+gs
 U66sakrgJL5vYEjd0BwBHHkqy5WYC1N49ldjay4x41Qhcx+3TOOBAlRVY
 YJRsxATQtpawAmGhnbouVRZ3+mStcdilxMNxLPzKQuxjepe7WGBM6cg+D
 nMVFofO2rjIqeGuogyrJaW7aa79X8HjEOBNdodLcXERC8dPEbLB8hOxHy A==;
X-CSE-ConnectionGUID: 9SsRWD1UQ6aphO2wEvzVhw==
X-CSE-MsgGUID: oD7oq3DqSYKUjzxjG/AWfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36367064"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36367064"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:08:12 -0800
X-CSE-ConnectionGUID: SrcAznIwQa2FIZwzZ3yDHA==
X-CSE-MsgGUID: 2QN7DPjtR+GDYm0JD0hkmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="102688368"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:08:10 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 4/5] lib/igt_core: Enhance __igt_fopen_data to
 support additional directories
Date: Wed,  8 Jan 2025 01:36:13 +0530
Message-ID: <20250107200614.963199-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
References: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
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
2.43.0

