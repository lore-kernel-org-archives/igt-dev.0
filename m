Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0338C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 09:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597F710E993;
	Fri, 14 Mar 2025 09:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBKt/69t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA7610E993
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741946249; x=1773482249;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CyLBQ0JI6nDyTDj3wpeg0u0RlFsqM37s7nrQBwozjU4=;
 b=nBKt/69t80OgTznwEqiMo62kTX3fgnPKsl9erwmR4cE0KHFJt9C+bxf3
 rNHala75lXnrwY8G1rUP/jB7MycFXxdV+UObBR9FTNcgsz6UuoRMWfFrt
 Xeb8282r2nIq5iOAeptMTuxM5wLaOpMAZYmOFZ1bQWbOc2tIBN1jYWBMC
 ArcELUc0gGPrUSBX26RMm8IKLrx704+T0qttsp0xSuEI69Da9CKGIhCer
 mVcbE0jHItS1uBEOfSjkPUKuyaXOaXTmIu/ddiMF8ys0kiR2PScrMB3UG
 8l5ltfSKbn2P5rbTtPf+rGoCn5y6fEhXb+awjmYp4fDOysFWwxRhk8mPJ Q==;
X-CSE-ConnectionGUID: KqgD28WMSd6ttmLeFJ79QA==
X-CSE-MsgGUID: U1/z4zutQ26Keinrnajgzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53745148"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="53745148"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 02:57:29 -0700
X-CSE-ConnectionGUID: Pw38ze7wSPSOr9ErSWa3vQ==
X-CSE-MsgGUID: 84K2n+e0Q66TpmcZWP11vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="144404698"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.175])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 02:57:27 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Prepare to remove xe_sysfs_driver_do()
Date: Fri, 14 Mar 2025 10:55:03 +0100
Message-ID: <20250314095701.581686-1-francois.dugast@intel.com>
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

This is a first step to address this comment:
https://patchwork.freedesktop.org/patch/641321/?series=144466&rev=3#comment_1175344

Francois Dugast (2):
  lib/igt_kmod: Allow igt_kmod_unbind() on a specific device
  lib/igt_sysfs: Remove XE_SYSFS_DRIVER_UNBIND

 lib/igt_kmod.c                   | 15 ++++++++++-----
 lib/igt_kmod.h                   |  2 +-
 lib/igt_sysfs.c                  |  4 ----
 lib/igt_sysfs.h                  |  1 -
 tests/intel/xe_fault_injection.c |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.43.0

