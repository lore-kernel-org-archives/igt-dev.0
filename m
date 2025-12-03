Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF8AD116F3
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A15910E11F;
	Wed,  3 Dec 2025 09:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/GI1h7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7940210E11F
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764753893; x=1796289893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GevhoqitanJ5vchMRm8mHl+Vpmhd8TN/wWZ9/Zk1rDw=;
 b=Y/GI1h7lx9Ese4XxNKkRV5lzojVZaLSajO7a0GNgQLgoGf2vsrbAvzFM
 UTqYK/n8R7obN6s4CmoBU2OmrlJnJpZZnPf3lVPBxcxXj5vum4K3hNE/0
 Qx9pexkZ9DUsqynWTAExAt+KgFrwRnVB4ooeiz4RWsm8vcGb/cjSocNN6
 xYVQa7EfWMF+5N0GApEP81FzMqyx6GhCLRcx/CVhhVjVKDRZxXXk+pAm+
 ASbbzMeUvE/8OWXezAQkdOT7mL5Xb+X96QX3EZ/BHZ7UnDLb4PmD0/UmZ
 yiWQXD/U7tQ1eQHmdApn4RRyxN4xlw0zdiqG/jSb+feK9w0Yf8gUiGInx w==;
X-CSE-ConnectionGUID: RMPo2yp6TSq423M6Vc++EQ==
X-CSE-MsgGUID: FZIMFJCySEqzDy2PQP4Skw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66783626"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66783626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:53 -0800
X-CSE-ConnectionGUID: ubHV7hkGSpqlY3fgoZUHIQ==
X-CSE-MsgGUID: xFKDrLGQSDSvzPwFGyzHmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="199569574"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:24:51 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 0/6] Add writeback changes for intel-supported formats
Date: Wed,  3 Dec 2025 15:13:01 +0530
Message-ID: <20251203094307.3187669-1-sowmiya.s@intel.com>
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

This series introduces validation for writeback functionality
across newly supported formats specific to Intel platforms.
existing functions with limited format support were retained
for compatibility. After validating new formats introduced by
the platform, additional format support was added to the
writeback test suite. Subtests leveraging common framebuffer
creation logic were consolidated and dynamic subtest generation
was implemented to efficiently handle format-specific variations.
Add negative test cases to validate format and mode.Refactored
existing test cases to improve efficiency.

Sowmiya S (6):
  tests/kms_writeback: Add support for intel-specific formats
  lib/igt_fb: Validate supported formats for crc calculation
  tests/kms_writeback: Add intel specific check
  tests/kms_writeback: Refactor format handling in commit_and_dump_fb
  tests/kms_writeback: Refactor writeback-fb-id subtest
  tests/kms_writeback: Refactor writeback-check-output subtest

 lib/igt_fb.c          |   6 +-
 tests/kms_writeback.c | 215 +++++++++++++++++++++++-------------------
 2 files changed, 124 insertions(+), 97 deletions(-)

-- 
2.43.0

