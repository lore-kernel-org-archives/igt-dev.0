Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C0BC56205
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 15:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97F610E7C3;
	Fri, 20 Feb 2026 15:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaHFV9v8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C7B10E366
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599682; x=1803135682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NRuv8HFqb1HKD/4qB6fGUZCn1Px5wg43wWaka0NZP0A=;
 b=AaHFV9v8jhbXV96BkUIzQ77tL5rJbqI2NJWbzXXGW6GgYnReNjou+kcV
 CuiwdiM/vsz1gj1kdCGr+N3YVscFXcn1Rk6+Mnoudymtc7RBns2Wfa2Kt
 yuU0tc9F/7D04BvwM9VEJRkCo3F5vE/xpUBOEOr2fAwjOZICKOBXrugw/
 QmIGzj+qu37Z0rZXkW2uacGnx7ivF8Kq3+7C+2FG6TGxlnkk17mx1cSCT
 XmCogkzQ1wZ7cL1/EGpcm2ZADf5gQqzwVrzO5tOSaQJ4dF1my00LYFWwZ
 816HFpGJTRxYVVu7W9l1rTgqgsrHuGc/+4ttq+6HbaiWWtUIupIO0YW8Y Q==;
X-CSE-ConnectionGUID: GmmnRzw2RumlKVTGZY24Dg==
X-CSE-MsgGUID: STh6kQlmQ7OHz1CvfEPbyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72592284"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72592284"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 07:01:22 -0800
X-CSE-ConnectionGUID: 3CxRPGRkSxS1ptSNx19nEA==
X-CSE-MsgGUID: 62UhjSGhSHO3x9wX74yQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="219411138"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 07:01:20 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 0/3] tests/kms_pipe_crc_basic: add mst suspend-resume test
Date: Fri, 20 Feb 2026 20:52:36 +0530
Message-Id: <20260220152239.276034-1-kunal1.joshi@intel.com>
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

This patch series introduces MST suspend-resume test to kms_pipe_crc_basic.

The MST test validates there is no corruption/blank out
across suspend/resume cycles for all possible subsets.

Kunal Joshi (3):
  tests/intel/kms_mst_helper: Add helper to check for MST outputs
  lib/igt_kms: Fix max_non_joiner_mode_found to handle connectors below
    pipe max
  tests/kms_pipe_crc_basic: Add MST suspend-resume test

 lib/igt_kms.c                |  15 +-
 tests/intel/kms_mst_helper.c |  19 +++
 tests/intel/kms_mst_helper.h |   1 +
 tests/kms_pipe_crc_basic.c   | 314 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   3 +
 5 files changed, 347 insertions(+), 5 deletions(-)

-- 
2.43.0

