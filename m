Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE62CC021AD
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 21:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9C810E77E;
	Tue, 18 Feb 2025 21:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6n+Gaxt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7DD10E77E
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 21:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739915654; x=1771451654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l1stYS1kW+bvm4/tsBVpROQXdjgpWlsJtJPbMRGuOVw=;
 b=c6n+Gaxt8kgTr7KbYrWDivCPrcOvOsXsR1xdGGAGoziZWA/5B/7vIcXV
 Zhs4jQGMTv+BPvL3HY9T/gJknWqcWdlVuHGRjVcuOjqD6nWRXHA4OthKF
 ovV1xo2RzpTZofPczqnanDoraBJ16hW3mHZEYRNgzKRkCRXeL/77zfUHm
 /U/0UesIS0DvyMKLujvr0wbkOB6LBu91Ct1hWdrITJ8tKYPPREnAQzPoM
 +M7N1GJSBwX/qHnhorJvmxpa1xBhgV0X7UHZXtHf9JnXn5sS90MawClLv
 1pNVy9DEkY9kQaRj+ExH9QgqtC+K8HCo2jtWjoAfSOUulIX8slx2i206F g==;
X-CSE-ConnectionGUID: A7C1s5WvT2mfvFjGq7IUeQ==
X-CSE-MsgGUID: I1+GloukT7GfrzGbS9O3QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58170190"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="58170190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:54:14 -0800
X-CSE-ConnectionGUID: ki7K5UsRRpCD3ekjKL/MvA==
X-CSE-MsgGUID: +YoFhKpzRui1lXHQVLORcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119465947"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:54:12 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 4/5] lib/igt_core: Enhance __igt_fopen_data to
 support additional directories
Date: Wed, 19 Feb 2025 03:23:48 +0530
Message-ID: <20250218215349.1063788-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
References: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
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

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_core.c | 31 +++++++++++++++----------------
 lib/igt_core.h |  6 +++---
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b551..20162ff55 100644
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
+			      getenv("IGT_DATA_PATH"), "./data"};
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

