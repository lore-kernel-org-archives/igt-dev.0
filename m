Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCD3CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98EC10E887;
	Thu,  6 Nov 2025 10:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQd9xj/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4E610E88C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424948; x=1793960948;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=x0WgCABH53kRrDIqX3JgD5wuBF/Uf0uwX2bcxLPES7Q=;
 b=IQd9xj/nqN/GFB/nhdb6rEyPjcXDyJTIwUB1oYtzmi2csDjvSlPqm8T6
 TCUGiwpk5GqhgpPeABzionA33MAGLUrYNTsyO4OCv9tfe1d4XJybGwPiZ
 o9myNXyd3EWLkCH237L2eXpV7jRHykMoqsN/pQ56VCYiIJ/cJLCTij26K
 Y3rH04gFpvDUyo2Q/IUjRV0rkF2J9gfHnwKRY/xR81JTuDEp3eD7Z7+nm
 FC+FK/IVqfq3YCV7KBy0/8cDAaT2+C0VSRtvZReOvXoXsG9zjE5QfriNS
 T3vNccQ7Z5Z/uvbxY+QSAP2Ip/O+DWQ2Iz3CwHJWHP/LpEZ7+GwD8RJCf g==;
X-CSE-ConnectionGUID: pihVEjgtRYSwNg0jbJ1Q0g==
X-CSE-MsgGUID: b5PPd4u1Qd6TYVBSieNHwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81960963"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81960963"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:08 -0800
X-CSE-ConnectionGUID: 6IYs83saSmeXdorJW1qZOg==
X-CSE-MsgGUID: XYextAZLRBGdisHcpzMERQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187667958"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:07 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 06 Nov 2025 11:27:32 +0100
Subject: [PATCH 7/7] lib/xe/xe_oa: use xe_query helpers for query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-xe_query_helpers-v1-7-d761a944c237@intel.com>
References: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
In-Reply-To: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3372;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=x0WgCABH53kRrDIqX3JgD5wuBF/Uf0uwX2bcxLPES7Q=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDHgoUhkqyNcGNGgGeFS9Wb8OrlB1eGrnCUZhR
 HULHCXiaZaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQx4KAAKCRAjYrKT3hD9
 1yrdC/9fI7OzsqqPlO7lDR9GemoUcawb5MVhxhxasRwTBWF005CLCixalDiL6mPS2rjbT33H5Ry
 JGoO2znrZZlFD3cDUyLKBhtCrSiovMhEGOoy7HppPZltiJ/1bVsH6buUH/CfzgH22n9LPAgjieT
 bFP7a0Vl0qWHgaUSrWjM3AWyA2CHSZAkRYkTTEzjAb+3WZqKVBDyE+fryHQbtr+cs7tI7YrkX0Z
 TyC3FtisjkBXQRtgWCHrzFkJpbf3+kdSqlQFnMgGsgtDRVL4Dn1Cn8W2TgHmvo679tkDT0pwa0V
 aSgGjW1UJdo9vQQL6XYV2V4Z4KysRxWQjjZfGZ3mSmk/4IF2caebGbQCi9xHvB83vgTOd8Yhoj5
 qvEKBzljLm0mMyeR5Ci99G32A0iuDAeBZTlGp4DwsOnL5awM8bKMA8CoFHyECmn8r9MysEC7hiO
 zPourAQyXrb4Wo9He1NycFb5yQe5Vv4G9L2z3OaGI+ZVOMrnHz36M4WRXTaEhTx3G6h00=
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
 lib/xe/xe_oa.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

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

-- 
2.43.0

