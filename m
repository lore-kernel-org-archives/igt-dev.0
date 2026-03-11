Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48365FCC9AA
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 05:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1DC10E31B;
	Wed, 11 Mar 2026 05:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVv3Yhfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F1D10E31B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773208202; x=1804744202;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pjYt2CILy8fSfCT68YXUz3U0KqMzh2u9MGHkLDmPavI=;
 b=CVv3YhfebjtCSW9Jn8W/K+W3BR7wbZ0UNnlHHwqaqwg6uBbUkdYo/WXa
 8kCzaO5jP6GwEtbINRrL1DBbZDF/Vd0/3KClmnZqBxzRnTHrGtv4/5J9I
 2xRw7eX7NNLfvq13Dpa8V5n9E7K5AUAUNwyu7A1g4EYpEcbU957uEIw7N
 oh9B82ZJu5Z3PZcK/IwyA6HyT6OpSjapeyjBiJPpSHg3H7H92LlDCCo1z
 3tr9rvHd2/97C0rCgDT5rJ5mZt8ViHyRjamHjVfROw9qeHmGjwOWYBYoD
 7wH/t+h5DVtYcFXE+O3Esecbqi/Xmn3Kr734JsxitLMyxtcHQqvu9xKx4 A==;
X-CSE-ConnectionGUID: 5q1HR6dNSgef8Z8cXGcTxQ==
X-CSE-MsgGUID: 96FAxqa5Q9GF54w+Ao7wsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96881954"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="96881954"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:50:02 -0700
X-CSE-ConnectionGUID: lEYAPZ2XSPumn2ywCzeLdA==
X-CSE-MsgGUID: 2eOFSP57Qs63k0rfBPlUqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219483618"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa006.jf.intel.com with ESMTP; 10 Mar 2026 22:50:01 -0700
From: himanshu.girotra@intel.com
To: kamil.konieczny@intel.com,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] lib: Add NVL-P and WCL support
Date: Wed, 11 Mar 2026 11:19:55 +0530
Message-ID: <20260311054958.9770-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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
commit 32620e176443 ("drm/pcids: Split PTL pciids group
to make wcl subplatform").

Changes in v2:
- Add patch 3: WildcatLake support (Kamil Konieczny)

This series supersedes the incorrectly threaded earlier submission:
https://patchwork.freedesktop.org/series/162971/

Himanshu Girotra (3):
  lib/pciids: sync with upstream kernel
  lib: Add NVL-P support
  lib: Add WildcatLake support

 lib/intel_chipset.h     |  4 ++++
 lib/intel_device_info.c | 27 +++++++++++++++++++++++++++
 lib/pciids.h            | 19 +++++++++++++++++--
 3 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.50.1

