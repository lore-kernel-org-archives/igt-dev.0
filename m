Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A463FCCD193
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 10:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DC510E76B;
	Wed, 15 Oct 2025 10:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCK7R1tR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473AD10E76B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760522531; x=1792058531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vKAve1gv1Cg1L0NP3Ak/MegCXrQdBXaONH8JpVpnXWQ=;
 b=GCK7R1tRg0d7QwSNiZTA6Z/J14yjVz2HV1qFn/67UcqEhMDeZBgr6XO5
 d5DQc8QuwSF3pHIL6yWpogIKgIPZCigD7s6tUWHnvwbgB6fA246Jrg/Bk
 wArpAC3A6l36oumr1+BgbJCNfK+6fJSCedKxzODempH0rgSncddLamERM
 WJ48fLQuzy8Emfcvd06DpSWgOnCXJtM3AN61i9gDJ60VPhf8z2I9kVNps
 1vcThglw61hYbxH9w7YXHJPOMyi/kYqeKRDTZ9zxcqSIP3sAGOiHbpozq
 IkHTkhvMc3mpq6wJ3dU17gIc/nAEDZhZ3kdG3lp+jZMLjKBhtiitqWlC7 Q==;
X-CSE-ConnectionGUID: RePysDN4RG6bdtpHs7J87Q==
X-CSE-MsgGUID: 4F3zcf3HTLuc1LSpgnDCwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62590177"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62590177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:02:10 -0700
X-CSE-ConnectionGUID: 1M9zXRgTRmS9jotp06GFNw==
X-CSE-MsgGUID: auG2rUqoToGF5RtPIjmnCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="205835539"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:02:08 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] extend link training test cases for eDP connector
Date: Wed, 15 Oct 2025 15:47:53 +0530
Message-Id: <20251015101759.3982477-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Rename kms_dp_linktrain_fallback -> kms_linktrain_fallback
and kms_dp_link_training -> kms_link_training.
Add support for eDP connector in both tests.

Note : On local testing eDP fallback is failing,
Seeing eDP/i915_dp_force_link_retrain as 1, so link isn't retrained
and fallback doesn't happen.

Kunal Joshi (6):
  tests/intel/kms_dp_link_training: rename to
    tests/intel/kms_link_training
  tests/intel/kms_dp_linktrain_fallback: rename to
    tests/intel/kms_linktrain_fallback
  lib/igt_kms: add helpers for connector type
  tests/intel/kms_link_training: extend test for eDP connector
  tests/intel/kms_linktrain_fallback: extend test for eDP connector
  HAX: Do not merge

 lib/igt_kms.c                                 | 74 +++++++++++++++----
 lib/igt_kms.h                                 |  9 ++-
 tests/intel-ci/i915.fast-feedback.testlist    |  7 ++
 tests/intel-ci/xe-fast-feedback.testlist      |  7 ++
 tests/intel/kms_dsc_helper.c                  |  2 +-
 ...dp_link_training.c => kms_link_training.c} |  6 +-
 ...in_fallback.c => kms_linktrain_fallback.c} | 43 +++++++----
 tests/intel/kms_pm_backlight.c                |  2 +-
 tests/kms_atomic_transition.c                 |  4 +-
 tests/kms_hdr.c                               |  2 +-
 tests/meson.build                             | 16 ++--
 11 files changed, 126 insertions(+), 46 deletions(-)
 rename tests/intel/{kms_dp_link_training.c => kms_link_training.c} (98%)
 rename tests/intel/{kms_dp_linktrain_fallback.c => kms_linktrain_fallback.c} (93%)

-- 
2.25.1

