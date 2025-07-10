Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612E4C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 22:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E890610E391;
	Thu, 10 Jul 2025 22:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIIm0FLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EFC10E391
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752185580; x=1783721580;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Dtwpfaphs5U7XZ6KBEJgLjRhZzIQ8wRPH3MlTSTrnPU=;
 b=QIIm0FLbom6R8MJDfBhP0Rp7zoAS51NFQYvDbWVIeZv/jDgVbwTsnyJJ
 Y1NNmPj9wK6dyFiQMa5wWStqpKdALKEhu7BQqO5BhGIDMltwBTrr7t8PH
 PCQvn78PBZt19Onzs9Azp+w7hlqp3bPeduLwTMtgLAmK7n60AFjN6O0QE
 9CZY+00NUao+xCTtaVkQapRMzWj4YjGEsRSDtSkfbjWzYQDjOtBuaRdn6
 iKUl9ilbD8CAFjLZ5xQmt33JQslfl00C32bgzOUJ/L+z3xcyLdzbXGNYS
 17XBPiV1XGD7WlywGMGJtpdpNYCTOW3Xa5JxxPN5Yf1QdWImoM8pVCkLR Q==;
X-CSE-ConnectionGUID: 4p81OQURSjGGRbBqE2VF5A==
X-CSE-MsgGUID: EDnwcDoeRnWVoRoQApPKIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65179576"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="65179576"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:13:00 -0700
X-CSE-ConnectionGUID: QNzWg6yTQDSlxk6qDznvDQ==
X-CSE-MsgGUID: d4yzv2GwShaj38jd1i4uYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="160222838"
Received: from spandruv-desk1.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.110.234])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:12:58 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 10 Jul 2025 19:12:27 -0300
Subject: [PATCH i-g-t] lib/xe: Fix allocation for vram_size and
 visible_vram_size based on max_gt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250710-fix-allocation-of-vram_size-and-visible_vram_size-v1-1-cee73305db60@intel.com>
X-B4-Tracking: v=1; b=H4sIAMo6cGgC/0WN0QrCMAxFf2Xk2UA67Ib+isiIW7oFaiutDHHs3
 42++HgOl3M3qFJUKpybDYqsWjUnA3doYFw4zYI6GUNLrafeEQZ9IceYR37aFHPAtfB9qPoW5DT
 hN3GLMvxtcKdjIPG+cwTWfRSxyO/zct33D77XyXODAAAA
X-Change-ID: 20250710-fix-allocation-of-vram_size-and-visible_vram_size-f194f0e55610
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

The current allocation for vram_size and visible_vram_size has two
issues:

* The expression (max_gt = ffsll(xe_dev->gt_mask) - 1) gives us the
  zero-based index of the first bit set in the mask, which does not give
  us the maximum GT ID, but the minimum.

* Since max_gt is zero-based, even if its value was right, we would
  still be allocating not enough entries for the array.

Fix that by calculating max_gt in the same way that xe_dev_max_gt() does
and using (max_gt + 1) as argument to calloc().

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Fixes: 3a39a6e51b18 ("lib/xe: Populate vram_size[] and visible_vram_size[] by GT ID")
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_query.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3d628cb3fe59ddc390684941452ca04fd735b212..c0dba018244e8a47c8f1b305cf43ec3d4ffdc575 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -361,9 +361,9 @@ struct xe_device *xe_device_get(int fd)
 	 * vram_size[] and visible_vram_size[] are indexed by uapi ID; ensure
 	 * the allocation is large enough to hold the highest GT ID
 	 */
-	max_gt = ffsll(xe_dev->gt_mask) - 1;
-	xe_dev->vram_size = calloc(max_gt, sizeof(*xe_dev->vram_size));
-	xe_dev->visible_vram_size = calloc(max_gt, sizeof(*xe_dev->visible_vram_size));
+	max_gt = igt_fls(xe_dev->gt_mask) - 1;
+	xe_dev->vram_size = calloc(max_gt + 1, sizeof(*xe_dev->vram_size));
+	xe_dev->visible_vram_size = calloc(max_gt + 1, sizeof(*xe_dev->visible_vram_size));
 
 	for (int idx = 0; idx < xe_dev->gt_list->num_gt; idx++) {
 		struct drm_xe_gt *gt = &xe_dev->gt_list->gt_list[idx];

---
base-commit: eacde5c2acc37c1570e27b68b8b6c39d8b61fb32
change-id: 20250710-fix-allocation-of-vram_size-and-visible_vram_size-f194f0e55610

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

