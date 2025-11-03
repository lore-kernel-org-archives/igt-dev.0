Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE99CCFA04
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB5510E1B6;
	Mon,  3 Nov 2025 10:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpf0n9ua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A229D10E1B6
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762164243; x=1793700243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TwpGcy4wd/9YNRO7p72zovgQetgvods5CGFErI9bEpw=;
 b=cpf0n9uavZrar7/yw7QqLDbzxqCFMFyN2gSsdoAmJIkfyftS1Wxvw84x
 c/RzDqggj6ry1OtLiLbyrlJ11dSkQyTGfDz76i2Xguih+m4vceiLtm62W
 Ik8mSPYrnJcgbEWiljnXbh0Fzw7T27I1YiVSFURPzqzeHWNrfxskN5b4B
 /jIETpbIR00YahxpMT1gDGNNlnDNd8eKjA+VsAkPAlxTxjErOAo6HEH+c
 XW+VgbrZMfsSXOsY64/SFpDeCfomXx6nBpuzSSY7tvBkKGdI5/IGLluwd
 /kP3IfTfDAz6ZgoZ1eStPCIwTRDqrKvcxegQXW+2gld5dq71/S3esFQQm w==;
X-CSE-ConnectionGUID: WLsqhV2wTFea5F1RxczXew==
X-CSE-MsgGUID: iZH8NGq4SM6faTr0uJv9QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="63440342"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="63440342"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:04:03 -0800
X-CSE-ConnectionGUID: ILG17mwAQT2BJGVJXuWpvQ==
X-CSE-MsgGUID: sS3tmPZIRa+jQvWKRXTP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191936756"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:04:01 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v10,
 0/3] tests/intel/xe_survivability: Add xe_survivability test
Date: Mon,  3 Nov 2025 15:29:19 +0530
Message-ID: <20251103095921.3889090-5-sk.anirban@intel.com>
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

This series creates a new xe_survivability.c test file with two subtests.
i2c-functionality validates i2c adapter preservation in survivability
mode for AMC firmware updates, and runtime-survivability tests CSC error
injection, device wedged state recovery, and post-recovery GPU
functionality validation.

Sk Anirban (3):
  tests/intel/xe_survivability: Add new xe_survivability test for i2c
    adapter
  tests/intel/xe_survivability: Add new test runtime survivability
  HAX: Add xe_survivability tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |   4 +
 tests/intel/xe_survivability.c           | 267 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 272 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

-- 
2.43.0

