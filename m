Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0934CCFA04
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9423910E3A7;
	Mon,  3 Nov 2025 10:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFTCNGIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7E10E3A7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165246; x=1793701246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kqakNvSaz9SR1j8pu9LMaMJbHAoa/bDXBnGEAPffPZE=;
 b=cFTCNGIKfyWX4iHeclqvx2w2l3qJoZDhXG/uwEaii524RndNoas0PNeu
 d7JOMNKmm48ppCmVFRlHVfT2KzqzgV0foNB/9PUvQDTV7h4w8YISccO60
 ikzbzs6ZJ2YHHk5RWxdjowzAixWyncmbpEGo74xStIx3xjAuqOPO6mbHW
 p/OuWI25RhBPcAVNX0F08M6h1IjbRIMXtnQLo5NAonVoYErX2DBWcMPIN
 5IbasISEbSjgXt+mv6JD/y1SSDeVMmMlOb2N8mohPtUU4E3pMZ+6jkNzN
 2gs53MYXKypVlxHNi8rfR9S36P17m2AnB08BObPNPaK3FvjICwGJkubb9 A==;
X-CSE-ConnectionGUID: KP+XUH4bQX2gk3Qk1A5VPg==
X-CSE-MsgGUID: +Dtpa/rUSIKGRbSU/TsuoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64269394"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64269394"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:20:45 -0800
X-CSE-ConnectionGUID: dvqwUZUsQxSRDuj0LLYM6A==
X-CSE-MsgGUID: oVrXty0DSfChJucehJGHRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186120085"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:20:44 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/8] Add writeback changes for intel-supported formats
Date: Mon,  3 Nov 2025 16:08:34 +0530
Message-ID: <20251103103842.3025204-1-sowmiya.s@intel.com>
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
xisting functions with limited format support were retained
for compatibility. After validating new formats introduced by
the platform, additional format support was added to the
writeback test suite. Subtests leveraging common framebuffer
creation logic were consolidated and dynamic subtest generation
was implemented to efficiently handle format-specific variations.

Sowmiya S (8):
  tests/kms_writeback: Add support for intel-specific formats
  tests/kms_writeback: Validate supported formats
  lib/igt_fb: Validate supported formats for crc calculation
  tests/kms_writeback: Add intel specific check
  tests/kms_writeback: Refactor format handling in commit_and_dump_fb
  tests/kms_writeback: Add utility function for shared logic
  tests/kms_writeback: FB creation within subtest
  tests/kms_writeback: Refactor writeback-fb-id subtest
  tests/kms_writeback: Refactor writeback-check-output subtest

 lib/igt_fb.c          |   6 +-
 tests/kms_writeback.c | 228 +++++++++++++++++++++++++-----------------
 2 files changed, 139 insertions(+), 95 deletions(-)

-- 
2.43.0

