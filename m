Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF825C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 13:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A3810E753;
	Wed, 21 Feb 2024 13:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfQUa5Ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7621B10E74D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708523451; x=1740059451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mWkPnqvefnvHemPg5ZcbflYMDRzYr51rkjKT4anC+U0=;
 b=NfQUa5FtoDhMSwyjJOCgWq8LlIaYlN+Z1dfcbx9zbsdeyYvd/xMXbln5
 x2h8YcrM1wMtRIwlen7m6QkFOAAIxcpaza1cQngqs1o5iubFlO+ltFuGm
 IoqUuarAep1ZOhCJwPEBhQDc6pHYS7BNfTALqkiweN56BTf1TzG4DRTOe
 d3R5w30idBwp1dWcPY43Ig5aJEBABt8n3rjHjhfB/75tHEHPtDixR6KXN
 IKcyM89GnnF1tU7BFry2DK8pkUzXolkhdF3E4/xhQs3WVph55vuqDZD69
 DcM1smFpxSfISrrkvm9Y55yD3h59DwmPtMcVMICZgXa6S/JmLDVjgTvQu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5637224"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5637224"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 05:50:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5081258"
Received: from tnienhux-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.221.55])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 05:50:50 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t,
 v4 2/2] drm-uapi/xe: Add test to query HuC firmware version
Date: Wed, 21 Feb 2024 13:50:33 +0000
Message-Id: <20240221135033.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221135033.7-1-francois.dugast@intel.com>
References: <20240221135033.7-1-francois.dugast@intel.com>
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

v3: Share code between guc and huc tests (John Harrison)

v4: Better use of asserts to report errors (John Harrison)

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/drm-uapi/xe_drm.h |  1 +
 tests/intel/xe_query.c    | 88 ++++++++++++++++++++++++++++++---------
 2 files changed, 70 insertions(+), 19 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 745637a04..157dd005f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -583,6 +583,7 @@ struct drm_xe_query_engine_cycles {
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
 #define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
+#define XE_QUERY_UC_TYPE_HUC 1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index bbe5955eb..a0cd66c7f 100644
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
 
@@ -757,20 +748,62 @@ test_query_uc_fw_version_guc(int fd)
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
+		igt_assert_eq(ret, 0);
+		igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
+			 uc_fw_version->branch_ver,
+			 uc_fw_version->major_ver,
+			 uc_fw_version->minor_ver,
+			 uc_fw_version->patch_ver);
+		igt_assert(uc_fw_version->major_ver > 0 ||
+			   uc_fw_version->minor_ver > 0);
+		break;
+	case XE_QUERY_UC_TYPE_HUC:
+		if (ret == 0) {
+			igt_info("XE_QUERY_UC_TYPE_HUC %u.%u.%u.%u\n",
+				 uc_fw_version->branch_ver,
+				 uc_fw_version->major_ver,
+				 uc_fw_version->minor_ver,
+				 uc_fw_version->patch_ver);
+			igt_assert(uc_fw_version->major_ver > 0);
+		} else {
+			igt_assert_eq(errno, ENODEV);
+			/*
+			 * No HuC was found, either because it is not running
+			 * yet or there is no media IP.
+			 */
+			igt_info("XE_QUERY_UC_TYPE_HUC No HuC is running\n");
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
@@ -820,6 +853,22 @@ test_query_uc_fw_version_invalid_mbz(int fd)
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
@@ -834,6 +883,7 @@ igt_main
 		{ "query-topology", test_query_gt_topology },
 		{ "query-cs-cycles", test_query_engine_cycles },
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
+		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.34.1

