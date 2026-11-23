Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D4A606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hv1fyJDc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3795310E2B1;
	Mon, 23 Nov 2026 06:25:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356CD10E13B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 06:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795415073; x=1826951073;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1M1kXnQ5sQ1HL6WDegJpI/HEWB3D7AXrlllNTHYI1IY=;
 b=Hv1fyJDcAwUaFUd1JNuoLqegsLgfAteJcJwj9BJ6CM5IsfZcQKjkB8ct
 mcilEQJTDefJyaU0KfnjjNBk1F05gsZlbygkeSVinkY94vLzc9k2dKI9a
 O4h3H6FwEctvsLYiSHZIzWgSmMsyj9Ud2IMt5yLa5632CIA1tpfqmzja/
 QT5QvctxUTnyjSnFHQ9CL4HUkJdYaUMSFd0hyLf77HYqWxnBi/etANOw+
 3mJJTQxtfvfXZc8w6tRfK79lKKywfgvmmEk2duYCpaxabTFWOd9IvzQQ8
 JZepAfmcp+QBOiU0Jo7yvQyyRjxxt6TyEXlsCBUQzYEYk2KK2oSA1b4I6 Q==;
X-CSE-ConnectionGUID: bQQ2c99SRAW/T4AJ1+Lbtg==
X-CSE-MsgGUID: afZI90BbSFOW7p/FJ+9A/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4260576"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4260576"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 22:24:33 -0800
X-CSE-ConnectionGUID: vF2gW8qiTzaUl7e0yWJKSw==
X-CSE-MsgGUID: W9pDUjkVTHegs7jLYl7Ofg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11629434"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 21:57:08 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first and
 last CRTC
Date: Mon, 23 Nov 2026 11:26:04 +0530
Message-ID: <20261123055604.724128-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Running on every CRTC makes the test hit the timeout on simulation.
Restrict it to the first and last usable CRTC when running in
simulation, which keeps coverage while avoiding the timeout.

v2:
 - Test the first and last usable CRTC instead of the first 2 pipes,
   and drop SIM_MAX_PIPES.
v3:
 - Skip non-first/non-last CRTCs inside the existing loop.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_cursor.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17..dfe1f2418 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -288,7 +288,7 @@ int igt_main()
 {
 	static const int cursor_sizes[] = { 64, 128, 256 };
 	data_t data = { .max_curw = 64, .max_curh = 64 };
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc, *last_crtc;
 	igt_output_t *output;
 	igt_display_t *display;
 	int i, j;
@@ -315,6 +315,8 @@ int igt_main()
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 		display = &data.display;
+		last_crtc = igt_crtc_for_pipe(display,
+					      igt_display_n_crtcs(display) - 1);
 
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &data.max_curw);
 		igt_assert(ret == 0 || errno == EINVAL);
@@ -327,6 +329,8 @@ int igt_main()
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe_f("%s", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
+			bool tested_first = false;
+
 			for_each_crtc_with_single_output(&data.display, crtc,
 							 output) {
 				if ((tests[i].flags & TEST_OVERLAY) &&
@@ -334,6 +338,15 @@ int igt_main()
 							     DRM_PLANE_TYPE_OVERLAY))
 					continue;
 
+				/*
+				 * In simulation, only test the first usable
+				 * CRTC and the last one to avoid timeouts
+				 * while keeping coverage.
+				 */
+				if (igt_run_in_simulation() && tested_first &&
+				    crtc != last_crtc)
+					continue;
+
 				igt_display_reset(display);
 
 				igt_output_set_crtc(output,
@@ -341,6 +354,8 @@ int igt_main()
 				if (!intel_pipe_output_combo_valid(display))
 					continue;
 
+				tested_first = true;
+
 				test_init(&data,
 					  crtc,
 					  output,
-- 
2.43.0

