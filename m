Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9759F1061B05
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21C210E033;
	Mon, 30 Mar 2026 14:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vraherb8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1093F10E033
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774881640; x=1806417640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X0RRHO5EruqOQdutuubZCJEdAjq3C+S/r8dl91Y/Sh0=;
 b=Vraherb8TSVhzgDmkU2yHoBrptC+PccLYej/DeUKXD76v3pQXSVOh8N3
 00nIQt22DdFWJUQ+eGwI0TB9sYbuzieRcJBZ8W6FFvpCOmN8rYzM7zA7A
 2nLu2w1ST8gdw1wFglD+zZOF8cN1qJpR2qsrobnThpWKdL29XXBCm96N0
 vBZ3XytaTXjRbnppQ4X+HmOkySQrS8yhltUpzs4a15FYr2TytUpIlqmlm
 zsoX2xQB21PmVZBygpfQvZiIH9ZyIIx83tLlxq53La8BB3BPFVsREgJQs
 L9iXjYBm5YlqI7iRSLMRVcGgMSUve16JZUCCE/nlQF2rSdr3GQwncKiGx w==;
X-CSE-ConnectionGUID: K3YsMgllTCiTB8eBtkuXWQ==
X-CSE-MsgGUID: EzKPhi06RiquULynXrBiqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75771080"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75771080"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:39 -0700
X-CSE-ConnectionGUID: l19DinLfT2e2FG4ODKc4Yw==
X-CSE-MsgGUID: SThUlYLaTzyAqUZyYGU21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="264013237"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:38 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v4 0/5] Verify PTA entries contains expected values
Date: Mon, 30 Mar 2026 16:40:33 +0200
Message-ID: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
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

According to spec verify PTA entries in reset / suspend scenarios.
Extending parsing to media gt was necessary as it may contain
different PTA values for main / media gts.

v2: use pat debugfs instead of pat_sw_config
v3: add hw/sw PAT compare subtest
v4: simplify PTA comparison subtest (Matt)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Zbigniew Kempczyński (5):
  lib/intel_pat: Support other than gt0 during parsing debugfs PAT
  lib/intel_pat: Expose getter of PAT registers
  lib/intel_pat: Set PTA + ATS PAT entries to invalid value
  tests/xe_pat: Verify PTA PAT entries contain expected values
  tests/xe_pat: Verify PAT registers are properly programmed

 lib/intel_pat.c      |  51 ++++++++++++++++++-
 lib/intel_pat.h      |   3 +-
 lib/xe/xe_query.c    |   2 +-
 tests/intel/xe_pat.c | 114 ++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 165 insertions(+), 5 deletions(-)

-- 
2.43.0

