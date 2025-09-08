Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01F5CAC581
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 14:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6B110E544;
	Mon,  8 Sep 2025 14:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHGBbqp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8848C10E53E
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757342796; x=1788878796;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g4k9ZhgJg78cITMjiFzVf803SsdAXKI7HE2YiANb/cU=;
 b=UHGBbqp4vfVW8AYuJ+52kOko+f33ge8lv7K9j7duL2zFUgPJG10XIjK4
 dIkDAFVao/hbNIOSYBCCy0xuzUzzQ7Wfn5Nn0s0MDVuaiIISOsFxqqxKg
 yQsx346klwidbA0rg7zBB7ZcJYKFMiNHyAzbXJ2LAdZ6rJnd8Bh4nlV/s
 QZv9xahF0vEcHGrlL426itXT7HB+6YKI6rNXU3foaY2ZwERCkk+C6F0Ey
 AoZYe3F4LS4mNvkqHjHKYay7zxN3gsCvN8aPZ2ivKP7yFgOpBa9/C2aGd
 i/ix3/hJnG+SYV4SCVSenLVZRlyOD27ecuymJt8pVKZkGd0vejECHwCy0 w==;
X-CSE-ConnectionGUID: mXb/a0BhSkGaaESPk0GL8g==
X-CSE-MsgGUID: JJiladWNTMi0/wkXb9eYfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59459867"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59459867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:46:32 -0700
X-CSE-ConnectionGUID: NCeXbmcTQEq37DhPYuA5kw==
X-CSE-MsgGUID: F7xQEVCuTkWbf2ufVWL4ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="176864656"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by orviesa003.jf.intel.com with ESMTP; 08 Sep 2025 07:46:31 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v3 0/3] Multi-CCS support in IGT
Date: Mon,  8 Sep 2025 14:46:26 +0000
Message-ID: <20250908144629.938071-1-nishit.sharma@intel.com>
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

Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Add loop_duration_2s subtest
  tests/intel/xe_compute: Added eu-busy-10s test

 lib/intel_compute.c       |  25 +++-
 lib/intel_compute.h       |   2 +
 tests/intel/igt_eu_perf.h | 255 +++++++++++++++++++++++++++++++++
 tests/intel/xe_compute.c  | 293 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 575 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/igt_eu_perf.h

-- 
2.43.0

