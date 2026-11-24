Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35331606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 06:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O8ec01HC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AA410E768;
	Tue, 24 Nov 2026 06:29:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AC410E1F3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 06:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795501704; x=1827037704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AvPNiXJ4EDEN+voujysgstTriwA4InzpKoaTDVG3EeI=;
 b=O8ec01HCEQYQ1zt8ufC8pKLvj14CrIj4yCygPRkNNvzONCAedbnl3XW/
 D++Uy3nbv9pOHxHodd1LZ0lZlcd6scpifi2fWwRVLhnODmGv7pf1ijWHw
 UZ5S/gW54iXG4NMJrKwSXipUlpugz9flDpuC1PfcFAMaXfFJRgTrUlQ0c
 K7acBFUsJPidZEYBd52F7tGjklnzHGAth1CIpR/XOn/wkHMvb/cjYPwI6
 N1MVIYDvg32IR4ypu0Ymz7fyTyk2saSfcvFowaaS0MhgKQESan26XmLlx
 79gVe724/pi//SwRvJljMdaJLwd3R+IL9r9k0f7eBDbjl+pXDMWH+rh8F g==;
X-CSE-ConnectionGUID: pnbJngKLT228+6xdt/m80g==
X-CSE-MsgGUID: 9jg/FDjrSvO5rIV0wcO0Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4338203"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4338203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:28:23 -0800
X-CSE-ConnectionGUID: +UVeW3RiQ6iIXAxYOJgcAw==
X-CSE-MsgGUID: PGE23HxJSBWZo0HuhHIAjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11799696"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:28:22 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first and
 last CRTC
Date: Tue, 24 Nov 2026 11:57:25 +0530
Message-ID: <20261124062725.952438-1-jeevan.b@intel.com>
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

Move the per-pipe validity check and the per-pipe subtest body into
pipe_output_valid() and run_pipe() so both the regular and the
simulation paths can share them.

v2:
 - Test the first and last usable CRTC instead of the first 2 pipes,
   and drop SIM_MAX_PIPES.
v3:
 - Skip non-first/non-last CRTCs inside the existing loop.
v4:
 - Split the validity check and per-pipe run into helpers, and pick
   the first/last valid CRTC while iterating, then run only those
   after the loop in simulation.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_cursor.c | 92 +++++++++++++++++++++++++++-------------
 1 file changed, 62 insertions(+), 30 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17..f932cc775 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -284,14 +284,51 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 	test_cursor_spots(data, size, flags);
 }
 
-int igt_main()
+static bool pipe_output_valid(data_t *data, igt_crtc_t *crtc,
+			      igt_output_t *output, unsigned int flags)
+{
+	if ((flags & TEST_OVERLAY) &&
+	    !igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_OVERLAY))
+		return false;
+
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(output, crtc);
+
+	return intel_pipe_output_combo_valid(&data->display);
+}
+
+static void run_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		     unsigned int flags)
 {
 	static const int cursor_sizes[] = { 64, 128, 256 };
+	int j;
+
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(output, crtc);
+
+	test_init(data, crtc, output, flags);
+
+	for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
+		int size = cursor_sizes[j];
+
+		igt_dynamic_f("pipe-%s-%s-size-%d", igt_crtc_name(crtc),
+			      igt_output_name(output), size)
+			test_cursor(data, size, flags);
+
+		test_cleanup(data);
+		if (igt_run_in_simulation())
+			break;
+	}
+
+	test_fini(data);
+}
+
+int igt_main()
+{
 	data_t data = { .max_curw = 64, .max_curh = 64 };
 	igt_crtc_t *crtc;
 	igt_output_t *output;
-	igt_display_t *display;
-	int i, j;
+	int i;
 	struct {
 		const char *name;
 		unsigned int flags;
@@ -314,7 +351,6 @@ int igt_main()
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
-		display = &data.display;
 
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &data.max_curw);
 		igt_assert(ret == 0 || errno == EINVAL);
@@ -327,40 +363,36 @@ int igt_main()
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe_f("%s", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
+			igt_crtc_t *first_crtc = NULL, *last_crtc = NULL;
+			igt_output_t *first_output = NULL, *last_output = NULL;
+
 			for_each_crtc_with_single_output(&data.display, crtc,
 							 output) {
-				if ((tests[i].flags & TEST_OVERLAY) &&
-				    !igt_crtc_get_plane_type(crtc,
-							     DRM_PLANE_TYPE_OVERLAY))
+				if (!pipe_output_valid(&data, crtc, output,
+						       tests[i].flags))
 					continue;
 
-				igt_display_reset(display);
-
-				igt_output_set_crtc(output,
-						    crtc);
-				if (!intel_pipe_output_combo_valid(display))
+				if (!igt_run_in_simulation()) {
+					run_pipe(&data, crtc, output,
+						 tests[i].flags);
 					continue;
+				}
 
-				test_init(&data,
-					  crtc,
-					  output,
-					  tests[i].flags);
-
-				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
-					int size = cursor_sizes[j];
-
-					igt_dynamic_f("pipe-%s-%s-size-%d",
-						      igt_crtc_name(crtc),
-						      igt_output_name(output),
-						      size)
-						test_cursor(&data, size, tests[i].flags);
-
-					test_cleanup(&data);
-					if (igt_run_in_simulation())
-						break;
+				if (!first_crtc) {
+					first_crtc = crtc;
+					first_output = output;
 				}
+				last_crtc = crtc;
+				last_output = output;
+			}
 
-				test_fini(&data);
+			if (first_crtc) {
+				run_pipe(&data, first_crtc, first_output,
+					 tests[i].flags);
+				if (last_crtc->crtc_index -
+				    first_crtc->crtc_index > 1)
+					run_pipe(&data, last_crtc, last_output,
+						 tests[i].flags);
 			}
 		}
 	}
-- 
2.43.0

