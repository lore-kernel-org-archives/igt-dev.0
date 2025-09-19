Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF685CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E6210EA5A;
	Fri, 19 Sep 2025 17:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OakEhO/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5781610EA5A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758301517; x=1789837517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b8jKDUbSV9V7QdUlMukkV88YBFTwFlcwamlHpQBA/eA=;
 b=OakEhO/AxXz265T1k/Zp6LsqQBrswGSbhebbPYJiflrnJgrpMN1D5rzF
 Qv+opw2zA58NkKgTB1NB9AbpZHLRKPBpABKn/h63VEUzRnBe/q9TnaMbX
 gdQskncvChOVQLTjgDSCcg+ymIgpX8R3Vl9fvA/xmqO191Jofl81Ftk46
 g6I4tEUEbTsjiSFMLZeo1EkgY0fH6knJMeYdQ/yzNHtQHTih8j/O6rjtO
 Yk3ZaWqLo34Hiz3pz2/lEK9UUDTxe65y2Qjh6DpIqLn0KIkGPqUhl8zFr
 oqGSDhv+V0LxnT2sAUPY9qfdoxKYl/clMv3yztwjIcSYM6eFnnujToyOW g==;
X-CSE-ConnectionGUID: UqwB4D0uTGerYjDA9lzMmw==
X-CSE-MsgGUID: z36gjESyTnO8WATipSSiww==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59691325"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="59691325"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:17 -0700
X-CSE-ConnectionGUID: nCBiJKPvTK2y8gq3X5Hfgw==
X-CSE-MsgGUID: AFgrxifcTcK6Mv5RljSY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175131726"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 10:05:15 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 0/4] Convert core_* and one xe_* to subtests
Date: Fri, 19 Sep 2025 19:05:06 +0200
Message-ID: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Convert few tests to have one proper subtests named 'basic'.
For get_stats add also all-cards subtest.

Kamil Konieczny (4):
  tests/core_getclient: Create basic subtest
  tests/intel/xe_noexec_ping_pong: Create basic subtest
  tests/core_getstats: Create basic subtest
  tests/core_getstats: Create all-cards subtest

 tests/core_getclient.c            | 49 +++++++++++++++++--------------
 tests/core_getstats.c             | 46 +++++++++++++++++++++++------
 tests/intel/xe_noexec_ping_pong.c | 15 ++++++----
 3 files changed, 73 insertions(+), 37 deletions(-)

-- 
2.51.0

