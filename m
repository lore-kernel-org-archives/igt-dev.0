Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91C8C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 18:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4E710E036;
	Fri, 25 Apr 2025 18:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lN1r4vn3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693B110E036
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 18:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745604738; x=1777140738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gty1gF/tQPEES9ko1e3YECTn9fIZbNJtCQG1HX/hqGw=;
 b=lN1r4vn3L/j4rfTZQn7s5Uu1HDklGpNoVHUSygyRxPpxnDcMEF31mUfO
 +26nYNPZIzYdFNyF9wmzXk/1xV/UCM4Xlxz/nlE1gngrTTWBcW1KnAVE8
 jeSnD7kTpTj409Os9SlLLNQejfuFU2ytCeo5l1qoWNtqqW4wZhL0VXV3R
 B7MOCdRR1vAh6ldokaWJ5wSzw+7gEyxtcx3CACsM0GgfnZdMGE4XtynR/
 oldP9O0jtNKAVUz6sh1bqaFw1gp/Rh5mAaty8wGvbABrUTsKvQhM2D44i
 T5lw6eFETGs9OkEEdMk6YteeG+V8x++I7Rh1/CLhoTu/Lqj/z5f5oPWVp g==;
X-CSE-ConnectionGUID: OtH7vP9VRf2+rUVv0inogA==
X-CSE-MsgGUID: fYPrCB5XRZWaZuUAtv+n3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57916658"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="57916658"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 11:12:17 -0700
X-CSE-ConnectionGUID: 4S0S8OphRSeC2q2UK0e5Bg==
X-CSE-MsgGUID: ojvNSwtDQ0qdUwIN1jy63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="137020702"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 11:12:15 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: vinay.belgaumkar@intel.com, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/xe_pmu: Fix frequency stashing issue
Date: Fri, 25 Apr 2025 23:36:58 +0530
Message-Id: <20250425180658.2533825-1-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Sk Anirban <sk.anirban@intel.com>

Resolved the frequency stashing problem by accurately
dereferencing the pointers, ensuring the minimum and
maximum frequencies are correctly restored.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 589c7cbde..094dc0c6c 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -527,8 +527,8 @@ static void stash_gt_freq(int fd, uint32_t **stash_min, uint32_t **stash_max)
 	igt_skip_on(*stash_min == NULL || *stash_max == NULL);
 
 	xe_for_each_gt(fd, gt) {
-		*stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
-		*stash_max[gt] = xe_gt_get_freq(fd, gt, "max");
+		(*stash_min)[gt] = xe_gt_get_freq(fd, gt, "min");
+		(*stash_max)[gt] = xe_gt_get_freq(fd, gt, "max");
 	}
 }
 
-- 
2.34.1

