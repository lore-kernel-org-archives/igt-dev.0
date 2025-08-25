Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59EECA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 11:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4070710E255;
	Mon, 25 Aug 2025 11:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU3Ie4X7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8348B10E23F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756122941; x=1787658941;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TrZUNwh6/xJQAnJKMBQdme6hxNwQFFLL6kEdV0TqBC4=;
 b=HU3Ie4X7ujb+H86VLSH79AIDaWvdX8s5pmlzLxk4emoExLE+1pctpwLK
 si0yDzaM/B44kP7G06EXt5XLABBjUl9kGFdfZY319CnokzJBCq6LQ9VM7
 EsVKxnbJ1e/5DS+3d1pDW8kEeUEGCzQBFGUqJjcfSUn0sOawaSgiRhP5K
 c5OyAauNhiv5N3dCDPuVD/GesL0wkMOHK7y2rDsHxjOn7FEegfICrboGC
 OlHuVF4t9QTZbt6Z9PhqQGGR4jaFSQaft8IvAz6wEYAB+BeoW4r9iWSQc
 FhtHb90TZhv4RdPCfED/AGw+iQAwLBOHEPMAfMyyv+I6aFCHYuQBDw0cs g==;
X-CSE-ConnectionGUID: ykmQjFxBQy+xKl5VVBtskg==
X-CSE-MsgGUID: PFWEHfxwSNWQT7hV45aHoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58392494"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58392494"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:55:41 -0700
X-CSE-ConnectionGUID: 5LQ42s7KQZew1U0FlRFKdg==
X-CSE-MsgGUID: Ip7sYGuwR/S9ATMub1tcpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168887852"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by orviesa009.jf.intel.com with ESMTP; 25 Aug 2025 04:55:40 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH 0/3] Multi-CCS support in IGT
Date: Mon, 25 Aug 2025 11:55:35 +0000
Message-ID: <20250825115538.321253-1-nishit.sharma@intel.com>
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

Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Added loop_duration_2s subtest
  tests/intel/xe_compute: Added eu-busy-10s test

 lib/intel_compute.c       |  25 +++-
 lib/intel_compute.h       |   2 +
 tests/intel/igt_eu_perf.h | 255 +++++++++++++++++++++++++++++++++
 tests/intel/xe_compute.c  | 292 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 574 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/igt_eu_perf.h

-- 
2.43.0

