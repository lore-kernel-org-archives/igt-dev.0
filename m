Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056BECCD184
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 03:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB61E10E6D3;
	Wed, 15 Oct 2025 03:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFMQWvrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE14110E6E9
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 03:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760498232; x=1792034232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zSxT8YpZm8jT0gDwtLV4Fv0ckIyP3IZZ6v96CaEz0TA=;
 b=NFMQWvrXQTus3rfDAqIp9PRDfrhv4EmNWldXWVg7V/zneSRpqCNT1dBZ
 kUsjTsMc9+0oHXShpvWH/17YxzGjmfZ9FyBCPkxoUrpJoqf+CAZsMoftS
 Llu5rnR+FFgqGLqvQIfUnFLSIEOe0+OaUx7vcr+JZ3Aqu7nfC+MZwmZdB
 dBq00u0viXyn728+eGutsE+KJYl7OwZT1y71RPAUhyhPQdnKCTT9PUiV8
 j2KPnQmDPknhiQSmTZNHWMq7iCW7QdOGGjCbZjE4cPPpRut4ewjgTyJJa
 +YRI2t0dk9KZM16y5MQ4xNw/gfunQV0PqkFZJF8g9EKH7W8vzIV9GsiSx A==;
X-CSE-ConnectionGUID: 1dsGOpwMTZWVmI/IgNrghA==
X-CSE-MsgGUID: LUJlk+c0SYqaFXw3//4JPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62577180"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62577180"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 20:17:12 -0700
X-CSE-ConnectionGUID: f90k5PSoQ66Teu52Rx6mpw==
X-CSE-MsgGUID: V2Tb0lTNR8KFhUUo0wFBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="186302551"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.81])
 by orviesa004.jf.intel.com with ESMTP; 14 Oct 2025 20:17:11 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v6 0/2] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Wed, 15 Oct 2025 03:17:07 +0000
Message-ID: <20251015031709.73133-1-x.wang@intel.com>
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
- Cache device info by devid in global map for efficient lookup
- Provide xe_device_get_info() API for other components

Patch 2/2: Query runtime xe device graphics versions
- Use runtime xe device info for Gen20+ platforms
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

Xin Wang (2):
  lib/xe/xe_query: Get runtime xe device graphics version from GMD_ID
  lib/intel_device_info: Query runtime xe device graphics versions

 lib/intel_device_info.c | 24 +++++++++++++++++++++---
 lib/xe/xe_query.c       | 33 ++++++++++++++++++++++++++++++++-
 lib/xe/xe_query.h       |  4 ++++
 3 files changed, 57 insertions(+), 4 deletions(-)

-- 
2.43.0

