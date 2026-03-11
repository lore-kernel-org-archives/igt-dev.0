Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBE5FD88F3
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 04:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2221810E309;
	Wed, 11 Mar 2026 04:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3Z1C8W3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF64A10E309
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 04:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773203823; x=1804739823;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KYQHuj4ULuWMaEl7UChZdZqAc+cQNK3OExzUYn9/99w=;
 b=g3Z1C8W36sOmvg79JE6VPipqcTxUM5+RWo5qR/NtXZNct1rylShTviGC
 kZEiMdG9r5Qi3SVs/AmSNm1eugP20AfawvSSRNVIUvTn86Clwy2tA+ic8
 49UWVMnNOoSjuR7HnyfX3e+8n/Dyp4VMe/4QuCGnzM/VJofHjvxRWuLR/
 p6ig1aJ3XDD5eynyBjyDItcZLg8d9EoAoc2rWqr1z/W+iBewH65F5aHr1
 4Yz1iJyEpb9kmey2zB7FqQ5lltq7toQIVAuRujwI/DZ5YyLznme953AQA
 AvoJHpAM0SdUc+L9LdTrlTcv6YFgJM356vEowoLE16DRJvx1pE0Na5JIN A==;
X-CSE-ConnectionGUID: bc//M4F6SkeQK9Qr9MhOXw==
X-CSE-MsgGUID: Z8RDIledTG+WGvHzdzvX5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74381211"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74381211"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 21:37:02 -0700
X-CSE-ConnectionGUID: vxXWop3WSReCyGq9eyOGOw==
X-CSE-MsgGUID: uL0SW2+EQPGffeDHEJ0h4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="258260101"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa001.jf.intel.com with ESMTP; 10 Mar 2026 21:37:01 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, aditya.chauhan@intel.com,
 shekhar.chauhan@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 0/3] lib: Add NVL-P and WCL support
Date: Wed, 11 Mar 2026 10:06:56 +0530
Message-ID: <20260311043659.6425-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260310165113.8994-1-himanshu.girotra@intel.com>
References: <20260310165113.8994-1-himanshu.girotra@intel.com>
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
kernel commit 32620e176443 ("drm/pcids: Split PTL pciids group
to make wcl subplatform").

Changes in v2:
- Add patch 3: WildcatLake support (Kamil Konieczny)

This series supersedes v1:
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

