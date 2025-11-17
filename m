Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A420CEBF97
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2969110E1C3;
	Mon, 17 Nov 2025 10:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhoZ8mdH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB1510E1C3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376566; x=1794912566;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Sk+OAjpfd1XE6IxRk+RdRHSxI3Qyh4BpE5peFCL0s4g=;
 b=GhoZ8mdHK/kgygKjUhlLyghyN3RvRovCirf8FWqyvDl3mnKpLo8WgEpc
 2nTHhtZy62c8IpZHOsELsBlyqt30AM6/7+rfQbph6MWnPGLezyiMWZo6g
 hNLHS3Vh9IbSjG4cwuH6LYkr152P2Tl8JhQFb9fns0Q/ZqaG4vLxi178h
 NOIfxvTM3yJVGMS2nWnHLqJ0N/7pWLYoh8UJOdV7SqxbQGD3BOy0Zo1jv
 mizDXYsQqfr8vPFW2rcRFWa6P/h6vfmlYYkZKuG+4+RMLTNPrqPD2y92t
 sDifkQMIaE5L+KCGg1f2VGXgShksO8ZUzwjb9is9euZ4EfAG3fTXn0DB9 Q==;
X-CSE-ConnectionGUID: nIKT8f+4QpmBn75YZCoWRA==
X-CSE-MsgGUID: nXo+xr4HT/iNXT86wbnP5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306115"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306115"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:26 -0800
X-CSE-ConnectionGUID: +GDMAOnwR2qnQFF0TzqJNA==
X-CSE-MsgGUID: W7k2H3foQJmthiohS7UyYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213818011"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:23 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Nov 2025 11:47:45 +0100
Subject: [PATCH v3 7/8] tests/intel/xe_query: use xe_query helpers for
 query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-xe_query_helpers-v3-7-25d984ae58cb@intel.com>
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
In-Reply-To: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4218;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Sk+OAjpfd1XE6IxRk+RdRHSxI3Qyh4BpE5peFCL0s4g=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1lJbCsTXK0u/n7DYh/8fOBxeKHSl832pVRP
 hhPWG1BLvWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9ZQAKCRAjYrKT3hD9
 1/7QC/96YiSUI2sKa0rX7VCHQK+KaaHoSP82N63mBOeE8Y1UqaXp7l4GEHxzZOs/rVGECcYeKWv
 gIFs2dIaokWBSiCKo2Nqx4aYvXz23ZkudWTazIawDS31dsU/5L6OWsLEahq4n1hy5F4Y0DkJMoi
 WsR0U6I584MYsm3KlTMtnbe8759KZCZBZ4zmxv3ddltlWU+z/cSKtfHe27kw0kc3Emu1DN9uaim
 CPWC3ZU9JzNFEVSaQFG7+nWipmS+kPEsp1ITt608g4dYYTcVuqJav3N3+B5qr+kcdMslxrokZCK
 /efCYMl+kTgDZsNZXO0yptqHZiAdHPiFUogg4UJNMNMw6zMeNvEBdoUMT3KsB+9x1bVNDaqIsw9
 VNgGHHbQwUpFU52HoM9FPAP6uAjpHtU+PYgml1mYuoc9sjyvwW8hqec0nG6kHfcVYEaxIheN9n6
 dH/H5tXIDrB5wTnt2QTiCFq/8YRc6CbgMaeCOi8+7Un4V+yG5xrPB1NfdvS7gioh5KjiM=
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
 tests/intel/xe_query.c | 69 +++++++++++++-------------------------------------
 1 file changed, 17 insertions(+), 52 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 928daaf5875d8e62888f8b994e31d5d6315afe73..23b6726f2e67acedb5f0bfe0691a98cc28f823c6 100644
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
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size, false);
 
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
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size, false);
 
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

