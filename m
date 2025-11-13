Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EECCD4F50
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8939710E09A;
	Thu, 13 Nov 2025 08:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SM9QeNKl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4F910E09A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021880; x=1794557880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=APUcOfZaFs2VcjxYVKVhMz3CKxNJCfuZsxCD1EWMhLQ=;
 b=SM9QeNKlBR5bhSk3l4T1pt9w74NZdAwITYS9/pjlQCBvbEDRgFgYFnYO
 zh9Xm2ctFZYn8NuyYcyXgX3Zm8a1FwGi4fbIM+IfI6cm6nIQaP4d+/Njv
 aB5HsEdjX98fGtWH2zBwN+WG0IcUlhOncVNEzuCzOqFzA/W9+ufTBC3Dp
 73Z4O+ylpDvoELKMOl57uTNk6mK8ujgNTHwzQxLwTPerwoJCrhW1Bb9rr
 ILVa9+dBm7FCwYOYiNPYhR8O+DReVtJO6BRmkrWj1KpQYHtRAhhSTTHuK
 Bmxs8gpXSi5RhJK1q35xveXbetmJJFDsmpAfsCy1dQsNTEU6ND53acUGY g==;
X-CSE-ConnectionGUID: 4V8MSJrpTWuUSd4JTMZEQA==
X-CSE-MsgGUID: wJE+//zXSmunJqCeN7Ve1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65000502"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65000502"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:00 -0800
X-CSE-ConnectionGUID: dZYj6S2KTCmt2aofhLx7Ig==
X-CSE-MsgGUID: oKTercqLSBaMNcwGaYqMLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="212822296"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:17:59 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 0/9] Add writeback changes for intel-supported formats
Date: Thu, 13 Nov 2025 14:05:46 +0530
Message-ID: <20251113083555.3088873-1-sowmiya.s@intel.com>
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

