Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10103C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 05:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727B410E336;
	Thu, 29 Feb 2024 05:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9eh4vmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CC610E276
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 05:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709183934; x=1740719934;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aayB+q6oakVoYK2nJqtQIv3qTQx/p59v2ReMYwn0Wx8=;
 b=E9eh4vmy2qH4ZE1Xqi2kJRGTjHTXkX/TZG+ePw2JMhXPo5agVn+0KED3
 SZz5h71C66ZpPNxOJSJ/7JO8XUcMxncBIKIFgd7FJJOX0K5ZT4oleTYsX
 nA8g8J8ZYogHNrStwP3cZZbj/SviC/IP5URT0ZuLuQVbmc/FQMQM9HzfO
 HQq37mo4cVOGKHSx6JcxwB36hC4/y+a3eERKNGEdwzOWt1aycWsil1Gzw
 epxGEdFMBvSui/IqgxM7QdysJW3YYuG3q7GoIHYxZlfej2R4s7lq8gIFN
 r7YVsnPhBJrBuNMl+cSPdiSo3MeoOGPQzWiRX8M6C6fBisOHVEOt2W0oI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14780742"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="14780742"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 21:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="12250002"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 21:18:52 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v7 0/8] tests/kms_vrr: Modify kms_vrr to allow flicker
 profiling
Date: Thu, 29 Feb 2024 10:42:42 +0530
Message-ID: <20240229051250.2939774-1-bhanuprakash.modem@intel.com>
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

V5:
- Drop HAX patches to pass the CI

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

 tests/kms_vrr.c | 275 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 194 insertions(+), 81 deletions(-)

--
2.43.0

