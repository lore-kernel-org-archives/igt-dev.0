Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747C4606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jz82Vd2h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2858110E0D8;
	Mon, 26 Oct 2026 08:57:38 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B6610E2AD
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Oct 2026 18:24:25 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-854e904005cso108464a34.1
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Oct 2026 11:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792952664; x=1793557464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/T7fiSPlKiLhGhZT4rMc/42F0EceA/cMU4biTXFIUI4=;
 b=jz82Vd2hmLJ34Rd2DhLJQtsqpx8Zwd30MzNwIQhf11HOirvPv40QpJ8ODinIMEstHE
 WGDB0tAMNX+vjSslyzbYT8JC28RTjmVyMvqcuxR8v6fXwc7KaO4NwUQaHdUqnLmhnRn3
 kUd+aJ+BBiC51L4zFNRUuwPDA82wFXzdC/ssECyVdoqqzSxkykVsvYkKaJ/ZfR+sj95w
 juulVQFDypBG5mI6o3iHyCsnhZC6tW1jPKVwYsyz3465CrZJp/HVvS0QnDm9xm3be3dG
 f4cKAvcsa4t0Q4tzfkd80Mu8BM0Cm0XweLj6s/Z6h2VRt/TdkGnuGdd/JVIWkB4OZR1I
 mgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792952664; x=1793557464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/T7fiSPlKiLhGhZT4rMc/42F0EceA/cMU4biTXFIUI4=;
 b=mNQOXRJs3Awaiy4wc8P4XGLqUDL4i3IeX7SOfizAJyEUADG4U2YfnO0jXcujiPeDRX
 +JYhn6ByzJ3PeZOL2KP1IKCpjUt4DeCPqYxvxUq4cw/kC79q4t/wmPJ8KZuvRYJpIbuO
 4Ag/NkhBtzfUdaDpE5U3LFdY9YufIPRveu4mOC7j52wmQdp798ZCgnuppT+Tl2KN4cwW
 hzPJVFM60yClVx27LSy4zENzHC9DbP1mXC/+7fwOr6rG0UdyF19SwpVs7MRVgINjLl+s
 G4D/CiGnSyx2ZvycXktGlVPJygGVNLcNj0eFHlJUpMPY3wXUk3dFWYQCtZFBm4ug4x1k
 DN6w==
X-Gm-Message-State: AFq9FYKm8Egga7QfxGonuY5BQhvZD/0ZHwO5Fyr7Gm51qbApX0RXk17m
 I7OfEn+E9tJaoGNJ8dI6isz5lfkPSTGsUTircNXt48/YtVWEhCxwTCrCyvpNz0hbvC0=
X-Gm-Gg: AYBFou19p+X6dUMe+SIk4P/eV7Fyc/jEXTR1RxSN8OudQ2U5dVbplM3l7qlIhIkC7bP
 E1UGDeOv/xQ8p21bNncvv1crhCdvo24N6NHeiAzFXThrTUvKAk2yNVgW+RQR/LGE1fuVZDszbw6
 y4Y5eESWgD51Cez/4PNDq1oFCWPeKuIqSguQ5PYWAR5n9UrYzCsf2u/oYT45DWjDOCiHpHwGmeE
 cOez5IUvqf82A2GccVvh9nelcD2uMltdqbhFR76ATrLcj7W69k7fQh60ZqsLi9EOxpgOwfpqAYa
 3+ywwm0caqWdCtQqF0x2rDxsEocOtOHH744CuRUGEuGdypsMZjf+AW7VmRVypLd3Kh44F/9yzfT
 yjjJ56rEVRtk+dVei8HhKu/JHU0Pa/dfrGYT0MnhCzIKInEed4K8aKPDavSJ4XfKwfqlcQ/NKS9
 85PRoYbj1YQY2qn3oewE8wOHoh3XR1yDqANvtiHHD6p2ZD1aJhzC7CqQ8Y3NfGm0iwlMYMHqUiW
 1g4WVvfRAS/0AnGMGYd42mLCuLC1+UJXIqPTLObdXDs2OK7oeyhdavmQqMUlXGMVP7U1fnIQuvN
 Rc0fmPyl7iVIG0N73rddCN54AoBQij9/Az75
X-Received: by 2002:a05:6830:2317:b0:843:a64b:6e3b with SMTP id
 46e09a7af769-850ff0a576fmr2804000a34.32.1792952664554; 
 Sun, 25 Oct 2026 11:24:24 -0700 (PDT)
Received: from localhost.localdomain ([72.12.197.23])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fa99bd27sm5396324a34.7.2026.10.25.11.24.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 25 Oct 2026 11:24:23 -0700 (PDT)
From: atipre <tipreaditya@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	louis.chauvet@bootlin.com
Subject: [PATCH i-g-t] tests/kms_writeback: Check CRC capture survives
 writeback
Date: Sun, 25 Oct 2026 14:24:20 -0400
Message-ID: <20261025182420.52258-1-tipreaditya@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Oct 2026 08:56:47 +0000
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The existing writeback tests validate captured framebuffer contents, but
do not keep pipe CRC capture active across writeback completion. This
misses the VKMS bug where writeback cleanup disables the composer while
CRC capture still needs it, leaving subsequent CRC reads waiting for
samples that never arrive.

Add writeback-preserves-crc. Complete the initial modeset before starting
capture and establish reference CRCs for separate red and blue input
framebuffers. Keep capture open across four alternating writebacks, wait
for each output fence, and compare three fresh CRC samples with the
corresponding reference after each writeback. Use atomic updates without
ALLOW_MODESET once capture starts, and release capture from the final
fixture so a failed subtest also closes it.

Check output fence status in the shared wait helper so a signalled error
fence cannot be treated as a successful writeback.

On ARM64 QEMU with one and two CPUs, the new subtest fails on unmodified
mainline and passes with the local VKMS composer-user lifetime
fix. Four existing applicable writeback subtests pass on both kernels;
the two XRGB2101010 subtests skip because the format probe rejects them.

Signed-off-by: atipre <tipreaditya@gmail.com>
---
 tests/kms_writeback.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 7c30e8e..71317cf 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -64,6 +64,10 @@
  *
  * SUBTEST: writeback-pixel-formats
  * Description: Check the writeback format
+ *
+ * SUBTEST: writeback-preserves-crc
+ * Description: CRC capture remains active across completed writebacks
+ * Driver requirement: i915, xe, vkms
  */
 
 IGT_TEST_DESCRIPTION(
@@ -317,6 +321,7 @@ static void get_and_wait_out_fence(igt_output_t *output)
 
 	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
 	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
+	igt_assert_eq(sync_fence_status(output->writeback_out_fence_fd), 1);
 	close(output->writeback_out_fence_fd);
 	output->writeback_out_fence_fd = -1;
 }
@@ -537,6 +542,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_output_t *output;
 	igt_plane_t *plane;
 	igt_fb_t input_fb, input_fb_10bit;
+	static igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo mode;
 	unsigned int fb_id;
 	int ret;
@@ -709,7 +715,63 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
 
+	igt_describe("CRC capture remains active across completed writebacks");
+	igt_subtest("writeback-preserves-crc") {
+		igt_fb_t blue_fb, output_fb;
+		igt_fb_t *colors[] = { &input_fb, &blue_fb };
+		igt_crc_t reference[2], crc;
+		int i, j;
+
+		igt_skip_on(data.dump_check || data.list_modes);
+		igt_require(data.supported_colors & XRGB8888);
+		igt_require_pipe_crc(display.drm_fd);
+
+		igt_create_color_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.0, 0.0, 1.0, &blue_fb);
+		igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &output_fb);
+		fill_fb(&input_fb, 0x00ff0000);
+		igt_plane_set_fb(plane, &input_fb);
+		igt_output_set_writeback_fb(output, NULL);
+		igt_display_commit_atomic(&display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* Finish the modeset before starting continuous CRC capture. */
+		pipe_crc = igt_pipe_crc_new(display.drm_fd, output->config.crtc_index,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_start(pipe_crc);
+
+		/* Establish both references before writeback can affect capture. */
+		for (i = 0; i < ARRAY_SIZE(colors); i++) {
+			igt_plane_set_fb(plane, colors[i]);
+			igt_display_commit_atomic(&display, 0, NULL);
+			igt_pipe_crc_get_current(display.drm_fd, pipe_crc, &reference[i]);
+		}
+
+		for (i = 0; i < 4; i++) {
+			int color = i % ARRAY_SIZE(colors);
+
+			igt_plane_set_fb(plane, colors[color]);
+			igt_output_set_writeback_fb(output, &output_fb);
+			igt_display_commit_atomic(&display, 0, NULL);
+			get_and_wait_out_fence(output);
+
+			/* Require fresh frames without stopping or restarting capture. */
+			for (j = 0; j < 3; j++) {
+				igt_pipe_crc_get_current(display.drm_fd, pipe_crc, &crc);
+				igt_assert_crc_equal(&reference[color], &crc);
+			}
+		}
+
+		igt_plane_set_fb(plane, &input_fb);
+		igt_display_commit_atomic(&display, 0, NULL);
+		igt_remove_fb(display.drm_fd, &blue_fb);
+		igt_remove_fb(display.drm_fd, &output_fb);
+	}
+
 	igt_fixture() {
+		igt_pipe_crc_free(pipe_crc);
 		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
 

base-commit: bb76404eac7032ba85c53eac15b76e4fadaff0de
-- 
2.50.1 (Apple Git-155)

