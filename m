Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E2BD64072
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 04:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6126F10EAE1;
	Wed, 17 Dec 2025 04:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cqd5bUim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AE010EAE1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 04:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765946112; x=1797482112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gRtNafsrU4n4/G9tBeIFhGG6BKLMdH8O3of0sJDS0Qk=;
 b=Cqd5bUim+HSOIkcl+u7t2Askl+S36sEl6b99QbrcsBQOFaQxlmzDdL9E
 nJVFffliLWq+SH2iHgMUpEEzCciJd9wmvY3OJkIX+w8thlLHF2Nz7eqsR
 3ocBwKKxFFoc8TT+1BuDdesnOD8qiZFQ2qMB0ua8ZHsFex+FButIYO00c
 8sFKQM8az80EeKhGE3+aBeP98s6eBEWVn9QRWnd0+rmxxHiMRqvNO8FCm
 r/V8mw2lrWaNlVZOR6fpvnGDkUN8vXB6IGCmsHUdUqIV1FNlJXXskqP1i
 OudwMFra0NZdtDLqygv4cKXkSqAVoWO/1XC6Bhh1YV9qEktW3zBLp4y+n w==;
X-CSE-ConnectionGUID: 7RrePwSpQgurRQ7avATfog==
X-CSE-MsgGUID: kaD/anKmRKGhZeqf84x60g==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85291435"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="85291435"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 20:35:12 -0800
X-CSE-ConnectionGUID: pXNY91FORIi2lUAlq6pWcw==
X-CSE-MsgGUID: zaDGAsNsTCiqd6qfqIsiHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198196631"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 20:35:10 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v9 0/2] lib/intel_device_info: get the xe .graphics_rel from
 GMD_ID
Date: Wed, 17 Dec 2025 04:34:48 +0000
Message-ID: <20251217043450.241761-1-x.wang@intel.com>
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

