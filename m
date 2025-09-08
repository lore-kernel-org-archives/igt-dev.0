Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087B7CA1016
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 17:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02110E595;
	Mon,  8 Sep 2025 17:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnBp9Yop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C89D10E595
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 17:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757353408; x=1788889408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p0Ld0Zcp0Mok453JNuLSCZCsddr8JMo7iKm3KP2iWtg=;
 b=hnBp9YopQwOQ/1mX2RuC+Q9D3wuDYSADh4mxlZYF9gnKVSZVbsKl2Bv0
 ovlpBr5bGjLSikvL1fNwRlJwdKwRw9oNysah0WOOXKzpFgVxp8/aGCSsE
 FGSiUvpEncSp/4SxHgv6rCGs8+WkGzAXyR3QksvbhPAwGJ9gWvd6iP1mE
 c+SpDKNkwU7W3cvsp5FkvvJ7/evh9m5Dhji700fBDdiLl5OhliHUsM1WG
 APbYCycTh+znkkPUwctpR4l2qWrFj66uF7EcqHu7Z8WL3vxqR+Ascd0Jf
 fzhzlB4umOabtDfkCXw9N2oaGJMeAYZZ78ZtBvaxBCFfclpiTz9u36AQg A==;
X-CSE-ConnectionGUID: sU4OnafjS/6TkK5Fh+2OtQ==
X-CSE-MsgGUID: XCBkUHIPRfamWr9csS+w0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58832409"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="58832409"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:43:28 -0700
X-CSE-ConnectionGUID: RwVapxwASPin0LdRRyEiOQ==
X-CSE-MsgGUID: 8wIyrK0xQcSzyuo1RRhh1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="172987738"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.244])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:43:25 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t v1 0/2] runner: Add new option --disk-limit-per-run
Date: Mon,  8 Sep 2025 19:43:17 +0200
Message-ID: <20250908174319.93968-1-kamil.konieczny@linux.intel.com>
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

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Ryszard Knop <rk@dragonic.eu>

Kamil Konieczny (2):
  runner: Add alias option disk-usage-limit-per-test
  runner: Add option disk-usage-limit-per-run

 runner/executor.c     | 70 ++++++++++++++++++++++++++++++-------------
 runner/executor.h     |  1 +
 runner/runner_tests.c | 52 +++++++++++++++++++-------------
 runner/settings.c     | 22 ++++++++++++--
 runner/settings.h     |  1 +
 5 files changed, 103 insertions(+), 43 deletions(-)

-- 
2.51.0

