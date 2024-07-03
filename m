Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58EEC30658
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA2C10E718;
	Wed,  3 Jul 2024 00:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A39x/1RS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42EB10E6F8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966338; x=1751502338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=F6TgbLgbDH6Uu/wpGckbFLSuecPDbbPZcjpmrxv6Ns8=;
 b=A39x/1RSCT93mQ4gao9zsuVE3G73GR18lYCQWO+E0GD4MOi6nW05fPsh
 gfqZcx13s4T07ZuLC8eCzJr2Le/buKHj8XYZPWBPZ3OS16mxSUSjQu3XG
 n64sDquAp98BcG6mZcPAr/VUN/LgUUmgeOr1J/T49AiK8hILS7bNMdUak
 UGaY+AfLccYTQq/w7NmXQefWmzSslYda00M3tUL6ZHj//tRUDJhv4wY4v
 vt4b0dbCQhAiNEL8UUbmggEtOOJUcBPK1vE2VN5xEYTLPqFqzzdejtR1N
 dz7U+eStJzOrUeU4tnr7d+VelFF2UCofy1yofGixwWpgfVpdgNYKYs4hV g==;
X-CSE-ConnectionGUID: IphEV1feRjKSals0MVr5JQ==
X-CSE-MsgGUID: ONcWz0YWSy+uXbFgD3Y9EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074281"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074281"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
X-CSE-ConnectionGUID: pXsn5PSDQ0OQk3uPFXdiTA==
X-CSE-MsgGUID: ttGJGeegS1+RNA0/N9c9lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072865"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 02/10] tests/intel/xe_drm_fdinfo: Add
 basic-engine-utilization test
Date: Tue,  2 Jul 2024 17:25:24 -0700
Message-Id: <20240703002532.3156277-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
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

Add the basic test for engine utilization.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index f0aa23e2f..b64bef339 100644
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
@@ -35,10 +38,17 @@
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
@@ -287,6 +297,18 @@ static void basic_memory(int xe)
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
@@ -303,6 +325,10 @@ igt_main
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
2.38.1

