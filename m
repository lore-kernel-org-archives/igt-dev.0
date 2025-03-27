Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE66C36011
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 14:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAC210E8E3;
	Thu, 27 Mar 2025 14:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXA9dQj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401BC10E8E3
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743087075; x=1774623075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pM2Icpmp8K845JxTKIdCSMue86GBGh9naOUQuA+8Xic=;
 b=CXA9dQj0flRd1yILXxQrXoq+ra3LnSwYzfffIZoh2T0cQGVDbYGLPQ4t
 JE6slNXGTnSywsg6NIHrJWpTMlocl5UjQ4lsHFZNUMZh9kyz3A6MMGOyc
 GQSzQv6amvAVJXfbejt4bYDPQdqAzy2MDHEzqlohbcagCFG7VHs80L3FF
 7Z+0aT2YMTj2f8MNbPMV39jjIlLm95VURdJnXGhC9BiJWdkDiKuhowVsp
 pOvsZHj5co8MGtkb2VWObBzjy/oUSmeQAwFwicqMu1Ubt6Yoegk3CSZ0r
 jJZw2ybdnLH9xxh/Th7X5OzJy0lzjh2/c2giQoTBW0yfjVu/EjEwDt4IV w==;
X-CSE-ConnectionGUID: eyDkxlYbQN695mdBSTOoLA==
X-CSE-MsgGUID: mla7QRGtRZaDtcFQcTFbHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44313150"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44313150"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 07:51:15 -0700
X-CSE-ConnectionGUID: ewCWlHdSQgmc3oqkbiToZQ==
X-CSE-MsgGUID: OPCtFb7NRouRY6Zwq/yLiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="129861556"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 07:51:15 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v6 2/6] tests/intel/xe_query: Add test for PXP status
 query
Date: Thu, 27 Mar 2025 07:50:56 -0700
Message-ID: <20250327145101.722032-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327145101.722032-1-daniele.ceraolospurio@intel.com>
References: <20250327145101.722032-1-daniele.ceraolospurio@intel.com>
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

v2: fix ioctl error checking, free allocated mem

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v1
---
 tests/intel/xe_query.c | 65 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index f5aa4a572..9c7bf1d6f 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1062,6 +1062,70 @@ static void test_query_oa_units(int fd)
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
+
+	errno = 0;
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+	if (errno == ENODEV) {
+		igt_info("PXP not supported\n");
+		free(qpxp);
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
+	free(qpxp);
+}
+
 igt_main
 {
 	const struct {
@@ -1079,6 +1143,7 @@ igt_main
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
 		{ "query-oa-units", test_query_oa_units },
+		{ "query-pxp-status", test_query_pxp_status },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.43.0

