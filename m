Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD60C98312
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 07:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B3310E029;
	Sat, 17 Jan 2026 07:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZQSNj2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF6A10E029
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 07:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768634155; x=1800170155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6nPG8Jf4UgP7BwV7DRjRWrcsRDp3BFQ+rjWKJa3oxWY=;
 b=eZQSNj2nyeMRrlglSRcGAq1GcuLNb47EURhpAMcifUgoSYkPGte8J0Se
 XfogVsYyidLzhjRlOnMvh2+nG3v0TVUk3xsdA/p+nM5sus811SYH+151r
 ZecZ2fFcc5Simoi58PQoiEKD9sNdtQ30le/Du9tFnIabRFbruirPlEJ4C
 x+T2gtgqzv3qGAGQGShESRODVzl96UeoFPUFHdi/K9vAarYGgFGmZD9Zr
 oHV0BZg8AmgFSoe5rvnY7b4ijDdHdpSXcRwE0ZsAnCZ58YWnZSvCbR13l
 fneG3JYhfV+6wOp/8CkNCuIf/q0U8GVHUuRXsJzWZ7B8ej3lP3hoqUdci w==;
X-CSE-ConnectionGUID: bsl1fNtGT9C6xqYCFByLog==
X-CSE-MsgGUID: 6/IJepROQ0iEHoN1ZZQqCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73786307"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="73786307"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 23:15:55 -0800
X-CSE-ConnectionGUID: m98lcqi7Sa+x+l3W9AUEAw==
X-CSE-MsgGUID: sIATSP74Tg+/OeEm7GZZKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="205842651"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2026 23:15:54 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v11 0/4] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Sat, 17 Jan 2026 07:14:55 +0000
Message-ID: <20260117071459.892532-1-x.wang@intel.com>
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

This series enables IGT to retrieve the accurate IP minor version
(graphics_rel) at runtime for xe platforms with GMD_ID support,
instead of relying on hardcoded values in the PCI device table.

Background:
-----------
Current IGT uses static PCI device tables with hardcoded graphics_rel
values. For Xe2 platforms, Different device instances may have
different graphics_rel (minor version) values

The kernel's GMD_ID ioctl provides accurate runtime IP version
information (ip_ver_major.ip_ver_minor) which should be used for
platform-specific workarounds and feature detection.

Benefits:
---------
- Accurate IP version for platform-specific workarounds
- Proper feature detection for hardware variants
- Unified device info API between i915 and xe drivers
- No changes needed to existing test code

V2:
- set the graphics version info in xe_device_get() don't copy 
  the whole struct of the intel_device_info 
- update the graphics_rel when the info is already in the cache
V3:
- Optimize the coding style
V4:
- add braces around the else statement body
V5:
- add new struct xe_device_ipver to hold the ipver info
- separate cache map to eliminate collision (Roper, Matthew D)
- changed function name to xe_ipver_cache_lookup() to avoid 
  confusion (Roper, Matthew D)
V6:
- optimize the coding style. (Summers, Stuart)
V7:
- rebased to latest mainline

V8:
- Reworked caching in intel_get_device_info(): replace the per-thread single-entry cache
  with a process-wide cache keyed by devid (igt_map + pthread mutex), with automatic
  init/fini via igt_constructor/igt_destructor.
- Dropped the xe_ipver_cache_lookup() weak-symbol plumbing and the separate xe_query-side
  ipver cache. Instead, xe_query updates the cached intel_device_info directly via
  xe_dev_update_graphics_ver() when MAIN GT exposes ip_ver_{major,minor} via GMD_ID.

Xin Wang (4):
  lib/igt_core: add igt_destructor helper macro
  lib/intel_device_info: make device info cache thread-safe
  lib/intel_device_info: allow xe_query to override graphics version
  lib/intel_device_info: remove the graphcs_rel from xe2+ devices

 lib/igt_core.h          |  12 ++++
 lib/intel_chipset.h     |   1 +
 lib/intel_device_info.c | 119 +++++++++++++++++++++++++++++++++++-----
 lib/meson.build         |   1 +
 lib/xe/xe_query.c       |  12 ++++
 5 files changed, 131 insertions(+), 14 deletions(-)

-- 
2.43.0

