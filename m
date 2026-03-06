Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E555F01814
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 09:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE33510ECBB;
	Fri,  6 Mar 2026 09:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YA35aRPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012EF10ECCB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772788479; x=1804324479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Xs7jmoAjgiONMM50Gk8U0/UGZed7u3bWgePas1ongk=;
 b=YA35aRPkgknzyMhnVLmspJQZBbprvw8wOrgVxtva0Tol+881uDdql/m8
 JMu5UKMx2BoIYEqafwFNwY54o0+cStXlDnAipOlkjrKGTN+7c4AG2+feg
 B3pawyLrQv0CTYQhhKw6AU+BE9WK73seMpYVGTi7anHY/vWBqi3PcfwjO
 uxpwLGs3+jZNdU+sF0OaqFg1gA5AIVQiE4b+W3ENwgc64VZO6uId8r/NC
 xg8JJHSJNXpGjFXb4CCnRKoGPCmYCGdSTrgpAatRBp4ciV1+hF2BlUviO
 N2KnpLWJPHwCjhjlOfcRQbfbHTfBuLQGCBeqG7gZA8rMaoF6EZmq8EGHJ g==;
X-CSE-ConnectionGUID: CdosUPMsSOKJUczqlvnHfg==
X-CSE-MsgGUID: 78fn33u9R9+0tv+wiJ4oqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77494758"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="77494758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:14:38 -0800
X-CSE-ConnectionGUID: 6aD9wf3USRGwfuCfMbVn0Q==
X-CSE-MsgGUID: gF8M8HebQi+Uq2EQQZTTSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="216106572"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:14:36 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v7 0/6] Extend compute userenv to support user passed
 buffers
Date: Fri,  6 Mar 2026 10:14:31 +0100
Message-ID: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
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
v6: fix PVC path, but as it requires pipeline rework limit iteration
    number and fix in the future
v7: fix PVC pipeline and replace shader

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Zbigniew Kempczyński (6):
  lib/intel_compute: Add types for input and output buffers
  lib/intel_compute: Extend userenv by adding input and output bos
  lib/intel_compute: Enhance Xe3p pipeline to accept user data
  tests/xe_compute: Extend compute test to cover user passed buffers
  tests/xe_compute: Use appropriate feature in compute-square tests
  tests/xe_compute: Change shader and local max x on PVC

 lib/intel_compute.c            | 200 +++++++++++++++++++++++----------
 lib/intel_compute.h            |   4 +
 lib/intel_compute_krn_square.h |  59 +++++-----
 tests/intel/xe_compute.c       | 154 ++++++++++++++++++++++++-
 4 files changed, 327 insertions(+), 90 deletions(-)

-- 
2.43.0

