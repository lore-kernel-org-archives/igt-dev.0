Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31772C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 19:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83010E29C;
	Mon, 12 Aug 2024 19:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTALMjQd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAEB10E29C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 19:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723491701; x=1755027701;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ppGYIH4JVMNeWW9Xo4FMEpn5xh5JJv6G9C/52ZxaI0c=;
 b=CTALMjQd4XNAbNqm/EpSJ4NRKgw6a5vcJJXxcWcun4Wn6fzOFdncwkgJ
 WTasCLG2c5Wd4lBAJCOwhdSPvmonKdiv9jivEeOPuGsrWQVG9sevQTtSO
 McF1mUtlRX9mq0u1K/cGT35c0qL6NE2MVJdnaMiUmk3Lcor2oO4zcg3PK
 qt2DbML+MxqzCKL3p9ZqMjKXKOj2ABZp2iyeZFv2IVrO5xjlI4TFGKbaA
 JkZcyF/zrtB2jZYFcdyDPU5Q/4/Z/vnoS5pf2K2Z3clDgW9b1jbXyf5T8
 keAa4Yo804OO6J8gHdAhNgB2AFMcZdRAd1sqhT8K9ePSjvcSL86FmNIVx g==;
X-CSE-ConnectionGUID: +b0DjYZgS4S5Y5EjN0xWtQ==
X-CSE-MsgGUID: m1fNEuFcTEG1JWCeQqmeHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21788430"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="21788430"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 12:41:41 -0700
X-CSE-ConnectionGUID: MKZU83MKRC6OK96oyox/MQ==
X-CSE-MsgGUID: Qe4dhSvBS2Kml0NC1eSuOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; d="scan'208";a="58443114"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2024 12:41:40 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH 2/2] tests/intel: Adopt igt_sysfs_engines dependent tests to
 use query engine class
Date: Tue, 13 Aug 2024 01:11:36 +0530
Message-Id: <20240812194136.6352-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240812194136.6352-1-sai.gowtham.ch@intel.com>
References: <20240812194136.6352-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Adopt igt_sysfs_engines denpendent tests to query engine class based on
the updated sysfs engines queried.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_queue_property.c |  7 ++++---
 tests/intel/xe_sysfs_defaults.c      |  5 +++--
 tests/intel/xe_sysfs_scheduler.c     | 10 ++++++----
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 3edab0af5..25a7e7abb 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -64,7 +64,8 @@ static void test_set_property(int xe, int property_name,
 					     &exec_queue_id), err_val);
 }
 
-static void test_property_min_max(int xe, int engine, const char **property)
+static void test_property_min_max(int xe, int engine, const char **property,
+				  uint16_t class, int gt)
 {
 	unsigned int max;
 	unsigned int min;
@@ -198,7 +199,7 @@ igt_main
 {
 	static const struct {
 		const char *name;
-		void (*fn)(int, int, const char **);
+		void (*fn)(int, int, const char **, uint16_t, int);
 	} tests[] = {{"property-min-max", test_property_min_max}, {} };
 
 	const char *property[][3] = { {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
@@ -257,7 +258,7 @@ igt_main
 						engines_fd = openat(gt_fd, "engines", O_RDONLY);
 						igt_require(engines_fd != -1);
 
-						igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
+						igt_sysfs_engines(xe, engines_fd, 0, 0, property[i], t->fn);
 						close(engines_fd);
 						close(gt_fd);
 					}
diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 1777158d5..393e56651 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -28,7 +28,8 @@
 #include "xe_drm.h"
 #include "xe/xe_query.h"
 
-static void test_defaults(int xe, int engine, const char **property)
+static void test_defaults(int xe, int engine, const char **property,
+			  uint16_t class, int gt)
 {
 	struct dirent *de;
 	uint64_t property_value;
@@ -81,7 +82,7 @@ igt_main
 			engines_fd = openat(gt_fd, "engines", O_RDONLY);
 			igt_require(engines_fd != -1);
 
-			igt_sysfs_engines(xe, engines_fd, NULL, test_defaults);
+			igt_sysfs_engines(xe, engines_fd, 0, 0, NULL, test_defaults);
 
 			close(engines_fd);
 			 close(gt_fd);
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 979ce95d2..947dbdbc9 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -37,7 +37,8 @@
 #include "xe_drm.h"
 #include "xe/xe_query.h"
 
-static void test_invalid(int xe, int engine, const char **property)
+static void test_invalid(int xe, int engine, const char **property,
+			 uint16_t class, int gt)
 {
 	unsigned int saved, set;
 	unsigned int min, max;
@@ -57,7 +58,8 @@ static void test_invalid(int xe, int engine, const char **property)
 	igt_assert_eq(set, saved);
 }
 
-static void test_min_max(int xe, int engine, const char **property)
+static void test_min_max(int xe, int engine, const char **property,
+			 uint16_t class, int gt)
 {
 	unsigned int default_max, max;
 	unsigned int default_min, min;
@@ -113,7 +115,7 @@ igt_main
 {
 	static const struct {
 		const char *name;
-		void (*fn)(int, int, const char **);
+		void (*fn)(int, int, const char **, uint16_t, int);
 	} tests[] = {
 		{ "invalid", test_invalid },
 		{ "min-max", test_min_max },
@@ -150,7 +152,7 @@ igt_main
 					engines_fd = openat(gt_fd, "engines", O_RDONLY);
 					igt_require(engines_fd != -1);
 
-					igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
+					igt_sysfs_engines(xe, engines_fd, 0, 0, property[i], t->fn);
 					close(engines_fd);
 					close(gt_fd);
 				}
-- 
2.39.1

