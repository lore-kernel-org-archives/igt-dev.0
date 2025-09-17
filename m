Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7698BCA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 09:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C30110E644;
	Wed, 17 Sep 2025 09:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmsH89fu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA3E10E644
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758101657; x=1789637657;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CNwjmJe0kwjmZHP8YqEhXkCQIGOyRMffaHN7L9nb9wE=;
 b=bmsH89fuKloTpTfURO/nSa1BBrykknelF1mJzOJ78LXHECR8U1rX/QEJ
 r3lLjw7HZqJAyTbmNQhlSP6fuVuK7z1MyjRalkBhCJ0IMBYSofDRkXhoc
 K386XUNGWJZmoLetHYeIDYbwi6XFiJJ1lCnMlmUpRdhM+TPl5BB1LiDvt
 N5d1HSFKi3oM3swdFU9OlqqdalE0wRbvsqzMbNw//PT0WV5Md60oMj1+B
 BnKnGBhB/uEv7/PAyJQ4aATt9D2T0zGtRw/0+M6nTbwLcIyiA1n5txVeC
 nVHvnGSCfkpfxBwE5Rtj0VeW+WxPKx7s2HQfc06mzhTPbBTyVvKfNgO7i w==;
X-CSE-ConnectionGUID: J4HV7HSGSc+IgxK11eUaxw==
X-CSE-MsgGUID: P4gmK4P0QR6Ff0S/NdZUTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59621931"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="59621931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 02:34:17 -0700
X-CSE-ConnectionGUID: p4LvxoeOTnuxb5ovfeKtIw==
X-CSE-MsgGUID: kXgShkk8SWeFh6D/PdAP/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="175600372"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2025 02:34:16 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v4 0/3] Multi-CCS support in IGT
Date: Wed, 17 Sep 2025 09:34:11 +0000
Message-ID: <20250917093414.36124-1-nishit.sharma@intel.com>
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

Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Add loop_duration_2s subtest
  tests/intel/xe_compute: Add eu-busy-10s test

 lib/intel_compute.c      |  25 +++-
 lib/intel_compute.h      |   2 +
 tests/intel/xe_compute.c | 304 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 4 files changed, 331 insertions(+), 1 deletion(-)

-- 
2.43.0

