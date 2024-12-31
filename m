Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628DDE77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 13:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E423510E0C4;
	Tue, 31 Dec 2024 13:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvg0tFN1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EC410E0C4
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735653584; x=1767189584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fGJN2Eh8/vu5rvCnDySkxTLBv0IZHgadZ15R/Oh16Zw=;
 b=cvg0tFN119pyecbhn2nDXaPcuQU7paXQzwmA7h7arx4aKzvYogXIoPfI
 1+Q5sCqCIbShVxwkRKxfKMDeW+S14cjmU6rsGICzLCsM78Jm2BYWaF9k3
 s7lMYjIwGxTYZm5FHfM7mLq05TiBplY2X31nsuoQFtif9+CwA9OZ3Tpqa
 OQLoSLRwtijBvCmFqha/Jo5hyM3d33nevdE4E6+rxSv+IvipI0joKTImr
 JE+gMqKKdOOenmYp/5mNjl+fEecSHdvXlnVXtQy09rGzDThS86YYA6M9Q
 K5CRYKh+Ovvhs03I78xVI4cInUi733T38dk/qqSQCdq3GnndjfEzlIoEP A==;
X-CSE-ConnectionGUID: 7LNktLc9SAifFcxCkOeEDg==
X-CSE-MsgGUID: oxFVxTD/QdKfIEDVQQVhBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36047297"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36047297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 05:59:44 -0800
X-CSE-ConnectionGUID: s2Ms7UvCT1C5xFH9DQsxwQ==
X-CSE-MsgGUID: qdhmc3qNTnGfwlprw7gYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="100820127"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 05:59:42 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/4] add test to validate uhbr/non-uhbr over sst/mst
Date: Tue, 31 Dec 2024 19:45:14 +0530
Message-Id: <20241231141518.765212-1-kunal1.joshi@intel.com>
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
 tests/kms_feature_discovery.c            | 171 ++++++++++++++++++++++
 tests/meson.build                        |   6 +
 10 files changed, 463 insertions(+), 37 deletions(-)
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

-- 
2.25.1

