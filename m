Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D2FC48BC4
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 10:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764F110E628;
	Wed, 14 Feb 2024 10:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S1/Ai91n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F6C10E797
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707906286; x=1739442286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xCj93QIOeBgG9gM0HkTu4C9LBirv6tDMozvkj+ymxVc=;
 b=S1/Ai91nw1K8C5rQmoKc0ZHDtvu73f3vnX6UUBBH6eJaulxMnlppJgfv
 /rdN6bHDwXkobcvUwk6IZjIN4j7pjxIYDKWazDJZ6iaj1vsgSHUf1GH3V
 6w45sWjdUeDtQ+3lgDbEkkm48ao/GHGr7WL8btMsiqIMxl87OhtByWErq
 OvjCGIHIgWcMlfxAkW3Na99evauNZyux59aCFnrCzlGNZkVx4Qu/KUCf2
 qvavPWKwbC3Ha/e3qLpEV7DZIflER7Cvl+UFSapo7tUUkV5bKdItwBK0+
 hAvLfWucY2g9TSBknXApfw8TtGCTPdaKZ/fxt7YbVv+wMOVo8xsSG7fNq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13332144"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="13332144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 02:24:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="26308547"
Received: from eseidenw-mobl4.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.30])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 02:24:44 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t,
 v2 1/2] drm-uapi/xe: Add test to query GuC firmware submission version
Date: Wed, 14 Feb 2024 10:24:34 +0000
Message-Id: <20240214102435.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214102435.7-1-francois.dugast@intel.com>
References: <20240214102435.7-1-francois.dugast@intel.com>
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

This aligns with kernel commit ("drm/xe: Add uAPI to query GuC firmware
submission version").

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 31 +++++++++++++
 tests/intel/xe_query.c    | 97 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bacdca787..3bd795f27 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
 	__u64 cpu_delta;
 };
 
+/**
+ * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
+ *
+ * Given a uc_type this will return the major, minor, patch and branch version
+ * of the micro-controller firmware.
+ */
+struct drm_xe_query_uc_fw_version {
+	/** @uc: The micro-controller type to query firmware version */
+#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
+	__u16 uc_type;
+
+	/** @pad: MBZ */
+	__u16 pad;
+
+	/* @major_ver: major uc fw version */
+	__u32 major_ver;
+	/* @minor_ver: minor uc fw version */
+	__u32 minor_ver;
+	/* @patch_ver: patch uc fw version */
+	__u32 patch_ver;
+	/* @branch_ver: branch uc fw version */
+	__u32 branch_ver;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
 /**
  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
  * structure to query device information
@@ -643,6 +673,7 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
+#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
 	/** @query: The type of data to query */
 	__u32 query;
 
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9a6799c84..d51e73ea5 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -730,6 +730,101 @@ static void test_engine_cycles_invalid(int fd)
 	query_engine_cycles(fd, &ts);
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
+	struct drm_xe_query_uc_fw_version *uc_fw_version;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	uc_fw_version = malloc(query.size);
+	igt_assert(uc_fw_version);
+
+	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
+	uc_fw_version->pad = 0;
+	uc_fw_version->pad2 = 0;
+	uc_fw_version->reserved = 0;
+	query.data = to_user_pointer(uc_fw_version);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert(uc_fw_version->major_ver > 0);
+
+	igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
+		 uc_fw_version->major_ver,
+		 uc_fw_version->minor_ver,
+		 uc_fw_version->patch_ver,
+		 uc_fw_version->branch_ver);
+
+	free(uc_fw_version);
+}
+
+/**
+ * SUBTEST: query-invalid-uc-fw-version-mbz
+ * Test category: functionality test
+ * Description: Check query with invalid arguments returns expected error code.
+ *
+ * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
+ * Test category: functionality test
+ * Sub-category: MultiGPU
+ * Description: Check query with invalid arguments for all Xe devices.
+ */
+static void
+test_query_uc_fw_version_invalid_mbz(int fd)
+{
+	struct drm_xe_query_uc_fw_version *uc_fw_version;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	uc_fw_version = malloc(query.size);
+	igt_assert(uc_fw_version);
+
+	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
+	uc_fw_version->pad = 0;
+	uc_fw_version->pad2 = 0;
+	uc_fw_version->reserved = 0;
+	query.data = to_user_pointer(uc_fw_version);
+
+	/* Make sure the baseline passes */
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	/* Make sure KMD rejects non-zero padding/reserved fields */
+	uc_fw_version->pad = -1;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	uc_fw_version->pad = 0;
+
+	uc_fw_version->pad2 = -1;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	uc_fw_version->pad2 = 0;
+
+	uc_fw_version->reserved = -1;
+	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
+	uc_fw_version->reserved = 0;
+
+	free(uc_fw_version);
+}
+
 igt_main
 {
 	const struct {
@@ -743,10 +838,12 @@ igt_main
 		{ "query-hwconfig", test_query_hwconfig },
 		{ "query-topology", test_query_gt_topology },
 		{ "query-cs-cycles", test_query_engine_cycles },
+		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
 		{ "query-invalid-extension", test_query_invalid_extension },
+		{ "query-invalid-uc-fw-version-mbz", test_query_uc_fw_version_invalid_mbz },
 		{ }
 	}, *f;
 	int xe, gpu_count;
-- 
2.34.1

