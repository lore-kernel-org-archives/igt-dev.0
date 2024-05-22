Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9B6C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADBA10ECC7;
	Wed, 22 May 2024 10:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9fs+87i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFE710ECC7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374129; x=1747910129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sCpGfpkIAxb1BigBboecMIPwhG686RoKbf5R4rQ9TTI=;
 b=S9fs+87ibv5ENYyJkSZpjs890NxJrfZId1+qmQqi+lpq9JSuX2UmzY4T
 nIbO5KHVPyRxO8jDTmWpYCg6knpPMiYJYlOnw4ANNvfOGWX8y/i/SXVvU
 Xl7C5xC0HH+IdxQf6+SYoHY1NjZauKasmB4wiq2YGmMRSuTFjLmExh9H5
 vgL/YRrTY/acWM04dAF4R0E3LOajWRqGM+o/phgw7kLepgjuaWnWU1Agj
 0rRHGI0pkGpjTuoZVN3Dng+0P+y+THExgyRJ0OgEGzhgDrDS20S8yyVOP
 fcp5jgKZy/9pIHEJAxWefeRd+PRqP8z3/Dvp3s9eR2HQu37K5r4GKS/ps A==;
X-CSE-ConnectionGUID: I3PXeP2/QauRsZzxTjoNVA==
X-CSE-MsgGUID: jbSpKvmrR8ehVpLZrZyt7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24029200"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="24029200"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:28 -0700
X-CSE-ConnectionGUID: 1LvP6QKHRg6oKVxGnnlKdg==
X-CSE-MsgGUID: 44odHPN2Q3O8fAEeaJ74YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37827612"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 00/10] lib: sync i915_pciids.h and _local.h with kernel
Date: Wed, 22 May 2024 13:35:13 +0300
Message-Id: <cover.1716373923.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Bring in the PCI ID macro changes from kernel, one commit at a time for
ease of review. There should not be functional changes. This is just to
not ambush the innocent person who is next tasked to update some PCI IDs
from kernel.

BR,
Jani.

Jani Nikula (10):
  lib: sync i915_pciids.h with kernel commit 432ed92bfb55
  lib: sync i915_pciids.h with kernel commit 41c0f8a36f15
  lib: sync i915_pciids.h with kernel commit 7b43a37348b7
  lib: sync i915_pciids.h with kernel commit 5c8c22adc802
  lib: sync i915_pciids.h with kernel commit aa3d586e1624
  lib: sync i915_pciids.h with kernel commit bfbda4722767
  lib: sync i915_pciids.h with kernel commit 7858cc0b55e3
  lib: sync i915_pciids.h with kernel commit d2c4b1db1c4f
  lib: sync i915_pciids.h with kernel commit cfa7772880f8
  lib: switch i915_pciids_local.h to xe driver style PCI ID macros

 lib/i915/perf.c         |   33 +-
 lib/i915_pciids.h       | 1337 ++++++++++++++++++++-------------------
 lib/i915_pciids_local.h |   44 +-
 lib/intel_device_info.c |  149 ++---
 4 files changed, 785 insertions(+), 778 deletions(-)

-- 
2.39.2

