Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0B9CD4F4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 07:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C67B10E349;
	Thu, 13 Nov 2025 07:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lO4jLd85";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E726510E350
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763020653; x=1794556653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=APUcOfZaFs2VcjxYVKVhMz3CKxNJCfuZsxCD1EWMhLQ=;
 b=lO4jLd85kU0Cd7c37NIfMgEkG4dSk4jPVmn9yZ8STBGMmjywzz6gW8mp
 kq+5ZKfizAWRkwD2xz3JL20K371FhrSe46i0y5YQZBAJ3ekJVfAmF97sD
 TiAuex+K3FWWr2+c06Nx91Z8sZrwHg0wkOVjdW3h/ehut/K7h3mySW9S0
 xP8/14l9w7t5WEiRoAoGdAcQiHBFE9+066gmzpdRstfhaJDvHlURa7mmR
 xe8So1Niuw8qsVlPl71V81CaPuRkFyHhTBAUQH9k6flL2nuuOnHHeRufk
 1mcmzU+fcHFzGmrJfeSIHrtAhCljONHmMFatAY/cvaF5gfVZv77v8nF1o g==;
X-CSE-ConnectionGUID: CQm0y8GvQBWLrmV1omDONw==
X-CSE-MsgGUID: A3pclcBfR0SoWFzJVs8SEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64298351"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64298351"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:57:32 -0800
X-CSE-ConnectionGUID: B7iivNJxRUODPgSh3fPUoA==
X-CSE-MsgGUID: NybK/8LgTXmOr8YYT7Ag9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189230311"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:57:31 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 0/9] Add writeback changes for intel-supported formats
Date: Thu, 13 Nov 2025 13:45:14 +0530
Message-ID: <20251113081523.3088787-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103103842.3025204-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
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

