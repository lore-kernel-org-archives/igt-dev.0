Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E9CF532D0
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 03:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA8110E008;
	Tue, 24 Mar 2026 03:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iq+PQXUl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72FE10E008
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 03:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774324547; x=1805860547;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zoNtZGS72FgL0wYWA7QInHYUcCUqbeEp6tbclrZSuhc=;
 b=Iq+PQXUlikRhNzJc2phxrbMNWzA1Fu0wHPf7ppepYhsIKhqKE/IwZd7z
 t8ndkNOZs0Fi9NkPCeukfA6TAFeTT0nF4zd6fm95l10SErRHOxvP0OtT1
 DeYNSk1chISrn5Zns93x9Qhd/oIH5aalUxcZls9Gq4tHyZSjm/SAkf4i0
 NV9DqlciKj8iBtMYVkfujAkeTL2ev1/oRJ+s8XhOMWbbBtkvrXKefFbYc
 dhN0CdORwVTHpBvxMn6wmyOUmipkNBiVSsmuZxpACc0KasA00HyRgjSIX
 HVaNjh00Qrh5RlSHl7V1g0chiF1vgvoxGLGZvsG0QRdmjPmlTIxa0WTdE A==;
X-CSE-ConnectionGUID: VHqyBEyoTryzQ6vwXPA4MA==
X-CSE-MsgGUID: BZND74gNTDqXgCC86A59Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75046945"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75046945"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 20:55:46 -0700
X-CSE-ConnectionGUID: NZJzzTVBTdin15ldJE9WPQ==
X-CSE-MsgGUID: Bvhlx+0aTnWI3wJFJbJJZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219347494"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2026 20:55:45 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/2] Implementation of Negative tests for VM_BIND Decomp
Date: Tue, 24 Mar 2026 09:27:11 +0530
Message-ID: <20260324035713.796560-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309060901.642399-1-smitha.balasubramanyam@intel.com>
References: <20260309060901.642399-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND Decompression.

Patch 1 adds resource management structures and helper utilities
used by the VM_BIND Decomp Negative tests.

Patch 2 implements the actual negative tests covering invalid uapi parameters and
ccs corruption scenarios.

Changes since v1:
- Dropped temporary helper patch
- Rebased on latest upstream
- Fix indentation issues

Smitha Balasubramanyam (2):
  tests/intel : Add data structs & helper utilities for VM_Bind Neg
    tests
  tests/intel : Add Neg tests for VM_Bind Decomp

 tests/intel/xe_ccs.c | 1026 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 1021 insertions(+), 5 deletions(-)

-- 
2.43.0

