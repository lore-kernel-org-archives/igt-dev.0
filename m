Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8552AC3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 05:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FE110E0F8;
	Wed, 10 Jul 2024 05:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PX24zv0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D88010E0F8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 05:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720590295; x=1752126295;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O9aN3G+Sbnj4nB2MPJBD6I0n4avtup22ViMeOBuRH3k=;
 b=PX24zv0c7HEzxtDskt24YwziSh1rwtQuzMygMTIQK2708ld/LsLrNKff
 M0pc7MKHGla0CdWjNMKoSHZ8VMtwOPNxHRXcumkKL5Nt8ijfHWsYjNGcN
 GanmVQGRE7qfWB98pwfTo44hiPJOZ4SmHBbjIKOW55TPp6e/guVBKMtEC
 Ic2E+G/jhh6MqFPpTzTrWMpOH+s6A+zsqKD0cpcj5IbE/KjUn0de4eFmA
 3+dSZaDssh+QjxFj4eEy3toBvuKz9e48aU++NomWlSv7nv0uFAB7xsfW9
 op7IhAWTTPW515gan3uG9FGe6BSAWTAWrf45JRjDktrbBI/cxb3WpcUu5 Q==;
X-CSE-ConnectionGUID: QRo/I8n0T/+bGt7kzkVMow==
X-CSE-MsgGUID: 0ZyeorcXRjySbp8U7lLJkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17837452"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="17837452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 22:44:55 -0700
X-CSE-ConnectionGUID: ha/+FSXDRWKddS14U8HztA==
X-CSE-MsgGUID: ak3eYt1BSCacRgKHnm0M6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48002540"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 22:44:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_query: Sanity check EU width
Date: Tue,  9 Jul 2024 22:43:16 -0700
Message-ID: <20240710054446.1985069-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a sanity check for kernel returning the expected EU width in the
topology query.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

This depends on patch series to be submitted to the kernel. The local
defines are done to be able to test, but should be replaced by an update
to the uapi headers.

 tests/intel/xe_query.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 92f82f6ee..818ce7a9c 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -20,6 +20,10 @@
 #include "xe/xe_query.h"
 #include "intel_hwconfig_types.h"
 
+#define LOCAL_DRM_XE_TOPO_EU_WIDTH		5
+#define LOCAL_DRM_XE_TOPO_EU_WIDTH_SIMD16	1
+#define LOCAL_DRM_XE_TOPO_EU_WIDTH_SIMD8	0
+
 void dump_hex(void *buffer, int len);
 void dump_hex_debug(void *buffer, int len);
 const char *get_hwconfig_name(int param);
@@ -168,6 +172,7 @@ const char *get_topo_name(int value)
 	case DRM_XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
 	case DRM_XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
 	case DRM_XE_TOPO_L3_BANK: return "L3_BANK";
+	case LOCAL_DRM_XE_TOPO_EU_WIDTH: return "EU_WIDTH";
 	}
 	return "??";
 }
@@ -354,6 +359,7 @@ test_query_gt_list(int fd)
 static void
 test_query_gt_topology(int fd)
 {
+	uint16_t dev_id = intel_get_drm_devid(fd);
 	struct drm_xe_query_topology_mask *topology;
 	int pos = 0;
 	struct drm_xe_device_query query = {
@@ -378,10 +384,23 @@ test_query_gt_topology(int fd)
 	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
 		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
 		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+
 		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
 			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+
+		/* sanity check EU width */
+		if (topo->type == LOCAL_DRM_XE_TOPO_EU_WIDTH) {
+			igt_assert_eq(topo->num_bytes, 1);
+
+			if (IS_PONTEVECCHIO(dev_id) || AT_LEAST_GEN(dev_id, 20))
+				igt_assert_eq(topo->mask[0], LOCAL_DRM_XE_TOPO_EU_WIDTH_SIMD16);
+			else
+				igt_assert_eq(topo->mask[0], LOCAL_DRM_XE_TOPO_EU_WIDTH_SIMD8);
+		}
+
 		for (int j=0; j< topo->num_bytes; j++)
 			igt_info(" %02x", topo->mask[j]);
+
 		igt_info("\n");
 		query.size -= sz;
 		pos += sz;
-- 
2.43.0

