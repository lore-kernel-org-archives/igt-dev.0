Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD07C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 19:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361AF10E645;
	Wed,  8 Jul 2026 19:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeZtM5mZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3130C10E645
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783537449; x=1815073449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NWnqILG1Sq8rDQd/VnOQrXBZ3fuc0wfBlTwZMja5cAg=;
 b=VeZtM5mZIrNyZNPSQc0ZtWxR/AKGWNFEE979mYr8YiIMtb6fY7B5j0Bo
 fiXyrvgx2HIDzrT4CucPWuioRwek70oc84y92xwfqN3vNXthPW2MiUyYM
 SGXWIK2WPPqS8Aj7rf7OEe19mwYCGdTyoW+iPtpvqPqMjegp9aikX8JIW
 7egHV66oWDZkc3KOuuxMxKOZ9jjLxB3GdN3tU1mdBOjEk/5Xvj7f+rLYt
 Nbe/bfjzjBJ0l43Pg0KUKG4qTyLzMUYx/SzDrLohF+j8+NiQyQPVsDRDU
 0uS8AMyIY5yGz57iC5LjD5Xv2aad2q+fIhID9wUuP7S7fvxYgt86euHf4 Q==;
X-CSE-ConnectionGUID: 1KSYfFFORziPGUzfHln3Dg==
X-CSE-MsgGUID: k3wblipBSHyBaWgPz+Zs8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94567496"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94567496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:04:08 -0700
X-CSE-ConnectionGUID: J/YUnxVpRvK224TtIjhUHw==
X-CSE-MsgGUID: MLbCz3q2SLarxhiChN6teA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278758948"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:04:06 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/kms_sharpness_filter: Fix tap filter
 test failures
Date: Thu,  9 Jul 2026 00:43:04 +0530
Message-Id: <20260708191306.2995928-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fix two issues in the filter-tap subtest:

1. get_modes_for_filter_taps() could select modes requiring bigjoiner
(e.g. 7680x2160@60) for tap filter testing, but joiner + CASF is
currently unsupported. Filter out such modes using
igt_bigjoiner_possible() against the platform's max dotclock.

2. After each tap iteration, cleanup() calls igt_display_reset() which
clears the output's pending_crtc binding. Subsequent tap iterations
(e.g. tap-5 after tap-3) then fail with EIO during pipe CRC
collection because the output has no CRTC assigned. Fix by
conditionally restoring the CRTC binding via igt_output_set_crtc()
when pending_crtc is NULL.

Swati Sharma (2):
  tests/intel/kms_sharpness_filter: Skip joiner modes
  tests/intel/kms_sharpness_filter: Restore CRTC binding

 tests/intel/kms_sharpness_filter.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

-- 
2.25.1

