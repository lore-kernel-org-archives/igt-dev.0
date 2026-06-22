Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE1CDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 07:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC26F10E4F7;
	Mon, 22 Jun 2026 07:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjEnd17Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69BF10E4F7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782114101; x=1813650101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ukv6werAU7U4ugJekerluibo0fLKLeyEpsy3TL8OLm8=;
 b=NjEnd17Qb9Aq2XnkK7MUUXqU4exDJKvPAKBFROHGioPbuRSskYCOXUsG
 KToZ3eimixnDxlRJGnhkFHIMUQn4q1y/8k+jcT52M3Jsi8KflaHB4AnI4
 r5kPUjx0DCTvcskHMWhJsi/Ttm9kSkZaP05Aqkvu4PfqQnKNp35gHTZOm
 Q7fYsYIyVZou88tLptm+gCghYKXWN/LC6Tv83Ag5/rxoOJ0FrIuHtjz9j
 dPzHF0sJdHH4R3noT6EGfgRky6nhhMPMAtgb60flGkgc5t4cvXVUHilRt
 3MogBn0sIomf0eoNemRUSvUuuRmhEvBffFcKhFiNbAQ9/atQm5uCAYQQB A==;
X-CSE-ConnectionGUID: iDe5tXuoS46KL740kpf/Tg==
X-CSE-MsgGUID: XM0aCz9VR5qMEvtWg5sObA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="81814895"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="81814895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 00:41:41 -0700
X-CSE-ConnectionGUID: vr7bAay3R+6Oh9K18V0e3Q==
X-CSE-MsgGUID: aJGl5OdbR+GeapIw/PDkYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248270721"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 00:41:39 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v3] tests/intel/xe_pmu: Fix gt-frequency failure with raised
 min freq
Date: Mon, 22 Jun 2026 13:05:20 +0530
Message-ID: <20260622073519.2526530-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

The gt-frequency subtest can fail when the min frequency has
already been raised above RPn before the test begins. Using that
value as the original minimum prevents the later min_freq write
from enabling the GuC ignore_efficient_freq parameter, so min_freq
can keep moving toward RPe.

Since RPe varies dynamically with thermal conditions, use RPn as the
fixed minimum baseline instead. This ensures that writing to min_freq
enables the ignore_efficient_freq GuC parameter.

v2: Fix commit message (Vinay)
v3: Cosmetic changes (Kamil)

Closes:https://gitlab.freedesktop.org/drm/xe/kernel/issues/8344
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/intel/xe_pmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fb4b871e7..4bbc801a1 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -903,10 +903,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	unsigned long config_rq_freq, config_act_freq;
 	double min[2], max[2];
 	uint32_t gt = eci->gt_id;
-	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
+	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "rpn");
 	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
-	uint32_t current_min;
-	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
 
@@ -956,9 +954,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 * Restore min/max.
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
-	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
-	current_min = xe_gt_get_freq(fd, gt, "min");
-	igt_assert(current_min == orig_min || current_min == orig_rpe);
+	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);
 
 	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
 		 min[0], min[1]);
-- 
2.43.0

