Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FD6103A9A0
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7150B10E2EA;
	Thu, 26 Mar 2026 07:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rfqahz6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCF610E9E2
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774509991; x=1806045991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NbLwnFYVzq9k507o+XAsQ1L+sofh7J5nA+6civUk84Y=;
 b=Rfqahz6tvjhyT3uFCqIWjG1ZvGQS9sRSqgS9Y7pFQncEjV4F0Mi4Jo0o
 u5gDBUFDgg2crIPImsCl38jBdXmriUnXHMivragv3gjHbLpdCGrtfsPzj
 HP2Hm7VTm5XkpQVVVl5i7CrH7mM/IczH4MQ2pGRbI6xy+ZFc/DanS882Z
 3HPAG4q96nY8EtHyajmPNiALVarr4BCWtzw94u8ATWNW2ymzmCZ7hOYBu
 ieBpwNuRlEl5oEFvuKLVF39P1Uumm5hqdCF3oYmxMjjj5s+OngnbqKYfj
 TDWQb01uovKmgs96VZRvoDwyTFjNYx8R3zRU1AG7In1Be9Ml6MlcL9kcF g==;
X-CSE-ConnectionGUID: O7BJ4s1IQ+eSVcHSkI/jdw==
X-CSE-MsgGUID: GaqmDzXLRT6o+GacgORFgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="85866188"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="85866188"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:30 -0700
X-CSE-ConnectionGUID: lkOR7gB0T82VG7xXEFDJCw==
X-CSE-MsgGUID: 37TyIWAATNiT0scMrmiyfg==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.223])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:26:28 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t 0/4] updates to fbc tests
Date: Thu, 26 Mar 2026 09:25:51 +0200
Message-ID: <20260326072555.160329-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Some of the fbc status texts are outdated, fix those.
FBC cannot be enabled if the plane size is too big. Such cases
to be treated as skips instead of failures.
And some cleanups where we query the current fbc status from
the debugfs.

Vinod Govindapillai (4):
  tests/intel/kms_frontbuffer_tracking: update the outdated fbc status
    checks
  lib/i915/fbc: extract intel_fbc_get_fbc_status()
  tests/intel/kms_frontbuffer_tracking: use intel_fbc_get_fbc_status()
  tests/intel/kms_fbc_dirty_rect: check the plane size before fbc dirty
    rect tests

 lib/i915/intel_fbc.c                   | 35 +++++++++++++++-------
 lib/i915/intel_fbc.h                   |  1 +
 tests/intel/kms_fbc_dirty_rect.c       | 19 ++++++++++--
 tests/intel/kms_frontbuffer_tracking.c | 40 ++++++++++++++++++--------
 4 files changed, 71 insertions(+), 24 deletions(-)

-- 
2.43.0

