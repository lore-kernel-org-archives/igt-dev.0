Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C08C5AE59
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 00:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D8310E22A;
	Mon, 26 May 2025 00:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LiVnj0H5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D61610E0C3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 00:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748218408; x=1779754408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y3zlsMEtFSQYXr3RbVs1v18Io3X44X7+RFBmPPljKbA=;
 b=LiVnj0H5zCOk4agZypomGFA/2kVOFwVGjCPmAr4GWKi8PBcAoZ1aWFJU
 WuJaPPFlZWqGph9LbcWZrzhg2Zo9Ch/4nCL41Uf38RtEEu/8zpPbwoMuC
 1z3gyt/3hmC5Gft3wc7BLRKX9byZHqWJ0kS4OIzedwi0pBCkBUAcE67gY
 M+jsAQQCNoyfCUd9vv/Ke4TXB1sObxri0u/R4Z6kuDFxOUePnSpI6YtF0
 2NPxp31jXeS5cj1T1FQUGfw9I9G10+8QEAEhm9tYM0WLIzvTU/74KCjCT
 FUv14hIKWhcxqw9031024la9L69FWJ3ncq0tcyOws2LqyTauIZfsc1b4k w==;
X-CSE-ConnectionGUID: 3C0cT2TrQ1Sml65kZWuP7w==
X-CSE-MsgGUID: 5GBnVHYcRQuy4eha2Vt0mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50296218"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; d="scan'208";a="50296218"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 17:13:22 -0700
X-CSE-ConnectionGUID: 8+gsGqEUQSu++7tR2T6lJw==
X-CSE-MsgGUID: b1xU5coySaOS1yEVjtKrpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; d="scan'208";a="142029273"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 17:13:21 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/2] tests/intel/xe_eudebug_online: Introduce pagefault stress
 tests
Date: Mon, 26 May 2025 00:13:02 +0000
Message-Id: <20250526001304.2899977-1-jan.maslak@intel.com>
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

This patch series introduces stress variants of already existing
pagefault-(read|write) tests in the `xe_eudebug_online` test suite.
These tests use the maximum number of threads in thread group and
maximum number of threads in the shader.

Jan Maslak (2):
  lib/gpu_cmds: expose num_threads_in_tg parameter for tests
  tests/intel/xe_eudebug_online: Add pagefault stress tests

 lib/gpgpu_fill.c                  |  6 +++---
 lib/gpgpu_shader.c                | 16 ++++++++++------
 lib/gpgpu_shader.h                |  1 +
 lib/gpu_cmds.c                    |  8 +++++---
 lib/gpu_cmds.h                    |  4 +++-
 lib/media_fill.c                  |  4 ++--
 lib/media_spin.c                  |  4 ++--
 tests/intel/xe_eudebug_online.c   | 27 ++++++++++++++++++++++++++-
 tests/intel/xe_exec_sip.c         |  2 +-
 tests/intel/xe_exec_sip_eudebug.c |  2 +-
 tests/intel/xe_exec_store.c       |  2 +-
 11 files changed, 55 insertions(+), 21 deletions(-)

-- 
2.34.1

