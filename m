Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF2DC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 14:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A1E10E572;
	Wed, 19 Aug 2026 14:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPDNeZXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2421610E901
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787151186; x=1818687186;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FUfwu8RoG90KR7ltP4lqhs/SM9PpZq5Kg6tTEYI0FEc=;
 b=cPDNeZXYr0PAkn6IYoJMbFqEHWYWNjCiHcBtw07PCtc75BatxuvebRVc
 N+yTV/v+9mk7H631dILP5lU/4DtABl6tNsi7xwjLHG3ejjb1iycKEPEIN
 WW4eZ3ZyxoliMiFPlgnVWggw7mA67DNpVd99kvup6dgDi/WqLiNANL+KJ
 rPzCT7RTUkZJnskLN3O0Nrw4M0nR+AVRSNiXSmRAmQfK09SzHk0vm40+E
 zwg6umLXKhnLUliqqMNvDs1rp7JPBsuicxbImlbIG5dH6M6H/E9V7/xqa
 9w4ShLSElY08yY74m7B2/AFX/vAPMPxgn+2d0MeKqgNuiDflwUdbU29dB A==;
X-CSE-ConnectionGUID: z3whCbNET5uaeAIL115p4Q==
X-CSE-MsgGUID: Wk/ykdXvTqyFXQWZcr/Khw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87588153"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87588153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:53:06 -0700
X-CSE-ConnectionGUID: xfWCHCKzTMOsFAfxS39Sdw==
X-CSE-MsgGUID: BWIL6aD/TPewnPsainUVbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="270791042"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa005.fm.intel.com with ESMTP; 19 Aug 2026 07:53:04 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v1 2/2] tests/intel/xe_exec_system_allocator: use correct
 DONTNEED test flag
Date: Wed, 19 Aug 2026 14:53:01 +0000
Message-ID: <20260819145302.18068-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819145302.18068-1-nishit.sharma@intel.com>
References: <20260819145302.18068-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Test now using correct flag (USE_MADV_DONTNEED) instead of the libc
MADV_DONTNEED constant. Both USE_MADV_DONTNEED and MADV_DONTNEED have
value 4 and went unnoticable.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 476470be7..305512dfd 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2337,7 +2337,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
 	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
-	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & MADV_DONTNEED);
+	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & USE_MADV_DONTNEED);
 	env.vm = vm;
 
 	read_gt_stats_snapshot(fd, eci, &stats_before);
-- 
2.43.0

