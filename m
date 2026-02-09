Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F1DEE20BD
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A4610E339;
	Mon,  9 Feb 2026 08:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWJekOsR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B953010E339
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770625380; x=1802161380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Iut1ucP2n4b5ZA7WTzlBXfNYgDZB+NwTzCtr2WYdBAo=;
 b=HWJekOsRtOUrkUqhG7noTGAoTTrAq7elPhFmBGjFRDldiJ7SgG7f8w5Q
 uZMw6ZJ4xrRZyo/Mame+4y+V6rCvxeNrecMRZj38PjK09iGFWwKiUuOsL
 IY3z8TM4BUqdwbrgUR04SH5AQPDX99mpFIV5sl5XQ5vdmudHZ3MGzvIHN
 uePYX2D1mewtTjU/UO3OM9LroohPfm5j1Zod3L5XUk7fb+v8BR5mac8Si
 LvwEsjTj4SquCFeculNfW9jkfInpTAV3OrwIKC4sJVk4cphZVs+v2YJE9
 OYnEDS8Bo9fw44BocUZCGjdRq/oPZ278Dedg/JesHA5CyCMR5mXMahSmH g==;
X-CSE-ConnectionGUID: Y8PmRBhARd68GNPiz5VR9A==
X-CSE-MsgGUID: ajoBSQkbTayBThCo5RGwJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71718750"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="71718750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:23:00 -0800
X-CSE-ConnectionGUID: FL4TFUXHQDOozodEJm+IBA==
X-CSE-MsgGUID: W0QAA3FySAKM2aCm2Pb9Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211577196"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 00:22:58 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 0/2] tests/kms_plane: Refine clamping and modifier
 skips
Date: Mon,  9 Feb 2026 14:03:29 +0530
Message-Id: <20260209083331.1088550-1-pranay.samala@intel.com>
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

These changes avoid running source clamping tests on cursor planes and
skip modifier subtests that are not supported on the target display
platform.

Pranay Samala (2):
  tests/kms_plane: Skip cursor plane for source clamping
  tests/kms_plane: Skip unsupported modifiers

 tests/kms_plane.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.34.1

