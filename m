Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490E2606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JRA7a7vl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6951120EF;
	Thu, 19 Nov 2026 00:51:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDC61120EF
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 00:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795049416; x=1826585416;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H4C/8doECwF5TF+Z/x3iy8Ne68SafKOQPQSh25NqAsE=;
 b=JRA7a7vlPyTasdLpFoPqrXGa+xsduBWzoByXGplRSZNjGZgPp+0GJ+sv
 MKYV5PBpEOjk9rCiQXyhnsfbsZYLeb5hGfpQSWUqmaF3ZqKtloDb+YWpO
 kuhhQ/MNw4gOoC/mXMXHdizdhOekwM8Fx95njhFAepCjuQ2VK4t3jeURj
 uTzVdI3uqtto0g2IN6knjFiKQU2iTzjF37g3jE7iOEh9z+DjetdY6Y1Pe
 TxsHVelxiEXdqk3VmK+TYJ5cnvXDpQ/Hhira7HRTpwbDXgQfzKAeo1mbD
 MZbA2rLzdzrS8rEGj7Zpftx5YlElh84kwbPONUarK85lA2DEmbxMNPp2z w==;
X-CSE-ConnectionGUID: 4KWEqoj6QSqKZ/0O78s6OA==
X-CSE-MsgGUID: CxTs0yRbQeCGDCHklx+u7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3771126"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3771126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:50:16 -0800
X-CSE-ConnectionGUID: 6BfJUp/QSDyRMa0FKYU9pg==
X-CSE-MsgGUID: jYUiQ3C+ThWb1QySUmbr0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10679598"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 16:50:16 -0800
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, shuicheng.lin@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 0/3] tests/intel/xe_pm_residency: Wait for a stable C6 before
 measuring residency
Date: Wed, 18 Nov 2026 16:50:06 -0800
Message-ID: <20261119005009.364632-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Several CI runs of xe_pm_residency@idle-residency@gt0 fail with only
~82% residency (allowed: 90%).

The test waits only once for xe_gt_is_in_c6() and then starts the 3s
measurement. That single sample can succeed on a transient visit to C6
while the GT is still being woken up by deferred work of the previous
test. Some asynchronous teardown (GuC deregistration, LRC/BO free, 
GGTT node removal and the resulting TLB invalidations on both GTs) 
may make GT out of C6 for ~0.8-1.4s after the test exits.

This series makes the C6 residency tests wait until the GT is really
idle before measuring, as a robustness fix independent of the order in
which tests are scheduled:

  1. add xe_gt_wait_c6_stable(): poll idle_status/idle_residency_ms every
     10ms and require the GT to stay in gt-c6 for a minimum window
     (with the residency counter advancing >= 95% of the window), with
     a timeout;
  2. use it in xe_pm_residency (idle-residency, gt-c6-freeze, and once
     before the C6 power sample in toggle-gt-c6);
  3. use it in xe_pmu@gt-c6-idle. 

The waits use 500ms / 5s. idle-residency-on-exec is intentionally not
changed because a workload is running while it measures. A GT that never
reaches stable C6 (e.g. forcewake held) still fails the test, after the
timeout.

Testing on a BMG-G21 DUT, running xe_pat@pat-index-auto followed
immediately by xe_pm_residency@idle-residency@gt0, 3 runs each:

  upstream master IGT:       3/3 fail, residency 67.8-78.5%
  this series:               3/3 pass, residency ~100%, the stable wait
                             took 1.37-1.68s
  this series + intel_bb fix: 3/3 pass, wait ~0.5s (minimum window)

Zongyao Bai (3):
  lib/xe/xe_gt: Add xe_gt_wait_c6_stable()
  tests/intel/xe_pm_residency: Wait for stable C6 before measuring
  tests/intel/xe_pmu: Wait for stable C6 in gt-c6-idle

 lib/xe/xe_gt.c                | 90 +++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h                |  2 +
 tests/intel/xe_pm_residency.c | 21 ++++++--
 tests/intel/xe_pmu.c          |  4 +-
 4 files changed, 112 insertions(+), 5 deletions(-)

-- 
2.43.0

