Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E5ECF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 03:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2CB10E368;
	Mon, 23 Sep 2024 03:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3cgR4wc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1D510E368
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 03:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727063510; x=1758599510;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CFBG8tY6s1AXrieeJx7mj1c2f4kVrYtKb1a8UyriRw=;
 b=H3cgR4wcr9eROJywI977A9GcHWLbJWAnDZl3ZMkgNWec0iZrLobr8+KE
 WlKYX5R/PRDWTrsVH78+y5sjhNnKMfxRtQmJPnTZf53T/5GC1PNGgBQCz
 k7SEQui68KtQbJuRtZ2DCeWf2+qdNtaG1GHusCC9OrBPLfJL1ZAWQDNuU
 96LisrXgEpBMGMmC1i4J9zHLbUTiTeNsSNgE28jVDa/ga5ScoVQ71hPEm
 OM/o3iobug9Gs/xEdKdXEEomZwvdnt4SiGM27TYkqviIi5WYixVSA1FSS
 jCg6vTPggilZh71XEss44yVL/2VasyOUT760GQGUpxqDBDOPMpK2NMNuT w==;
X-CSE-ConnectionGUID: 5uZSE/avRx+IZ1EwY6bKBQ==
X-CSE-MsgGUID: PMZWKVlyTgWzVmDGDxPHtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25941109"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25941109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 20:51:50 -0700
X-CSE-ConnectionGUID: j1GsabonRLus6nJxOIRaUg==
X-CSE-MsgGUID: T3qYf/xeQI+B0gRA47uXZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75882358"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 20:51:45 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com, vandita.kulkarni@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/2] tests/kms_async_flips: Async flips suspend
 resume test
Date: Mon, 23 Sep 2024 09:21:18 +0530
Message-Id: <20240923035120.673521-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces a new subtest to validate async flips during
suspend and resume cycle.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: Async flips suspend resume test
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 178 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 284 +----------------------
 tests/kms_async_flips.c                  |  15 ++
 3 files changed, 29 insertions(+), 448 deletions(-)

-- 
2.34.1

