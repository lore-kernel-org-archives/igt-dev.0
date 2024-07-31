Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2867C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A6810E641;
	Wed, 31 Jul 2024 14:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBfvw+Uk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C005A10E63C
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437536; x=1753973536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8dCFuzsGy+tPVKWA8V2/vrXriKb0Y0TLMtZxQ2IzMM=;
 b=RBfvw+UkjhJTajjtWBZXaoMW//tW6mzQGgmNPGsWrsw8zTjy5duYwyIa
 AcVIiUDIFvpH4U2k6mKQUP1BjfXMX4+Bh2VYqR+RvGndncDvHqFG5QpJ1
 hP+5hEpvSd39Dm9s6JEVhG92oTr5jJXxqrZvDiesN31x+3Dbc7DbNOmIs
 fS+6kAU1+roHAdDL6k8pj32iwCiD5xiqrye/OnNm1WHZHIggGqkgVV9ge
 7mWCaQsIe4TwRm2Pgm0Ue/fIJ7XYKZNaonuUgN/vEhi7qrjDHkG845CXs
 jCKv3UafhfoKnQVy5fdAL+OshLYEjXafTgNthJzJjSNsx7ar4uwfXYw7R g==;
X-CSE-ConnectionGUID: loByZqHMT1+UTDVlrqWYbQ==
X-CSE-MsgGUID: TI0jxQJDQIakHzBxWTqW+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37838499"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37838499"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:52:07 -0700
X-CSE-ConnectionGUID: ueDVXskNQ4ieIVhFpEEktA==
X-CSE-MsgGUID: wzd6AorqQoCIKVL2/I8OVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="58845527"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:52:05 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_drm_fdinfo: Add
 basic-engine-utilization test
Date: Wed, 31 Jul 2024 20:32:50 +0530
Message-Id: <20240731150252.2951870-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731150252.2951870-1-jeevan.b@intel.com>
References: <20240731150252.2951870-1-jeevan.b@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Add the basic test for engine utilization.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/r/20240703002532.3156277-3-umesh.nerlige.ramappa@intel.com
---
 tests/intel/xe_drm_fdinfo.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index f0aa23e2f..2f9661a0b 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -14,17 +14,20 @@
 #include "xe/xe_spin.h"
 /**
  * TEST: xe drm fdinfo
- * Description: Read and verify drm client memory consumption using fdinfo
+ * Description: Read and verify drm client memory consumption and engine utilization using fdinfo
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: driver
- * Functionality: Per client memory statistics
+ * Functionality: Per client memory and engine utilization statistics
  * Feature: SMI, core
  * Test category: SysMan
  *
  * SUBTEST: basic-memory
  * Description: Check if basic fdinfo content is present for memory
  *
+ * SUBTEST: basic-engine-utilization
+ * Description: Check if basic fdinfo content is present for engine utilization
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -35,10 +38,18 @@
  * Description: Create and compare active memory consumption by client
  */
 
-IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo");
+IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine utilization using fdinfo");
 
 #define BO_SIZE (65536)
 
+static const char *engine_map[] = {
+	"rcs",
+	"bcs",
+	"vcs",
+	"vecs",
+	"ccs",
+};
+
 /* Subtests */
 static void test_active(int fd, struct drm_xe_engine *engine)
 {
@@ -287,6 +298,18 @@ static void basic_memory(int xe)
 	}
 }
 
+static void basic_engine_utilization(int xe)
+{
+	struct drm_client_fdinfo info = { };
+	unsigned int ret;
+
+	ret = igt_parse_drm_fdinfo(xe, &info, engine_map,
+				   ARRAY_SIZE(engine_map), NULL, 0);
+	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
+	igt_assert(!strcmp(info.driver, "xe"));
+	igt_require(info.num_engines);
+}
+
 igt_main
 {
 	int xe;
@@ -303,6 +326,10 @@ igt_main
 	igt_subtest("basic-memory")
 		basic_memory(xe);
 
+	igt_describe("Check if basic fdinfo content is present for engine utilization");
+	igt_subtest("basic-engine-utilization")
+		basic_engine_utilization(xe);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.25.1

