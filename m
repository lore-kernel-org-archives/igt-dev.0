Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71AAC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 13:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E2210E1E1;
	Tue, 11 Mar 2025 13:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/mAUZ0g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110CA10E1E1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701353; x=1773237353;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kTlMccTFIa37uw54mZ0hgeq5y2/qZJvJbMUzPJHKpks=;
 b=Q/mAUZ0g3KiExi1XCehWKMUnHiIhK15YOMv/pJcimdmOgfHQ1Q96SoBi
 hvb4Wax2iFJhdz71nyUArHADRmtLXiZDGk8Q1Sy7b0sVa+cwGnWmO1UqN
 oui6fr9UMm85tysRHbvviI4h6dRyBNJmAfB67GuZ0l/2p9IBxNtkGN5VR
 IRK24912fl9GgqEdurcpRa6Xlbdp+2f0ReWaQcFLj7J8ouyl6F688U2vo
 LwiAJlWQv769CCQDn8ncM4BJpd8I4h0Vm6o3x4Iuyg203CsEElaNUpSxA
 vtvZdpNmk/AeB3BX30KxwUb2bBXn3wFfI+ZzHDvScE8Z5Tt63Q3WBGMp4 w==;
X-CSE-ConnectionGUID: QbEEWMBPQAKUrYQhkXp9QQ==
X-CSE-MsgGUID: h37pPXFMRGKa4REgN/WKXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42616257"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42616257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:55:52 -0700
X-CSE-ConnectionGUID: /dH5V8lvQdePZ4epIXmpgA==
X-CSE-MsgGUID: iQ8APKp7R4GT982OltlXfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151131518"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.177])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:55:51 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 0/3] tests/xe_eudebug_online: Add
 set-breakpoint-sigint-debugger test
Date: Tue, 11 Mar 2025 14:55:26 +0100
Message-Id: <20250311135529.5425-1-dominik.karol.piatkowski@intel.com>
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

Add a test that sends SIGINT to the debugger thread with random timing
and checks if nothing breaks, exercising the scenario multiple times.

In order for this test to work, make debugger thread SIGINTable.

While at it, fix rare xe_eudebug_client_stop corner case issue that was
spotted with the new test.

v2:
 - Initialize sigaction (Mika)
 - Count correctly timed SIGINTs and assert that they happened (Mika)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (3):
  lib/eudebug: Make debugger thread SIGINTable
  lib/eudebug: Fix xe_eudebug_client_stop corner case
  tests/xe_eudebug_online: Add set-breakpoint-sigint-debugger test

 lib/xe/xe_eudebug.c             | 18 ++++++-
 tests/intel/xe_eudebug_online.c | 96 +++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+), 2 deletions(-)

-- 
2.34.1

