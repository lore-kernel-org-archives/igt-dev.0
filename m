Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3851BCCF9FE
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 03:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A2910E0C5;
	Mon,  3 Nov 2025 03:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkkUI9lx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2563310E0C5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 03:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762141536; x=1793677536;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6l+UfI/3kDm9Ev5lPyoSIcpApzhqqZ51LKHtIQ9eoWY=;
 b=ZkkUI9lxDASJ8OCvixjiR5xUUPAnuhfWBfgTuWVaBmdSf8Cla+DIRYji
 L4e0lJEooI6YOE0tQmAttKI5NeMftKkIizR3zkyBi4o5B0YavBLotm6DE
 l4+ncmIprUjRGz/JO1NYTZIBOno6KEkVCuRx6cWHdzXQogQsp/ItXkW8f
 GLYL+KpeuhbvB/eG4PrJo7KkqOMdXxiW5cHXzOI6J7Wx3AvyyGmoIvnxU
 DiMDyNmqbJ1mY7moIzcG9CnqYd7U9RDCjErKuqru3FzvwkH6oXkmmz1AR
 diBz2LpyaiRQkan02vnC3KF+RQ1GuYtcYeGXOAcxjoLKLQuYZBQCpFzcQ Q==;
X-CSE-ConnectionGUID: NqZt8TcwS3eFre3vzpilGQ==
X-CSE-MsgGUID: YhrGSHFMSp2edvQKn4hV1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64252195"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64252195"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 19:45:36 -0800
X-CSE-ConnectionGUID: 10OBe/iQRNWZQp6kNyxNMw==
X-CSE-MsgGUID: hv/mW+pkTM2LObusXsqBag==
X-ExtLoop1: 1
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa003.fm.intel.com with ESMTP; 02 Nov 2025 19:45:34 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v8 0/3] Multi-CCS support in IGT
Date: Mon,  3 Nov 2025 03:45:30 +0000
Message-ID: <20251103034533.24895-1-nishit.sharma@intel.com>
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


Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Add loop_duration_2s subtest
  tests/intel/xe_compute: Add eu-busy-10s test

 lib/intel_compute.c      |  26 ++-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 336 ++++++++++++++++++++++++++++++++++++++-
 tests/meson.build        |   1 +
 4 files changed, 363 insertions(+), 2 deletions(-)

-- 
2.43.0

