Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF3DE7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 12:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382D110E32D;
	Fri, 13 Dec 2024 12:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mp9bfx/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0072A10E32D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 12:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734091809; x=1765627809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b3y62cjsLTug1MYlVME9OcsZJ7pwQgMeVJUe5qGw3mY=;
 b=Mp9bfx/PvQL4JhZvp6BBeNqphYgNYoXeX54N9OCmIPapBVhOKWRDANfp
 lgiqabKzbDDlbPSf74j5Q4JdlkklQ9/U90Ly4mXOWUKlj/3cU5Ta6rOHu
 RO5ADe38jACJafwpuxi6XZXSjammRffB7QK1ksvjRxeUyfwabh2MDp/02
 wqrOaK7r2Idwe1dld+T2+nPvDrDxWYMbxM6ibVE5dPtMYja/DoAXbM2Bf
 fO28ja6RFutHbNZSnG7s4VmT3vLCtGnPYs7EItPMlIPmPxUp0xq8jgmrN
 W9cIrWq1LJ7YOz8W4mIX4Dg6EPXpX6JXEscaxkY8k+bZz9LlInAElKo4U A==;
X-CSE-ConnectionGUID: q+kLbbiJRX6lJX09TFO0Eg==
X-CSE-MsgGUID: T/agsG0oQjK5MIE2te4kmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45951723"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45951723"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 04:10:08 -0800
X-CSE-ConnectionGUID: zn7O3dzGT7mh+6nD3e+KoQ==
X-CSE-MsgGUID: 5dbykWN/TtGl0LQ25+M4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="127331275"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa002.jf.intel.com with ESMTP; 13 Dec 2024 04:10:08 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v10 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Fri, 13 Dec 2024 17:37:37 +0530
Message-Id: <20241213120739.650439-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

 lib/xe/xe_spin.c            | 203 ++++++++++++++++++++++++++----------
 lib/xe/xe_spin.h            |  52 +++++----
 tests/intel/xe_drm_fdinfo.c | 195 ++++++----------------------------
 tests/intel/xe_spin_batch.c | 119 +++++++++++++++++++++
 tests/intel/xe_vm.c         |  17 +--
 5 files changed, 341 insertions(+), 245 deletions(-)

-- 
2.34.1

