Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F11EB7EAC
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 09:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26AF10E1BF;
	Wed,  4 Mar 2026 09:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFUfVSUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306B310E1BF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772615815; x=1804151815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YIt5cmIfykopZlXYaFoZZO4hYyXezh/CW/Q6xVSgpDk=;
 b=lFUfVSULW7xF1aiB9VAn7I2OacU5F3Zo2J/XLaceXg35DdN/yrKpdkh1
 P7rVRtu5FPpliiuZgu/VbkRfezvJuli5e/QQycwLb9Lirn3y97B4wu54Y
 TLJh7EfofI5X0tTj0qUl6Em8srRS8GZEMdlnFvF0y5pQD8jjXn3o8dCgf
 JUjRQk5pgUzu+4m74TPLFEy1xIJkyQ0CVNa4GyUlgVWsHcLN1+BIJ3i/s
 YQXhnU18LccmnFR5m5cpLQvvGzGRhSOxUT/dI+O/szOWye8oNaCpOXgDu
 7Cfj6QjdVo+nKfIzIq4K0u48EbR+2KhlP22BMmTHt3hwJnynq7yQBJNKK g==;
X-CSE-ConnectionGUID: k/XGLEsiS7qZNfkuGW6Rpg==
X-CSE-MsgGUID: RLJlRlx9RFKmMiyg9seh2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73579520"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73579520"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:16:55 -0800
X-CSE-ConnectionGUID: nzbBf/8ESo+OG+dMhMMnqw==
X-CSE-MsgGUID: COmyzIQTTheYzJNBvorwrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218237101"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:16:54 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v5 0/5] Extend compute userenv to support user passed
 buffers
Date: Wed,  4 Mar 2026 10:16:50 +0100
Message-ID: <20260304091649.72814-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add support for user passed buffers in compute userenv. This allows
users to pass their own input and output buffers to compute tests, which
can be useful for testing specific scenarios.

v5: updating commit descriptions, no functional changes

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>

Zbigniew Kempczyński (5):
  lib/intel_compute: Add types for input and output buffers
  lib/intel_compute: Extend userenv by adding input and output bos
  lib/intel_compute: Enhance Xe3p pipeline to accept user data
  tests/xe_compute: Extend compute test to cover user passed buffers
  tests/xe_compute: Use appropriate feature in compute-square tests

 lib/intel_compute.c      | 191 ++++++++++++++++++++++++++++-----------
 lib/intel_compute.h      |   4 +
 tests/intel/xe_compute.c | 154 ++++++++++++++++++++++++++++++-
 3 files changed, 294 insertions(+), 55 deletions(-)

-- 
2.43.0

