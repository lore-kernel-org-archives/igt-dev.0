Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA86ECCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 15:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657E210EAF6;
	Fri,  7 Nov 2025 15:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvMK4zIl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C963B10EAF6
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 15:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762528521; x=1794064521;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=izcy90qAQJIY2m5T+6d8p/3v477dMY38hEgbNsww4so=;
 b=mvMK4zIlZZuC4dtlvwqFfb2NEyaLfeS+tvEKiB3iC4f4k8WgtOYcIana
 hT0sICrz8GcBXXxImdu+AarsQjCjl1yRa5tfS/+7f8iN64l/+apeiVcsu
 2nZs7qfKlt0+lxMciJkhVzGx5XHPuWJK0P99kmq6jsMGR/S/AD6fr+QN+
 UtQ9CxdweW0IMumLMaxL8Vqpfg7hg2w1PP/+2btLvt68zLeKYhCXyjC2s
 +oDrHkA1WicMZ1g/hcVPsSKFwhRZbA5q1j9wS4yRrY9AgHW/9kv0WtRgT
 hbYAjevYBXdDsNJO1al/0RnIkwRMfakxjI2TLCYom6+vdFDZirc8AUkmJ g==;
X-CSE-ConnectionGUID: ZP5L/iwTR9iNtf+Ijm9O9A==
X-CSE-MsgGUID: tTiLfKN/QvGFbrwukMJpMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64773442"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64773442"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 07:15:21 -0800
X-CSE-ConnectionGUID: R/hq1fu9RbiJebBhZCPEmw==
X-CSE-MsgGUID: iR18992ATQuSjovOUAiiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193087140"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2025 07:15:20 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v14 0/3] Multi-CCS support in IGT 
Date: Fri,  7 Nov 2025 15:15:16 +0000
Message-ID: <20251107151519.66692-1-nishit.sharma@intel.com>
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

v14:
- Incorporated review comments (Zbyshek)
- Incorporated review comments (Kamil)

v15:
- Incorporated review comments (Zbyshek)

v16:
- Used ARRAY_SIZE instead sizeof() which was giving wrong value

Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Add loop_duration_2s subtest
  tests/intel/xe_compute: Add eu-busy-10s test for EU utilization
    measurement

 lib/intel_compute.c      |  26 ++-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 352 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 4 files changed, 377 insertions(+), 4 deletions(-)

-- 
2.43.0

