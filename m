Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2DEC3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 21:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1B610E6CA;
	Wed, 28 May 2025 21:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQfvwEmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F0F10E6CA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 21:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748467623; x=1780003623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xfQENC+oC+aKlHylpSCJTydL0p5kCuhb9h/AuXrXoQs=;
 b=PQfvwEmVkWhc9VwckTWQdOYKFeTqVpOWxGO2lWNTXP92gjHEcEgcW9G9
 ExLRjVuhgRrLeqxPbx0Pf9b9dd6c7T6hU7YP8CuNMUW5/PA4ET7jP6WIL
 JYcTnXbgzry3mITmBphLsxBJkotGxpyaH5VzI/9Iw1a7TmFgJXccsz7tR
 eOao2ZHZxxmDDe36QrpaBZOsvStiCHACyPRkxN/jdfsCZ4Ryhnn9SQWsi
 IuDdThIpd6rRWFXp2ePN0M+97aUc3iFFOcXU/bJo4w7XpQALLLB5rNY+N
 kpTWIA6UGwhAkqbHiwh//ovwd/sh2RTFs5Fm+u1aEKDEhTMECNCXE54n7 A==;
X-CSE-ConnectionGUID: Mf02sgCTSpyHFqcJVV27DQ==
X-CSE-MsgGUID: GVvvVkJZSYS28vxzefHchg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61864167"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61864167"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:27:00 -0700
X-CSE-ConnectionGUID: RxaBZubzThubT+UiGGMdhQ==
X-CSE-MsgGUID: G+i5DbwPRb2smD1KYDGa3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143688337"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 14:26:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t 0/3] Update "force_reset" code
Date: Wed, 28 May 2025 23:26:15 +0200
Message-Id: <20250528212618.373-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

The newest Xe driver supports triggering a GT reset using a write
operation and this is now a preffered method.

Cc: John Harrison <John.C.Harrison@Intel.com>

Michal Wajdeczko (3):
  lib/xe_gt: Move reset related function to xe_gt.c
  lib/xe_gt: Trigger forced GT reset using write
  lib/xe_gt: Update has_xe_gt_reset function

 lib/xe/xe_gt.c          | 64 ++++++++++++++++++++++++++++-------------
 lib/xe/xe_gt.h          |  3 ++
 lib/xe/xe_ioctl.c       | 23 ---------------
 lib/xe/xe_ioctl.h       |  2 --
 lib/xe/xe_legacy.c      |  1 +
 tests/intel/xe_wedged.c |  1 +
 6 files changed, 49 insertions(+), 45 deletions(-)

-- 
2.47.1

