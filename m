Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0450ACFD379
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 09:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA54F10E39C;
	Tue, 25 Nov 2025 09:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lT180iqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75E810E3A4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063542; x=1795599542;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=NHJuJR0SC6kDH/kD78f97J7Vj4kzuJTzJ8vsIfEOw9o=;
 b=lT180iqV0NM771wkjaiwN/fOZPm2XfssEoLI8gAIcLBc6OohquV8zRg3
 C9pVTakJ+p7j2vXAaC3FxQA+tKCYYUGuR7K9DT/OyjTGWlHeMMRTbvmLP
 sAfs1UwW3J7aSES81hua1NhkKqHXNaYOxoP8fRohW4rATiN1QC60hMxuN
 Nl1orNS266pJysioWK0yepc64vzA7UWqDQ0rO9Lz1zKrxO1LLcr5a2Syp
 E//CBfA7rHT1WM/OTq2FkrxgyByvW+Uv4SmjxFKwn7ejMKxLl9d1XiIFg
 aUgkpM83MnZWXLcfKRs2jgh4EJhCdg1DU+kg/USE+xh+HuIQe5DNx92O9 w==;
X-CSE-ConnectionGUID: 89zbUyiwQIufefLh98cGkw==
X-CSE-MsgGUID: wfXLZvZ4Q36sD493M0v6jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66022191"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66022191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:39:02 -0800
X-CSE-ConnectionGUID: cYzYCehjQbev5r26Ntz33w==
X-CSE-MsgGUID: sohGh/BTTLKu5xcjLD52PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="215944006"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:39:00 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Nov 2025 10:37:25 +0100
Subject: [PATCH v6 5/7] lib/xe/xe_oa: use xe_query helpers for query GT
 topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-xe_query_helpers-v6-5-97686fac1b77@intel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3436;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=NHJuJR0SC6kDH/kD78f97J7Vj4kzuJTzJ8vsIfEOw9o=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpJXjnBv4B5KOP9isOv91YOslaLB0YHXCKfD/xU
 U3dfqaYw22JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSV45wAKCRAjYrKT3hD9
 1zNvC/wJrua+1PmC8girsdq7uUMGWYXKGStrBJqWRK3uEQ+rroq10kJKJOhLJDPral8HSuXVZA2
 i9fsmj6GsMZOOIkIfhvtZex/BKqvVOqXG9jyJYLcpnT93cMX4WctBsWQq+Ek/TSOUsSh00A94lR
 lyNU+F+hdbXQpUB4k/NJru5yioD73ZM2SbnJamc+k7yGMoDg6fYLFknIwQnDfGy9RPh+RNSk9Eo
 EOInDX85ae6eA8rrYblzh/xTItEzY1zkqItzMiaXDRpn19Eex11gfDpSTldJqXd8kwonyd4VRCU
 OAEs47Mw9noCMd7XOV9D+dLkyb0ItT18kYRNoZP0Vkdk4nUQHpEDAlKAeATZ5HpmiBRioye5BWl
 0/qIvZLXDsCnU9ot0dhuzg68GvPT3vTOGh8oUh4ZyldL+tMeMjbjDeFrN4l20XgsY/Mk3PsNG7x
 0oBaQ16Xz2jgTsqGEQItNqJVL1VzBcuualscNAeXX0+NfqeiqL2J+bGKNvwsVeKfOPGYA=
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

