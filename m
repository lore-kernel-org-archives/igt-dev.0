Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD91C27C55
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 20:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B0810ED10;
	Fri,  7 Jun 2024 20:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFjajtxt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A56510ECF8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 20:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717790940; x=1749326940;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eOnPgt76OpEFMcBn+YYXvOz0R0XAsh8AGUqhO/ZAO5A=;
 b=fFjajtxtLtRpEn3JUHVTXsuTL4CUhO5e5QFl6BalLHq1KntfTmOrO1An
 G9gobCXAeDEuyl9SFbDWkkq4aLQbQ6rvlefpDASkkP0yiwUjKrH3waVcW
 0CY+ByonOXFb/XouRgdJFja9oqMDVu2X/4Y6T7tUa8iFVqwvdKaEsW3fG
 7ftbZpYPqRRKVhjl/lhGaqLnnOhtykR2p81Hj//vHZZazLxC1QamqKmyN
 TiBLcGtSaULCUX3dO6pSY0qsljD/YzoqLordh2+tldYEcCLxkngaOWL2Y
 eDmrMtS8mor6wfk2iblin2tzbF8LRLJhyQirN5Yg1vyk1xEeF2HL5RYAK A==;
X-CSE-ConnectionGUID: sdpdRDsmTMW9IBXrKq3DPQ==
X-CSE-MsgGUID: vyPDWtbaQp6x6Pas6babUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18383223"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18383223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:08:59 -0700
X-CSE-ConnectionGUID: EaqHRxFvQkSJLOYyLcbpFA==
X-CSE-MsgGUID: gmYlESJ0TvazufRA1n3oSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38373844"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:08:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/27] tests/intel/xe_query: Add OA units query test
Date: Fri,  7 Jun 2024 13:08:29 -0700
Message-ID: <20240607200847.1964629-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240607200847.1964629-1-ashutosh.dixit@intel.com>
References: <20240607200847.1964629-1-ashutosh.dixit@intel.com>
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

