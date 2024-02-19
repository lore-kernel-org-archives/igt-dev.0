Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC56C54764
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 14:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF5210E2EB;
	Mon, 19 Feb 2024 14:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+f4W/Hc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBDC10E29B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708353315; x=1739889315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iBrEBVCK9+GBCV098GRrAfye+kw+RgdCt6jXB6rL5DM=;
 b=N+f4W/HcDD8HwwKJG8VryDCQjA7HBRWDuBdSyVRn/e6yBQw4GWuCbK3E
 PL7Oes+mtGcCfo8dSnwmYWScmJU4Dd9CZwTVHLeNCHMirhdEJrHbvtEmh
 VzcCqC8rO6DGqQ0K7TfoDSJME6Aco9sdWIKnPL+Yn6IPanl0pL3FWjbZM
 TqeA3LhH/LUaZEGSRZfbIRHD2bcx++yP2Aw9cGTVB3U3YSh3yh2KgnZIS
 ExqmAljyfQlT1/0LzzRK1iQiowzVJw59xlWQsWxEvuAvL94D6cyDYoC8s
 AvjJwTRxxE7ZfPldkwE8mU8LuxvW5f6bheWKDyiShvFuQ/77U5ZsOkJNo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="12983834"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="12983834"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 06:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4545807"
Received: from laileona-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.20])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 06:35:14 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t,
 v3 2/2] drm-uapi/xe: Add test to query HuC firmware version
Date: Mon, 19 Feb 2024 14:35:01 +0000
Message-Id: <20240219143501.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219143501.7-1-francois.dugast@intel.com>
References: <20240219143501.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This aligns with kernel commit ("drm/xe: Extend uAPI to query HuC
micro-controler firmware version").

v2:
- Fix printing branch (Francois Dugast)
- Make ENODEV the only accepted error (José Roberto de Souza)

v3:
- Share code between guc and huc tests (John Harrison)

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/drm-uapi/xe_drm.h |  1 +
 tests/intel/xe_query.c    | 89 ++++++++++++++++++++++++++++++---------
 2 files changed, 71 insertions(+), 19 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 3bd795f27..ce4acf9d4 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -583,6 +583,7 @@ struct drm_xe_query_engine_cycles {
 struct drm_xe_query_uc_fw_version {
 	/** @uc: The micro-controller type to query firmware version */
 #define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
+#define XE_QUERY_UC_TYPE_HUC 1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index bbe5955eb..b21c3820a 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -730,18 +730,8 @@ static void test_engine_cycles_invalid(int fd)
 	query_engine_cycles(fd, &ts);
 }
 
-/**
- * SUBTEST: query-uc-fw-version-guc
- * Test category: functionality test
- * Description: Display the GuC firmware submission version
- *
- * SUBTEST: multigpu-query-uc-fw-version-guc
- * Test category: functionality test
- * Sub-category: MultiGPU
- * Description: Display GuC firmware submission version for all Xe devices.
- */
 static void
-test_query_uc_fw_version_guc(int fd)
+test_query_uc_fw_version(int fd, uint32_t uc_type)
 {
 	struct drm_xe_query_uc_fw_version *uc_fw_version;
 	struct drm_xe_device_query query = {
@@ -750,6 +740,7 @@ test_query_uc_fw_version_guc(int fd)
 		.size = 0,
 		.data = 0,
 	};
+	int ret;
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
@@ -757,20 +748,63 @@ test_query_uc_fw_version_guc(int fd)
 	igt_assert(uc_fw_version);
 
 	memset(uc_fw_version, 0, sizeof(*uc_fw_version));
-	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
+	uc_fw_version->uc_type = uc_type;
 	query.data = to_user_pointer(uc_fw_version);
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
-		 uc_fw_version->branch_ver,
-		 uc_fw_version->major_ver,
-		 uc_fw_version->minor_ver,
-		 uc_fw_version->patch_ver);
-	igt_assert(uc_fw_version->major_ver > 0 || uc_fw_version->minor_ver > 0);
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+
+	switch (uc_type) {
+	case XE_QUERY_UC_TYPE_GUC_SUBMISSION:
+		igt_assert(ret == 0);
+		igt_assert(uc_fw_version->major_ver > 0 ||
+			   uc_fw_version->minor_ver > 0);
+		igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
+			 uc_fw_version->branch_ver,
+			 uc_fw_version->major_ver,
+			 uc_fw_version->minor_ver,
+			 uc_fw_version->patch_ver);
+		break;
+	case XE_QUERY_UC_TYPE_HUC:
+		if (ret == 0) {
+			igt_assert(uc_fw_version->major_ver > 0);
+			igt_info("XE_QUERY_UC_TYPE_HUC %u.%u.%u.%u\n",
+				 uc_fw_version->branch_ver,
+				 uc_fw_version->major_ver,
+				 uc_fw_version->minor_ver,
+				 uc_fw_version->patch_ver);
+		} else if (errno == ENODEV) {
+			/*
+			 * No HuC was found, either because it is not running
+			 * yet or there is no media IP.
+			 */
+			igt_info("XE_QUERY_UC_TYPE_HUC No HuC is running\n");
+		} else {
+			igt_assert(false);
+		}
+		break;
+	default:
+		igt_assert(false);
+	}
 
 	free(uc_fw_version);
 }
 
+/**
+ * SUBTEST: query-uc-fw-version-guc
+ * Test category: functionality test
+ * Description: Display the GuC firmware submission version
+ *
+ * SUBTEST: multigpu-query-uc-fw-version-guc
+ * Test category: functionality test
+ * Sub-category: MultiGPU
+ * Description: Display GuC firmware submission version for all Xe devices.
+ */
+static void
+test_query_uc_fw_version_guc(int fd)
+{
+	test_query_uc_fw_version(fd, XE_QUERY_UC_TYPE_GUC_SUBMISSION);
+}
+
 /**
  * SUBTEST: query-invalid-uc-fw-version-mbz
  * Test category: functionality test
@@ -820,6 +854,22 @@ test_query_uc_fw_version_invalid_mbz(int fd)
 	free(uc_fw_version);
 }
 
+/**
+ * SUBTEST: query-uc-fw-version-huc
+ * Test category: functionality test
+ * Description: Display the HuC firmware version
+ *
+ * SUBTEST: multigpu-query-uc-fw-version-huc
+ * Test category: functionality test
+ * Sub-category: MultiGPU
+ * Description: Display HuC firmware version for all Xe devices.
+ */
+static void
+test_query_uc_fw_version_huc(int fd)
+{
+	test_query_uc_fw_version(fd, XE_QUERY_UC_TYPE_HUC);
+}
+
 igt_main
 {
 	const struct {
@@ -834,6 +884,7 @@ igt_main
 		{ "query-topology", test_query_gt_topology },
 		{ "query-cs-cycles", test_query_engine_cycles },
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
+		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.34.1

