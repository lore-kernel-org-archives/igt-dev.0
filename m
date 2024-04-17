Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9825C05023
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CF61135D7;
	Wed, 17 Apr 2024 14:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6lnt0ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE94B10F695
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713365471; x=1744901471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V4cGmMOJSo9w84XW1XMH1h2TfQFL1WY47uiMqjlLxPc=;
 b=M6lnt0ijzkOXAoN8zpU4aUohv9sERsNVkxFT3+Qa5kttckIhXygDQ30G
 a0sMv/Tev2p2xJHShpVJlLx7CvlCMyr5/obu0iQWe8KpQp1+6MNhen9Ob
 /8Brc68YnHsFLyMHb60f9B/CzJPg/eLvtfL8V1aaUpbbDfvhEe8HCkLYG
 ru5XuBx8KK184LXy4IY4PUrcaELy4QTdlpASAIFvTz+nOIVE/t8DqJyUF
 Z0lAVOzwQxP/tGzXboGWz6aUA16Jkaq790QhlT29dg9RDMn/Fx77Ppcu4
 o1w99+SmqEKg+mb6z3dNlU3EWvEVSuY/FQ3kV++bsQf+LlZJ4fBxAE0KC A==;
X-CSE-ConnectionGUID: mNXYgHxtRni7kGFIesEUow==
X-CSE-MsgGUID: LxGZNrsDSve0SV2k/1QVRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8726359"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8726359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:51:11 -0700
X-CSE-ConnectionGUID: C0RSuAUaQAKRz6tG+Eb66A==
X-CSE-MsgGUID: hJQX0mfdSo+ox2nEuw6FnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22729729"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO cc1cf3aaf32c.intel.com)
 ([10.252.44.146])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:51:10 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v1 4/4] lib/xe/xe_query: Add L3 bank mask test
Date: Wed, 17 Apr 2024 14:50:49 +0000
Message-Id: <20240417145049.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417145049.7-1-francois.dugast@intel.com>
References: <20240417145049.7-1-francois.dugast@intel.com>
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
 tests/intel/xe_query.c | 66 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index a5a2dd7d4..9897cb7d8 100644
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
@@ -384,6 +385,70 @@ test_query_gt_topology(int fd)
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
+			igt_assert(count > 0);
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
@@ -920,6 +985,7 @@ igt_main
 		{ "query-config", test_query_config },
 		{ "query-hwconfig", test_query_hwconfig },
 		{ "query-topology", test_query_gt_topology },
+		{ "query-topology-l3-bank-mask", test_query_gt_topology_l3_bank_mask },
 		{ "query-cs-cycles", test_query_engine_cycles },
 		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
 		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
-- 
2.34.1

