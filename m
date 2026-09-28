Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B324CA5FA2
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 17:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BD110E93E;
	Mon, 28 Sep 2026 17:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOmtKQSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F2210E93E
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790616436; x=1822152436;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cgx54Be64a9qOMx9a+BhpDTBjxuWGRPlL9uKuWj6RKk=;
 b=EOmtKQStKkC6w7W170zNvndfPd2AL4MHciHQQhqGpOY6WTHIJ4UmDSVY
 /D5QlPVfSHWdD1YNKceV7+PKxdYVFLt7Z2zC6byf19n5VIxBD3URCCsHe
 MyHLmGZaF76/nbkXg9ysbjRYqjEgGpF32Fhd2nIe+4iB22/XrOXphLxkY
 WUSwymzOnDza/rppN7JST/b8weYfLzMcfqJ0+cXNQEHjZA4fnlI54duj7
 txHOjy4GRrYnLqLsECNE1TtOOyE/U6SLn6ObHY4MuGvqKlLrjntzO3CTI
 YLkY/IWpaBOuPlwdoVuHVajAxEOnhPI+yNWXMuT6Rv8xIk8Mr3JY3ylAf Q==;
X-CSE-ConnectionGUID: F9FgJDb+SZisD8P1ieHM+g==
X-CSE-MsgGUID: dbNSjfwMSsaO0t6G5B+vAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="78889472"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78889472"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 10:27:16 -0700
X-CSE-ConnectionGUID: 2fc+b2wfREuVIAJh+NVf1g==
X-CSE-MsgGUID: n9iZCspURRSoieG8Fd2wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274616947"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2026 10:27:15 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, matthew.d.roper@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 stuart.summers@intel.com
Subject: [PATCH i-g-t v14 0/4] lib/intel_device_info: get the xe .graphics_rel
 from GMD_ID
Date: Mon, 28 Sep 2026 10:27:03 -0700
Message-ID: <20260928172713.1341060-1-x.wang@intel.com>
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
values. For Xe2+ platforms, devices sharing the same PCI ID may have
different graphics_rel (minor version) values.

The kernel's GMD_ID query provides accurate runtime IP version
information (ip_ver_major.ip_ver_minor) which should be used for
platform-specific workarounds and feature detection.

Limitation:
-----------
The device info cache is keyed by PCI device ID. A system with multiple
GPUs sharing a device ID but reporting different IP versions is not
supported; the last probed device wins. This is considered unlikely in
practice, while the hardcoded devid -> IP version mapping fixed here
affects every such device.

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
V10:
- rebased to latest master.
- statically initialize the cache mutex and create the map lazily
  instead of relying on igt_constructor ordering.
- fall back to the static table entry instead of intel_generic_info
  when a cache entry cannot be allocated.
- return -ENOENT from xe_dev_update_graphics_ver() and fix coding style.
- document the devid keying and the lockless readers.
- also drop graphics_rel from WCL and NVL-P.
- reword commit messages.
V11:
- rebase to latest master.
- report allocation, map creation, and map insertion failures with fprintf()
  and exit(EXIT_FAILURE), rather than returning an unmodifiable static entry.
- release the cache mutex before reporting an insertion failure.

Xin Wang (4):
  lib/igt_core: add igt_destructor helper macro
  lib/intel_device_info: make device info cache process-wide
  lib/intel_device_info: allow xe_query to override graphics version
  lib/intel_device_info: remove the graphics_rel from xe2+ devices

 lib/igt_core.h          |  12 +++
 lib/intel_chipset.h     |   1 +
 lib/intel_device_info.c | 164 +++++++++++++++++++++++++++++++++++-----
 lib/meson.build         |   1 +
 lib/xe/xe_query.c       |  17 +++++
 5 files changed, 174 insertions(+), 21 deletions(-)

-- 
2.43.0
