Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EE6CFD315
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 09:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EFC10E3A7;
	Tue, 25 Nov 2025 09:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJtuD30w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6BB10E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063544; x=1795599544;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=P3FWH+kIiULSf9ZkxcvMyGcYjjTyTL5hAwgS7XYwQJM=;
 b=fJtuD30wYf8P++WIJfgqOqL1ZX7yoGshqjRkVtvjS/kohXlfbmxY1b5K
 LEBGlRPEbIpZa8VbfErlm/2n/tEbo2maA9C5/2e1dqs0NDXzLn5Ysz99l
 VBnqKfsvuhiS5JhD0yW1r767ZsTA+TZwT0jSOV8W2UTAOfTDF5cl6yau+
 W/R5B8qKJMstWND/F/K0XMpS0UQU8w1kE8SHccuzNW6xjjwSUDcFnTqmU
 SonR7MJ0AXS8imxELpo9r2TX20TE/YvkK2ILu1hbRRPvmjC/0BTltk928
 Oyas+POF55YmIUPjHS2PCnyeumy/HG5MbdIaqymdBrfhltnLbc3c006lS Q==;
X-CSE-ConnectionGUID: 6DRRi7IwQb2zhRsgduplCA==
X-CSE-MsgGUID: 8htxUr+BSIS+LOtsxjZ6eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66022196"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66022196"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:39:04 -0800
X-CSE-ConnectionGUID: T8psWyOoRsi8QX1XO4h+wg==
X-CSE-MsgGUID: 4nSmBga8TpSvyZOHbK76zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="215944019"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:39:02 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Nov 2025 10:37:26 +0100
Subject: [PATCH v6 6/7] tests/intel/xe_query: use xe_query helpers for
 query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-xe_query_helpers-v6-6-97686fac1b77@intel.com>
References: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
In-Reply-To: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4268;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=P3FWH+kIiULSf9ZkxcvMyGcYjjTyTL5hAwgS7XYwQJM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpJXjncCFnGeamzItrVfTOKcLh2yJWxFkL6b5og
 erfUfn3BXmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSV45wAKCRAjYrKT3hD9
 17DWC/4zdUpnqMNJ/4gUjPCzPFStLcXcdISFsFu47cdI3kWVsxpBVBAG1F0V95/rzSB+fVSnwAR
 FcR9nMavRMEU6pwfkHZKP+zwOjUf9Evg/B2l0nqBALRw+KhLVsr6Rqgf5ZdBiw3jYnDWCqQVWKx
 j9NEs1hfruQxk6jG6p1iVec/N+An7CpdI43XKL+eY6IEqNWGX1zfF9RUdDgmxMnD4MbtpCT19NU
 5TZqZbR0H8ZsTnFO+RPGhRwcbOq0tHP3GCwlN+PgZcsqvvwVDMLowLWq6UvG1i0oso1ZKwQkDQh
 t4PlHBqaIZGe7abyliE+KtpSESlREwQ0+FALMkRaoyJAC/mCr+pAoywO6udnWWBjtBI89KtlLKM
 K+k+EpPdtmYEbZ1lhXyU3uUXP2XF0Upyc0WHt8hPmW6ds6biXkGD5eY+6pxmFemJF3uRfRQSEFs
 JekWxaEl3dOpQeL8UNevZlgB3eBfWW94VpmAm/k6v7eCEcpONl5N+QA52VCN/B6U8Try0=
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_query.c | 69 +++++++++++++-------------------------------------
 1 file changed, 17 insertions(+), 52 deletions(-)

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

