Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD76D2504D
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 08:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BBA10E316;
	Mon, 12 Jan 2026 08:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3/EMm6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CC810E316
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768207738; x=1799743738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=verq99sq5XwCBqr2tmiAF7MaKE2n+NfjlbJK9YEncLg=;
 b=B3/EMm6m76Q5FCcjOvimJ+JHKP7l0WCME7uQJ5+7w+4QKoeCUXc1iT/E
 CmC2Mfvugfk+EvWFNi3G3TlrJUx3MmkKe8PjUiMk8NFjYOJyq/B6rgMUz
 M4QzLzm9FYr1mecWDriufXm1B00pI6UPxjwubjm6OOzWdHUzmMgNUmWn+
 +yDctBPiWsM1uQXvsYqVyUQXK7AA1rAmLxCvlxBt0YURFMCmjWJbgQw6K
 nILGWv2VR+Hk63+C3kDyxNW+4grsBDOu7CPQwIyil9qNO8eeM6SdaGVoR
 iTL4WXU8xhN+vOR1dQsIy/9vn7FpJO+5YSK6Vy1DmkST4NGzS8WKezqVL Q==;
X-CSE-ConnectionGUID: bFKCtSp3Q9G9YaAXMfI8GQ==
X-CSE-MsgGUID: 6fb4A4XDSF++Ozdoi5+Kjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69461964"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69461964"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:48:57 -0800
X-CSE-ConnectionGUID: Xlwg6WkaRbyoNFOc9Gh6dQ==
X-CSE-MsgGUID: vyLEoIzKSRKRRm/yTbyDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208562164"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:48:56 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, swati2.sharma@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 0/2] Add helper to validate modes
Date: Mon, 12 Jan 2026 14:14:53 +0530
Message-ID: <20260112084455.157949-1-karthik.b.s@intel.com>
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

Add a helper function kmstest_mode_is_valid() that checks if
a given drmModeModeInfo pointer is non-NULL and has positive
width, height, and pixel clock.

This allows tests to safely check if an output mode is usable before
assigning it to a pipe or creating a framebuffer.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (2):
  lib/igt_kms: Add helper to validate modes
  tests/kms_joiner: Add check to validate mode

 lib/igt_kms.c            | 14 ++++++++++++++
 lib/igt_kms.h            |  1 +
 tests/intel/kms_joiner.c |  1 +
 3 files changed, 16 insertions(+)

-- 
2.43.0

