Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4336606A323
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cglOmeGM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9D410FA9E;
	Wed, 25 Nov 2026 10:19:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D5210E35A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 10:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795601888; x=1827137888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LH2pdUIBimeWIUuaQOKy2VLlGAYG5wSxF4Pc8DZ9jVI=;
 b=cglOmeGMs3lXAHsW4GGfmRWg488qkvGbHfz7+QNZWZ3tNANt5/9KBizc
 +kq18uegpQu7ZAEMFbz9KCXUEJ2kOVp+6JRusiMgujKzk9m+UrMCCFZZi
 DcYH1tuo1hr6m9XaHfQrK1ZRxAtQUXaAhcU/8BTGXVLJsoi/emeEg+yJp
 llb4BH24RpN5ss4dmsdBy/5rRLAID0lCnL6NTc+Q+bp5hLByflp+zkURx
 X0n7C1Hj+ZwHuRbKgWqc5lKJYsD5jr847LbduDx9244pPHsO27Ida6e62
 sxPI2XD4WuV/Q+24V+/Zy/KR7AhNMzFhGfyUW3Qm96l69MhnitOeCB7Ka A==;
X-CSE-ConnectionGUID: OE1laioAQw20oNC70Pw5Tg==
X-CSE-MsgGUID: gB9wyVTDROy59dCeCmUaOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4358355"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4358355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:42:54 -0800
X-CSE-ConnectionGUID: 9cN0LWOAQteTLCDkiOoerg==
X-CSE-MsgGUID: jjh4V3H+Tny9bMqaFUfHQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12129885"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 01:42:53 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first and
 last CRTC
Date: Wed, 25 Nov 2026 15:11:55 +0530
Message-ID: <20261125094155.1174557-1-jeevan.b@intel.com>
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
Restrict it to the first and last pipe when running in simulation,
which keeps coverage while avoiding the timeout.

Compute a CRTC index mask once in the fixture, holding only the first
and last pipe in simulation and all CRTCs otherwise, and skip CRTCs not
in the mask in the existing loop. This keeps the simulation handling
out of the main test loops.

v2:
 - Test the first and last usable CRTC instead of the first 2 pipes,
   and drop SIM_MAX_PIPES.
v3:
 - Skip non-first/non-last CRTCs inside the existing loop.
v5:
 - Use a CRTC index mask computed up front.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_cursor.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17..a1111245f 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -284,6 +284,27 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	test_cursor_spots(data, size, flags);
 }
 
+static uint32_t get_crtc_index_mask(igt_display_t *display)
+{
+	igt_crtc_t *crtc, *first_pipe_crtc = NULL, *last_pipe_crtc = NULL;
+	__maybe_unused igt_output_t *output;
+	uint32_t crtc_index_mask = 0;
+
+	for_each_crtc_with_single_output(display, crtc, output) {
+		if (!first_pipe_crtc || crtc->hardware_pipe < first_pipe_crtc->hardware_pipe)
+			first_pipe_crtc = crtc;
+		if (!last_pipe_crtc || crtc->hardware_pipe > last_pipe_crtc->hardware_pipe)
+			last_pipe_crtc = crtc;
+		crtc_index_mask |= 1 << crtc->crtc_index;
+	}
+
+	if (igt_run_in_simulation() && first_pipe_crtc && last_pipe_crtc)
+		crtc_index_mask = 1 << first_pipe_crtc->crtc_index |
+			1 << last_pipe_crtc->crtc_index;
+
+	return crtc_index_mask;
+}
+
 int igt_main()
 {
 	static const int cursor_sizes[] = { 64, 128, 256 };
@@ -291,6 +312,7 @@ int igt_main()
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_display_t *display;
+	uint32_t crtc_index_mask = 0;
 	int i, j;
 	struct {
 		const char *name;
@@ -322,6 +344,8 @@ int igt_main()
 		igt_assert(ret == 0 || errno == EINVAL);
 
 		kmstest_set_vt_graphics_mode();
+
+		crtc_index_mask = get_crtc_index_mask(&data.display);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -329,6 +353,9 @@ int igt_main()
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
 			for_each_crtc_with_single_output(&data.display, crtc,
 							 output) {
+				if (!(crtc_index_mask & (1 << crtc->crtc_index)))
+					continue;
+
 				if ((tests[i].flags & TEST_OVERLAY) &&
 				    !igt_crtc_get_plane_type(crtc,
 							     DRM_PLANE_TYPE_OVERLAY))
-- 
2.43.0

