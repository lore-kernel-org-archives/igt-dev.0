Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2A1CCFA18
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E1F10E888;
	Thu,  6 Nov 2025 10:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nw6/yWaV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B94510E88B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424947; x=1793960947;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bbsaNK8DEi0fq2mYu8gJINQzvgEBfGIbMAwrJf/c4Ck=;
 b=Nw6/yWaVhhSsaKzcoUYs4xgSF6ALEGKkEXOPFdIZDK6I9GGhrtfOoBtW
 dRz4K/MU/kwOnkmg2ix0zhZXgb1d5+AwFLqyP6QpBOTcTNOnp/ltjOO5+
 TuBLHbbsvGNDiR51S3W9Ji3QMXA0ml2J/rfRWkgluzZbr73BkztxAmWoS
 2HiKHECUUy9xVM/0qE5byVnLezvKxRX4+6Xix/RB6ajReL6N1viYVsD3T
 zQiwyhabLJ5ZOH7RdFk34U2qeflJuJfLLO1NIKrKdVT1kXyAOEUycc6dg
 o5v1WS035Y1WxuSdfsrV5sfHJkqzoAryQZJIDdttFvjk4HeqFCT1AQxDA w==;
X-CSE-ConnectionGUID: AK1fiaHrROGGRxAFibOf2Q==
X-CSE-MsgGUID: Igs35EUoQtiNRT3/q0FfDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81960960"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81960960"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:07 -0800
X-CSE-ConnectionGUID: FEmeSnW6TbCf8tldM2jsBQ==
X-CSE-MsgGUID: km3SKu7tSSKIvHwUW5JabQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187667949"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:06 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 06 Nov 2025 11:27:31 +0100
Subject: [PATCH 6/7] tests/intel/xe_query: use xe_query helpers for query
 GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-xe_query_helpers-v1-6-d761a944c237@intel.com>
References: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
In-Reply-To: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4204;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=bbsaNK8DEi0fq2mYu8gJINQzvgEBfGIbMAwrJf/c4Ck=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDHgoNQs+bTzSCmYjYSeY2JvpB9acOqEWkVCUh
 B7s5MmOsXmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQx4KAAKCRAjYrKT3hD9
 1zMYDAC7QO5CZCtPEh2aYWT/gnncZePd8MrAb25Uvc7Mj4rucZe2z+IFL4iguvTL7bQiHTtITGy
 rnOc4CtJLuHPT7KUICPebrW5CK+1Mpj5nUjqhwu5UOhfL/XuT0Qbch/P+vgfoIFCeshIR1dB/+N
 bQtLIXgYtlv7sipVCk8T9KfweDBbdEHzBj8LDHx9wRJYC9eGov1gAcNVCnTt12W4JoX2vZHaR7v
 p079mjUGjzBHgBoC1bjL7xoTnzGGMWnCn20nk3iViZv6cYua7TjAFqsPX22VTZSUYmKhJk4w7mP
 y3bUzP99voTqg3KFpmoN6jvGzMrO4i1LAa8LbCWMzZqdZ0V9+ExmYNFNyaHF0dNIUmwaaT7NPeC
 m1edWdZRDxgizFpqda0y2mII6xd7eiA8+Iqpf1L9hhe9vVUERuCa2b2+QKoLzCodCQ7t3nsJLez
 izJMliPIW0kURJK0ex4TqPycyEdDItT2hS83r9lDHik4gP9zrcMAR/c6Rn9o3CXhsmgDw=
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
index 2de88fac9071a5db95ef482e59ed06fc45440dd0..d56bb31da706578773565b477d3daf089458f538 100644
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

