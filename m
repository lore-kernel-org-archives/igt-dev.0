Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D4EC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 20:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A88310E1DF;
	Wed,  7 Feb 2024 20:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCiJeuh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE6210E1DF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 20:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707338839; x=1738874839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KRze3eT6LfifSm1mhs2DIpLzry/vUshqMthznJdrDDk=;
 b=KCiJeuh9kPiEPv9QVreLLDpqUhlpaVwUZ830FxJujTZk1+8RbrD9C7rv
 aYlOGXUrPDlycid4rvze48Qhkn12laJjgTkkL1NGvb5tB+UE9cXblxZB6
 iVcWHWrlzk6MAl+5ZP2yNexNtoxpFCaAhA+fmYcRSx2n6q39v+U+XSyoD
 1hvjm7fKUAToLqxP2w1KaJFFTb440L//umG/dOZpAiKeWW+aVhyWU2LmZ
 /US+Zj0zmWXbsVuT74IK8R8TkSGF39Bob2xCi3WnG9wCqMIIsfxbxRRMB
 XD/qmu+JDywsq24HNnWZdYH8wojWwPSrL+nuCWy75CvfV4CuAgHHpCdrJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18499151"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="18499151"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 12:47:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6105995"
Received: from ndesainx-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.42.38])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 12:47:18 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] drm-uapi/xe: Add test to query HuC firmware version
Date: Wed,  7 Feb 2024 20:46:59 +0000
Message-Id: <20240207204659.7-3-francois.dugast@intel.com>
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

This aligns with kernel commit ("drm/xe: Extend uAPI to query HuC
micro-controler firmware version").

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h |  1 +
 tests/intel/xe_query.c    | 46 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

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
index d51e73ea5..c2eebe801 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -825,6 +825,51 @@ test_query_uc_fw_version_invalid_mbz(int fd)
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
+	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_HUC;
+	uc_fw_version->pad = 0;
+	uc_fw_version->pad2 = 0;
+	uc_fw_version->reserved = 0;
+	query.data = to_user_pointer(uc_fw_version);
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) == 0) {
+		igt_assert(uc_fw_version->major_ver > 0);
+
+		igt_info("XE_QUERY_UC_TYPE_HUC %u.%u.%u\n",
+			 uc_fw_version->major_ver,
+			 uc_fw_version->minor_ver,
+			 uc_fw_version->patch_ver,
+			 uc_fw_version->branch_ver);
+	}
+
+	free(uc_fw_version);
+}
+
 igt_main
 {
 	const struct {
@@ -839,6 +884,7 @@ igt_main
 		{ "query-topology", test_query_gt_topology },
 		{ "query-cs-cycles", test_query_engine_cycles },
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
+		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.34.1

