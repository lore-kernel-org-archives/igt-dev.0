Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9808CDD1B2
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 13:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FC410EC49;
	Fri, 27 Sep 2024 13:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1mNaNd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D66310E0CC
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445024; x=1758981024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k7Egve3QXijMAjmRWctQs9YSRV81RFb+0fjUN4QixGI=;
 b=J1mNaNd95GIOLNV9THEloK+QtDDbff/sH/HvR+VKuyNrVOMK4uSJcYkm
 Nh5skd1vJ7rI+zvLwgkbirbgj9JhM5QYvU/DkLa3ZZ5HcnC8S5V3o+n9P
 s2psSGNpkGZbFLja67MfZjP1Zf2E8ampA2KPIxEeymQXCYR5AQWUPRrJq
 POXDoZD3ivQm3ZlRly22wgZ6WS5fIdqUkQulCfKz8JwUMfXLrT/LqVKBN
 CAaZ14hmCZq3/KQii1C9VR6PVLcya5VKZUqrN0doL+UzeZTo4aR3cE4OM
 issQVbzUDyP7uLkcxiWlpmDCT65ZpHkwBRxCQUxZh4xdNhubM0lpSVxcH Q==;
X-CSE-ConnectionGUID: ZM29H1EURVubW6cV6nPOrw==
X-CSE-MsgGUID: 5ZbXUztoQSONRtNp5eQuAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49115998"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49115998"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:50:24 -0700
X-CSE-ConnectionGUID: gNIPWswOTPO34fPzvLj9Bg==
X-CSE-MsgGUID: xCuApRz5SH2wWJZBqn6j4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72850010"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:50:22 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] add test to validate fallback
Date: Fri, 27 Sep 2024 19:32:16 +0530
Message-Id: <20240927140222.1688565-1-kunal1.joshi@intel.com>
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

[1] provides debugfs interfaces to force link training
failures, retrain link, set/get current/max link rate/lane count.

add new test using newly exposed interfaces to validate fallback.

[1] https://patchwork.freedesktop.org/series/133624/

Kunal Joshi (6):
  lib/igt_kms: add DP link management helper functions
  lib/igt_kms: allow set and reset value to be same
  lib/igt_kms: add function to reset link params
  lib/igt_kms: fix helper igt_get_dp_mst_connector_id
  lib/igt_kms: Handle EINVAL error as well
  tests/intel/kms_dp_linktrain_fallback: add test for validating
    fallback

 lib/igt_kms.c                           | 371 ++++++++++++++++++++-
 lib/igt_kms.h                           |  11 +
 tests/intel/kms_dp_linktrain_fallback.c | 413 ++++++++++++++++++++++++
 tests/meson.build                       |   1 +
 4 files changed, 782 insertions(+), 14 deletions(-)
 create mode 100644 tests/intel/kms_dp_linktrain_fallback.c

-- 
2.40.1

