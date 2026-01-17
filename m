Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966FCCA5FEA
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 23:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F191E10E176;
	Sat, 17 Jan 2026 23:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0E3UX5K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0AB10E034
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 23:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768693713; x=1800229713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4/gVcooTztH6IzoldiAWi+6J9Adfu8UH5uwnD2l8f3U=;
 b=d0E3UX5KOYqV775iClOnpAS3/umEFN8ld0QecHqlaRrvLd7F8UYptBM7
 kelYU+4AO6RpSyS83hJfQ4k+vEFK/4ydj4tB7HZcTHmzBX0IFamQAbiGZ
 04zhiUccFvXwePVz99cbwaGKulg3LEEgbafe/Ut04Ex351O23ElJ3mChI
 nmfLA5mTb+Thh3HvAJujcWyP8MZQxr8ioLXYW28p6MvFylndZjD2OJ/oG
 8XsgV7/BmHyzJYepyMDIH1mHgYo4V09kAyXKM2F5oJ+a8alkcFSZ9RJ51
 GS7Ldyj/T6nQR7zd+6Do+A4jx1T9MsX9QqvzjN/i0xMPe3JAdVBUUjV8z A==;
X-CSE-ConnectionGUID: WKFmhpIgRdSXJqLsTDEb3w==
X-CSE-MsgGUID: wtjN06F3TUm6umcn4X0JRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81073815"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="81073815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 15:48:32 -0800
X-CSE-ConnectionGUID: GUtBIQdXT6ie2+Ep0o3HKg==
X-CSE-MsgGUID: pmqBCqITTrGxDmq82q1ejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="205150350"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2026 15:48:31 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ravi.kumar.vodapalli@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v12 0/4] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Sat, 17 Jan 2026 23:48:16 +0000
Message-ID: <20260117234821.929209-1-x.wang@intel.com>
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
V9:
- make xe_dev_update_graphics_ver() return error and guard NULL cache.
- assert in xe query path to avoid silently ignoring update failures.

Xin Wang (4):
  lib/igt_core: add igt_destructor helper macro
  lib/intel_device_info: make device info cache thread-safe
  lib/intel_device_info: allow xe_query to override graphics version
  lib/intel_device_info: remove the graphcs_rel from xe2+ devices

 lib/igt_core.h          |  12 ++++
 lib/intel_chipset.h     |   1 +
 lib/intel_device_info.c | 128 +++++++++++++++++++++++++++++++++++-----
 lib/meson.build         |   1 +
 lib/xe/xe_query.c       |  13 ++++
 5 files changed, 141 insertions(+), 14 deletions(-)

-- 
2.43.0

