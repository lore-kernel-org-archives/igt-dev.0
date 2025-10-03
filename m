Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81112CAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 11:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C7A10E11A;
	Fri,  3 Oct 2025 11:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbbRzGsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B8610E11A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759491111; x=1791027111;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+cyFknZRNGfUBFdS6YXE3B+N9X+RC7mn0u8Bn+gv3zs=;
 b=PbbRzGsCj7WjPZjvG5e+XZp+Gxta1dkHakBO8uUx8qds/GcX13+X2X4k
 8sVTM6r1Lw0SM3ZmgPBWBC4oe2zX6x4qvKsBD8jJxGHZxjllt/uWhaE6b
 iTfFITh6XMnomJWDGkHKdkyqBdIdYZeCvYSzVOB9aWEMSsXerbUbgX05S
 1jTrfItKkB8E7a7GMF6Nuq+jgB06oBbFsH6d2pLlRiYRk+CJFyXeK4UKA
 IHuzLuuBvtzs60KlnkO3lUCGUHzAWnsjSIjV222/NU5H/RjZEb4bdBWKM
 EZ9FeLhIs+cdhIwZdpIIe1/f+RSaIWJCyZZ6NU+wKfOgRPXOdJHfG6OGA g==;
X-CSE-ConnectionGUID: SgUvuOFlRgyddu2jZfjkLg==
X-CSE-MsgGUID: QoWWkbMTQN+uwg29YabjFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61874912"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="61874912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:31:51 -0700
X-CSE-ConnectionGUID: B2EDOn01Qnu9lhJAAFCHGA==
X-CSE-MsgGUID: Lt9Civ2vRw+nEt27ROij7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183677153"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa005.fm.intel.com with ESMTP; 03 Oct 2025 04:31:50 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v6 0/3] Multi-CCS support in IGT
Date: Fri,  3 Oct 2025 11:31:46 +0000
Message-ID: <20251003113149.262620-1-nishit.sharma@intel.com>
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


Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Add loop_duration_2s subtest
  tests/intel/xe_compute: Add eu-busy-10s test

 lib/intel_compute.c      |  26 ++-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 334 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 4 files changed, 361 insertions(+), 2 deletions(-)

-- 
2.43.0

