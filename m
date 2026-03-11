Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8A3FD063E
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 07:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1889E10E25D;
	Wed, 11 Mar 2026 07:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfY8qHX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755810E25D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 07:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773214473; x=1804750473;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sxYEAWeZkHTC0UKZ+MwBfhcFFr1mYukzAYt+XEKaXLo=;
 b=EfY8qHX6/wymZAplxVXfO2kQsMpMJefZujNZosu3A7zfshv4/0caovRj
 z7iNfliH8EVIlgxXO21Ml5HHS8KWnaf5te+QKRysNF068GU443m7z+h+c
 Rb7DxUUOfa7weJ8Fcsd9/D1VJhv/gJoYUl7Xngyas4vejsyo9C3jvE+2L
 j3Rj9RMMHld64+b0aQwtsNSebhEw/ZnEmbxeEKBXvQYuksp1GfYLM8ybs
 20/nZkWJSkTydjzP3ruJlhG+iDgmnkX1f3G/tqMoeKqZdoLJ33ZiGFVUJ
 AWZJ2lkF4+BkdEmrcdv6Rg1ZF+ZcquSNP90CojpSYPHjI9++Zf7c8q4k2 g==;
X-CSE-ConnectionGUID: RkKISXV9Qx2dMJbsNATtPQ==
X-CSE-MsgGUID: DSW+hm//SGGGSxtAejlnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85362021"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85362021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:34:33 -0700
X-CSE-ConnectionGUID: javbzU5JS2qx5hLVD8Ta1w==
X-CSE-MsgGUID: 0np3Q3wcQcCd5W8AN0M9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224547827"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 00:34:32 -0700
From: himanshu.girotra@intel.com
To: kamil.konieczny@intel.com, shekhar.chauhan@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 0/3] lib: Add NVL-P and WCL support
Date: Wed, 11 Mar 2026 13:04:27 +0530
Message-ID: <20260311073430.17421-1-himanshu.girotra@intel.com>
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

Changes in v2:
- Add patch 3: WildcatLake support (Kamil Konieczny)

Changes in v3:
- Fix typo in WildcatLake graphics_rel (0 → 3)

This series supersedes the incorrectly threaded earlier submission:
https://patchwork.freedesktop.org/series/162971/

Himanshu Girotra (3):
  lib/pciids: sync with kernel commit be07d8f707e4
  lib: Add NVL-P support
  lib: Add WildcatLake support

 lib/intel_chipset.h     |  4 ++++
 lib/intel_device_info.c | 27 +++++++++++++++++++++++++++
 lib/pciids.h            | 19 +++++++++++++++++--
 3 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.50.1

