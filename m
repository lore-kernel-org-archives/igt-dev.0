Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E18CAC583
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 12:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3475310E251;
	Tue,  9 Sep 2025 12:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/M0XYhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BF210E251
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757422020; x=1788958020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TqAUT+JEM8b49J4ez9HGrGIXlrLjsQQ7r0tvN+zqKF0=;
 b=m/M0XYhyi7OI/3mLrlNmrKuHakiPBB83jcUYDAjpG79kEr/7fUS1XUwH
 x1IexL4nWg7gEQhA1WnjVb0pTDnLAFU5fRkzJFPONzPIXGE/OpoG5qFY9
 49yXShTNyE44cbyvCzhmpruuS1YzMPqunhlOJfMcn4SvFi6Qn6CQzWxdR
 QFvfG8X00RYNEXwTyvNJgzwDXkvq4CT7FjkOu450Pb3IcBjb6qscsdPie
 QN0sQvQgowrI4WIPf4e6Wtj+7fg9vfmVbLZTWyknjqcrzMbyD7MCTYgH6
 ryPeUZkZPpHiCPJ/geKFxywJbA2c27lsUpbH0YxYqGiPPvrAuoFG/7odV g==;
X-CSE-ConnectionGUID: DHVHtYuxSmipnr6UwjO2RQ==
X-CSE-MsgGUID: insE89WbSiKQH92S6aYXGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62330824"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="62330824"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:46:59 -0700
X-CSE-ConnectionGUID: 5+dyGM48RF6+FXPMDIcpaQ==
X-CSE-MsgGUID: ITA6Bf3zRjqLANxEtXHOnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="203850711"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:46:57 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t v2 0/2] runner: Add new option --disk-limit-per-run
Date: Tue,  9 Sep 2025 14:46:49 +0200
Message-ID: <20250909124651.173431-1-kamil.konieczny@linux.intel.com>
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

Add new option for global disk limit, with disk used accumulated
between each test run. This should allow to plan resources used
by igt_runner.

Also add an alias --disk-limit-per-subtest for option --disk-usage-limit

v2: fix compilation, make options shorter, add explantaion for dynamic
subtest. (Kamil)

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Ryszard Knop <rk@dragonic.eu>

Kamil Konieczny (2):
  runner: Add alias option disk-limit-per-test
  runner: Add option disk-limit-per-run

 runner/executor.c     | 70 ++++++++++++++++++++++++++++++-------------
 runner/executor.h     |  1 +
 runner/runner_tests.c | 58 ++++++++++++++++++++++-------------
 runner/settings.c     | 23 ++++++++++++--
 runner/settings.h     |  1 +
 5 files changed, 110 insertions(+), 43 deletions(-)

-- 
2.51.0

