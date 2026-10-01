Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22043CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C684A10E1E1;
	Thu,  1 Oct 2026 07:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnK1RrGJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4110F598
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838996; x=1822374996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WATT3z2WPOxvDOPLHPFlwX2FF5rxzklzs2HrL+7satw=;
 b=dnK1RrGJlxLBKzgqRdrwylBbhF7dhBwsoEEJI6HQOGVkJqd1y+96Aarf
 LUXuqYLxQYo5RDirp6wp5SsF3Tbdyvsb8CbthYsiwI8ZiwsD9JCrMSqHO
 ky8M7CHLggl1WNuZc1gkh81UW7nSJ+bDLKApJQdRcxDpC8N+zOLpkBu2o
 IQ7WXInk0E8Ado/Xc9pB15obiZfNV6mVU4hub68MN2M6a87ubddAhzJgZ
 fKZyiWO/JR7BsKBwqtEY+HKJpXE61MgisiTbRXBQLJ5xWOBqiti0m3oGC
 KUkwyYJbq55rCIR6x7V8df7hnCUD1l2SFaIkhUZbHaze5OypwiC+ucS7l A==;
X-CSE-ConnectionGUID: 0MLIOlKPRBuabzv+m431yg==
X-CSE-MsgGUID: Ewwm+JNsTr6vsqpRbeoB1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605981"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:43 -0700
X-CSE-ConnectionGUID: DlUjwll3RDSvMzqjTpDyWA==
X-CSE-MsgGUID: ZopriqQMTFyeROP44i6cTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138294"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:42 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 00/13] Expand kms_dp_link_training coverage
Date: Thu,  1 Oct 2026 13:06:50 +0530
Message-Id: <20261001073703.5067-1-kunal1.joshi@intel.com>
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

kms_dp_link_training forces the maximum link config, reads the link rate
back from debugfs, and asserts the two match. Both values are
intel_dp->link_rate, i.e. what the driver asked the sink for, not what
the link ended up running at, so a link that failed training and fell
back still passes. The FIXME in the test has been saying this for a
while. Nothing below the maximum is trained at all, which is precisely
the range every fallback and every bandwidth constrained modeset uses.

The series turns this into a sweep over the link configuration space:

 - lib helpers for the debugfs the test needs (allowed link configs,
   forced rate/lane, retrain state, Type-C port mode), plus generic DPCD
   read and link status helpers in lib/igt_dp covering both 8b/10b and
   128b/132b.

 - Enumerate the configs in intel_dp_allowed_link_configs, i.e. the
   intersection the driver really picks from, force each in turn as a
   dynamic subtest, and verify from both ends: no link recovery in
   progress, retraining not disabled, and the sink reporting CR, EQ and
   symbol lock on every active lane.

 - Configs that cannot carry the modes are skipped rather than failed,
   using the aggregate data rate of all streams the commit enables.
   Deriving the floor from the driver's unforced choice does not work
   for MST, where it always configures max link bw.

 - Outputs are grouped into links, so an MST topology is trained once as
   a unit, and every output is covered instead of the first one. Per
   connector mode subtests drive the smallest mode the sink offers,
   which keeps the most configs reachable.

 - Separate subtests for tbt-alt and direct links. That is where the
   link clock comes from, and today a lab with no dock and a lab with a
   broken tunnel look identical. The connector mode has to be in the
   static subtest name, since a dynamic subtest that skips is not
   counted as executed and the no-dock lab would report green.

The old four subtests keep their names and their PHY agnostic scope.
Everything new is guarded by igt_require() on the debugfs it needs, and
the sink side checks skip when the DP AUX chardev is not built in.

Kunal Joshi (13):
  lib/i915/i915_dp: add helpers for the allowed link configs debugfs
  tests/intel/kms_dp_link_training: use i915_dp_is_uhbr_rate()
  tests/intel/kms_dp_link_training: extract train_link_config()
  tests/intel/kms_dp_link_training: detect links that failed training
  tests/intel/kms_dp_link_training: use the lowest pixel clock mode
  tests/intel/kms_dp_link_training: train all allowed link configs
  lib/i915/i915_dp: add i915_dp_get_tc_mode()
  tests/intel/kms_dp_link_training: log the DP link inventory
  tests/intel/kms_dp_link_training: train each MST topology only once
  tests/intel/kms_dp_link_training: add tbt-alt and direct link subtests
  lib/igt_dp: add DPCD read helpers
  lib/igt_dp: add DPCD link status and channel coding checks
  tests/intel/kms_dp_link_training: check the link from the sink side

 lib/i915/i915_dp.c                 | 192 +++++++
 lib/i915/i915_dp.h                 |  41 ++
 lib/igt_dp.c                       | 211 ++++++++
 lib/igt_dp.h                       |  13 +
 tests/intel/kms_dp_link_training.c | 770 +++++++++++++++++++++++++----
 5 files changed, 1126 insertions(+), 101 deletions(-)

-- 
2.25.1

