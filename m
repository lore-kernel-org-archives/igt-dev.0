Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068B7C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 07:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A320E10E4DD;
	Wed, 15 Jan 2025 07:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUkw9O1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C6110E4DD
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736925428; x=1768461428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ga+mLL4rkQ2UJwFCZkZlgXnKM67DNn4Oc0RCKP309K4=;
 b=TUkw9O1ppkyP0dAajPZVkBdU/kwd8elu3MAfhRQNOEqD2rzMTwHRc1wx
 BNNUcvBDVubqopAE8dsgHm4lw73rTdpGcmXoYandXl6QhTECnxRbtW4T5
 e/akxHw3cvZhnwWo2wcJionT3Ps7AMeeSE6ioNGcYfxez2PRFqj4/b/Ul
 ACMmINzJ9JndrhIe3RMo0z1SSmZ55hD3X+cHQNV/FX8MshT+keFrZQ5bu
 a5zLPa0TuzHOMWtBcdNAGpyum3BATesw/+hO5yNNLFrcwKayddT30gKam
 QV9DhFXoDag9rJoV6iXCDfZrYxw2F7kkh6VB3WPJIxFsbEVhNO4OmagUy w==;
X-CSE-ConnectionGUID: kXdUu9hUS4abzT4Am7Y5uw==
X-CSE-MsgGUID: 4TL3W4WTR6SbVoU1osKYYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40927868"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="40927868"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 23:17:07 -0800
X-CSE-ConnectionGUID: 8RDqST5gTQK2u/L+/Q8mBQ==
X-CSE-MsgGUID: 92RHgK+RRYGHqow4AUteMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="110008213"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 23:17:06 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 0/4] add test to validate uhbr/non-uhbr over sst/mst
Date: Wed, 15 Jan 2025 13:02:39 +0530
Message-Id: <20250115073243.2002014-1-kunal1.joshi@intel.com>
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

Add new test validating UHBR and non-UHBR link rates for
both SST and MST configurations. The series comprises three patches:

1. tests/intel/kms_joiner_helper:
   - Introduces kms_joiner_helper.c/h for pipe assignments taking care of joiners
   - Moves common joiner-related logic out of kms_joiner.c.

2. tests/intel/kms_mst_helper:
   - Adds kms_mst_helper.c/h for MST-specific operations.
   - Centralizes code for identifying and assigning MST outputs.

3. tests/kms_feature_discovery:
   - Implements tests verifying UHBR and non-UHBR link rates with SST and MST.
   - Uses the new helpers for pipe assignments and topology discovery.

Kunal Joshi (4):
  tests/intel/kms_joiner_helper: helper for joiner-related functions
  tests/intel/kms_mst_helper: Add helper for MST-related functions
  tests/kms_feature_discovery: Add tests for UHBR/non-UHBR over SST/MST
  HAX: DO NOT MERGE

 tests/intel-ci/fast-feedback.testlist    |  14 ++
 tests/intel-ci/xe-fast-feedback.testlist |  14 ++
 tests/intel/kms_dp_linktrain_fallback.c  |  28 +---
 tests/intel/kms_joiner.c                 |  15 +-
 tests/intel/kms_joiner_helper.c          | 179 +++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h          |  15 ++
 tests/intel/kms_mst_helper.c             |  48 ++++++
 tests/intel/kms_mst_helper.h             |  10 ++
 tests/kms_feature_discovery.c            | 177 ++++++++++++++++++++++
 tests/meson.build                        |   6 +
 10 files changed, 469 insertions(+), 37 deletions(-)
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

-- 
2.25.1

