Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F18FCCA470
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 23:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F4B10E1A6;
	Tue,  7 Oct 2025 23:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDIafXtf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C843710E70E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 23:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759879588; x=1791415588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/e7tZmemHuv+N7dxKNJNTbFk+CPMJwdEeOSJ9YjLMKM=;
 b=gDIafXtfcvi/gwoQG5rwDJ6T9BYXIfFiRTAfLkaiV8zWBVDN9NiJAlaj
 XVln/fXhGgqET7/Du7FmB6Z20P4pAg0Ku03on/clma+GqYyIUkjfYmixH
 XrRLuiD0kSVr404F4Rh5JfQ7mFJjP/5SR47ojmtszAyaQdw+UIQxNtYHF
 MdIIgMdWfQUlgta+6A2OV/7lQuReElHRAAzi7/s5v+GNFU+GLBJKoi9y1
 IDHSZyyLojsE+t7hX2XTKrs2o3ayO+oa0UDnvz7OLEjVzaLibg9A5tSM9
 KiQnnCGkt7Rigcd1+Fah4HcnoOvaodOGwbGlHvP4SX+95+qjCCywx9pvN g==;
X-CSE-ConnectionGUID: YwtMk/OlQXiHZVIEcT9/9g==
X-CSE-MsgGUID: aJJCDt0IRd+jkupdogt3Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="79717912"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="79717912"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 16:26:27 -0700
X-CSE-ConnectionGUID: LdmbZHtsTMek8/osR1n0Bw==
X-CSE-MsgGUID: 8562p1szTEesRz1I1uIjpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="179882093"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by orviesa009.jf.intel.com with ESMTP; 07 Oct 2025 16:26:27 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 0/6] lib: Add runtime device info query APIs for xe devices
Date: Tue,  7 Oct 2025 23:26:00 +0000
Message-ID: <20251007232606.363629-1-x.wang@intel.com>
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

Xin Wang (6):
  lib: Add runtime device info query APIs for xe devices
  lib/xe: Use new APIs for xe device info queries
  lib: Use new APIs for xe device info queries
  tests/intel: Use new APIs for xe device info queries
  tools: Use new APIs for xe device info queries
  lib/intel_device_info: Remove hardcoded .graphics_rel values

 lib/gpgpu_shader.c                     |  2 +-
 lib/gpu_cmds.c                         | 22 +++++-----
 lib/igt_draw.c                         |  6 +--
 lib/igt_gt.c                           | 10 ++---
 lib/igt_store.c                        |  2 +-
 lib/intel_blt.c                        | 21 +++++-----
 lib/intel_blt.h                        |  2 +-
 lib/intel_bufops.c                     | 13 +++---
 lib/intel_chipset.c                    | 56 ++++++++++++++++++++++++++
 lib/intel_chipset.h                    |  3 ++
 lib/intel_common.c                     |  8 ++--
 lib/intel_compute.c                    |  7 ++--
 lib/intel_device_info.c                |  3 --
 lib/intel_mocs.c                       | 15 ++++---
 lib/intel_pat.c                        | 17 ++++----
 lib/ioctl_wrappers.c                   |  2 +-
 lib/rendercopy_gen9.c                  | 22 +++++-----
 lib/xe/xe_legacy.c                     |  2 +-
 lib/xe/xe_oa.c                         |  4 +-
 lib/xe/xe_query.c                      | 19 +++++++++
 lib/xe/xe_query.h                      |  3 ++
 lib/xe/xe_sriov_provisioning.c         |  4 +-
 tests/intel/api_intel_allocator.c      |  2 +-
 tests/intel/kms_ccs.c                  | 13 ++----
 tests/intel/kms_draw_crc.c             |  2 +-
 tests/intel/kms_fbcon_fbt.c            |  2 +-
 tests/intel/kms_frontbuffer_tracking.c | 12 +++---
 tests/intel/kms_pipe_stress.c          |  4 +-
 tests/intel/xe_ccs.c                   | 24 +++++------
 tests/intel/xe_copy_basic.c            |  6 +--
 tests/intel/xe_debugfs.c               |  3 +-
 tests/intel/xe_eudebug_online.c        |  8 +---
 tests/intel/xe_exec_store.c            |  6 +--
 tests/intel/xe_fault_injection.c       |  2 +-
 tests/intel/xe_oa.c                    | 38 +++++++++--------
 tests/intel/xe_pat.c                   | 26 +++++-------
 tools/intel_tiling_detect.c            |  3 +-
 tools/xe-perf/meson.build              |  2 +-
 tools/xe-perf/xe_perf_configs.c        |  2 +-
 tools/xe-perf/xe_perf_recorder.c       |  2 +-
 40 files changed, 226 insertions(+), 174 deletions(-)

-- 
2.43.0

