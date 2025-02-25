Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ED7C021A4
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 00:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3037E10E366;
	Tue, 25 Feb 2025 00:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdNvobNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEE010E0A6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 00:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740443514; x=1771979514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YMH5WSPC1JJg32kHc4fjLGj7Q9/Mta/WmVtcfSmN0tE=;
 b=VdNvobNEy8kPoFNzcD7D0qP6DEO5OTNKYedaTnq2oqUwfS8lk0A/szBf
 AmFXk8O4F2bMDg31TwHGerkqhEJKo1L4I1RKphH65qVXhLDhWKq0Af6Z4
 ieX0vmogR3K+rIEfozOCIeUy/yR4OQ12TeXZ0Wp2eU9tz/6/DEtrkmijD
 nY5e6ndmiyUGrEQMmNXl+woSyEm3apd+xE5Dzu+k30JwpvVMJWpJTEAIc
 CPvdirw5qQLV5ZsnRUZ3jGhArGC9dx1h9OKdiGTnyNATZJTdIFkqrgxPa
 gPBSXabBzFQKCLLRp5G5ANq3ayNxtKXVYunIDF5OuemaZD/XdE/s6nX+2 g==;
X-CSE-ConnectionGUID: NZRLKqooRrSfM9tz9l+vJQ==
X-CSE-MsgGUID: zE1tldQySb+usK79OHVq9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51863658"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="51863658"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:31:54 -0800
X-CSE-ConnectionGUID: er+KQpWtT4aaW/Z2U+B1MQ==
X-CSE-MsgGUID: CBfNIXoxRh2BHJhpSj/YFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="120840119"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:31:54 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v4 3/7] tests/intel/xe_query: Add test for PXP status
 query
Date: Mon, 24 Feb 2025 16:31:34 -0800
Message-ID: <20250225003140.2738645-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225003140.2738645-1-daniele.ceraolospurio@intel.com>
References: <20250225003140.2738645-1-daniele.ceraolospurio@intel.com>
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

Add a new test to exercise the PXP status query.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel/xe_query.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 1566680e7..0a2ff8d7f 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1077,6 +1077,66 @@ static void test_query_oa_units(int fd)
 	}
 }
 
+/**
+ * SUBTEST: query-pxp-status
+ * Description: Display PXP supported types and current status
+ *
+ * SUBTEST: multigpu-query-pxp-status
+ * Description: Display fields for PXP unit query for all Xe devices
+ * Sub-category: MultiGPU
+ */
+static void test_query_pxp_status(int fd)
+{
+	struct drm_xe_query_pxp_status *qpxp;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
+		.size = 0,
+		.data = 0,
+	};
+	int ret;
+
+	/*
+	 * if we run this test on an older kernel that doesn't have the PXP
+	 * query, the ioctl will return -EINVAL.
+	 */
+	errno = 0;
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+	igt_require(errno != EINVAL);
+	igt_assert_eq(ret, 0);
+
+	/* make sure the returned size is big enough */
+	igt_assert(query.size >= sizeof(*qpxp));
+
+	qpxp = malloc(query.size);
+	igt_assert(qpxp);
+
+	memset(qpxp, 0, query.size);
+
+	query.data = to_user_pointer(qpxp);
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+	if (ret == -ENODEV) {
+		igt_info("PXP not supported\n");
+		return;
+	}
+
+	igt_assert_eq(ret, 0);
+	igt_assert_neq(qpxp->supported_session_types, 0);
+
+	switch (qpxp->status) {
+	case 0:
+		igt_info("PXP initialization still in progress\n");
+		break;
+	case 1:
+		igt_info("PXP initialization complete\n");
+		break;
+	default:
+		igt_assert_f(0, "unexpected PXP status %u\n", qpxp->status);
+	}
+
+	igt_info("PXP supported types mask 0x%x\n", qpxp->supported_session_types);
+}
+
 igt_main
 {
 	const struct {
@@ -1094,6 +1154,7 @@ igt_main
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
 		{ "query-oa-units", test_query_oa_units },
+		{ "query-pxp-status", test_query_pxp_status },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.43.0

