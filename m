Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8A1107637B
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 13:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BAE10EDC4;
	Wed,  1 Apr 2026 13:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YapVPxOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E7110ECDF
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775051629; x=1806587629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mkV7pj71Q5L5oJzp49WsNflSPqpAHkm2oBUYZ5/ZOzc=;
 b=YapVPxOV+NCzCoSEXpRsEI2eob8jJywZ4X9CVRpFFzF5uC+rBtoReUue
 /jb0hVm0db18yavOL2w6wQU3hoJ3rFk/ntyUBwWd1L3CvrP1QU0VYtKm0
 YzImpLNL7JT3ctD0VPJjpgtWmI5v7croY2ZKzzWQisr9y8IA+R4/ieJJ+
 r/BlCwGQhTHKkZpXXLBlbskrowtmJgZP2DAsQOoyu5SEBECNiOtaTIu5R
 gMqfhVBVAYprfrMo4maqxHvxn+bveGpcklauNzdwfea76m69qaqV6Hcrb
 uBs9jKw6L+V6xwD5Q/YpT7rT0rXgnoNPMOPbGq7QoZKRYttQm/nz0Beav Q==;
X-CSE-ConnectionGUID: VK+hFm3bRXyCPnMs6dr6Uw==
X-CSE-MsgGUID: vD7axItwQ0yg87S6fautXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75972713"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75972713"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 06:53:49 -0700
X-CSE-ConnectionGUID: BzoYO8KsRxK6ojbRn6J9zQ==
X-CSE-MsgGUID: 5CrE4AROTfSjjRMs44jDyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="257161791"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.206])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 06:53:48 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v7 0/4] Verify PTA entries contains expected values
Date: Wed,  1 Apr 2026 15:53:44 +0200
Message-ID: <20260401135343.2874239-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

According to spec verify PAT entries in reset / suspend scenarios.
Extending parsing to media gt was necessary as it may contain
different PTA values for main / media gts. With this series
I also observe different PAT ATS values on BMGs.

v2: use pat debugfs instead of pat_sw_config
v3: add hw/sw PAT compare subtest
v4: simplify PTA comparison subtest (Matt)
v5: unify PTA/PAT tests
v6: skip on !pf and assert in case of PAT access failure (Wang)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_pat: Support other than gt0 during parsing debugfs PAT
  lib/intel_pat: Expose getter of PAT registers
  lib/intel_pat: Set PTA + ATS PAT entries to invalid value
  tests/xe_pat: Verify PAT entries contain expected values

 lib/intel_pat.c      | 51 +++++++++++++++++++++++++-
 lib/intel_pat.h      |  3 +-
 lib/xe/xe_query.c    |  2 +-
 tests/intel/xe_pat.c | 87 +++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 138 insertions(+), 5 deletions(-)

-- 
2.43.0

