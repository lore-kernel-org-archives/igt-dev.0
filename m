Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B93C48BED
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDAE10E3FE;
	Wed, 14 Feb 2024 06:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlevqItr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7743510E35D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893147; x=1739429147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ooCy8JWKg/IhSrQ+IXD9ndut2TKEvmzaRImfG0raQMY=;
 b=VlevqItrJhHa5yuBPA8auiXPbu3tlWO5FV1gpAoicPreM81G/y0R2NDY
 KDX/jPL0RQ/skvmjEY6tZ3RVsnSbACWWorjq/DxmirxJGHLpLtgocKtdm
 KEIxLUYQYpT/GU1VCzNBzE4BoSr/1CEOamN5TYX/jJ+JMALbGUlOVTPh6
 b/gPPrrVWyzHJ3YWeSNonXIqNUpzPuVmNtXMalwozm7+WxyspAbbR3DMk
 7dyEroasckkvSprZulGvmc8wzv9O+4JBJXYt13BJMJpXRWwM/BQlMkuiN
 Igs0yttjzPLQ3Kl8TlnVQXLHd7UgXuUAZWCfFQhy+FLvj5CazNmvbycui A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645438"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645438"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427580"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:46 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC v4 05/22] tests/kms_properties: Add colorop properties test
Date: Wed, 14 Feb 2024 12:09:36 +0530
Message-ID: <20240214063953.1285495-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

From: Harry Wentland <harry.wentland@amd.com>

We've introduced the concept of a new DRM core object, the
drm_colorop, to represent a color operation as part of a
color pipeline.

Add new tests to kms_properties to test the properties of
a drm_colorop object.

v3:
 - Update test to work without new libdrm definitions for
   colorop objects
 - Test colorop properties with both atomic and legacy
   code paths

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_properties.c | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index bd414f534..e33503303 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -49,6 +49,7 @@
  * @crtc:            CRTC
  * @plane:           Plane
  * @invalid:         Invalid (connector/crtc/plane)
+ * @colorop:         Colorop
  *
  * arg[2]:
  *
@@ -221,6 +222,39 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
 	}
 }
 
+static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+{
+	struct igt_fb fb;
+	igt_plane_t *plane;
+	igt_colorop_t *colorop;
+	int i;
+	int colorop_id = 0;
+
+	prepare_pipe(display, pipe, output, &fb);
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
+			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+
+		/* iterate over all color pipelines on plane */
+		for (i = 0; i < plane->num_color_pipelines; ++i) {
+			/* iterate over all colorops in pipeline*/
+			colorop = plane->color_pipelines[i];
+			while (colorop) {
+				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
+					kmstest_pipe_name(pipe), plane->index, colorop->id, kmstest_plane_type_name(plane->type), output->name);
+				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id, atomic);
+
+				colorop_id = igt_colorop_get_prop(display, colorop,
+								IGT_COLOROP_NEXT);
+				colorop = igt_find_colorop(display, colorop_id);
+			}
+		}
+	}
+
+	cleanup_pipe(display, pipe, output, &fb);
+}
+
 static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
 {
 	struct igt_fb fb;
@@ -266,6 +300,35 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 		cleanup_pipe(display, pipe, output, &fb);
 }
 
+static void colorop_properties(igt_display_t *display, bool atomic)
+{
+	bool found_any = false, found;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	/* colorops are only available with atomic */
+	igt_skip_on(!display->is_atomic);
+
+	for_each_pipe(display, pipe) {
+		found = false;
+
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!i915_pipe_output_combo_valid(display))
+				continue;
+
+			found_any = found = true;
+
+			run_colorop_property_tests(display, pipe, output, atomic);
+			break;
+		}
+	}
+
+	igt_skip_on(!found_any);
+}
+
 static void plane_properties(igt_display_t *display, bool atomic)
 {
 	bool found_any = false, found;
@@ -799,6 +862,14 @@ igt_main
 	igt_subtest("plane-properties-atomic")
 		plane_properties(&display, true);
 
+	igt_describe("Tests colorop properties with atomic commit");
+	igt_subtest("colorop-properties-atomic")
+		colorop_properties(&display, true);
+
+	igt_describe("Tests colorop properties with legacy commit");
+	igt_subtest("colorop-properties-legacy")
+		colorop_properties(&display, false);
+
 	igt_describe("Tests crtc properties with legacy commit");
 	igt_subtest("crtc-properties-legacy")
 		crtc_properties(&display, false);
-- 
2.43.0

