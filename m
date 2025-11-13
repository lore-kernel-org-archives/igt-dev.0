Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8439FCD4F34
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 07:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C1310E510;
	Thu, 13 Nov 2025 07:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEvVKx13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D89C10E515
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 07:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763020741; x=1794556741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p7bmXFMZTVRR1SV8yhY+zsteCw8ijIogyJq3wv/gc04=;
 b=bEvVKx13WHjAE01aPgqIXQROK6Dnb328vugECpxTljsdYCdkErrz3NZY
 ftQj+dWPZ2AFdgmiS3PtCdDgjFrqSPQY8TUhnEm7CuyIjDvZj1rGpQ67L
 qRFUZdAoAPIJmdvucwP1XTa3RL7uXt7t2u21LZ33oWXsGzYRyyOcww9zi
 g7YAMp/iGfyAWB/hpnoOBszeSbCOKNc3Et23qZey2Fo+5Gm66vzsonM+n
 6PRnr3rvT0+ULzKGZspnMpgNpOZdhk3vHE4RBlgs9VmdGMzMk+KctGCoN
 Vs+G4vsmpomLCO9sR1tsCR8Jmn/yOq0qXrMPSR7MxDtKZD3V8Jqc3uwND g==;
X-CSE-ConnectionGUID: fiLXBj3CRfSPNrBJwXaJcQ==
X-CSE-MsgGUID: nLG+O3tPQ8+ogScRF6GP0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64298416"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64298416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:59:01 -0800
X-CSE-ConnectionGUID: j41r50eMSUSiHJc02i45Kg==
X-CSE-MsgGUID: O/tOw+d/T5qpeV4Ni1qyJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189230424"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:59:00 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 4/9] tests/kms_writeback: Add intel specific check
Date: Thu, 13 Nov 2025 13:45:18 +0530
Message-ID: <20251113081523.3088787-5-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113081523.3088787-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251113081523.3088787-1-sowmiya.s@intel.com>
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
index e9173ea4a..b6d38ab28 100644
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
@@ -402,7 +403,8 @@ static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
 
 	/* Two commits, the second with no writeback */
 	out_fbs[0] = output_fb;
-	writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
+	if (!is_intel_device(data.drm_fd))
+		writeback_sequence(output, plane, input_fb, out_fbs, 2, fourcc_color);
 
 	/* Two commits, both with writeback */
 	out_fbs[1] = output_fb;
@@ -552,6 +554,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.drm_fd = display.drm_fd;
 
 		kmstest_set_vt_graphics_mode();
 
-- 
2.43.0

