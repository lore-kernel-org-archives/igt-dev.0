Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93724C48BF8
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 23:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5983910ECFF;
	Fri, 16 Feb 2024 23:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avBKlSxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720D910ED05
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708125433; x=1739661433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRUNSRVr4nXfYExb3KkfL/OD1s88kCkZCW5OOjXeWXQ=;
 b=avBKlSxzEwFTdHe9iyPRIGFQ6/oOMqo1/NFOw4rV43rM5cDQ/2AQcDag
 /hLuDFEIMc1l5KEmiJ34rZxBTVe+rh2wKqw7Zi+TEdX5KA1COSjabrMwh
 eXIe7lorbTvYzdDU5GwJXuXMBGj3AahWKAOsa93EJNTtk+S6S3/xPlM/e
 ufM95qerxMljYuiiCl4C5OY+YIf4D7r4Oz+tukCydlz/7mksZPY3/aNeX
 dKcfKF6nonuO4528+uxa5P5zj72DhLhxnbe19t0d87+TWsEYy1LnfNySL
 VP09OHVgswxNYoGz8iDOKyVp/pRrdulh/P4yFgD7+bE4m5/8Ti57YQHVS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27724281"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="27724281"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8626871"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 07/18] tests/intel/xe_query: Add OA units query test
Date: Fri, 16 Feb 2024 15:16:52 -0800
Message-ID: <20240216231703.845644-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216231703.845644-1-ashutosh.dixit@intel.com>
References: <20240216231703.845644-1-ashutosh.dixit@intel.com>
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
index 9a6799c8473a..2005b8d20ae3 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -730,6 +730,58 @@ static void test_engine_cycles_invalid(int fd)
 	query_engine_cycles(fd, &ts);
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
@@ -743,6 +795,7 @@ igt_main
 		{ "query-hwconfig", test_query_hwconfig },
 		{ "query-topology", test_query_gt_topology },
 		{ "query-cs-cycles", test_query_engine_cycles },
+		{ "query-oa-units", test_query_oa_units },
 		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
 		{ "query-invalid-query", test_query_invalid_query },
 		{ "query-invalid-size", test_query_invalid_size },
-- 
2.41.0

