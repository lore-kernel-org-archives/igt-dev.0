Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0CBC77B7C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 19:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A977110E779;
	Wed,  2 Jul 2025 19:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxVQRUm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185F010E779
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484784; x=1783020784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IRtnzF0c2UyCpZU9BP5sidqFhwKupQ5dyeHdnFUq+6I=;
 b=IxVQRUm842e3kkPAkD8B51nrqqOhsem4hD2oeobCmZxqSWytHy35CLpL
 J5Fw6LIXxtRB+X51eVL+aHfGKuQgLA+DcNPUs2EOO8mj1T8wNK02k7DPm
 iRXT1XIHlmgrvD8+0YRFopv9UCJm7ywWZkRTUQEh6Scn8jRLtmr0eC1g4
 hFgknQzx3Oplzv0kCCxZkoEMAFi7G60mxP523Eke+egtUrLb84oAY7lCg
 /2uyVfyL3fZSWOl+azRm+tpQD8qIqD7J2IisngXrzusEVjIiDV4APhHyn
 wnU0uWMO88V9YoUlHRXbx6Nz4IkX35R6lHU6YHGVp6EqTSpM8+1ZFm7x7 A==;
X-CSE-ConnectionGUID: 0AVBRDsvTFaD3dr5sb8dCA==
X-CSE-MsgGUID: fxh5n6y+Q1uOyhhBDR3/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53028473"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53028473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:03 -0700
X-CSE-ConnectionGUID: qpzTZSyZSMeraOJvMvI2zA==
X-CSE-MsgGUID: VgRqpwBCRaujWyjrmRSBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154241553"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 3/7] lib/xe: Populate vram_size[] and
 visible_vram_size[] by GT ID
Date: Wed,  2 Jul 2025 12:32:58 -0700
Message-ID: <20250702193254.2613121-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193254.2613121-9-matthew.d.roper@intel.com>
References: <20250702193254.2613121-9-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

vram_size[] and visible_vram_size[] are used to lookup VRAM information
by uapi GT ID.  Ensure that they're populated according to these IDs
rather than by the GT's index in the query list; on future platforms
these two may not be the same.

v2:
 - s/ffs()/ffsll()/  (Zbigniew)

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index c4aed178f..8afcfe8db 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -332,6 +332,7 @@ static void xe_device_free(struct xe_device *xe_dev)
 struct xe_device *xe_device_get(int fd)
 {
 	struct xe_device *xe_dev, *prev;
+	int max_gt;
 
 	xe_dev = find_in_cache(fd);
 	if (xe_dev)
@@ -355,14 +356,22 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->engines = xe_query_engines(fd);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->oa_units = xe_query_oa_units_new(fd);
-	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
-	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
-	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
-		xe_dev->vram_size[gt] = gt_vram_size(xe_dev->mem_regions,
-						     &xe_dev->gt_list->gt_list[gt]);
-		xe_dev->visible_vram_size[gt] =
-			gt_visible_vram_size(xe_dev->mem_regions,
-					     &xe_dev->gt_list->gt_list[gt]);
+
+	/*
+	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
+	 * the allocation is large enough to hold the highest GT ID
+	 */
+	max_gt = ffsll(xe_dev->gt_mask) - 1;
+	xe_dev->vram_size = calloc(max_gt, sizeof(*xe_dev->vram_size));
+	xe_dev->visible_vram_size = calloc(max_gt, sizeof(*xe_dev->visible_vram_size));
+
+	for (int idx = 0; idx < xe_dev->gt_list->num_gt; idx++) {
+		struct drm_xe_gt *gt = &xe_dev->gt_list->gt_list[idx];
+
+		xe_dev->vram_size[gt->gt_id] =
+			gt_vram_size(xe_dev->mem_regions, gt);
+		xe_dev->visible_vram_size[gt->gt_id] =
+			gt_visible_vram_size(xe_dev->mem_regions, gt);
 	}
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
-- 
2.49.0

