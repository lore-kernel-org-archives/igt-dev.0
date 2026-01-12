Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F83CF45C5
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 19:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C66910E063;
	Mon, 12 Jan 2026 19:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nw1LC6V1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066CC10E063
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 19:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768245461; x=1799781461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WG8sPOa8fxoWCEMpnUWMbuRhIARsQUPRNVqkSFeYYuc=;
 b=Nw1LC6V1k+k0L0CYajB9qUxrJeaKh46vK5YlFCdYlIEfrJqPq50+1flm
 HeeGyZETgtyghXZxjCy5AGMz0xpYbeOHfMnrRYxNmf1jhBFZkqicv4wMh
 KlLtyHey4N0cOeCjVruJg7IMhEtHDAhndqN5Zt0GuTNraBL7nnUL9WsWe
 OmsZE/nFHTVJqPSgfTthL/ZCoPU5+9lelLHn1W5kPj79PB5NeS253D57U
 ctU3e6sqswXG7U9PAvjBPpOIPf4wV6IlECGik3z1bG7kRkNJM1ujb4qeY
 Nh1xrWga+ccyTyfD6WUnDgUUV6mGhmsah3qe3ryPexDA3ssPCRQrJZ9Pi g==;
X-CSE-ConnectionGUID: ndLHTnOtQYGpn6JO+3aK8Q==
X-CSE-MsgGUID: Fin553rtQp6WkW79lRpUOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80978163"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80978163"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 11:17:40 -0800
X-CSE-ConnectionGUID: +emq/SH0QsCNdMPaNk3ZWw==
X-CSE-MsgGUID: cuvChVd6Ttmr6l4EpbzrDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="209247603"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa005.jf.intel.com with ESMTP; 12 Jan 2026 11:17:39 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v10 0/2] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Mon, 12 Jan 2026 19:17:30 +0000
Message-ID: <20260112191732.672297-1-x.wang@intel.com>
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
V6:
- optimize the coding style. (Summers, Stuart)
V7:
- rebased to latest mainline

Xin Wang (2):
  lib/xe/xe_query: Get runtime xe device graphics version from GMD_ID
  lib/intel_device_info: Query runtime xe device graphics versions

 lib/intel_chipset.h     |  6 +++++
 lib/intel_device_info.c | 26 +++++++++++++++++---
 lib/xe/xe_query.c       | 54 ++++++++++++++++++++++++++++++++++++++++-
 lib/xe/xe_query.h       |  4 +++
 4 files changed, 86 insertions(+), 4 deletions(-)

-- 
2.43.0

