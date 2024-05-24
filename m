Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4F8C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:14:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A1910E15B;
	Fri, 24 May 2024 03:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpaeXuBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370CD10E278
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520491; x=1748056491;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eOnPgt76OpEFMcBn+YYXvOz0R0XAsh8AGUqhO/ZAO5A=;
 b=MpaeXuBP+0IDRuWjb97E8Xb0EfYVFo/OVNjywohahZRX0G8LpbWanmW9
 gt7aPXn5GcAnLSzCIzMUkyauNff5wak4tQGHoOd2WMnElNfGNovg20TqQ
 Tt48TY12u5uRNNA0G0lV5tYowHg23tIwLkzhXqjOdKBQT9P9TcicHrLmY
 VSvnR29CSxyoDlQfr5Kg+aICM/drX1eC1mEynXXPlBnIpqYzG41r9ZExY
 yP6EoAAqhXs6Nejb/GZ0h3Y2/zQ6ORx5MhPapDDlgM5tR0MMHvfGvVuT1
 x7fXKWVUBylxJ80tT/Uc8oSZdbiw8bJlfGo7hkj+4QjIRuAOoML4+Kyhj g==;
X-CSE-ConnectionGUID: fZCrerwXRWeesWShG3HqDg==
X-CSE-MsgGUID: nRFqSsuzRkWTB6JN9nfFqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30384630"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30384630"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:49 -0700
X-CSE-ConnectionGUID: cUQkzwC8Q3GDpMy3Kq7aZQ==
X-CSE-MsgGUID: o7XOJaMdTYSTH7Qv8dXkqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34413523"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/23] tests/intel/xe_query: Add OA units query test
Date: Thu, 23 May 2024 20:14:25 -0700
Message-ID: <20240524031439.106332-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524031439.106332-1-ashutosh.dixit@intel.com>
References: <20240524031439.106332-1-ashutosh.dixit@intel.com>
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

Add test to exercise OA units query.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_query.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 5b0db4d28b..92f82f6eef 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -995,6 +995,58 @@ test_query_uc_fw_version_huc(int fd)
 	test_query_uc_fw_version(fd, XE_QUERY_UC_TYPE_HUC);
 }
 
+/**
+ * SUBTEST: query-oa-units
+ * Description: Display fields for OA unit query
+ *
+ * SUBTEST: multigpu-query-oa-units
+ * Description: Display fields for OA unit query for all GPU devices
+ * Sub-category: MultiGPU
+ */
+static void test_query_oa_units(int fd)
+{
+	struct drm_xe_query_oa_units *qoa;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_OA_UNITS,
+		.size = 0,
+		.data = 0,
+	};
+	struct drm_xe_oa_unit *oau;
+	int i, j;
+	u8 *poau;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	qoa = malloc(query.size);
+	igt_assert(qoa);
+
+	query.data = to_user_pointer(qoa);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	igt_info("num_oa_units %d\n", qoa->num_oa_units);
+
+	poau = (u8 *)&qoa->oa_units[0];
+	for (i = 0; i < qoa->num_oa_units; i++) {
+		oau = (struct drm_xe_oa_unit *)poau;
+
+		igt_info("-------------------------------\n");
+		igt_info("oa_unit %d\n", i);
+		igt_info("-------------------------------\n");
+		igt_info("oa_unit_id %d\n", oau->oa_unit_id);
+		igt_info("oa_unit_type %d\n", oau->oa_unit_type);
+		igt_info("capabilities %#llx\n", oau->capabilities);
+		igt_info("oa_timestamp_freq %lld\n", oau->oa_timestamp_freq);
+		igt_info("num_engines %lld\n", oau->num_engines);
+		igt_info("Engines:");
+		for (j = 0; j < oau->num_engines; j++)
+			igt_info(" (%d, %d)", oau->eci[j].engine_class,
+				 oau->eci[j].engine_instance);
+		igt_info("\n");
+		poau += sizeof(*oau) + j * sizeof(oau->eci[0]);
+	}
+}
+
 igt_main
 {
 	const struct {
@@ -1011,6 +1063,7 @@ igt_main
 		{ "query-cs-cycles", test_query_engine_cycles },
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
+		{ "query-oa-units", test_query_oa_units },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.41.0

