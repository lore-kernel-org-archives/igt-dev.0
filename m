Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7628CCCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 09:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A05810E6EC;
	Wed,  5 Nov 2025 09:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSeEPjP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9B110E6E7
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762335303; x=1793871303;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=moy8yFY3WqkwecdUqMsNCRTwerNG9hBOW3C1StydnmA=;
 b=hSeEPjP6epar9pz+7brBB6mCaNU1sWYNVbdLOfB9uNtXFQetlEpt0hAa
 B3n53Ef49hv0Jeh1O/oF/nPEKTwUDKHUITocB+tdTr69Qpuv28QT5wCZa
 axW8E6Ru1MK29OgDe58A5VZlNezy/+E1A9fe6SFLl+g6E/q/AJv9eiNlf
 ZINVumR0kSF+I2IPddqLjwF01I5es2XYIP9mCD5PCm3X3kNKrGT5/sfVG
 cru1TqTv4GpozM/H5UkvJjktxWIdYfGExGtK8Y1iYJSPawJLVSbJ0AF51
 8yhHKOFNHxx8lbSkMmn8fAGb7IyPUsskoYT3bUT/8i2afS7UttnWlYmkM Q==;
X-CSE-ConnectionGUID: btzOoTENTg65M10a5fBXnQ==
X-CSE-MsgGUID: sGiDW02hRd+g4zM9Con3mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64481753"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="64481753"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 01:35:02 -0800
X-CSE-ConnectionGUID: JwuKSp3lQmOarxmA5+PHGA==
X-CSE-MsgGUID: AYL9G3ueRK2gVl5bEZqwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187860742"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2025 01:35:00 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v11 0/3] Multi-CCS support in IGT
Date: Wed,  5 Nov 2025 09:34:56 +0000
Message-ID: <20251105093459.55946-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Revision 1:
Added loop_kernel_duration in available pipelines. loop_kernel_duration
holds sleep duration and during sleep GPU will be workng.
Patch-1/3: loop_kernel_duration addition in available pipelines in
lib/intel_compute.c. igt_skip is called in pipeline which doesn't support
loop_kernel shader.
Patch-2/3: Added loop-duration-2s subtest in tests/intel/xe_compute to
test if GPU is executing shader when sleep is called. This is verfied
using gputop in another terminal. This also tests whether the test
executed successfully in >= 2seconds of duration set
Patch-3/3: Added eu-busy-10s test which creates multi threads depending
on num_slices available and schedules workload on all ccs instances
available. This also prints engine utlization in percentage while
workload is executing.

v2:
- Addressed review comments from Zbyshek on description in Patch-1.
- Added execution time check in Patch-2 regarding single iteration of
  scheduling and executing workload on single instance of CCS engine.

v3:
- Added missing code section in Patch-1.
- Modified LOOP_DURATIOn macro to LOOP_DURATION_2s to avoid confusion.
- Used LOOP_DURATION_2s in place of LOOP_DURATION and adjusted sleep
  durations.

v4:
- Test will skip if sriov is enabled and sriov_numfs > 0.
- Test will continue runing if sriov_numvfs = 0

v5:
- Incorporated review comments (Zbigniew)

v6:
- Simplified logic to capture EU busyness
- Removed header which had pmu counter and engine instance logic
- Moved pthread_data structure to xe_compute file which is used during
  thread creation

v7:
- collective counters are set per compute engine available in t->eci
- fixed few nits

v8:
- Incorporated review comments (Zbigniew)
- After workload execution set back ccs_mode to default value

v9:
- Moved get_gt_mask() in igt_fixture to avoid build failure

v10:
- Moved sriov enabled check in igt_fixture to skip test if sriov is
  enabled without initilializing or creation of threads.
- Moved check for loop_kernel support in pipeline in igt_fixture

v11:
- Moved sriov enabled check in subtests which is setting ccs_mode value
- loop_kernel support check moved in subtests which are using
  loop_kernel

v12:
- Added sriov enable check in subtest eu-busy-10s

v13:
- Incorporated review comments (Zbyshek)


Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Add loop_duration_2s subtest
  tests/intel/xe_compute: Add eu-busy-10s test for EU utilization
    measurement

 lib/intel_compute.c      |  26 ++-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 349 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 4 files changed, 374 insertions(+), 4 deletions(-)

-- 
2.43.0

