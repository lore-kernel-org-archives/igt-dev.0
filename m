Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B5C83036
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB38510E4A8;
	Mon, 30 Jun 2025 16:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YoEa0vE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B0C10E050
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301348; x=1782837348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dRoFnXhbpYujd4AnoAqlM+3/mYvmNtYFCXjraVsJa8A=;
 b=YoEa0vE0oTRwTqCd0yqkGbUSt/oxIT0bhLMgBeGBiEGeSruuLtNAiuj5
 V7sWgnGQNI8bnXLPxzb7y2H6gxSSVOOKjWvdVh9bHXbL3hs8dW+V3c8cb
 C9nrwKE+cSDVa7bkUgoZ1PtY+USzx+kMq2qvzo1qtbtNH5IFtivo7LHiW
 KgSDUl2WPwYfyfS/bmpVzsNGi4IQ5UsmM8R6FGHQTNlAYfTLW8HQC0pWH
 /bL3jVRvGkywXTq7DQ4NX47r8KVNUDr+oD3+xHUVnnpqWuNPYnxmld/xu
 CU9ALRSim8gZ0YVO2ASyAKJVx2HppmHk5r6y9oWfBVsSJ3a0q9aQr/Q+H Q==;
X-CSE-ConnectionGUID: l6FcxL90T2i9DFYb+TRWsg==
X-CSE-MsgGUID: /h7GUI6XT32jy5MX9QegZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71101951"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="71101951"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
X-CSE-ConnectionGUID: zAElKXabSjm+hyANplCl8Q==
X-CSE-MsgGUID: 9ObZuhrAS56e4Sox/xVTIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="159226409"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 3/7] lib/xe: Populate vram_size[] and
 visible_vram_size[] by GT ID
Date: Mon, 30 Jun 2025 09:35:33 -0700
Message-ID: <20250630163529.2096664-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630163529.2096664-9-matthew.d.roper@intel.com>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
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

vram_size[] and visible_vram_size[] are used to lookup VRAM information
by uapi GT ID.  Ensure that they're populated according to these IDs
rather than by the GT's index in the query list; on future platforms
these two may not be the same.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/xe/xe_query.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index ef4034185..9bfad0cc2 100644
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
+	max_gt = ffs(xe_dev->gt_mask) - 1;
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

