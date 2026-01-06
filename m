Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2D4CD0437
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 05:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D48310E41B;
	Tue,  6 Jan 2026 05:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSyeTeWd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340B510E41B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 05:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767677539; x=1799213539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sf93e2KBloGfU78nA2ObmbGlc6preY6LFrI4v4+8YWI=;
 b=eSyeTeWd3QR/fSH9zPOv55lnfAbKo8hb4D/gZzD//81O065FaFFF8ONU
 Z6QBxZ1aMc4fWRguDIr37b8j91VF6moPw2q2Iq+uhwV/GFsE1LtWNHb+5
 6M7guVtITQRPYjz3i+AnNnM2v/WwOHIFgdwbKSrG3vD2dlUvtZ5YXLyAj
 2hefNdbDV+8voU5tzy3cm4cK0Yy/e4omfstYTUy+zjUzTvsV57nHSnjDZ
 i0sNzI7hOfyrShyu9oD5TMpedVJ7QOn22FB/a41Cdn3koA8Wk09L8sEiE
 Ehldv4PK4m9y1+JAi6h/NjyEGOIornWka6c2LGUDYBdt+TlnQR0e7Juh9 w==;
X-CSE-ConnectionGUID: DmKi0xUSRI6c9ol6Jf3taQ==
X-CSE-MsgGUID: HFCIjxHBRS+Z/7Eorlp+og==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71621987"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="71621987"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 21:32:19 -0800
X-CSE-ConnectionGUID: x1PkVwdXQx+zxRDh3wGS5g==
X-CSE-MsgGUID: kMgnPeUcSbKAiw2f/LUWjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201707744"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 21:32:17 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_async_flips: Fix PSR2 selective fetch
 check for cursor tests
Date: Tue,  6 Jan 2026 11:00:02 +0530
Message-Id: <20260106053002.104612-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106053002.104612-1-santhosh.reddy.guddati@intel.com>
References: <20260106053002.104612-1-santhosh.reddy.guddati@intel.com>
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

The async flip cursor tests are expected to skip on PSR panels and
execute on non-PSR panels.The change allows the test to check per sink
PSR capabilities and verifies async flip behaviour accordingly.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 71570385c..e17b287f4 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -625,17 +625,17 @@ static void test_cursor(data_t *data)
 	struct igt_fb cursor_fb;
 	struct drm_mode_cursor cur;
 
-	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-
 	/*
 	 * Intel's PSR2 selective fetch adds other planes to state when
 	 * necessary, causing the async flip to fail because async flip is not
 	 * supported in cursor plane.
 	 */
-	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd, NULL),
+	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd, data->output),
 		      "PSR2 sel fetch causes cursor to be added to primary plane " \
 		      "pages flips and async flip is not supported in cursor\n");
 
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
 
@@ -1168,15 +1168,6 @@ int igt_main()
 	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
 	igt_subtest_with_dynamic("test-cursor") {
 		test_init_ops(&data);
-		/*
-		 * Intel's PSR2 selective fetch adds other planes to state when
-		 * necessary, causing the async flip to fail because async flip is not
-		 * supported in cursor plane.
-		 */
-		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
-			      "PSR2 sel fetch causes cursor to be added to primary plane "
-			      "pages flips and async flip is not supported in cursor\n");
-
 		run_test(&data, test_cursor);
 	}
 
@@ -1184,14 +1175,6 @@ int igt_main()
 		     "async flip with atomic commit");
 	igt_subtest_with_dynamic("test-cursor-atomic") {
 		test_init_ops(&data);
-		/*
-		 * Intel's PSR2 selective fetch adds other planes to state when
-		 * necessary, causing the async flip to fail because async flip is not
-		 * supported in cursor plane.
-		 */
-		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
-			      "PSR2 sel fetch causes cursor to be added to primary plane "
-			      "pages flips and async flip is not supported in cursor\n");
 		data.atomic_path = true;
 		run_test(&data, test_cursor);
 	}
-- 
2.34.1

