Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B9EC5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 16:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B17510F462;
	Mon, 11 Mar 2024 16:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbvWzmne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2826010F462
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710174248; x=1741710248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pjbdd8kZIUkWLglwoQjIrY0lukqtOdOtXfpVr7ZajBk=;
 b=MbvWzmneawNJGfCuQVRxOlBV8PygUCovzN8WOlOtWwKqbuZ/QmUjb/RX
 O49p+tWeM8cu43jkdnWsAlTYU0KP6EYKANbEANS0dkL5A2cfLfzNjGZbc
 9J1lWbBfWjLAuR1ugvl408YBx3UtysvF03be4C6LJYzLeXbiFOY0JQ/wa
 6IW4XaQz+AP3RplJsFbuelpwTlGOTNgLehT6bfyQvWmV6ZVZFj13MPpgo
 JMeB9Gl09+sBtC5Cu9ltz2dnzyebxzzbsT8XCJK2kW25j22CejGSS6GJm
 MiWcyq4sQ/bvOEio5NrDYS9DfkMin/ORelYkS2qznRzfsSSRGkVg7JDbS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15409759"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15409759"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15861867"
Received: from tlonnber-mobl3.ger.corp.intel.com (HELO b33d611921ea.intel.com)
 ([10.251.208.140])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:24:06 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t,
 v5 1/2] drm-uapi/xe: Add test to query GuC firmware submission version
Date: Mon, 11 Mar 2024 16:23:35 +0000
Message-Id: <20240311162336.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311162336.7-1-francois.dugast@intel.com>
References: <20240311162336.7-1-francois.dugast@intel.com>
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

v2: Print branch first, use memset to zero the query (John Harrison)

v3: Update header to match the KMD version with branch first (John Harrison)

v4: Add lore link to corresponding kernel commit (Francois Dugast)

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Link: https://lore.kernel.org/intel-xe/20240208183539.185095-1-jose.souza@intel.com/
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/intel/xe_query.c | 92 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 5807fe3ed..d0cc89092 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -741,6 +741,96 @@ static void test_engine_cycles_invalid(int fd)
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
+	memset(uc_fw_version, 0, sizeof(*uc_fw_version));
+	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
+	query.data = to_user_pointer(uc_fw_version);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
+		 uc_fw_version->branch_ver,
+		 uc_fw_version->major_ver,
+		 uc_fw_version->minor_ver,
+		 uc_fw_version->patch_ver);
+	igt_assert(uc_fw_version->major_ver > 0 || uc_fw_version->minor_ver > 0);
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
+	memset(uc_fw_version, 0, sizeof(*uc_fw_version));
+	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
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
@@ -754,10 +844,12 @@ igt_main
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

