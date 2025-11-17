Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904E4CEBF9A
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B19F10E1B9;
	Mon, 17 Nov 2025 10:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnUVyLPa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F2110E1B9
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376568; x=1794912568;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=2s6+Fl7mHlXiEd/LQTfTwHzszGRQ1uxyTjdy9xZKlaA=;
 b=YnUVyLPaYMyu6OIEGtgzL227y28mGlfRH8VodNwgnpu10MJGaio0VCtK
 8R0jOuLehMnShWbbnSiknSCkfqxETyZcoMIagj1wdx4B60YrspyxBmJbv
 QfH/ohMtfbqvW6kux4ronhSIMRkmIGEz1p/peTCibRRPOtaU8LszZMiyp
 +dE5bjIKVVMwWviBpW/POIcAYaTxtoE9HneuStFrFYfcWV23DmM2903ba
 873+UbmLqH9Ifzc67JJ9QNMAshvSXHBo9jxBkvaixu3NhOcE8gzdiDgW1
 ySzwz3gDbS41ym1fRWIXJ8wSkfk3rxORPlZmQhgv+Xm8T6cpLAvcZZXn3 g==;
X-CSE-ConnectionGUID: QJynVExpTeCT5Pe/KupCcA==
X-CSE-MsgGUID: b1koj4I+QNujELqaBmMPWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306121"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306121"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:28 -0800
X-CSE-ConnectionGUID: st/tPxToTSeLwsNuPgq0Xw==
X-CSE-MsgGUID: jEdA93bmQUWVVzuJjBFF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213818018"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:25 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Nov 2025 11:47:46 +0100
Subject: [PATCH v3 8/8] lib/xe/xe_oa: use xe_query helpers for query GT
 topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-xe_query_helpers-v3-8-25d984ae58cb@intel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3379;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=2s6+Fl7mHlXiEd/LQTfTwHzszGRQ1uxyTjdy9xZKlaA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1l5MU8SEcvR5AYKb/jE+fJ7FEfEo7nky4i4
 9+IY+vgL1qJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9ZQAKCRAjYrKT3hD9
 1+g3C/wOqAiAnvLlAdXTBnE9jVT4OzEMLj/lPX4rLE1mMfZF5ttnThb+r5+W0toB29QcCX99i69
 SZQHub2P/p+N6XFOQTmjp7BCKCjx174Z/x1RHuhETrdBuZ3BZ2GFRsj2lnGCIudVeI7LUPnnq5k
 t6FjqYFOf5j355o0iXjbzlAuRzLAYJVlEHzC4JeYN4lR/oxzpPHUuiK6sxfIMIFPnpXmRqcDJ/O
 +y1znH1RSzl8mu1BFVnhuwWOQViLYGn3TKZnrAirEa96VQHEq1+DksoR+cwDUdW/Hxc/mxDzyYM
 KO17ckR0SkhrbWRvldxuz7/HBVnMgAYMMPT8twk/tR+sLy5z7J+2JHntG8lp9Gbrl4XnYqZaizF
 HaxTwfaxEUWflvFkWHIxq93ZlRxvD6m6gSBZP2RPN66fvZzzYzvhFInkah1qKSrXbTY78ZuYSdC
 59wXVd3ipAXALBLf1Jb8JEBPeQtpNvTtlB4U+UelpbkoR7Lt6FLPd4Jg6RbXQjZVBu3t0=
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

