Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841D4C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 09:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F5B10F345;
	Tue, 12 Mar 2024 09:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jgw4zmpb";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73C910F6FA
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 09:39:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A6F02000E;
 Tue, 12 Mar 2024 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710236344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MPas7ss9oJR5PQ+t8OG5UUDAgUtkOvu+7a0P0O3k3gY=;
 b=jgw4zmpbgJ3LtIRj36+KFA1r0o0c2Vvr/71OU8kvYbmww5M3IuxP9HyIAXhDiU6sPdJL/Z
 +tlZ/kDFPx3/IlNhsG8fX1B5kSnTsQ2oh5NQzm/GXoW/R5Zr9sIDYHnvEEkRCcomVJq9wc
 KSpQ3HYlwufGDSqWcO9uAJ9rw1wRmFqoDXBXdRb1V5DGt8W7YndE5Zo9yWQRwnsUZ0ZMNJ
 /zZ8qsej7TCPIqIY3OJ0zS885wMiYZBxek6EKm/PVPV4hOQ4pO5HqulyBhy7eeTVCH3+Wy
 DvCpSOi4Flf8I9Gdb002X4kd59tjpIjzAsSLpzZTjRPF3Fc7gfpf0OJrpUtvqw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 12 Mar 2024 10:39:00 +0100
Subject: [PATCH i-g-t 3/3] tests/kms_rotation: Add command line option to
 reduce the number of tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240312-new_rotation-v1-3-ed9fe82589df@bootlin.com>
References: <20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com>
In-Reply-To: <20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5766;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=k/sYgcvDnR/UQTxr07qFM7L6Hn5fAQg5/6WytDyo9QA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8CK2Ow4Mqvf6MInik1yFRLv+lXEWp3SA4nxOpjW2
 JDzg6k+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfAitgAKCRAgrS7GWxAs4gezD/
 95pMHTQUk3KZhtZkpOx++EZ9Qx5Oa1e2SovQZ2qoz0bzOFYZVxfqKM5MLQVvAAI2AkDT6xSBFdX8DR
 sWRR6OqeU1n/iDv8NieZKcc0/R1rhSQ2UbWLYIjI3C1IOz7gLoJMTir6oPBbdD/nY+c4efvlSvo3Ud
 FX3MSzD3hC7nsA+AEFsGmoF53aQF0HdghSBGgguHMpU4wAECdRha3syzIJn5f0JDmFCIWJ7DpibO+7
 kr0iq5zYzvhDNgUjMQCtmsoANlqU9ZQVxneAHGo+CnR8Dd9B3C6FQcTcGfFBuNSD4rVmxoRuMWtkvo
 YHwI2EokySYChxHg2H2gnyXvecWWRnIX4ofjp94IoSovGtKai9FnW0BMsg0W5Ku6sQ1aNoVcrpcvVY
 XUp05rrQ/JLknkR80wvGhGfeR9g69XMENL0oFbjZ5yJT+2TmkXwELEDXCbMd55Jr+dA9J1C+2lXXTV
 E/0uTOVTrtKPrYiMS2Z+xTXLNOQfVZ56dT0fcxSD06IBQ3LNc1S4UWjMNGtzR6T6WSh76GbNdz5Gfp
 wuy9fYiyweTJVkGE3ACj8MyqeYJchw0HRetgKRbCBMjUHJbD+RiQ9UKf+Nh8XtLLDXgWH4Ves1+5RC
 xrKBoD6hTSNgXUoSf8W4TfnHaVXkPSfSuPHxMx6SUq1NYa8XI8Qn5XlOpXtQ==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_rotation.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/tests/kms_rotation.c b/tests/kms_rotation.c
index 4062549a0beb..f09ce9db665c 100644
--- a/tests/kms_rotation.c
+++ b/tests/kms_rotation.c
@@ -20,10 +20,17 @@
  *
  * @fd: file descriptor for the current drm device
  * @display: display used for the tests
+ * @format: If not zero, the format to test
+ * @rotation_mask: A mask of IGT_ROTATION_* / IGT_REFLECT_*. This allows running only the subtests where all the values
+ * in this mask are used. So for example:
+ *   IGT_ROTATION_0 | IGT_REFLECT_X will run rot_0, rot_0+reflect_x, rot_0+reflect_x+reflect_y
+ *   IGT_ROTATION_180 | IGT_ROTATION_90 will not run anything, it's not possible to rotate by 90 and 180 simultaneously
  */
 struct data_t {
 	int fd;
 	igt_display_t display;
+	uint32_t format;
+	uint32_t rotation_mask;
 };
 
 /**
@@ -63,6 +70,18 @@ static uint32_t tested_rotation[] = {
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
+static bool should_skip(struct data_t *data, uint32_t rotation) {
+	return (rotation & data->rotation_mask) != data->rotation_mask;
+}
+
 /**
  * non_equals_crc() - Check if at least one CRC is different
  *
@@ -196,6 +215,8 @@ static void get_ref_crcs(struct data_t *data, igt_output_t *output, enum pipe pi
 
 	for (int r = 0; r < ARRAY_SIZE(tested_rotation); r++) {
 		int rotation = tested_rotation[r];
+		if (should_skip(data, rotation))
+			continue;
 		/* Configure the pipe for reference frame */
 		igt_display_reset(&data->display);
 		igt_output_set_pipe(output, pipe);
@@ -242,6 +263,8 @@ static void get_crcs(struct data_t *data, igt_output_t *output, enum pipe pipe,
 
 	for (int r = 0; r < ARRAY_SIZE(tested_rotation); r++) {
 		int rotation = tested_rotation[r];
+		if (should_skip(data, rotation))
+			continue;
 		/* Configure the pipe for reference frame */
 		igt_display_reset(&data->display);
 		igt_output_set_pipe(output, pipe);
@@ -299,6 +322,8 @@ static void run_test(struct data_t *data, igt_output_t *output, enum pipe pipe,
 
 	for (int c = 0; c < ARRAY_SIZE(tested_rotation); c++) {
 		int rotation = tested_rotation[c];
+		if (should_skip(data, rotation))
+			continue;
 		igt_dynamic_f("pipe-%s-format-%s-modifier-%s-rotation-%s-reflect-%s", kmstest_pipe_name(pipe),
 			      igt_format_str(format),
 			      igt_fb_modifier_name(modifier), igt_plane_rotation_name(rotation),
@@ -324,6 +349,9 @@ static void test_all_formats(struct data_t *data)
 				uint32_t format = plane->formats[f];
 				uint32_t modifier = plane->modifiers[f];
 
+				if (data->format != 0 && data->format != format)
+					continue;
+
 				if (!igt_fb_supported_format(format))
 					continue;
 				run_test(data, output, pipe, plane, format, modifier);
@@ -334,15 +362,55 @@ static void test_all_formats(struct data_t *data)
 
 static int opt_handler(int opt, int opt_index, void *void_data)
 {
-	return IGT_OPT_HANDLER_SUCCESS;
+	struct data_t *data = void_data;
+	switch (opt) {
+		case 'f':
+			data->format = igt_drm_format_str_to_format(optarg);
+			return IGT_OPT_HANDLER_SUCCESS;
+		case 'x':
+			data->rotation_mask |= IGT_REFLECT_X;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case 'y':
+			data->rotation_mask |= IGT_REFLECT_Y;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case '0':
+			data->rotation_mask |= IGT_ROTATION_0;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case '9': // 90
+			data->rotation_mask |= IGT_ROTATION_90;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case '1': // 180
+			data->rotation_mask |= IGT_ROTATION_180;
+			return IGT_OPT_HANDLER_SUCCESS;
+		case '2': // 270
+			data->rotation_mask |= IGT_ROTATION_270;
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
 	{}
 };
 
-static const char help_str[] = "";
-
+static const char help_str[] = ""
+			       "  --format\tSet a specific format to test\n"
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

