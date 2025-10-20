Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E8DCCD1AB
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 23:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1DA10E53E;
	Mon, 20 Oct 2025 23:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYqk4QQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EB510E53C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761001976; x=1792537976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MCTtSNJxLVdy6PriBcm9EImZYMn70vbwYOO9xOPSwbk=;
 b=XYqk4QQM/JqRLrQtcGSQvX+hzdUyJb8WsLt7J00+W7JQnPdSX9b17zV5
 k9v4KYYZeKljX6Pz3axjf4wdj2nuZdfxoiwSlqXPe45yg6a09THamnfQG
 RCfqcBdnyHWf6joWhr9k6wfvDJyt+f1TdCQVowUNqaG/xi+lmkTpnGqtA
 4X6WKL556SrdIeBQGLLMHrIlBLW2eBAtYj3B5GgjWBoSiOKtTM9oR+D5U
 W508dCIzq1yp979aixI8bxtW06TP/n0WPAjo1Dt9rBGZvW6xS16lYdjJs
 h/Q9MHJ/kbiD4olaMXiPmurMa8g1vN2sCRcRTty0QTcei7RE5zTuUy+GX g==;
X-CSE-ConnectionGUID: Uyaz52ntQUC8HvJdX/EWEQ==
X-CSE-MsgGUID: Lt0/7Q0YTo2Fqfyx50Yh0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73797664"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="73797664"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:12:55 -0700
X-CSE-ConnectionGUID: lkl+wJWLQC69NLJDHby9RA==
X-CSE-MsgGUID: WPc4tsZZSjyXUGOIbSH5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="220605170"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.81])
 by orviesa001.jf.intel.com with ESMTP; 20 Oct 2025 16:12:56 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v8 0/2] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Mon, 20 Oct 2025 23:12:51 +0000
Message-ID: <20251020231253.138842-1-x.wang@intel.com>
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

Solution:
---------
This series adds support to query xe device info at runtime:

Patch 1/2: Get runtime xe device graphics version from GMD_ID
- Populate graphics versions in xe_device from GMD_ID ioctl
- Cache device ipver by devid in global map for efficient lookup
- Provide xe_ipver_cache_lookup() API for other components

Patch 2/2: Query runtime xe device graphics versions
- Use runtime xe device ipver for Gen20+ platforms
- Use weak symbol linkage to avoid breaking static library builds
- Remove hardcoded graphics_rel from static table for xe platforms

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

Xin Wang (2):
  lib/xe/xe_query: Get runtime xe device graphics version from GMD_ID
  lib/intel_device_info: Query runtime xe device graphics versions

 lib/intel_chipset.h     |  6 +++++
 lib/intel_device_info.c | 26 +++++++++++++++++---
 lib/xe/xe_query.c       | 53 ++++++++++++++++++++++++++++++++++++++++-
 lib/xe/xe_query.h       |  4 ++++
 4 files changed, 85 insertions(+), 4 deletions(-)

-- 
2.43.0

