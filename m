Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9DECD0421
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 05:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B6510E37D;
	Tue,  6 Jan 2026 05:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9yMZBcv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B8E10E37D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 05:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767677535; x=1799213535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LyNCHBsyaxBrE6dL1TnjUQwVy1vHIBEWyyJ/A+hGsIw=;
 b=e9yMZBcviOSrRoP2jCrGl/3POya3wzsXOatkhq17hdrBbxWVyTlYG5D0
 rumtsL40lpELXWXBL8AsYGXAjklyKnLcfws4o0Hc7EUv0QAL9ou1Wpoij
 XBS+DQhGcv9RJVaxozibYeSkBAflx31LI5bVG0YycTDyVTU93gRTo3o+v
 oQKyNDnV916FBIy0+9BkOWbnRQxIRl85KQjHJlneSvccTXfibk9EKh5Nc
 O//QcxZ3itHN2ylW0tfMLwpYHDfFW6t7eh0Bph0ZJdwGNoQOyhbm13P+C
 BfJpoHx1utDmCL+LFyStkwkQMmsOESdN/PL30s4OnSrlRXol9c+xU85Lm g==;
X-CSE-ConnectionGUID: +owo3eRwStiSfcs88IisKw==
X-CSE-MsgGUID: hLTUkCGGSnSjAaUCxR5m0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71621980"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="71621980"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 21:32:15 -0800
X-CSE-ConnectionGUID: bb6dijnaT9+CsaukemMmpw==
X-CSE-MsgGUID: Kror5gInTDysnNNhI6wjMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201707715"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 21:32:13 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/2] PSR2 Selective Fetch detection for async flips 
Date: Tue,  6 Jan 2026 11:00:00 +0530
Message-Id: <20260106053002.104612-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series fixes PSR2/Panel Replay selective fetch detection that was
failing during test execution, causing cursor tests to run on non-PSR
panels.

Santhosh Reddy Guddati (2):
  lib/igt_psr: Fix selective fetch detection to check sink support
  tests/kms_async_flips: Fix PSR2 selective fetch check for cursor tests

 lib/igt_psr.c           |  9 ++++++++-
 tests/kms_async_flips.c | 23 +++--------------------
 2 files changed, 11 insertions(+), 21 deletions(-)

-- 
2.34.1

