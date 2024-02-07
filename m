Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86498C4829A
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 20:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4C010E1B7;
	Wed,  7 Feb 2024 20:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZXTyVrw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610AA10E1DF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 20:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707338837; x=1738874837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xCj93QIOeBgG9gM0HkTu4C9LBirv6tDMozvkj+ymxVc=;
 b=mZXTyVrw1FdJHxnnVzD/5ca6vuFBD1bjzXjLFhtK7Tpnt40HkPldJ48J
 Uu90JnBdGXLBaDRIcvNtDDpGdK6QkuH9co2HqFwzPJENR0XMSd5xO4Wb5
 goxjMrFreNfdgg+SM6znChkQCtK8S6h/YjnL6DNTWOTQlrIN430pEsNsm
 PhALFtLUfQgKRrX8zK6g1bTJfkyraTpH0Mi3FAXTbRlgCZmBVE8saiaWd
 slxsVQIR8/enINCU+A5X9PztGcttynE7vQL57OSMj+FzCeTocwZB4V5hy
 I13lv7QrJJqYvvx5RGv7IrU9jtAYdnnlQNOentBmgW1coLbzKxg7i1ueF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18499148"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="18499148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 12:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6105991"
Received: from ndesainx-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.42.38])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 12:47:16 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] drm-uapi/xe: Add test to query GuC firmware
 submission version
Date: Wed,  7 Feb 2024 20:46:58 +0000
Message-Id: <20240207204659.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207204659.7-1-francois.dugast@intel.com>
References: <20240207204659.7-1-francois.dugast@intel.com>
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

