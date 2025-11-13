Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3066DCD4F50
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1F910E64E;
	Thu, 13 Nov 2025 08:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGVOSOnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C2A10E64E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763023205; x=1794559205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=APUcOfZaFs2VcjxYVKVhMz3CKxNJCfuZsxCD1EWMhLQ=;
 b=aGVOSOnYP98kVmuE38leulordsGlBXlY39XcIkBoPSjLzJuEon6ceSsa
 XzMO3meEN5lffeWSbjYhCkNNJOEgPSagHixWoHJtVg1gm1sbHEGIH7Rvv
 +y74uLmOTEK+qr8qHX1fE88H5kInhiSSCgvizDazB7wubfxKVpghLqgSN
 c2yM9GTUP7oeDtTCtto45oiEqV4JXGlCYqCu8DDfv/Jj0tRyRfDaFyiJf
 snF20KQqwpB2taqhyR1RoQOXvr/xFIOqJwxq4CS6zA3X5VFNeuwTzA+CQ
 lTLJz9pD45rCTEHoEUY85BeHCTSfFvakeKJGx7Kvnq6AMpKowTQYtk2AZ g==;
X-CSE-ConnectionGUID: LAAqf5SXQ+6zi3sl6reg/g==
X-CSE-MsgGUID: Rztn53MBSZqjx1ko0RFxNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="67696663"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="67696663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:40:05 -0800
X-CSE-ConnectionGUID: Rf7qudrgSiCpmoz77PFBnw==
X-CSE-MsgGUID: SFGbBzOcRT291vceC14lFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194434730"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:40:03 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 0/9] Add writeback changes for intel-supported formats
Date: Thu, 13 Nov 2025 14:27:52 +0530
Message-ID: <20251113085801.3088957-1-sowmiya.s@intel.com>
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

Sowmiya S (9):
  tests/kms_writeback: Add support for intel-specific formats
  lib/igt_fb: Validate supported formats for crc calculation
  tests/kms_writeback: Validate supported formats
  tests/kms_writeback: Add intel specific check
  tests/kms_writeback: Refactor format handling in commit_and_dump_fb
  tests/kms_writeback: Add utility function for shared logic
  tests/kms_writeback: FB creation within subtest
  tests/kms_writeback: Refactor writeback-fb-id subtest
  tests/kms_writeback: Refactor writeback-check-output subtest

 lib/igt_fb.c          |   9 +-
 tests/kms_writeback.c | 231 +++++++++++++++++++++++++-----------------
 2 files changed, 143 insertions(+), 97 deletions(-)

-- 
2.43.0

