Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2282CCCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 12:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C6410E0AA;
	Fri,  7 Nov 2025 12:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXe0PxJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D7610EAB2
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762518281; x=1794054281;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=2s6+Fl7mHlXiEd/LQTfTwHzszGRQ1uxyTjdy9xZKlaA=;
 b=GXe0PxJ/Y5eIT9BZvxAJx480RiyP+5opEryqeKJRORx/3irmaxvNYC+Y
 MRxcVkWVNeGrFHO3hoJVp97W8xYhns2vToipcrrqVoco8kKY9SS4Febv6
 vIo03iQlmp4w7vNkEyfS11B6NgG8IMz1yrlJFTy7bfmbZLr1K11Y3iapu
 V4LzuHV5miNuJA/jJMYsbwd7zyD8xAafKRXGpTqL/QP/DH9yeWXbRMPXD
 ueSlMuie6FWLOaIUU2ODI1D3Hp3Z+OPNFdIxVPRYcwg26y2d1izg7sIEq
 og7ur16VPPTuar3Vei/ijSc724D21Q+VSJbwAn5X1/dsTa0qE3jyf/GXE w==;
X-CSE-ConnectionGUID: 6YxnNXavTsm16/3tkC+PLg==
X-CSE-MsgGUID: 9cUuBuomQ1GsTFWa39tCNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64365679"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64365679"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:40 -0800
X-CSE-ConnectionGUID: B6yVISUtRt2nHSO7mrFiGw==
X-CSE-MsgGUID: 1X0F4MTeQf6MeTWjMvhL+A==
X-ExtLoop1: 1
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:40 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 07 Nov 2025 13:23:21 +0100
Subject: [PATCH v2 8/8] lib/xe/xe_oa: use xe_query helpers for query GT
 topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-xe_query_helpers-v2-8-ec66ba6af1c1@intel.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3379;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=2s6+Fl7mHlXiEd/LQTfTwHzszGRQ1uxyTjdy9xZKlaA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDeS9jhqG7YciUwUsLNvlRuqmLv+TWItBxXDHM
 JRAv0lp4nCJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQ3kvQAKCRAjYrKT3hD9
 1zAOC/9nIvhBEhvG6B1+pjMpTckvx51NmhPSljPJ7v6FNNVlPZFG0fCTBT/hamuaiiA2P/lg/0p
 FywKgKNubf16d6rrkbiVrSuEs7S3t+mPJGlF0NE2dD3YgmkJEIonYoRp2LGI85OgjdcfalSpWY1
 RNaDT1VjqNspmcCdVGLLlbEM75kjdFKIzH9AmDhxd7nJXx+qoWeROY0vFhG2Pu62ac16dKezLNv
 a3ZDHsCow4Tp60CP1a3NP9iuz7CqUx7Lvr7wnk33hS9ce/y4b8zntOzz9D0oWA4hyNHLPnOPyp0
 xytMR9ltsRFKzVOePc04f4tZ9vFSoo5yBxJAS/ULLefCizeBLB74NTbz/ZDMLykKCpEbDtX08e/
 5X42xR2iDsHvAQ7VkhVoYnuXwwQ5IcSB/siB/G1VJslnb1RqkgHebdqEjOIDourAlZQ/Svc7VZZ
 IoCA+If0EUQ0RaHYLJ6sVJqkHvtut9KD4xNh37yjxrmY8jbWuRfG0FCc8EMoswWm/npEk=
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
index 428e7d0a2980dba1106d62a4bf20e56af5b9997a..dcbc68d4bbd0de872c136acf7cef71488e7a1c6e 100644
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
+	xe_topo = xe_query_device(drm_fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size, false);
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

