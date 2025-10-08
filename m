Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B13CCAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B00210E8DB;
	Wed,  8 Oct 2025 21:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIm/6ry6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2D910E8D9
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759957360; x=1791493360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0d1dAlHGEHXuRs5ZgpdeBYjgRCurthxibxqHZLjZHYY=;
 b=hIm/6ry6GP2RB4UNWaTjcoVswLmH1d4wj3H8dYQcUzxKay4iUBHt6IxQ
 Bti0QbXTtZ2aUC/HoIabsDUf0mEkZQlL72xzD92POO9gmYwkJhw7X5d55
 Pk3n/gu3ohhsMw/dfYNsTBEHUXAHNxosGT4wS/xy2xbyRfwLu4aqozmzC
 G6GEZVDUTE9vwhWJjx9kx8n20zpGTgXDYbbhAzLn//YrlsCEKTdBzaGph
 bn9D+0I4oKzDCtnsG5Xm4AN+Nd+ZVHjLN408J48Nl35LsdmPVNKX4+oZt
 4fBCC5U0f2AbIFWqa/SqAVwxprNsfHiSacwnBYP34dwrGoDS8D5fFbBJn g==;
X-CSE-ConnectionGUID: T+SNKaKJTf2aVMTft9+y1Q==
X-CSE-MsgGUID: GM4BUlekRtC+yl5pQM67IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61867748"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61867748"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:02:40 -0700
X-CSE-ConnectionGUID: 0BQb+M//SiS/3pqlTsMPHA==
X-CSE-MsgGUID: pLrbiVGIT+K1Dgt4WabBVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184920003"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2025 14:02:39 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v3 0/6] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Wed,  8 Oct 2025 21:02:30 +0000
Message-ID: <20251008210236.396859-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007050554.340485-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
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

This patch series introduces runtime device information query APIs for xe devices,
replacing static device ID lookups with dynamic GMD_ID-based queries.

Background:
-----------
Currently, IGT relies on static device ID tables to determine device capabilities
like graphics generation and version. For xe devices, this approach has limitations:

1. Different device instances may have different graphics_rel (minor version) values
2. Adding new device IDs requires updating hardcoded tables
3. Graphics version information from GMD_ID is more accurate than static lookups

Solution:
---------
This series introduces new runtime query APIs:
- intel_query_gen(fd): Get graphics generation from GMD_ID
- intel_query_graphics_ver(fd): Get combined graphics version  
- intel_query_device_info(fd): Get complete device info structure

These APIs enable accurate device version detection by querying GMD_ID at runtime
rather than relying on static device ID matching.

Implementation approach:
------------------------
The series follows a layered approach to ensure clean integration:

1. Add new API infrastructure (lib/intel_chipset, lib/xe/xe_query)
2. Update xe-specific library code to use new APIs  
3. Update core library functions to use new APIs
4. Update test cases to use new APIs
5. Update tools to use new APIs
6. Remove hardcoded graphics_rel values as cleanup

Benefits:
---------
- Accurate graphics version detection including minor versions
- Reduced maintenance burden for new device additions
- Better compatibility with varying device configurations
- Consistent API across xe and i915 devices (fallback supported)

Testing:
--------
Tested on xe devices with GMD_ID support. Fallback to traditional devid-based
lookup verified for i915 devices. All existing tests pass with no functional
changes to test behavior. 

v2: The caching logic is implemented in intel_query_device_info(), while the
    other two functions directly call it to retrieve information.
  - Fixed error in xe_pat.c

Xin Wang (6):
  lib: Add runtime device info query APIs for xe devices
  lib/xe: Use new APIs for xe device info queries
  lib: Use new APIs for xe device info queries
  tests/intel: Use new APIs for xe device info queries
  tools: Use new APIs for xe device info queries
  lib/intel_device_info: Remove hardcoded .graphics_rel values

 lib/gpgpu_shader.c                     |  2 +-
 lib/gpu_cmds.c                         | 22 ++++-----
 lib/igt_draw.c                         |  6 +--
 lib/igt_gt.c                           | 10 ++--
 lib/igt_store.c                        |  2 +-
 lib/intel_blt.c                        | 21 ++++-----
 lib/intel_blt.h                        |  2 +-
 lib/intel_bufops.c                     | 13 +++---
 lib/intel_chipset.c                    | 63 ++++++++++++++++++++++++++
 lib/intel_chipset.h                    |  3 ++
 lib/intel_common.c                     |  8 ++--
 lib/intel_compute.c                    |  7 ++-
 lib/intel_device_info.c                |  3 --
 lib/intel_mocs.c                       | 15 +++---
 lib/intel_pat.c                        | 17 ++++---
 lib/ioctl_wrappers.c                   |  2 +-
 lib/rendercopy_gen9.c                  | 22 ++++-----
 lib/xe/xe_legacy.c                     |  2 +-
 lib/xe/xe_oa.c                         |  4 +-
 lib/xe/xe_query.c                      | 19 ++++++++
 lib/xe/xe_query.h                      |  3 ++
 lib/xe/xe_sriov_provisioning.c         |  4 +-
 tests/intel/api_intel_allocator.c      |  2 +-
 tests/intel/kms_ccs.c                  | 13 ++----
 tests/intel/kms_draw_crc.c             |  2 +-
 tests/intel/kms_fbcon_fbt.c            |  2 +-
 tests/intel/kms_frontbuffer_tracking.c | 12 ++---
 tests/intel/kms_pipe_stress.c          |  4 +-
 tests/intel/xe_ccs.c                   | 24 +++++-----
 tests/intel/xe_copy_basic.c            |  6 +--
 tests/intel/xe_debugfs.c               |  3 +-
 tests/intel/xe_eudebug_online.c        |  8 +---
 tests/intel/xe_exec_store.c            | 17 +++----
 tests/intel/xe_fault_injection.c       |  2 +-
 tests/intel/xe_oa.c                    | 38 +++++++++-------
 tests/intel/xe_pat.c                   | 26 +++++------
 tools/intel_tiling_detect.c            |  3 +-
 tools/xe-perf/meson.build              |  2 +-
 tools/xe-perf/xe_perf_configs.c        |  2 +-
 tools/xe-perf/xe_perf_recorder.c       |  2 +-
 40 files changed, 237 insertions(+), 181 deletions(-)

-- 
2.43.0

