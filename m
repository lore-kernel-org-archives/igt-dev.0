Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF85CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 07:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34B310E408;
	Mon, 18 Aug 2025 07:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq6TYHpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52DC10E405
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755503690; x=1787039690;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rJ3ALK20MdGYauw9BbCpkaxdmm9/SXuJX4QxAv8i/RE=;
 b=eq6TYHpzSZOi/X9jqznyic8e78Vm8wg2aTNz0n+J5oKToKEYSip9wqTy
 7LvoPrQuu8fjGwPzlGucsa3DN58v6/MAUeHCr1owgVicdU5LeqqpKnozM
 God2zBsn4NltOIJGr5D3GNQPoATswuvF//2UU5lv+ivRl0CJ+obhC01Pd
 FPNyljJPh5zLpPLHKrWCiY4odUDDI9rRSSgsrIth4ezbaUcCJWx4k/VK5
 P7odQkFnzrempcgUcDHihbpZEsO3oHD+HEKM+3KlmhUh0ZUfL8nw68FrF
 aEl8duZT50zv+SQeCyV5W14cUfMMGBenHsVlcO3M+MnE8kGg3yG1yvykc w==;
X-CSE-ConnectionGUID: jCUAME14SkePG+VlA/UzIQ==
X-CSE-MsgGUID: c4JsDT9QSPCC5CXNGUNr5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69170843"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69170843"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:54:49 -0700
X-CSE-ConnectionGUID: TN0KNNv0Thum/fAcPUCPyw==
X-CSE-MsgGUID: N+1ACJXOSHyvfOAipfwVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167010982"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 00:54:48 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/3]
Date: Mon, 18 Aug 2025 07:54:43 +0000
Message-ID: <20250818075447.15230-1-nishit.sharma@intel.com>
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

Nishit Sharma (3):
  lib/intel_compute: loop_kernel_duration in Pipeline
  tests/intel/xe_compute: Added loop_duration_2s subtest
  tests/intel/xe_compute: Added eu-busy-10s test

 lib/intel_compute.c       |  25 +++-
 lib/intel_compute.h       |   2 +
 tests/intel/igt_eu_perf.h | 255 ++++++++++++++++++++++++++++++++++
 tests/intel/xe_compute.c  | 281 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 5 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/igt_eu_perf.h

-- 
2.43.0

