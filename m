Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAC8D462B1
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 14:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA3310E710;
	Wed, 13 Nov 2024 14:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTUcNeem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC1A10E710
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731508189; x=1763044189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pDm5peE7bUnrrhsL+JON9JzOu+mSv/ceSuBZC2Vvy0U=;
 b=YTUcNeem4Iw3xllMG7hHMZ54irbmFV8+7kLVms5+qE0M9yMZFGXoLipF
 wzTpiKwwx2Fvp7E9SrLcgKgMKZ4qso/SQJlwl7QgA9HmW0pc0BEtMr+Sb
 kfiPCPf8Q6ghZmcD30+tOQrhnazz9Q8tObEp9A5PUjd+AnWuLQYP5XqS9
 jGo6gyJM4qeIClS8gZGrGgmH8uXW5X/Z/knXF5R1tsxzWX/1xCccRn/Gw
 RPB+nGaIxbrmf1o9UDQnL3SwFAFMllijLXNPfF+wQkgqman8Wt6JgpXmb
 jI9hZsBhlkvYAziongRR7RdJgCeesZ9yoY4VU4PhLz3UsmavdHq7tJ+Bk A==;
X-CSE-ConnectionGUID: LmvjuZLEQ+azqThtI26h8w==
X-CSE-MsgGUID: qMuojbu2SryvCLLkYSg2IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42015836"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="42015836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:29:48 -0800
X-CSE-ConnectionGUID: C/R3Cjo6QlK7f3WV6aLybA==
X-CSE-MsgGUID: LbUZLK56RBCRfyc80CY9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="87457166"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 06:29:46 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_hdr: Skip brightness on non-internal panels
Date: Wed, 13 Nov 2024 19:55:55 +0530
Message-Id: <20241113142555.2974018-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Skip the brightness test if the output is not an internal panel and log
the skip message.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_hdr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index b67902d43..c4c9df3fc 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -696,6 +696,12 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 		}
 
+		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
+			igt_info("%s: Can't run brightness test on non-internal panel.\n",
+				 igt_output_name(output));
+			continue;
+		}
+
 		for_each_pipe(display, pipe) {
 			igt_output_set_pipe(output, pipe);
 			if (!intel_pipe_output_combo_valid(display)) {
-- 
2.34.1

