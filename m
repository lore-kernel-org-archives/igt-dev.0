Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A80C25B10
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 17:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFCE113188;
	Fri,  3 May 2024 17:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kj0ljvXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464D7113185
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 17:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714756576; x=1746292576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hDfHj667HHnOCpCbePrK+AHzJa5fuI4j2y4TfSqaklk=;
 b=kj0ljvXyZuxeHThg1ZuhKbHrxlDK3ZhOXaTAhGJxLMYGMDCmwOTaplwA
 38oQxeKHricoafTOYNnf+IQIjn4EMX+ykcV1+X/W4iu6AWgg3PfX1B1cf
 LYKMCp9ovhDdEkHqtLsRlga6+BHoIwkfx5iCsM8hC9PsHzVpN6InTmmg4
 MjfcmRado9/et+OV8QwE3jEgQ/qz55Zt++yz0LZaBPUT+mkLQVD+tQR85
 aW2yxfMM1d8dxRbhTnxxxc7CpH3cwhyeCgV4x99VZOjUNz7sIb93CnuDk
 lg+xdLrveL1EnFuPnGjA/QvpgTGTb5HVIqNXFhu7PdSnc8txdEnf3c7Ed A==;
X-CSE-ConnectionGUID: TBBWrfntSleEqakxPEoTWA==
X-CSE-MsgGUID: 7yEtrxQqSt64f6KiAuFC+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10733944"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10733944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 10:16:16 -0700
X-CSE-ConnectionGUID: BW++zM7QT4OpJXj/R2N4hg==
X-CSE-MsgGUID: yMZJi+fsRty979d7tcT7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="64950673"
Received: from alutz-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.96])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 10:16:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v2 2/2] lib/xe/xe_query: Add L3 bank mask test
Date: Fri,  3 May 2024 19:12:30 +0200
Message-ID: <20240503171539.295801-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240503171539.295801-1-francois.dugast@intel.com>
References: <20240503171539.295801-1-francois.dugast@intel.com>
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

L3 bank mask has been added to the uAPI, so print it in the topology
query test and add a simple test for the mask value.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_query.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index a5a2dd7d4..6552ef297 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -166,6 +166,7 @@ const char *get_topo_name(int value)
 	case DRM_XE_TOPO_DSS_GEOMETRY: return "DSS_GEOMETRY";
 	case DRM_XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
 	case DRM_XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
+	case DRM_XE_TOPO_L3_BANK: return "L3_BANK";
 	}
 	return "??";
 }
@@ -384,6 +385,72 @@ test_query_gt_topology(int fd)
 	free(topology);
 }
 
+/**
+ * SUBTEST: query-topology-l3-bank-mask
+ * Test category: functionality test
+ * Description: Check the value of the l3 bank mask
+ *
+ * SUBTEST: multigpu-query-topology-l3-bank-mask
+ * Test category: functionality test
+ * Description: Check the value of the l3 bank mask for all Xe devices.
+ * Sub-category: MultiGPU
+ */
+static void
+test_query_gt_topology_l3_bank_mask(int fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	struct drm_xe_query_topology_mask *topology;
+	int pos = 0;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
+		.size = 0,
+		.data = 0,
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	topology = malloc(query.size);
+	igt_assert(topology);
+
+	query.data = to_user_pointer(topology);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	igt_info("size: %d\n", query.size);
+
+	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
+		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
+		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+		if (topo->type == DRM_XE_TOPO_L3_BANK) {
+			int count = 0;
+			igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
+				 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+			for (int j=0; j< topo->num_bytes; j++)
+				igt_info(" %02x", topo->mask[j]);
+			for (int j=0; j< topo->num_bytes; j++) {
+				for (int k=0; k< 8; k++)
+					count += (topo->mask[j] & (1 << k)) ? 1 : 0;
+			}
+			igt_info(" count: %d\n", count);
+			if (intel_get_device_info(dev_id)->graphics_ver < 20) {
+				igt_assert(count > 0);
+			}
+			if (IS_METEORLAKE(dev_id))
+				igt_assert((count%2) == 0);
+			else if (IS_PONTEVECCHIO(dev_id))
+				igt_assert((count%4) == 0);
+			else if (IS_DG2(dev_id))
+				igt_assert((count%8) == 0);
+		}
+		query.size -= sz;
+		pos += sz;
+	}
+
+	free(topology);
+}
+
+
 /**
  * SUBTEST: query-config
  * Test category: functionality test
@@ -920,6 +987,7 @@ igt_main
 		{ "query-config", test_query_config },
 		{ "query-hwconfig", test_query_hwconfig },
 		{ "query-topology", test_query_gt_topology },
+		{ "query-topology-l3-bank-mask", test_query_gt_topology_l3_bank_mask },
 		{ "query-cs-cycles", test_query_engine_cycles },
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
-- 
2.43.0

