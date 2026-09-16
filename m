Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE0DC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6710E03E;
	Wed, 16 Sep 2026 04:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lALyPmNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5193D10E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532793; x=1821068793;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l9Gi1tTA0Y+wI3FyVfjUGbqo4mP15+c2rMck3jRI888=;
 b=lALyPmNKvwd79VHJ+HZ49QJeH+527ibMJdswN0Ih+VtK1FAljzkfKYWm
 A+0Pe2BpHQG0ejE9CE6QQBkwqyHh4kynxVmHDjigqexTkoC95F69vI8L4
 LTCl52sfUaWJ75rF1d1VhvX1S0wLTTKrL9iyAiAN1iV1DDLYwsmEbWiDX
 W2uUn7JQXpj/oTmyurcbLFk3QPhRRIBrqg8C/NFFQPlfCENzaZvnzD2S/
 ueLqCmALgQqI/VPw1sJsF8QmVxDjPPos27V/wD2nKEereD/Kfh5qikVwI
 /CBKMsGJdegjdknggRvyuWKOtCdL5Nly6HZtBOBh/UavwZRz7rzIjV3bV A==;
X-CSE-ConnectionGUID: 474McGj+ThmCwaETu/reDA==
X-CSE-MsgGUID: Q0HHg0EmRXGIVJAPorOReA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503238"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:33 -0700
X-CSE-ConnectionGUID: vTnfLKrDS+WSrugKP98GJA==
X-CSE-MsgGUID: Wtp62FYwSWqXfuisORiJcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765017"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:32 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 00/13] Expand kms_dp_link_training coverage
Date: Wed, 16 Sep 2026 10:17:48 +0530
Message-Id: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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
  lib/i915/i915_dp: Add helpers for the allowed link configs debugfs
  tests/intel/kms_dp_link_training: Use the UHBR helpers from lib
  tests/intel/kms_dp_link_training: Extract train_link_config()
  tests/intel/kms_dp_link_training: Check the config survived training
  tests/intel/kms_dp_link_training: Drive the smallest mode the sink
    offers
  tests/intel/kms_dp_link_training: Train every allowed link config
  lib/i915/i915_dp: Add a Type-C port mode query
  tests/intel/kms_dp_link_training: Log the DP link inventory in the
    fixture
  tests/intel/kms_dp_link_training: Group the outputs into links
  tests/intel/kms_dp_link_training: Add per connector mode subtests
  lib/igt_dp: Add DPCD read helpers
  lib/igt_dp: Add link status predicates for both channel codings
  tests/intel/kms_dp_link_training: Verify the trained link from the
    sink side

 lib/i915/i915_dp.c                 | 192 ++++++++
 lib/i915/i915_dp.h                 |  41 ++
 lib/igt_dp.c                       | 211 ++++++++
 lib/igt_dp.h                       |  13 +
 tests/intel/kms_dp_link_training.c | 767 +++++++++++++++++++++++++----
 5 files changed, 1123 insertions(+), 101 deletions(-)

-- 
2.25.1

