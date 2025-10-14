Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2CACCD18C
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 06:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA37510E549;
	Tue, 14 Oct 2025 06:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjO06s1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B46A10E545
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 06:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760424092; x=1791960092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UYRQ9KcmUOLT5F4ZYq0Q+4Dn2ETOxw1zC1e+sp68oHA=;
 b=kjO06s1pU3HNxRQyqDOBbPM7d6To4P59nT+06IJU8APWuSJ3BzUTaYMV
 Zu+K002cXcwaAUchqcARQsrILCoq2/7i9UGU4c1V/V4J/xdpffMrkxkxK
 PXEgR73CpKP0SNJhbXUabvnhE52pKZpRQ5yXazzNI5yzzFlHfKUgWxkQU
 HlaXZd5Z+pHIb5LerE09ZN4KnoclrV5KFZP6686nMb/d//f7cWjsJXdUi
 TA56ct1/aTyoS+qwx62ag3a571KhrNwkOAV0XS9XA71qj2wSD39OATZIB
 akB13+w/Z1leqysLvQRlPj8CJcU8lz4vzKDgZm88GEiJMXSNXB4Ff5B5t g==;
X-CSE-ConnectionGUID: MwEwOMv6TX2qyI8QkM9MAw==
X-CSE-MsgGUID: xky7T30mSRuCeSIgpuP7pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="88038268"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="88038268"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:41:32 -0700
X-CSE-ConnectionGUID: 0nTS0EbYRU6cq/rBibp7sg==
X-CSE-MsgGUID: Nb3vRtIgR5WTfVSus3AIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="205496568"
Received: from fmbmgg31rpls058.fm.intel.com (HELO DUT6304BMGFRD.fm.intel.com)
 ([10.36.21.81])
 by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 23:41:32 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v4 0/2] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Tue, 14 Oct 2025 06:41:26 +0000
Message-ID: <20251014064128.36139-1-x.wang@intel.com>
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

Patch 1/2: Add runtime device info cache to xe_query
- Populate intel_device_info in xe_device from GMD_ID ioctl
- Cache device info by devid in global map for efficient lookup
- Provide xe_device_get_info() API for other components

Patch 2/2: Query runtime xe device info in intel_get_device_info()
- Use runtime xe device info for Gen20+ platforms
- Use weak symbol linkage to avoid breaking static library builds
- Remove hardcoded graphics_rel from static table for xe platforms

Benefits:
---------
- Accurate IP version for platform-specific workarounds
- Proper feature detection for hardware variants
- Unified device info API between i915 and xe drivers
- No changes needed to existing test code

Xin Wang (2):
  lib/xe: Add runtime device info with graphics_rel from GMD_ID
  lib: Query runtime xe device info

 lib/intel_device_info.c | 23 ++++++++++++++++++++---
 lib/xe/xe_query.c       | 32 ++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h       |  4 ++++
 3 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.43.0
