Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99B3CCF9FE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 10:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC6010EAFB;
	Fri, 31 Oct 2025 10:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRCGb8ux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F1C10EAFB
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761906808; x=1793442808;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NIjWTYXhBGw4A+ou6rv64ThGB/Vfay0x6O3ubeQD5Uk=;
 b=PRCGb8uxP47hon/fZf4VAKOrqLrGDp0eFiA1mL75xVnmZ6EkC8B0pLJh
 8xEBU1aTpL4nGdYF1X5fpMUY/jQDZYOTkPx5qMBGkRAgdeqNjwrzH0cy/
 0+fYNPQj0GTcqg2oVZ8Rr2Qo+9iDX5INpT1oECYGg94iISwNJfsKo92pE
 PLDA504S6yznppi0kpDtk8vr/eq9X5EGXbxo79XE5yd5XbiFR7oiZRaC+
 j37/vLnxbQgS3GdOC3vHqHDlZMXIoMJioCeD/dITybo7DhSy3DrCXaCC7
 hf0fRL5sXVOT0+4qGqrsxGo6s0kF5idiqeO0zAMYSjIxGp2QOf+Y2qAy/ w==;
X-CSE-ConnectionGUID: hV7B82xHSlS5W02s78HWgQ==
X-CSE-MsgGUID: QXF2rtlYSEewZFsN3raiYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64106470"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64106470"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:33:26 -0700
X-CSE-ConnectionGUID: CU/Ni9RDQIKvNmYm0OgN/A==
X-CSE-MsgGUID: lhMgbBeAS1yqxeEPjvQynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185476816"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by orviesa010.jf.intel.com with ESMTP; 31 Oct 2025 03:33:25 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 0/3] Multi-CCS support in IGT
Date: Fri, 31 Oct 2025 10:33:20 +0000
Message-ID: <20251031103323.11158-1-nishit.sharma@intel.com>
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

Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Add loop_duration_2s subtest
  tests/intel/xe_compute: Add eu-busy-10s test

 lib/intel_compute.c      |  26 ++-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 335 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 4 files changed, 362 insertions(+), 2 deletions(-)

-- 
2.43.0

