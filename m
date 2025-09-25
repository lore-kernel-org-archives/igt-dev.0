Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF07CAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 04:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5DC10E83B;
	Thu, 25 Sep 2025 04:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPjM00Bs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548BB10E83B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 04:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758775416; x=1790311416;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=og0yj2vkPA12qfSPh3b4dXWcGIH7zq6679oo4G7dEYU=;
 b=SPjM00BstbSD4G2FKeGTdOP504h+/FAOBAn3AcUgMw9Iyne+B464HuRY
 /N1HpovcFWM7hODqmpNgFbh60gi3Ua82+9s/sNrb6bLofM0M2Jq6gO+Y0
 5UUQXIAKurOxbxVkAZIzfRA9x3y2kEUj61Em339+YMWuxuPsmVbx0SNg7
 Lb7KV5aKqKxcszA/vTG9474TCvQj9Y8oEfb9vFSZ6UmGjGdxq1PCWMoe3
 LDpjEMmS25GwWnkCCOTN6jABJSQOafIHFlKfA6Vyv14Fni7O85x18gTW3
 QblgWcjVnB/k6zkIFnE6xq3GJAweZk21rYm5IxSUua8Qpj5nOalPozlcM Q==;
X-CSE-ConnectionGUID: GH3+H4iTR0uOvX1llvjnhQ==
X-CSE-MsgGUID: I7u6CgZfRTytkjLbSmN6Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60297799"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="60297799"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:43:36 -0700
X-CSE-ConnectionGUID: mjaxLZftRuSSouEKLCL3AA==
X-CSE-MsgGUID: /xyMSaikRFKAaFLrXOvuVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176798549"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by orviesa009.jf.intel.com with ESMTP; 24 Sep 2025 21:43:34 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v5 0/3] Multi-CCS support in IGT
Date: Thu, 25 Sep 2025 04:43:30 +0000
Message-ID: <20250925044333.176939-1-nishit.sharma@intel.com>
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

Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Add loop_duration_2s subtest
  tests/intel/xe_compute: Add eu-busy-10s test

 lib/intel_compute.c      |  26 +++-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 299 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 4 files changed, 327 insertions(+), 1 deletion(-)

-- 
2.43.0

