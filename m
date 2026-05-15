Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34E3CD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 08:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6404E10F498;
	Fri, 15 May 2026 08:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9+FMCy3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41B610F498
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778835341; x=1810371341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d7LJ6pua/S5KbqzON2ch+FMKrUNDusEdChybXGtMBAE=;
 b=n9+FMCy3yL+f67PH6bLXrhKZtMzwbR31bwORi4oRO9HqaLE67Z3UO1d6
 p79VBSO1+PfASTiognefgKTg3KvxBQA9uxPI2/U/8mbPubWSaimJ/F7x0
 h+MDYzPcDvG7GQpnb9T/PpjfXaxcBaTWSSgk9qBZ5a431qPHFZobZJZ/0
 hnmfQacM79TvqZ95nbqN4WxQbnhgtOHurz8dPRhLIk0K/+jNvOvaO9d7t
 qJlJEU0acAKOgrCldYgFCUh8b5RgnrWRuBXyqwaoYR02DwKA5F+D8pHWq
 oIJtuWuyjAyQ1mgcAhSVQhDVsLnTLx68vUwAVsJdKz/lW5OEKCOMIt/ae Q==;
X-CSE-ConnectionGUID: 3sFUytZVTVCDf5kEyM9L8w==
X-CSE-MsgGUID: i+jKNz+fSleh6IO4d4szKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="102463703"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="102463703"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:55:41 -0700
X-CSE-ConnectionGUID: 7aSaao+7S4KAgavSZxmzdQ==
X-CSE-MsgGUID: DDdavl+lSzWD3b+ftPJMyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="262159767"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 01:55:38 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jason-jh.lin@mediatek.com, karthik.b.s@intel.com,
 fshao@chromium.org, navaremanasi@google.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/3] Revert HDCP per crtc infrastructure
Date: Fri, 15 May 2026 14:19:32 +0530
Message-Id: <20260515084935.697125-1-santhosh.reddy.guddati@intel.com>
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

Reverts below commits

b4036b1a0 tests/kms_content_protection: Add FB cleanup for MST tests
8d7c2453d tests/kms_content_protection: Pass crtc parameter and use per-CRTC FBs
925b14d43 tests/kms_content_protection: Add per-CRTC framebuffer infrastructure

The per-CRTC fb introduced in the commits caused regression especially
when the eDP panel is connected with 2 4k Panels connected through a
DP-MST hub with "-ENOSPC" and all the content protection tests are
failing.

The MST subtests are skipping when subtests are executed with "--r
dp-mst*" , as the MST changes introduced did not clean up properly
across subtests.

The create_fbs() now iterated through all crtcs and eDP (2k) claims the first
crtc before the larger output and fb is created with smaller size. Later when DP-4 maps to
the smae CRTC (it has differnt fb dimensions now 2k fb than the mode
required) , the kernel rejects the commits  with ENOSPC because of
invalid coordinates.

Santhosh Reddy Guddati (3):
  Revert "tests/kms_content_protection: Add FB cleanup for MST tests"
  Revert "tests/kms_content_protection: Pass crtc parameter and use
    per-CRTC FBs"
  Revert "tests/kms_content_protection: Add per-CRTC framebuffer
    infrastructure"

 tests/kms_content_protection.c | 168 +++++++++------------------------
 1 file changed, 47 insertions(+), 121 deletions(-)

-- 
2.34.1

