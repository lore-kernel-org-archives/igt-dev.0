Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23A2D1D478
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 15:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B67010E345;
	Thu,  8 Jan 2026 15:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwlJcd7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6350E10E345
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767886094; x=1799422094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=44oBNDUYBx42g75yohMabyEeTTw2CAT8MSLPmcgyGCI=;
 b=BwlJcd7K9ZSLkMrRkgJfB/nSxVjCaBTM8JFuqlqW9mfY1pl7ImPMoPxl
 LZb3veKVYS5o+4HGQtiyfSxAhbXjRp5AqVHtlvUY2LxaP6GY+13AAAk6O
 1liy7pKXtYNeuNpEmGF6jR7fk+eYTnadyJ8MVggAjQZD2NQM4ldFmtt2q
 3fo+shFqnPueGgejNMau+oQWNoIqj+3L4n3BZlZ4LJQf1sY564nSzIaXF
 Ho5Mzu7WHOgnRvbh52sK1y2cyB8IDFAxnSza0AgIBwVgCWdCziu+T4w/x
 JkNPCWDXSzVJphrkiYs9XGwZ3jQZyC4hKYl35bfLEOwm2Fqw5AVU01IOc A==;
X-CSE-ConnectionGUID: 71d0AVifRmiyn6TAs4LCNA==
X-CSE-MsgGUID: Lg4ON4pfQVeB0KDOD0JWaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80374877"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="80374877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:14 -0800
X-CSE-ConnectionGUID: OyUexkfSSN+/SSUdkRHHgw==
X-CSE-MsgGUID: Tiavhcp9TF6p+f62c97RVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="234402868"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 07:28:12 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 0/6] Add writeback changes for intel-supported formats
Date: Thu,  8 Jan 2026 21:18:11 +0530
Message-ID: <20260108154817.48665-1-sowmiya.s@intel.com>
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
  tests/kms_writeback: Add intel check for vendor-specific restriction
  tests/kms_writeback: Refactor format handling in commit_and_dump_fb
  tests/kms_writeback: Refactor writeback-fb-id subtest
  tests/kms_writeback: Refactor writeback-check-output subtest

 lib/igt_fb.c          |   6 +-
 tests/kms_writeback.c | 239 +++++++++++++++++++++++++-----------------
 2 files changed, 145 insertions(+), 100 deletions(-)

-- 
2.43.0

