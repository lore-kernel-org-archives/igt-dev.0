Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE00C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 09:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1434F10E7DB;
	Thu, 15 May 2025 09:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUulZyyS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F19810E207
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 09:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747301305; x=1778837305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/DScoYBSfY+3V51cKya3B6FptyysSckRvoCmq/ae89I=;
 b=PUulZyySsYRvB+LDbmY0v+XkyE0eBmD4c8pMHKKI99Cy9lJ63qzgt5FI
 cRfqhYiljfevlWik20KWyZruzAxDn91Nu5Gid66fYUJKh//VsyPL9bw7x
 vkSGGXqXd839OX8AVyKcdpZ63aItaPHzsqtq+Em8gpJNeCgNJCXw6KqTa
 j52XF99I2ydxX8/0GXBR/v+8YJ3p+gyFIxkrKzvwPeGPdzKB37xCJnfNX
 Nyxc1XIckq35SIizQ7NLjX+yKwyBWQ/UTpPailHDwTzPJVxRcBHwdyFOw
 jjxB5EALSI3GX4v+MSQAu9gFJKNFki76e46ncDfcetTiZ9t9LlNIXwjH+ Q==;
X-CSE-ConnectionGUID: XsUAV+plSv+N9HgtKg+dYg==
X-CSE-MsgGUID: A7WYPlQWSHiWy5JFPwks7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="53039191"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="53039191"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:28:25 -0700
X-CSE-ConnectionGUID: dQADRPcHRzCl/hBaha9d6A==
X-CSE-MsgGUID: 1BJ7DFDlTXG1ob5kAPaUgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138359836"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:28:23 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 0/4] Support for IN_FORMATS_ASYNC plane property
Date: Thu, 15 May 2025 14:49:20 +0530
Message-Id: <20250515091924.3294094-1-santhosh.reddy.guddati@intel.com>
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

Use IN_FORMATS_ASYNC property to get list of async modifiers
and improve async flips test to add coverage for the supported modifiers
and formats.

Santhosh Reddy Guddati (4):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers
  tests/kms_async_flips: Add test for all async format modifiers
  tests/kms_async_flips: Remove allow_fail flag from async flip tests

 lib/igt_kms.c           |  73 ++++++++++++--------
 lib/igt_kms.h           |   7 +-
 tests/kms_async_flips.c | 143 ++++++++++++++++++++++++++++++++++------
 3 files changed, 174 insertions(+), 49 deletions(-)

-- 
2.34.1

