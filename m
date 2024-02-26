Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD18C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 07:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4D10EEDD;
	Mon, 26 Feb 2024 07:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8v0uiFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AEC10EEDD
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 07:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708932395; x=1740468395;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/+OsAQvAH5khjrc3MIoqGYvC+Jlax6C9KM798ODpX34=;
 b=K8v0uiFGedEttpEHgz8Oej998F0pDLFo+Vsi+aJMp92HrvtzDgFgInSE
 y59VtAd2sp7ah7Rw5qkXFWr1i7pe0wrE8swrSqMc2D9VkW+Ef/FIJMa4a
 ibQAbe3BUBeGy6mnq2vqxjEU5GSa0l81SqFbSBd561W0KT+EeEsMxrjl6
 S03Ffa6+6CYdBl0OIqujbOWS0bTAA/dirCjfVW/SAVg3d9kjGTw4Lhsdm
 3JAz6JdFtYJ1tPDqaZDkb6VyP6ktInadVhTsPVkStrRNaZQ7YE0YkQqAQ
 zYWzTNad321ADbPBBaiyqSeJMOLSIJd3Ipk5t1cvH+pWJYQxwmTlbU25I w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="6147554"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6147554"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6923228"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:32 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v6 0/9] tests/kms_vrr: Modify kms_vrr to allow flicker
 profiling
Date: Mon, 26 Feb 2024 12:50:26 +0530
Message-ID: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
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

V4:
- Rebase
- Minor cleanups

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
 tests/kms_vrr.c                          | 275 ++++++++++++++++-------
 3 files changed, 208 insertions(+), 81 deletions(-)

--
2.43.0

