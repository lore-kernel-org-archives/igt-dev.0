Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E106CCA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 15:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E692F10E8A9;
	Thu, 14 Aug 2025 15:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLiB2Uii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC5410E0C5
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755187097; x=1786723097;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YVhEfq+NK8qUxpYJbnA5Ric1NJuqUk5+qyj7zo4Jzfg=;
 b=eLiB2Uii34ICdqIHhE/YS6JrolDX0mmRRY31wwWcZYwd8YRLUWN17Qbq
 EykBsq8KatFpqnjaA56np5UsihQo+ajz8s1F2T/sZq2bMV3ZNaKr9h948
 PGEIUCSOLAxaOuL5ZKKUXXW/16Wot4at2SXFOZ1ZVf+QX3U/7GXcGyjrm
 wxmPgf9c+C52+Xq9mTVDKLGe93HW3OAbA7/ORR2SBhtKKAe27AWsoiIcg
 8bNdCHjA869m7xzDn2z4AuvtUEl2dksA1N39D9KZFxtNZ6ecmwY0dXQjq
 dCiPLGiuSNfPdSah+VJ8jW/fOGgvTg+0q9Lh17MfSyedMSzHjhtt7zgql w==;
X-CSE-ConnectionGUID: 2vnqwcU6TZmHxELwMpbaaA==
X-CSE-MsgGUID: ARdyl/9eRHaitxpt3cuRcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57416443"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57416443"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 08:58:16 -0700
X-CSE-ConnectionGUID: gNIt4S5+SDSVH4yiiqm0+A==
X-CSE-MsgGUID: JNuvOGhxRR2hutH5lZiiWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="167149805"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2025 08:58:15 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH 0/3]
Date: Thu, 14 Aug 2025 15:58:11 +0000
Message-ID: <20250814155814.130545-1-nishit.sharma@intel.com>
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

Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Added loop_duration_2s subtest
  tests/intel/xe_compute: Added eu-busy-10s test

 lib/intel_compute.c       |  25 +++-
 lib/intel_compute.h       |   2 +
 tests/intel/igt_eu_perf.h | 255 ++++++++++++++++++++++++++++++++++
 tests/intel/xe_compute.c  | 280 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 562 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/igt_eu_perf.h

-- 
2.43.0

