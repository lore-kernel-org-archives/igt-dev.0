Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF750D41D74
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 08:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857B810E0A9;
	Mon, 15 Dec 2025 08:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFGwfeIM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4466C10E0A9
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765788878; x=1797324878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=04KA0N4vW5dz4AuzeJCg3dL2rZZYBwynPFbf9nT3T7w=;
 b=lFGwfeIMZNC0LU3erYGhGS/cwmbnSgjoeAGrpAYO6QlH/dm8PEdO9wj8
 rl+5V9ftCC5CO6SQbM3DD/ijjluphNwAxCRnKlXJmfwZYzZF2MetQZVaI
 xzcyff5xkQ0DJ0L5YvYk6OYXrptDiuJxuImqC+6yw1J1ykFWq+pBxyELO
 fPP8X4WJ5VoxNW6rHEjzLNVcb1GoX1tEiHobusSS66QK337+1ACFx/9J5
 g1J2+IYE73tsg8eRxAfFjfcJGqznM7ts8Sm7/uSnSIGJZibOuQMcJVTFB
 KPCVXrTSQjzTYxwE0GtBbEfbaqt9ztk6QExdf5zz6MYYCspeR9F7SItRQ w==;
X-CSE-ConnectionGUID: Mz2DYUjARVWKV+lIw+53yQ==
X-CSE-MsgGUID: plwTyaUBStu4JGVr16A/6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67437669"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67437669"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:54:37 -0800
X-CSE-ConnectionGUID: 8Pdn3kMSTkKhLoMLodZlAQ==
X-CSE-MsgGUID: ivKVbtZBTr6Z1YoHkwW5Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="196746869"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 00:54:36 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, santhosh.reddy.guddati@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/intel/kms_joiner: Add function for pretest
 checks
Date: Mon, 15 Dec 2025 14:24:58 +0530
Message-ID: <20251215085500.2900416-1-karthik.b.s@intel.com>
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

Revert the patch which was added to cleanup the igt_require checks by
adding them to subtest groups as this can lead to spurious skips and
corresponding noise in logs.

After the revert, add the clean up patch which moves the igt_require
checks in invidual subtests to a function which is called from all the
subtests to avoid code duplication.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (2):
  Revert "tests/intel/kms_joiner: Cleanup igt_require checks"
  tests/intel/kms_joiner: Add function for pretest checks

 tests/intel/kms_joiner.c        | 238 +++++++++++++++++---------------
 tests/intel/kms_joiner_helper.h |   5 +
 2 files changed, 130 insertions(+), 113 deletions(-)

-- 
2.43.0

