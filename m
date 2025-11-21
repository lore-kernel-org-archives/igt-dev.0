Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73E7CFA76D
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 11:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8625710E857;
	Fri, 21 Nov 2025 11:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxQnKcki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F9D10E854
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763722836; x=1795258836;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XzuSKaYTClnT+NRWao/kQHT+nymJs3t4FBx4WBKUtOY=;
 b=NxQnKckiMcGtrqMNiLhwHcRZ0x5NHRiAP4Xi2CHUcnYRCsiwtQYVdT32
 HcilZGO7zn30riwenMTbz+mdJpBJlA4cinCgrerGr4IhYWUzDFF75VaHL
 3XcYzYVP8a1bXw+cuTJZIc8k0VuB7iVblVLXPnIq0yM/pv2r4f5TZIP1C
 +LMJDsxYTCggsiF7chjuIuWWPFp/n4MaRtSqbcae0sXuQArm0ClBOIQwW
 FHqzz8wzLYOdYvbQZDGUiFGuCnMUTbH4LYeAR10k6WBG9zNpFmLwb9ZL8
 7p462ZR3Fz2///fNzpoSW/gBcf5urDToQSdg94g25YyHYMJMGWpz2c32I Q==;
X-CSE-ConnectionGUID: CEDIZho1TeGUpuqMfaoKIQ==
X-CSE-MsgGUID: 9llApEnPTeO8mMXtjUZqfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83203555"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83203555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:36 -0800
X-CSE-ConnectionGUID: 4EhbuEpORNeYkGET6Utd/Q==
X-CSE-MsgGUID: MpF9DvvVRZOzz1tCAjAh5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="195953867"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:35 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 21 Nov 2025 11:59:04 +0100
Subject: [PATCH v5 5/5] xe/treewide: use xe_query helpers for query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-xe_query_helpers-v5-5-d69c1c160e96@intel.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
In-Reply-To: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9081;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=XzuSKaYTClnT+NRWao/kQHT+nymJs3t4FBx4WBKUtOY=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpIEYHOp2i87mVyUtwaM/VfOorAB5lbXVqJOXMr
 K77UOmsnPGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSBGBwAKCRAjYrKT3hD9
 1ykWC/0ZNI/nVnCyqTM01aQ4HILZDlv67M7nx3ZBLrHwH2CzrdM2EdDHvBUetL2lcIprPiXpP0e
 kk1NlR8I5r/zNf9PDFxS1YmhJIMhvOlUCanldm5QXR6OJvrKuz6Ih/LKebg0sf5XBEomCAuh1vx
 V1nHXcQmEqDRZS2its5wlr8xm1utQ03h8Bie2KreTRjX5ugMwmKKE1oMuNVhUK1xvrQsBXdwXQe
 nH1ZaAI1d/FONCjCWSzkZL//sZeM3U0b0Pos2Vfe3RuUrt1LFXCLAdzW8Ubt4qehcdyn05E3WZk
 eN/JvXuvjx20VAkFUw0trKJM8azRpYgpYlX6hREfUOxWzZYHyylSEI93oky732pk7G/7xZgfS5v
 B+wBFVaxnwEOhv+uZGydMmDRRTWqiGq57kPthvbK0VULG/Gq4AqDgiPMD754Q6NYBcI9JYY/8kf
 n3QQ/auJD4IwbXcapk4fZ0mAn5Q113ooP5ur5T3UxTMs7MPbIcxUejroyg9qjWgB7QduM=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Using xe_query_device and xe_for_each_topology_mask simplifies the code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_oa.c                  | 37 ++++++----------------
 tests/intel/xe_eudebug_online.c | 30 +++---------------
 tests/intel/xe_query.c          | 69 ++++++++++-------------------------------
 3 files changed, 30 insertions(+), 106 deletions(-)

diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 428e7d0a2980dba1106d62a4bf20e56af5b9997a..229deafa7132fd7d4992d419146c3620314abe3e 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -450,15 +450,9 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 	const struct intel_device_info *devinfo = intel_get_device_info(device_id);
 	struct intel_xe_topology_info topinfo = {};
 	struct intel_xe_topology_info *ptopo;
-	struct drm_xe_query_topology_mask *xe_topo;
-	int pos = 0;
+	struct drm_xe_query_topology_mask *xe_topo, *topo;
+	uint32_t size;
 	u8 *ptr;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
-		.size = 0,
-		.data = 0,
-	};
 
 	/* Only ADL-P, DG2 and newer ip support hwconfig, use hardcoded values for previous */
 	if (intel_graphics_ver(device_id) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
@@ -485,31 +479,21 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 	ptr = (u8 *)ptopo + sizeof(topinfo);
 	*ptr++ = 0x1;					/* slice mask */
 
-	/* Get xe topology masks */
-	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
-
-	xe_topo = malloc(query.size);
-	igt_assert(xe_topo);
+	xe_topo = xe_query_device(drm_fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
+	igt_debug("Topology size: %d\n", size);
 
-	query.data = to_user_pointer(xe_topo);
-	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_debug("Topology size: %d\n", query.size);
-
-	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
-		struct drm_xe_query_topology_mask *topo =
-			(struct drm_xe_query_topology_mask*)((unsigned char*)xe_topo + pos);
-		int i, sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+	xe_for_each_topology_mask(xe_topo, size, topo) {
 		u64 geom_mask, compute_mask;
 
-		igt_debug(" gt_id: %d type: %d n:%d [%d] ", topo->gt_id, topo->type, topo->num_bytes, sz);
+		igt_debug(" gt_id: %d type: %d n:%d [%zd] ", topo->gt_id, topo->type, topo->num_bytes,
+			  sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes);
 		for (int j=0; j< topo->num_bytes; j++)
 			igt_debug(" %02x", topo->mask[j]);
 		igt_debug("\n");
 
 		/* i915 only returns topology for gt 0, do the same here */
 		if (topo->gt_id)
-			goto next;
+			continue;
 
 		/* Follow the same order as in xe query_gt_topology() */
 		switch (topo->type) {
@@ -525,7 +509,7 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 			break;
 		case DRM_XE_TOPO_EU_PER_DSS:
 		case DRM_XE_TOPO_SIMD16_EU_PER_DSS:
-			for (i = 0; i < ptopo->max_subslices; i++) {
+			for (int i = 0; i < ptopo->max_subslices; i++) {
 				memcpy(ptr, topo->mask, ptopo->eu_stride);
 				ptr += ptopo->eu_stride;
 			}
@@ -535,9 +519,6 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 		default:
 			igt_assert(0);
 		}
-next:
-		query.size -= sz;
-		pos += sz;
 	}
 
 	free(xe_topo);
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index a5b2864a47a34b9051756174f73667bbc602e00b..1e160b0c3d8a3d616bfd99e2a99fb6b0d042f021 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1208,36 +1208,14 @@ static int query_attention_bitmask_size(int fd, int gt)
 {
 	uint32_t threads_per_eu = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
-	struct drm_xe_query_topology_mask *topology;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
-		.size = 0,
-		.data = 0,
-	};
+	struct drm_xe_query_topology_mask *topology, *topo;
 	uint8_t dss_mask, last_dss;
-	int pos = 0;
+	uint32_t size;
 	int i, last_dss_idx;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
-
-	topology = malloc(query.size);
-	igt_assert(topology);
-
-	query.data = to_user_pointer(topology);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
-		struct drm_xe_query_topology_mask *topo;
-		int sz;
-
-		topo = (struct drm_xe_query_topology_mask *)((unsigned char *)topology + pos);
-		sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
-
-		query.size -= sz;
-		pos += sz;
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
 
+	xe_for_each_topology_mask(topology, size, topo) {
 		if (topo->gt_id != gt)
 			continue;
 
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 928daaf5875d8e62888f8b994e31d5d6315afe73..36f9d87002d50ff3f4973657def65e282e53c899 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -358,42 +358,25 @@ static void
 test_query_gt_topology(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
-	struct drm_xe_query_topology_mask *topology;
-	int pos = 0;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
-		.size = 0,
-		.data = 0,
-	};
-	uint32_t topo_types = 0;
+	struct drm_xe_query_topology_mask *topology, *topo;
+	uint32_t topo_types = 0, size;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
-
-	topology = malloc(query.size);
-	igt_assert(topology);
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
 
-	query.data = to_user_pointer(topology);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_info("size: %d\n", size);
 
-	igt_info("size: %d\n", query.size);
-	dump_hex_debug(topology, query.size);
+	dump_hex_debug(topology, size);
 
-	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
-		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
-		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
-
-		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
-			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+	xe_for_each_topology_mask(topology, size, topo) {
+		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%zd] ", topo->gt_id,
+			 get_topo_name(topo->type), topo->type, topo->num_bytes,
+			 sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes);
 
 		for (int j=0; j< topo->num_bytes; j++)
 			igt_info(" %02x", topo->mask[j]);
 
 		topo_types = 1 << topo->type;
 		igt_info("\n");
-		query.size -= sz;
-		pos += sz;
 	}
 
 	/* sanity check EU type */
@@ -422,35 +405,20 @@ static void
 test_query_gt_topology_l3_bank_mask(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
-	struct drm_xe_query_topology_mask *topology;
-	int pos = 0;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
-		.size = 0,
-		.data = 0,
-	};
+	struct drm_xe_query_topology_mask *topology, *topo;
+	uint32_t size;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
 
-	topology = malloc(query.size);
-	igt_assert(topology);
-
-	query.data = to_user_pointer(topology);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	igt_info("size: %d\n", query.size);
-
-	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
-		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask *)((unsigned char *)topology + pos);
-		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
+	igt_info("size: %d\n", size);
 
+	xe_for_each_topology_mask(topology, size, topo) {
 		if (topo->type == DRM_XE_TOPO_L3_BANK) {
 			int count = 0;
 
-			igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
-				 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
+			igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%zd] ", topo->gt_id,
+				 get_topo_name(topo->type), topo->type, topo->num_bytes,
+				 sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes);
 			for (int j = 0; j < topo->num_bytes; j++)
 				igt_info(" %02x", topo->mask[j]);
 
@@ -471,9 +439,6 @@ test_query_gt_topology_l3_bank_mask(int fd)
 			else if (IS_DG2(dev_id))
 				igt_assert_eq((count % 8), 0);
 		}
-
-		query.size -= sz;
-		pos += sz;
 	}
 
 	free(topology);

-- 
2.43.0

