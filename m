Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A487DC27C65
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75A910E4D6;
	Mon, 10 Jun 2024 16:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvtznPYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCAF10E4D0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037781; x=1749573781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r7dRrWi/KczIW5ME01A5LmXPfD+F6TqxHXwNV0g6ZBg=;
 b=BvtznPYV1bpJ+Pb1+5p9n7hLn8FKqf2nPP9oHgZhJNqqmpfKlJ0JE4t+
 s7sHZtcV3ZXeoxHe8Dnhq56xw8lW4AmJNMvjbCeg5zii/6sJa+iErmEaq
 fUxGseidsJZH8f0L26ESnPC5RHveBwOTfDPFwy4YFGVU7xu8V65JVwC4N
 Aij64k85ZDwNLEG/1RTNJ1wp9AZDiS+EleVKFjVeuwluLqFQ3AckRSb42
 cgXnNPQ6UeyJaMmWvYl2ZYPGGeI5jzb2ishFBNfvkl/LHeyvicFHOhfCF
 m6w7uE04YKLj6/xhoQGfr6WmAjbXWf8IuyguG0B7eb9lSrkHFTCNCmXps A==;
X-CSE-ConnectionGUID: qT6dxf6aSfWiQSFmCBKPZA==
X-CSE-MsgGUID: d755/iFPTtKBoLd1lcxE6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819752"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819752"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:43:01 -0700
X-CSE-ConnectionGUID: jQsJnLk/RJO3rzm1ipHLGA==
X-CSE-MsgGUID: WMjlEIX+S5ea6T3mEy5ksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39681375"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:59 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 9/9] tests/kms_properties: Create dynamic subtests
Date: Mon, 10 Jun 2024 22:04:57 +0530
Message-ID: <20240610163457.3711476-10-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
References: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
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

From: Mohammed Thasleem <mohammed.thasleem@intel.com>

Modified kms_properties to include dynamic test cases.

v2: Fixed compilation issue.
v3: Removed redundant code.
v4: Moved get_prop_sanity calls to igt_subtest_group.
v5: Replace for loop with for_each_disconnected_output.
v6: Moved cleanup part to igt cleanup patch.
v7: (Bhanu)
 - Rebase
 - Handle disconnected outputs

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_properties.c | 188 +++++++++++++++++++----------------------
 1 file changed, 88 insertions(+), 100 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index bd414f534..17e6c0471 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -268,95 +268,76 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 
 static void plane_properties(igt_display_t *display, bool atomic)
 {
-	bool found_any = false, found;
 	igt_output_t *output;
 	enum pipe pipe;
 
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
-
-	for_each_pipe(display, pipe) {
-		found = false;
-
-		for_each_valid_output_on_pipe(display, pipe, output) {
-			igt_display_reset(display);
-
-			igt_output_set_pipe(output, pipe);
-			if (!intel_pipe_output_combo_valid(display))
-				continue;
+	for_each_pipe_with_single_output(display, pipe, output) {
+		igt_display_reset(display);
 
-			found_any = found = true;
+		igt_output_set_pipe(output, pipe);
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
 
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			      igt_output_name(output)) {
 			run_plane_property_tests(display, pipe, output, atomic);
-			break;
 		}
 	}
-
-	igt_skip_on(!found_any);
 }
 
 static void crtc_properties(igt_display_t *display, bool atomic)
 {
-	bool found_any_valid_pipe = false, found;
 	enum pipe pipe;
 	igt_output_t *output;
 
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
-
-	for_each_pipe(display, pipe) {
-		found = false;
+	for_each_pipe_with_single_output(display, pipe, output) {
+		igt_display_reset(display);
 
-		for_each_valid_output_on_pipe(display, pipe, output) {
-			igt_display_reset(display);
-
-			igt_output_set_pipe(output, pipe);
-			if (!intel_pipe_output_combo_valid(display))
-				continue;
-
-			found_any_valid_pipe = found = true;
+		igt_output_set_pipe(output, pipe);
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
 
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+			      igt_output_name(output)) {
 			run_crtc_property_tests(display, pipe, output, atomic);
-			break;
 		}
 	}
-
-	igt_skip_on(!found_any_valid_pipe);
 }
 
 static void connector_properties(igt_display_t *display, bool atomic)
 {
-	int i;
 	enum pipe pipe;
 	igt_output_t *output;
 
-	if (atomic)
-		igt_skip_on(!display->is_atomic);
-
 	for_each_connected_output(display, output) {
-		bool found = false;
+		igt_display_reset(display);
 
 		for_each_pipe(display, pipe) {
 			if (!igt_pipe_connector_valid(pipe, output))
 				continue;
 
-			igt_display_reset(display);
-
 			igt_output_set_pipe(output, pipe);
-			if (!intel_pipe_output_combo_valid(display))
+			if (!intel_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
 				continue;
+			}
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				      igt_output_name(output)) {
+				run_connector_property_tests(display, pipe, output, atomic);
+			}
 
-			found = true;
-			run_connector_property_tests(display, pipe, output, atomic);
 			break;
 		}
-
-		igt_assert_f(found, "Connected output should have at least 1 valid crtc\n");
 	}
 
-	for (i = 0; i < display->n_outputs; i++)
-		if (!igt_output_is_connected(&display->outputs[i]))
-			run_connector_property_tests(display, PIPE_NONE, &display->outputs[i], atomic);
+	for_each_disconnected_output(display, output) {
+		igt_display_reset(display);
+
+		igt_dynamic_f("pipe-None-%s", igt_output_name(output))
+			run_connector_property_tests(display, PIPE_NONE, output, atomic);
+
+	}
 }
 
 static void test_invalid_properties(int fd,
@@ -424,7 +405,6 @@ static void test_object_invalid_properties(igt_display_t *display,
 	igt_output_t *output;
 	igt_plane_t *plane;
 	enum pipe pipe;
-	int i;
 
 	for_each_pipe(display, pipe)
 		test_invalid_properties(display->drm_fd, id, type, display->pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic);
@@ -433,7 +413,7 @@ static void test_object_invalid_properties(igt_display_t *display,
 		for_each_plane_on_pipe(display, pipe, plane)
 			test_invalid_properties(display->drm_fd, id, type, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
 
-	for (i = 0, output = &display->outputs[0]; i < display->n_outputs; output = &display->outputs[++i])
+	for_each_output(display, output)
 		test_invalid_properties(display->drm_fd, id, type, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
 }
 
@@ -763,7 +743,6 @@ static void invalid_properties(igt_display_t *display, bool atomic)
 	igt_output_t *output;
 	igt_plane_t *plane;
 	enum pipe pipe;
-	int i;
 
 	if (atomic)
 		igt_skip_on(!display->is_atomic);
@@ -775,13 +754,33 @@ static void invalid_properties(igt_display_t *display, bool atomic)
 		for_each_plane_on_pipe(display, pipe, plane)
 			test_object_invalid_properties(display, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
 
-	for (i = 0, output = &display->outputs[0]; i < display->n_outputs; output = &display->outputs[++i])
+	for_each_output(display, output)
 		test_object_invalid_properties(display, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
 }
 
 igt_main
 {
 	igt_display_t display;
+	int i;
+	static const struct {
+		const char *name;
+		void (*func)(igt_display_t *, bool);
+		const bool atomic;
+		const char *desc;
+	} tests[] = {
+		{ "plane-properties-legacy", plane_properties, false,
+		  "Tests plane properties with legacy commit" },
+		{ "plane-properties-atomic", plane_properties, true,
+		  "Tests plane properties with atomic commit" },
+		{ "crtc-properties-legacy", crtc_properties, false,
+		  "Tests crtc properties with legacy commit" },
+		{ "crtc-properties-atomic", crtc_properties, true,
+		  "Tests crtc properties with atomic commit" },
+		{ "connector-properties-legacy", connector_properties, false,
+		  "Tests connector properties with legacy commit" },
+		{ "connector-properties-atomic", connector_properties, true,
+		  "Tests connector properties with atomic commit" },
+	};
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -791,59 +790,48 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 	}
 
-	igt_describe("Tests plane properties with legacy commit");
-	igt_subtest("plane-properties-legacy")
-		plane_properties(&display, false);
-
-	igt_describe("Tests plane properties with atomic commit");
-	igt_subtest("plane-properties-atomic")
-		plane_properties(&display, true);
-
-	igt_describe("Tests crtc properties with legacy commit");
-	igt_subtest("crtc-properties-legacy")
-		crtc_properties(&display, false);
-
-	igt_describe("Tests crtc properties with atomic commit");
-	igt_subtest("crtc-properties-atomic")
-		crtc_properties(&display, true);
-
-	igt_describe("Tests connector properties with legacy commit");
-	igt_subtest("connector-properties-legacy")
-		connector_properties(&display, false);
-
-	igt_describe("Tests connector properties with atomic commit");
-	igt_subtest("connector-properties-atomic")
-		connector_properties(&display, true);
-
-	igt_describe("Checks each property of any type with combination of mode object with legacy "
-		     "commit and make sure only valid properties are set to mode object else "
-		     "return with relevant error");
-
-	igt_subtest("invalid-properties-legacy")
-		invalid_properties(&display, false);
-
-	igt_describe("Checks each property of any type with combination of mode object with atomic "
-		     "commit and make sure only valid properties are set to mode object else "
-		     "return with relevant error");
+	for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe_f("%s\n", tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", tests[i].name) {
+			if (tests->atomic && !display.is_atomic)
+				continue;
 
-	igt_subtest("invalid-properties-atomic")
-		invalid_properties(&display, true);
+			tests[i].func(&display, tests->atomic);
+		}
+	}
 
-	igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
-	igt_subtest("get_properties-sanity-atomic") {
-		igt_skip_on(!display.is_atomic);
-		get_prop_sanity(&display, true);
+	igt_subtest_group {
+		igt_describe("Checks each property of any type with combination of mode object "
+			     "with legacy commit and make sure only valid properties are set to "
+			     "mode object else return with relevant error");
+		igt_subtest("invalid-properties-legacy")
+			invalid_properties(&display, false);
+
+		igt_describe("Checks each property of any type with combination of mode object "
+			     "with atomic commit and make sure only valid properties are set to "
+			     "mode object else return with relevant error");
+		igt_subtest("invalid-properties-atomic")
+			invalid_properties(&display, true);
 	}
 
-	igt_describe("Test validates the properties of all planes, crtc and connectors with legacy commit");
-	igt_subtest("get_properties-sanity-non-atomic") {
-		if (display.is_atomic)
-			igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 0), 0);
+	igt_subtest_group {
+		igt_describe("Test validates the properties of all planes, crtc and connectors with legacy commit");
+		igt_subtest("get_properties-sanity-non-atomic") {
+			if (display.is_atomic)
+				igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 0), 0);
+			get_prop_sanity(&display, false);
+			if (display.is_atomic)
+				igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+		}
+	}
 
-		get_prop_sanity(&display, false);
+	igt_subtest_group {
+		igt_fixture
+			igt_require(display.is_atomic);
 
-		if (display.is_atomic)
-			igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
+		igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
+		igt_subtest("get_properties-sanity-atomic")
+			get_prop_sanity(&display, true);
 	}
 
 	igt_fixture {
-- 
2.43.2

