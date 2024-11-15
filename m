Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1A0D68BCE
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 17:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241D110E8AD;
	Fri, 15 Nov 2024 17:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrAMItv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C78310E115
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731690234; x=1763226234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q1URStbRD5AffvCDrbA5KGfiPCl+Hg53RJCEi8xKX7k=;
 b=VrAMItv6aW/Bn7mfJwxMxbGYUXwt6uudFUhvuRQECM3bwUHJW5m0AhkB
 vn8sAaZyP7dQFHXVqqu1RY7bnMC9+STBgBEZF3bFyaIRDW8wOpr8znggT
 xAFPyW4uFc0GjzNEMhVf7ZRdXZJJ2oCSI74hsr8295Jn0H7qBMBSK5qui
 1D287g+NNiKKaf3c1vde6k3R3Vo3VPfjMi6FR1RHsoBSVb5/odCjU64+A
 g22PoLnfMkm8MQgA7dJiIOReQUn3/IKGvSK/zg6yEslOt5xVAJs70tJZk
 oOH0e9fm3LWaKJ+99RBqscsHZ9URDcih/E6roFC7ve/69Du3FrOlrwmQm g==;
X-CSE-ConnectionGUID: WXsllooyRem1gjnhGgZgJA==
X-CSE-MsgGUID: CvC6lNoiSiihiaTwLRMudQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="57119395"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="57119395"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 09:03:53 -0800
X-CSE-ConnectionGUID: t+oxowpcTwienbm4MQW4xg==
X-CSE-MsgGUID: OxgvUnDlRW+ATn42e1j27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88497732"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 09:03:53 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v6 0/3] test/intel/xe_sysfs: Restore sysfs params correctly
Date: Fri, 15 Nov 2024 17:03:49 +0000
Message-ID: <20241115170352.102039-1-jonathan.cavitt@intel.com>
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

The xe_sysfs_timeslice_duration and xe_sysfs_preempt_timeout tests do
not correctly restore modified sysfs params on test failure.
Additionally, xe_sysfs_timeslice_duration modifies but does not restore
preempt_timeout_us.  Repair these issues.

v3: Fix several formatting issues (Kamil)

v4: Do not compare possibly unassigned variable (Kamil)
    Whitespace and commit name fixes (Kamil)

v5: Add new helper funciton, igt_sysfs_get_next_engine
    Fix igt_sysfs_scanf/printf usage in tests (Kamil)

v6: Replace helper function igt_sysfs_get_next_engine with new helper
    functions that return and destroy engine lists (Kamil)

Jonathan Cavitt (3):
  lib/igt_sysfs: Add engine list helpers
  tests/intel/xe_sysfs*: Restore values on test failure
  tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout

 lib/igt_sysfs.c                           | 54 +++++++++++++++++
 lib/igt_sysfs.h                           |  3 +
 tests/intel/xe_sysfs_preempt_timeout.c    | 58 +++++++++++++++---
 tests/intel/xe_sysfs_timeslice_duration.c | 74 ++++++++++++++++++++---
 4 files changed, 169 insertions(+), 20 deletions(-)

-- 
2.43.0

