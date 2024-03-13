Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57ACC54E66
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 17:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C7F10E943;
	Wed, 13 Mar 2024 17:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PpqnjIaz";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E42710EEFF
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 17:10:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A10CE1C0007;
 Wed, 13 Mar 2024 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710349800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nDPjYBsR4AbIiJOTMpPD2r+I4ulUvtexzdGx+6Fqbmk=;
 b=PpqnjIazKDhSmI/iAICYkwZGkfwh09XLwk/lGmwZUahz6gTooRTuLibRU3qeeXp6Isuk8k
 zVSajiRNl0BoRlj0927cnJnjVgDgwKF0w0xmaiC7rD/x9HsOpXvqNTjc0ozTk8jwOoD+YR
 TwoJYXcFV4y2Ob+ijpzbHpR4lHrYEnudQRkay+CIPkU1LTNDu8p6wqVifHk9TP62vLbnxT
 Tp0w9+xq4PyRulg0QMNSI8hSv+QwTX1kfBF7a5Xc5uqPEWvmoDnUFowdUV0HxsdeCEUTma
 NLYcUnTVKOWbieNoVQKZUvRkVFDDu617rtiojy7zJMO2c7Z63JYCbGyHYKdkkQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:09:43 +0100
Subject: [PATCH i-g-t v2 4/4] tests/kms_rotation: Add command line option
 to reduce the number of tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240313-new_rotation-v2-4-6230fd5cae59@bootlin.com>
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
In-Reply-To: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8731;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VD55JHG30V2G3yQGuYNnX1Fw2AcQVLT7YxxicoCqixQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8d3mE02xt834VnHREphdbsDrXFfJwmoDTC5TvGdb
 90n/YoWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHd5gAKCRAgrS7GWxAs4jKvD/
 46vTxB5hQNEyN2pa0gZBIC1SnmxyLx0ipy0xin/eiZoGsUoxn53E0zq0shRsIyyHCI09S25H1beYZJ
 Y/JexwwDFKQ8NN9VEtazgKsb+/4mpYpf2gV/WK+pQdvMbz669NRQ5Igfbp2/WTcPpAqL3xHFriLJ7j
 RlRrewq46TqBMqY+/gpVWHLB38EH7uz8AVy+fAzUQLsaxjrKE9tpGxBKTEoXQhzgfix+VDLL6MVOW0
 dcZ30aoshlCflxDEuHSbJjld5VSj7X99CD99DdWsQeN5M2l2c/xoOx14F+8+7wcvIY2tFE1fzTw3qp
 1V7PXd0BFyr49tObyCeB/JsWBzKeRFvq2e1htfKcl7wniPfp6Xb3vmBShozpBw5WjhIBM/x+0H4YQ7
 D3eCWoyWmpioDSWAND/gmyzsfBYwHE3XD0sJi7KMOEqftZJuybwWJKAYKlnOBMjQbn33AQctey6PeY
 QsOOJcZEhFa6Jjrx2GJ9o1arLlLn0aXYK7svnFoNpPRBHq+GhtAixMz01oco28SyHyxTih+UYEUEq0
 uBpO1LB1EgqMdzwJpyrC6GFlEzCJuvUla5QQJp8hsk4omKE1DrgxMMIwt8dLD0v3MowjKbcVwALSjH
 i2Cf30dteAdQMFf8NOqpjMRild4MTfs6cUQRN2nr2lilGaYi0O8Z+W5K8Ucg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

As it is often needed to reduce the number of tests (for example during
development), add few command line options to reduce the number of
subtests.

Also add command line option to set a specific plane size.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_rotation.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 111 insertions(+), 5 deletions(-)

diff --git a/tests/kms_rotation.c b/tests/kms_rotation.c
index 333485619541..4d168f66abef 100644
--- a/tests/kms_rotation.c
+++ b/tests/kms_rotation.c
@@ -21,12 +21,19 @@
  * @fd: file descriptor for the current drm device
  * @display: display used for the tests
  * @width, @height: Size of the CRTC used for this test
+ * @format: If not zero, the format to test
+ * @rotation_mask: A mask of IGT_ROTATION_* / IGT_REFLECT_*. This allows running only the subtests where all the values
+ * in this mask are used. So for example:
+ *   IGT_ROTATION_0 | IGT_REFLECT_X will run rot_0, rot_0+reflect_x, rot_0+reflect_x+reflect_y
+ *   IGT_ROTATION_180 | IGT_ROTATION_90 will not run anything, it's not possible to rotate by 90 and 180 simultaneously
  */
 struct data_t {
 	int fd;
 	igt_display_t display;
 	uint32_t width;
 	uint32_t height;
+	uint32_t format;
+	uint32_t rotation_mask;
 };
 
 /**
@@ -66,6 +73,19 @@ static uint32_t tested_rotation[] = {
 	IGT_ROTATION_270 | IGT_REFLECT_X | IGT_REFLECT_Y,
 };
 
+/**
+ * should_skip() - Returns true if a specific rotation must be skipped
+ *
+ * Check if a rotation mus be skipped by comparing it to @data->rotation_mask. See @data->rotation_mask for the expected behavior.
+ *
+ * @data: Test configuration
+ * @rotation: Rotation to check for skipping
+ */
+static bool should_skip(struct data_t *data, uint32_t rotation)
+{
+	return (rotation & data->rotation_mask) != data->rotation_mask;
+}
+
 /**
  * non_equals_crc() - Check if at least one CRC is different
  *
@@ -252,6 +272,8 @@ static void get_ref_crcs(struct data_t *data, igt_output_t *output, enum pipe pi
 
 	for (int r = 0; r < ARRAY_SIZE(tested_rotation); r++) {
 		int rotation = tested_rotation[r];
+		if (should_skip(data, rotation))
+			continue;
 		igt_debug("Computing reference CRC for rotation-%s-reflect-%s\n", igt_plane_rotation_name(rotation),
 			  igt_plane_reflect_name(rotation));
 		/* Configure the pipe for reference frame */
@@ -306,6 +328,8 @@ static void get_crcs(struct data_t *data, igt_output_t *output, enum pipe pipe,
 
 	for (int r = 0; r < ARRAY_SIZE(tested_rotation); r++) {
 		int rotation = tested_rotation[r];
+		if (should_skip(data, rotation))
+			continue;
 		igt_debug("Computing CRC for rotation-%s-reflect-%s\n", igt_plane_rotation_name(rotation),
 			  igt_plane_reflect_name(rotation));
 		/* Configure the pipe for reference frame */
@@ -364,9 +388,36 @@ static void run_test(struct data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_output_set_pipe(output, pipe);
 	/* Check that the rotation is supported */
 	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
+
+	/* Get and ensure that the used crtc sizes are compatible with the current format */
 	format_description = lookup_drm_format(format);
-	width = ARRAY_SIZE(colors) * format_description->hsub * format_description->vsub * 6;
-	height = ARRAY_SIZE(colors) * format_description->hsub * format_description->vsub * 6;
+	if (data->width) {
+		width = data->width;
+		if (format_description->hsub > 1 || format_description->vsub > 1)
+			if (width % ARRAY_SIZE(colors) || width % format_description->hsub ||
+			    width % format_description->vsub) {
+				igt_warn("The requested width (%d) is not compatible with the format %s.\n"
+					 "The test will probably fail because of this.\n"
+					 "To avoid issues with subsampling and rotations, the size must be a multiple of %lu, %d and %d\n",
+					 width, igt_format_str(format), ARRAY_SIZE(colors), format_description->hsub,
+					 format_description->vsub);
+			}
+	} else {
+		width = ARRAY_SIZE(colors) * format_description->hsub * format_description->vsub * 6;
+	}
+	if (data->height) {
+		height = data->height;
+		if (format_description->hsub > 1 || format_description->vsub > 1)
+			if (height % format_description->hsub || height % format_description->vsub) {
+				igt_warn("The requested height (%d) is not compatible with the format %s.\n"
+					 "The test will probably fail because of this.\n"
+					 "To avoid issues with subsampling and rotations, the size must be a multiple of %lu, %d and %d\n",
+					 height, igt_format_str(format), ARRAY_SIZE(colors), format_description->hsub,
+					 format_description->vsub);
+			}
+	} else {
+		height = ARRAY_SIZE(colors) * format_description->hsub * format_description->vsub * 6;
+	}
 
 	/* Generate reference CRC with software rotation */
 	get_ref_crcs(data, output, pipe, plane, width, height, format, modifier, ref_crc);
@@ -377,6 +428,8 @@ static void run_test(struct data_t *data, igt_output_t *output, enum pipe pipe,
 
 	for (int c = 0; c < ARRAY_SIZE(tested_rotation); c++) {
 		int rotation = tested_rotation[c];
+		if (should_skip(data, rotation))
+			continue;
 		igt_dynamic_f("pipe-%s-format-%s-modifier-%s-rotation-%s-reflect-%s", kmstest_pipe_name(pipe),
 			      igt_format_str(format),
 			      igt_fb_modifier_name(modifier), igt_plane_rotation_name(rotation),
@@ -402,6 +455,9 @@ static void test_all_formats(struct data_t *data)
 				uint32_t format = plane->formats[f];
 				uint32_t modifier = plane->modifiers[f];
 
+				if (data->format != 0 && data->format != format)
+					continue;
+
 				if (!igt_fb_supported_format(format))
 					continue;
 				run_test(data, output, pipe, plane, format, modifier);
@@ -412,15 +468,65 @@ static void test_all_formats(struct data_t *data)
 
 static int opt_handler(int opt, int opt_index, void *void_data)
 {
-	return IGT_OPT_HANDLER_SUCCESS;
+	struct data_t *data = void_data;
+	switch (opt) {
+		case 'f': /* --format */
+			data->format = igt_drm_format_str_to_format(optarg);
+			return IGT_OPT_HANDLER_SUCCESS;
+		case 'x': /* --reflect_x */
+			data->rotation_mask |= IGT_REFLECT_X;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case 'y': /* --reflect_y */
+			data->rotation_mask |= IGT_REFLECT_Y;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case '0': /* --rot_0 */
+			data->rotation_mask |= IGT_ROTATION_0;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case '9': /* --rot_90 */
+			data->rotation_mask |= IGT_ROTATION_90;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case '1': /* --rot_180 */
+			data->rotation_mask |= IGT_ROTATION_180;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case '2': /* --rot_270 */
+			data->rotation_mask |= IGT_ROTATION_270;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case 's':  /* --size_x */
+			data->width = strtoul(optarg, NULL, 0);
+			return IGT_OPT_HANDLER_SUCCESS;
+		case 't':  /* --size_y */
+			data->height = strtoul(optarg, NULL, 0);
+			return IGT_OPT_HANDLER_SUCCESS;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
 }
 
 static const struct option long_opts[] = {
+	{ .name = "format", .has_arg = true, .val = 'f'},
+	{ .name = "reflect_x", .has_arg = false, .val = 'x'},
+	{ .name = "reflect_y", .has_arg = false, .val = 'y'},
+	{ .name = "rot_0", .has_arg = false, .val = '0'},
+	{ .name = "rot_90", .has_arg = false, .val = '9'},
+	{ .name = "rot_180", .has_arg = false, .val = '1'},
+	{ .name = "rot_270", .has_arg = false, .val = '2'},
+	{ .name = "size_x", .has_arg = true, .val = 's'},
+	{ .name = "size_y", .has_arg = true, .val = 't'},
 	{}
 };
 
-static const char help_str[] = "";
-
+static const char help_str[] = ""
+			       "  --format <fmt>\tSet a specific format to test\n"
+			       "  --size_x <x>\tSet a specific x size for the crtc\n"
+			       "  --size_y <y>\tSet a specific y size for the crtc\n"
+			       "All the following options are used to select a specific rotation to test\n"
+			       "For example --reflect_x --rot_0 will test all rotation involving reflect_x AND rot_0\n"
+			       "  --reflect_x\tOnly test cases where X-reflexion is involved\n"
+			       "  --reflect_y\tOnly test cases where Y-reflexion is involved\n"
+			       "  --rot_0\tOnly test cases where a 0° rotation is involved\n"
+			       "  --rot_90\tOnly test cases where a 90° rotation is involved\n"
+			       "  --rot_180\tOnly test cases where a 180° rotation is involved\n"
+			       "  --rot_270\tOnly test cases where a 270° rotation is involved\n";
 static struct data_t global_data;
 
 igt_main_args("", long_opts, help_str, opt_handler, &global_data)

-- 
2.43.0

