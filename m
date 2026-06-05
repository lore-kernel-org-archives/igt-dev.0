Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04BDCD6E7D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8243311A911;
	Fri,  5 Jun 2026 14:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MC4S8RvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B799911A90F
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670420; x=1812206420;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CdaMge2W1VIUuih2fNPb6QiLKr3jNQBZ84dT3ke9CqA=;
 b=MC4S8RvBZei/MxswjmyjnzNRp9iMf2VDWam/sL5mzeOgb04PAu++FNuk
 SQ+BnhCE+UzYRN7g+uTgTfre0eKPoYpvMT3x8ptXezj0dd0ENdulHi8x+
 nxFKOXV3k9CP4S46DhhIeu9iOx48HaHdnLpwW+vzLza6WOhv7H6m3RkYO
 z1lBfwkEfYvJZE/v3oludUQdzMx/rsxyIlRjg6hUDkOHX5qZPKnCXtjZl
 S/+IJycexCm2AoOkqby6illYPb/Mn45zoEvU9bqUwsuVA4Ph5q/ejtx+J
 mnfkxt2xa/RrHmi/oSAJEL9PavORE5nswVnP0q6vmUJbM0PKj4/+7ZLmX A==;
X-CSE-ConnectionGUID: dmS8oPU3QOuObRzHEvALcg==
X-CSE-MsgGUID: 3yu+y4H8SzC4RdVRzVrpJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483808"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483808"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:39:55 -0700
X-CSE-ConnectionGUID: cDG5d0+wQNu0AG/VkGGLTw==
X-CSE-MsgGUID: v0ROZgk1SEqdsFaNTAMx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384372"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:39:54 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 0/9] extend GT reset stress coverage
Date: Fri,  5 Jun 2026 14:39:44 +0000
Message-ID: <20260605143953.1122688-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This series expands GT reset stress testing to cover additional
reset/submission race windows using the existing flag-driven stress
harness.

Nishit Sharma (9):
  tests/intel/xe_exec_reset: Add concurrent GT reset submit stress test
  tests/intel/xe_exec_reset: add sync concurrent reset submit subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-memory-pressure subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-bo-invalidation subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-rapid-fire subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-destroy-vm-context
    subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-mixed-engine-usage
    subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-pm-transition subtest
  tests/intel/xe_exec_reset: add gt-stress-reset-engine-hang subtest

 tests/intel/xe_exec_reset.c | 216 ++++++++++++++++++++++++++++++++++--
 1 file changed, 207 insertions(+), 9 deletions(-)

-- 
2.43.0

