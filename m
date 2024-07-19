Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7D8C3DA59
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 13:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47E110EC1D;
	Fri, 19 Jul 2024 13:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lS9RA4Ga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B883710EC1D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 13:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721395675; x=1752931675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRWdaCvueN1kFgHSL/GV4PZ2cKCk2wHj40brjxH9uxo=;
 b=lS9RA4GaYr6lkiKX7Y9y/1+vTj5XKGinr89OvLa32iIkuE29kW2+8RTX
 sT7ruGBWUvJdCqSil+5AwVkBrQFvvhHv8O/Eu8xA/xUYT7t0lfhhLGVmt
 eivacdGU75Lfkp7PwZM0baKpw6cCzeMro61Dts7Kp0GS4GR5u3ApOn9c3
 wbxEVCIoU1MsXiPgJZdsQ6rNczlEN/hzMrs3Dnmul+I0MKaqMc+Chgjq7
 7yGMWyvDRcytwtCoGCslvd+vLN686hsz0h19FZ+0MUhOoZHXguXSdn7SG
 dyQgF/bdVUtl+hGZOfTthyBi7wcSUKMScNNm9QFAIt75bu41a1KsGmE/A A==;
X-CSE-ConnectionGUID: UJvqXk93SZeh80FwmmwSPQ==
X-CSE-MsgGUID: Z2kzbWJKRJ2XBbaGqUrsfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19119195"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="19119195"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 06:27:54 -0700
X-CSE-ConnectionGUID: E/cVeTKoRsK4JOUXWXBk6Q==
X-CSE-MsgGUID: 7BitSC84QIW+gsqBuhbC/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51400960"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 06:27:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_query: Sanity check EU width
Date: Fri, 19 Jul 2024 06:27:48 -0700
Message-ID: <20240719132748.3382266-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719132748.3382266-1-lucas.demarchi@intel.com>
References: <20240719132748.3382266-1-lucas.demarchi@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_query.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 92f82f6ee..84df24f49 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -168,6 +168,7 @@ const char *get_topo_name(int value)
 	case DRM_XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
 	case DRM_XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
 	case DRM_XE_TOPO_L3_BANK: return "L3_BANK";
+	case DRM_XE_TOPO_SIMD16_EU_PER_DSS: return "SIMD16_EU_PER_DSS";
 	}
 	return "??";
 }
@@ -354,6 +355,7 @@ test_query_gt_list(int fd)
 static void
 test_query_gt_topology(int fd)
 {
+	uint16_t dev_id = intel_get_drm_devid(fd);
 	struct drm_xe_query_topology_mask *topology;
 	int pos = 0;
 	struct drm_xe_device_query query = {
@@ -362,6 +364,7 @@ test_query_gt_topology(int fd)
 		.size = 0,
 		.data = 0,
 	};
+	uint32_t topo_types = 0;
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
@@ -378,15 +381,28 @@ test_query_gt_topology(int fd)
 	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
 		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
 		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+
 		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
 			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+
 		for (int j=0; j< topo->num_bytes; j++)
 			igt_info(" %02x", topo->mask[j]);
+
+		topo_types = 1 << topo->type;
 		igt_info("\n");
 		query.size -= sz;
 		pos += sz;
 	}
 
+	/* sanity check EU type */
+	if (IS_PONTEVECCHIO(dev_id) || AT_LEAST_GEN(dev_id, 20)) {
+		igt_assert(topo_types & (1 << DRM_XE_TOPO_SIMD16_EU_PER_DSS));
+		igt_assert_eq(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS), 0);
+	} else {
+		igt_assert(topo_types & (1 << DRM_XE_TOPO_EU_PER_DSS));
+		igt_assert_eq(topo_types & (1 << DRM_XE_TOPO_SIMD16_EU_PER_DSS), 0);
+	}
+
 	free(topology);
 }
 
-- 
2.43.0

