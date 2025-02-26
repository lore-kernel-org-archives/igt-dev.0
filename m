Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CD6C021A4
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 04:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B3E10E848;
	Wed, 26 Feb 2025 04:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjrncthp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A3E10E848
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 04:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740543163; x=1772079163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nNLQgrtyrrUz6YcMHD/5G7CFBtC06NQBgd9wpE8sWlk=;
 b=fjrncthpbCdqMSuqXVcYVg/L8AYL8jVn4LZ78JIzq7hnEToZcnRRyDmV
 Uni4u8lno/5mTUGoQVRChDx2bM0ZhD4mqgglW7xUOJzAM2aLOovOR+YLr
 0pkK4yjv4lkKdZfeNxzpikmO947ZDLEhF+U/R6l+HB96VsHyq08NU4CbO
 kLKtXCKCvwG26wQuOy8GE2OnYDKeG0heuikvbROKFstFPEljyhR62y2dl
 iBcJgkluzcwLYhVqgv6nBsHTje3CGcGlW3xHKRAxQm7dCtCBCrPOrWQcJ
 5Be01SJqNJhZWWD3Xq7YJ7KPbzZHiG5At9dLOlk43whRC6evmOrWxgkLc A==;
X-CSE-ConnectionGUID: qXhiqjxPSrueEEF7YeoDdg==
X-CSE-MsgGUID: 0NoqrKO3R4S7WNtAxK76Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40557449"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="40557449"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 20:12:43 -0800
X-CSE-ConnectionGUID: PvDBG7x0T8ei0/FwQJ7oKQ==
X-CSE-MsgGUID: AQMh0irXQS6gARjS06AEzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="116592092"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 20:12:40 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 juha-pekka.heikkila@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/1] Add FBC Dirty Rectangle tests
Date: Wed, 26 Feb 2025 09:38:50 +0530
Message-Id: <20250226040851.2399085-1-santhosh.reddy.guddati@intel.com>
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

This feature allows FBC to recompress a subsection of a frame.
When the Dirty Rectangle Enable bit is set in the FBC_DIRTY_CTL register,
and there is a sync flip indication, display will read the scanlines
between (and including) the Dirty Rectangle Start Line and End Line,
in FBC_DIRTY_RECTANGLE, from the uncompressed frame buffer.

Utilise the FP_DAMAGE_CLIPS property in the below subtests to validate
the feature.

1.Implement basic tests for Frame Buffer Compression (FBC) with dirty rectangles.
2.Add tests for dirty rectangles outside the visible region.
3.Include tests for dirtyfb functionality.
4.Support different formats in FBC dirty rectangle tests.
5.Ensure proper CRC validation for each test case.

Santhosh Reddy Guddati (1):
  tests/intel/kms_fbc_dirty_rect: Add FBC dirty rectangle tests

 tests/intel/kms_fbc_dirty_rect.c | 569 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 570 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1

