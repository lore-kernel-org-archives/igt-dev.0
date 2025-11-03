Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3344BCCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 10:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CFF10E3A7;
	Mon,  3 Nov 2025 10:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ak0MjeEg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EC110E3A7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 10:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762165267; x=1793701267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5t7+v4i46YfvksKSmP5aqsoBhv4fk0eBaNzp/XtbyTA=;
 b=Ak0MjeEgm7FGuHFvrBlrJSqWHSfKPpav6io4MTfZZ61/AdtzeDrWPwIu
 gvsOlgNxLNYr7iVUvPsaR8tKy9tq9be1wRNszv6fCU0ohDZrDew+GqSfb
 2AAKJDo2QaJK9ETkCrEWIaYtGZ1Uf6fiF5Um2IfL2eGwDKtXKZBKW5pgq
 bPyokMQsR5Rknj1LUP6xE61z58KTaDWOcXmDRZQnm6QSFq2CMbLrf69PS
 Qt8AeZTVO1HJM50LVpCwe8iK3MYCVICpAiKTbR0GTl5LohwKMp6qkpwqU
 vzcAlaCqvPkMZ7OzetLWRc5bAPKYPOwIb/W8mQSAFtYegO7RiPy+j/tV0 Q==;
X-CSE-ConnectionGUID: uNWsBGSySCmAu4kOqsx6WQ==
X-CSE-MsgGUID: gRcvWRnnTImtu8HxfAYrVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64162516"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64162516"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:21:07 -0800
X-CSE-ConnectionGUID: m65gNTpgSfG0tRb7U1eBMA==
X-CSE-MsgGUID: 79tTED5zSEyDhjCoNISPJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186120171"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 02:21:05 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 3/8] tests/kms_writeback: Add intel specific check
Date: Mon,  3 Nov 2025 16:08:37 +0530
Message-ID: <20251103103842.3025204-4-sowmiya.s@intel.com>
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

Add a check to ensure this line of code
executes only on Intel platforms.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 9523c24b8..ce9258f0c 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -74,6 +74,7 @@ IGT_TEST_DESCRIPTION(
 );
 
 typedef struct {
+	int drm_fd;
 	bool builtin_mode;
 	bool custom_mode;
 	bool list_modes;
@@ -287,7 +288,7 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 
 	/* Zero WRITEBACK_FB_ID */
 	ret = do_writeback_test(output, 0, NULL, false);
-	igt_assert_eq(ret, 0);
+	igt_assert_eq(ret, is_intel_device(data.drm_fd) ? -EINVAL : 0);
 
 	/* Valid output buffer */
 	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
@@ -401,7 +402,8 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 
 	/* Two commits, the second with no writeback */
 	out_fbs[0] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
+	if (!is_intel_device(data.drm_fd))
+		writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	/* Two commits, both with writeback */
 	out_fbs[1] = output_fb;
@@ -551,6 +553,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.drm_fd = display.drm_fd;
 
 		kmstest_set_vt_graphics_mode();
 
-- 
2.43.0

