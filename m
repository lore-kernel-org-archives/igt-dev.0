Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4941EC27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 23:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CA610E114;
	Fri, 21 Jun 2024 23:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ch11c8hh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245110E098
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719010914; x=1750546914;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gxI6GOlTXP+HcsUP0pEwaLwqeUiF1UJqujSQ1EUXzgg=;
 b=ch11c8hhqRaG/YiYGGG74cX8q1vjp17FOwYE4+9mkaTQS+WOjTKvSdRi
 DezBkctmp0F9nYWZexdwqKxFlDX5il0RDPVjwIEvXn1PBatLI9jaLiPel
 SdXH4mlvlDjc2dKkNgiALem2G+M48zVTTY8srUqP7mgkXuhXEw6/nX+Zh
 Af3HZGxVBIahw4eSrqgHoWk8CIXKNLUUPLQVWOERix4rk1gy0isq27eTJ
 mVtM0b1VGUb8Mvvb2oWixLib0JCJBvlShjqNkE1wrLbPkCDZCALVR461T
 SnA5eAbPt44bXFLpjD7zY8MY5hy7Zif910Wry6ErY0Gr2ZdyiRh23LsVm w==;
X-CSE-ConnectionGUID: bAYW6y3jSnGWwNubhpWbQw==
X-CSE-MsgGUID: bOkn0dDcQLKxXnS1Fm4FjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16204928"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="16204928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:06 -0700
X-CSE-ConnectionGUID: apN1Ou3gQPGEiwZtzoBF/g==
X-CSE-MsgGUID: Wu1KCyzgQlOwd82MFK1uJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="42597316"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Update basic test to
 include client utilization
Date: Sat, 22 Jun 2024 07:00:55 +0800
Message-Id: <20240621230102.238397-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
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

Add per client utilization related checks to basic test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 40 +++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 2ceafba24..e624029b8 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -14,11 +14,11 @@
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
@@ -35,10 +35,17 @@
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
 /* Subtests */
 static void test_active(int fd, struct drm_xe_engine *engine)
 {
@@ -259,18 +266,21 @@ static void test_total_resident(int xe)
 	xe_vm_destroy(xe, vm);
 }
 
-static void basic(int xe)
+static void basic(int xe, unsigned int num_classes)
 {
 	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
 	struct drm_client_fdinfo info = { };
 	unsigned int ret;
 
-	ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
+	ret = igt_parse_drm_fdinfo(xe, &info, engine_map,
+				   ARRAY_SIZE(engine_map), NULL, 0);
 	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
 
 	igt_assert(!strcmp(info.driver, "xe"));
 
+	igt_assert_eq(info.num_engines, num_classes);
+
 	xe_for_each_mem_region(xe, memreg, region) {
 		memregion = xe_mem_region(xe, region);
 		igt_assert(info.region_mem[memregion->instance + 1].total >=
@@ -289,19 +299,37 @@ static void basic(int xe)
 
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe;
+	unsigned int num_engines = 0, num_classes = 0;
+	unsigned int classes[16] = { };
 	int xe;
 
 	igt_fixture {
 		struct drm_client_fdinfo info = { };
+		unsigned int i;
 
 		xe = drm_open_driver(DRIVER_XE);
 		igt_require_xe(xe);
 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
+		igt_require(info.num_engines);
+
+		xe_for_each_engine(xe, hwe) {
+			num_engines++;
+			igt_assert(hwe->engine_class < ARRAY_SIZE(classes));
+			classes[hwe->engine_class]++;
+		}
+		igt_require(num_engines);
+
+		for (i = 0; i < ARRAY_SIZE(classes); i++) {
+			if (classes[i])
+				num_classes++;
+		}
+		igt_assert(num_classes);
 	}
 
 	igt_describe("Check if basic fdinfo content is present");
 	igt_subtest("basic")
-		basic(xe);
+		basic(xe, num_classes);
 
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
-- 
2.34.1

