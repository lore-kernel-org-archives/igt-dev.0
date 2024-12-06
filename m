Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D76E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 11:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4752010E1C7;
	Fri,  6 Dec 2024 11:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWMOCaNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0328810E1C7
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733483571; x=1765019571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xrG/M2315mNVM8KpD/31nhNEz97PvuXONjw3MR79uY4=;
 b=EWMOCaNtTmkI37QDcbUu1Jhg5o75fVuh8BGG8vYFiKKm+5t5nDhbkp4D
 jfVJbzP8ovKJGbsDstr0LEa3bg1xmdf7VPNsgwNH8Q11F1M2mXG1JT7CU
 WNYfLiVLx0mrdbaKQ9xqtatZg50hyz43FpfqsKuMn3mCs8tRRgSA5a+bO
 uYNxolOFEQgs1KH69JHyOlrRD0/4FYmUFbspAe5gYtc/jXaYZ1hvRnhlt
 lWhpD4FZqkIP+5dCx/F/yVCECNhtyhqJ+14AH+znkbSZ2SUVjd5uv10HH
 ZqyD72OTayXUnPHMWVsbmHYUT/hXx3uHlVyD53Q8QF33TLaw9z4BzS127 w==;
X-CSE-ConnectionGUID: wJx/nk9URCOmFfIsGuyTLA==
X-CSE-MsgGUID: ZjfQ0RA7RYKzMlpm+xTFiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37505325"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="37505325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 03:12:50 -0800
X-CSE-ConnectionGUID: r9bJEXOEQK6LKd8ljBuFvQ==
X-CSE-MsgGUID: ifZliRAzRiOKsWHml4HYSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99418951"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa003.jf.intel.com with ESMTP; 06 Dec 2024 03:12:50 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v5 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Fri,  6 Dec 2024 16:40:30 +0530
Message-Id: <20241206111032.572276-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Move the spinner related functions to lib.
check the ctx_timestamp register post gt reset for each engine.

Pravalika Gurram (2):
  lib/xe/xe_spin: move the spinner related functions to lib
  tests/xe_spin_batch: Add spin-timestamp-check

 lib/xe/xe_spin.c            | 160 +++++++++++++++++++----------
 lib/xe/xe_spin.h            |  56 ++++++----
 tests/intel/xe_drm_fdinfo.c | 200 +++++++-----------------------------
 tests/intel/xe_spin_batch.c | 121 ++++++++++++++++++++++
 tests/intel/xe_vm.c         |  17 +--
 5 files changed, 309 insertions(+), 245 deletions(-)

-- 
2.34.1

