Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2630CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 09:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8996610E111;
	Thu, 14 May 2026 09:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwRuvIx6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3B710E065
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 09:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778751673; x=1810287673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1PHMPMXJih+axcp69QAsVzYbmZYjJ7+NQWs+/FYcryc=;
 b=JwRuvIx6k4AkWzp39FVPsRjuMptW0UenmKeez6pmdgh+uvcw4nco4F2A
 SYIEOWkC3is2W7WuVYgo/ioDjutUE5GlmUCBqd4SeAP9qXFG58C/BmRh3
 b+Mko3t7arvxoOBFrDGwNiaGNWMNzBPzCJLYFKahwbIiNty1ik8gT1oCS
 pu0XhERvZncXU8fwbRy5pThoX+1c4o2UjVDmBP9lgBpSi6kdDhtdZop7z
 3BUUOwEYV25P3xKNX/5nqVgvNouwDFMUZTPNtACn7MXrw0eV/2FMCIPwM
 9F7Uicgj5eQ3QEpMlFSWEbCGJAfahRh/zBaHXAu/lPUo2uCqbLpXKwieO w==;
X-CSE-ConnectionGUID: W7pb51I8TZ+ZuV337B4/hg==
X-CSE-MsgGUID: dCeuSH9PTtGl+a12dASipg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83560524"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="83560524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 02:41:13 -0700
X-CSE-ConnectionGUID: /CUuA3h8Q2CIJ7NiCxtcYQ==
X-CSE-MsgGUID: pN6+CS2WQti3WQlKNrgr3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237475565"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 02:41:10 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jason-jh.lin@mediatek.com, karthik.b.s@intel.com,
 fshao@chromium.org, navaremanasi@google.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Date: Thu, 14 May 2026 15:05:07 +0530
Message-Id: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
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
  Revert "tests/kms_content_protection: Add per-CRTC framebuffer
    infrastructure"
  Revert "tests/kms_content_protection: Pass crtc parameter and use
    per-CRTC FBs"
  Revert "tests/kms_content_protection: Add FB cleanup for MST tests"

 tests/kms_content_protection.c | 168 +++++++++------------------------
 1 file changed, 47 insertions(+), 121 deletions(-)

-- 
2.34.1

