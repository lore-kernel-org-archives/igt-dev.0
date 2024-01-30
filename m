Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61170C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1158112131;
	Tue, 30 Jan 2024 05:49:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBD4112131
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706593754; x=1738129754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3v6K0rYmOYOB/aBX3VTyF+1wrdACiPVq3pIv+eJoL00=;
 b=DknnWGM8DF7uiuGErcbPDeehGBec0iz8h4Cria6wqvQsckCjHYkFGxd/
 R6gRwP2bFQHdjZvtOxpAsVzPUIQM7IhigIt/zjOVf4pyceIROGIUVbnI8
 Ty6YCw9LOgQ0BRzYWpNB0uwP4r9LEVOyLzoLqdLh5ek+XTYtkZvYNJYHH
 IjAqb2YOgnR8H9E9iZNYOodc5A09t2SAUEmiM5F8ItgXrDdCgM1ZWiUOD
 NRAWxHQKJcJJV2KepfPQlu1HzA49V8iwWb0PQkftsqOJCW/d3tpLQuHsQ
 lTCyZjYBB6fL43fQfNe5KXB/UjtHEyWmKkrVLikdlL0uZw6BN/UImE/dX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393609591"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="393609591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3603115"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:11 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v5 0/9] tests/kms_vrr: Modify kms_vrr to allow flicker
 profiling
Date: Tue, 30 Jan 2024 11:12:26 +0530
Message-ID: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
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

Do some cleanup in the kms_vrr test and add some optional command line
arguments to alter the target refresh rate for the test. This allows us
to profile VRR flicker on panels at the low end of the refresh range.
This series also adds a new 'maxmin' subtest which alternates the rate
between max and min every frame.

V2:
- Address the review comments from Bhanu
- Add a new maxmin subtest which alternates the rate b/w max & min every frame.

V3: As communicated in IRC channel #igt, I am doing this revision on behalf of
Sean Paul.
- Rebase
- Add testplan documentaion for 'maxmin' subtest
- Minor cleanups
- Hax patch to test VRR in BAT

Bhanuprakash Modem (1):
  HAX/DO_NOT_MERGE: Test VRR in BAT

Sean Paul (8):
  tests/kms_vrr: Move fb0 and fb1 to an array
  tests/kms_vrr: Move vtest_ns into data_t
  tests/kms_vrr: Allow test rate to be altered from the command line
  tests/kms_vrr: Allow test duration to be specified from the command
    line
  tests/kms_vrr: Change the pattern displayed in the test
  tests/kms_vrr: Add ability to flip static image for flicker profiling
  tests/kms_vrr: Allow for multiple rates in a test
  tests/kms_vrr: Add a max/min test to oscillate between rates

 tests/intel-ci/fast-feedback.testlist    |   7 +
 tests/intel-ci/xe-fast-feedback.testlist |   7 +
 tests/kms_vrr.c                          | 272 ++++++++++++++++-------
 3 files changed, 205 insertions(+), 81 deletions(-)

--
2.43.0

