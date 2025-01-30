Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C1C0218F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ECB10E02D;
	Thu, 30 Jan 2025 17:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DwwrZEAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59AA10E02D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738256700; x=1769792700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=USWVds63mCcFflsPnAnafGiwPQsO3OY+ySHF9SGBL7I=;
 b=DwwrZEAL2/jNe7sC4qN8vcVla3TOGdo9VY/3Dnzwrh46nGAU5eB6EzOE
 DYHFyroTSxFNNEUiJ5/puKqBDl/pRgNdXwAWNshyyAPqrAVDK1RO9v9UU
 SxhcHTMurVQlovrOjI3UalAYtdFRnyimJrWzWEbF/D7rASMEHNeMuRqaM
 +7ouhestXngHlpgfnrgZE4XZCVtHARDqKGlUiSd5yyRbgOG4IpkuYgopT
 XFD69mFvyiRmFkiPWZlAhhCfQ0SyEWAzxJ6dflzie5TA48aOCZ6WsYY0V
 MT3dWL1uRto35JASQVpprOIYdZXAshR+BpltMNunSlxHnnx2XpC7g38Yx Q==;
X-CSE-ConnectionGUID: E6ICqXL2RJ+5LI1teiK/Gw==
X-CSE-MsgGUID: 0U5ftlEKQJ+L/qRBKVtyVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38953330"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38953330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:05:00 -0800
X-CSE-ConnectionGUID: bCfEk3fwRXiHBJhpOcA8pw==
X-CSE-MsgGUID: gkDIf3YYRty0rWsltiIkpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109241020"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 09:04:57 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/6] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Thu, 30 Jan 2025 22:50:25 +0530
Message-Id: <20250130172031.4126606-1-jeevan.b@intel.com>
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

Added my changes on top of Kunal lib changes.

Jeevan B (2):
  tests/intel/kms_joiner_helper: Add lib changes to check joiner is
    enabled
  tests/intel/kms_joiner: Add a new test to validate non-joiner mode

Kunal Joshi (4):
  tests/intel/kms_joiner_helper: helper for joiner-related functions
  tests/intel/kms_mst_helper: Add helper for MST-related functions
  tests/kms_feature_discovery: Add tests for UHBR/non-UHBR over SST/MST
  HAX: DO NOT MERGE

 tests/intel-ci/fast-feedback.testlist    |  13 ++
 tests/intel-ci/xe-fast-feedback.testlist |  14 ++
 tests/intel/kms_dp_linktrain_fallback.c  |  28 +--
 tests/intel/kms_joiner.c                 |  93 ++++++++--
 tests/intel/kms_joiner_helper.c          | 217 +++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h          |  17 ++
 tests/intel/kms_mst_helper.c             |  48 +++++
 tests/intel/kms_mst_helper.h             |  10 ++
 tests/kms_feature_discovery.c            | 177 ++++++++++++++++++
 tests/meson.build                        |   6 +
 10 files changed, 586 insertions(+), 37 deletions(-)
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

-- 
2.25.1

