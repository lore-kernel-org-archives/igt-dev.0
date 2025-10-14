Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F64ECCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 18:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121DE10E234;
	Tue, 14 Oct 2025 18:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyzeU3Yx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950E10E234
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 18:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760466684; x=1792002684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ltAONbkOqLQDKO0j8tgHDW5Qr+RDokmJNMA6ydJFw3o=;
 b=lyzeU3YxOaZsYpON4Z2O7+I3LDtaMuGdHGiKXa/uYYvELZXNL2HN31dg
 B/rU7v/MIKWtNZowyKCoR79/eVfu6OGW9ru4Pa9gpQ+uMQ8oKQQiQXg2g
 3qCyoxvtj4nfDqoPMh3D55ZauSmnhsYyeSntsJ9oUSR/LijHSRpGi2zvK
 3SpGAANdMsZ+OMPSnDPE1ZJ27UK+bgp3on1afsL/ZhgKVyX4MvHvyJY7j
 XfNO7ZZ4+GgrtLlAPNOvvaNq+MTQ/r8VAzaQOMTp2Dq8DO2i7/5W+sO19
 ulZALO6uj89VOTpTYm6OaqMDUW7FP+OyhMaHFQPfVli2jgQFUwjJcvC41 w==;
X-CSE-ConnectionGUID: ydix+XMqSz+pxM6/EClUpA==
X-CSE-MsgGUID: SAcybRGPQr+aKS3Kx+TyQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66287148"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="66287148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:31:24 -0700
X-CSE-ConnectionGUID: UTBauOOVSMyHV/qiyOGdGQ==
X-CSE-MsgGUID: MPfWcm2MSxi/YugWUoCe9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="212572575"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.81])
 by orviesa002.jf.intel.com with ESMTP; 14 Oct 2025 11:31:24 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v5 0/2] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Tue, 14 Oct 2025 18:31:19 +0000
Message-ID: <20251014183121.53185-1-x.wang@intel.com>
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

Xin Wang (2):
  lib/xe/xe_query: Get runtime xe device graphics version from GMD_ID
  lib/intel_device_info: Query runtime xe device graphics versions

 lib/intel_device_info.c | 27 ++++++++++++++++++++++++---
 lib/xe/xe_query.c       | 33 ++++++++++++++++++++++++++++++++-
 lib/xe/xe_query.h       |  4 ++++
 3 files changed, 60 insertions(+), 4 deletions(-)

-- 
2.43.0

