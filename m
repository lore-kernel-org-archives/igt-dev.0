Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C00106705A
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 16:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E221510EA5B;
	Thu, 12 Mar 2026 16:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2wdx1NB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED3C10EA5B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773331413; x=1804867413;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VdR+9tflhn3XZDemsP9/i0WtyWTVvPY0AphXL56WVqY=;
 b=M2wdx1NBNXkrrHFMbqIJyXi4B51Lga02OYw4AVAB9evAk2m8nk779hgs
 anxih+LBWo/l3hDZq2VCsUzEkNmcP3qiWkWtuE4AYoYuIOpyvkjf4/ImE
 U6kJzlhqcC6+I51ioalAwQwcwFukjI3X4FH824+SASd3N7K3GUhIOBHH4
 O3XWpupKWzRfLrNHoZbXeZkjnLSM+N5F/QuieJgOBxFLEyi4pt9HS7iT1
 mpU3jW9zg/e1mAJN1L1azmjnlvletluLuDrnb1qzTVquVp96PFKhwfqGY
 57pwS13UMr82Fon+6yaBJKk1g3sj8/vQEtktoNeyZhooWkbFvTY4J7VK1 g==;
X-CSE-ConnectionGUID: jqWlaIdhSUi3LbPi6Uiw2g==
X-CSE-MsgGUID: ivjbvpU/QcuW+bHCT7M/VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77037684"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77037684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 09:03:31 -0700
X-CSE-ConnectionGUID: 4a4+I+a+R7y01yOi1xpecw==
X-CSE-MsgGUID: 8T144ypfSZKUkAC7OkGheA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225839021"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa005.jf.intel.com with ESMTP; 12 Mar 2026 09:03:30 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, nishit.sharma@intel.com,
 aditya.chauhan@intel.com, kamil.konieczny@intel.com,
 shekhar.chauhan@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v3 i-g-t 0/4] lib: Add NVL-P and WCL support
Date: Thu, 12 Mar 2026 21:33:24 +0530
Message-ID: <20260312160328.9462-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

This series adds NVL-P (Novalake-P) and WildcatLake platform
support to IGT.

Patch 1 syncs pciids.h with upstream kernel up to
commit be07d8f707e4 ("drm/xe/nvlp: Add NVL-P platform definition"),
following the established pattern of keeping pciids.h as a direct
copy of include/drm/intel/pciids.h from the kernel.

Patch 2 adds the device descriptor and platform detection macros
for NVL-P.

Patch 3 adds WildcatLake support. WCL was previously consumed
under INTEL_PTL_IDS but now has dedicated PCI IDs following
commit 32620e176443 ("drm/pcids: Split PTL pciids group
to make wcl subplatform").

Patch 4 fixes compute tests that would skip on WCL. The compute
kernel lookup uses exact ip_ver matching, so a dedicated
IP_VER(30, 03) entry is required now that WCL has its own
graphics_rel distinct from PTL's 30.00.

Changes in v2:
- Add patch 3: WildcatLake support (Kamil Konieczny)

Changes in v3:
- Fix graphics_rel typo in WildcatLake (0 → 3)

Changes in v4:
-- Add patch 4: Fix tests on WCL due to missing ip_ver entry

This series supersedes the incorrectly threaded earlier submission:
https://patchwork.freedesktop.org/series/162971/

Himanshu Girotra (4):
  lib/pciids: sync with kernel commit be07d8f707e4
  lib: Add NVL-P support
  lib: Add WildcatLake support
  lib: Add WildcatLake to compute kernel tables

 lib/intel_chipset.h                |  4 ++++
 lib/intel_compute.c                | 11 +++++++++++
 lib/intel_compute_square_kernels.c | 11 +++++++++++
 lib/intel_device_info.c            | 27 +++++++++++++++++++++++++++
 lib/pciids.h                       | 19 +++++++++++++++++--
 5 files changed, 70 insertions(+), 2 deletions(-)

-- 
2.50.1

