Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172C606A31F
	for <igt-dev@archiver.kernel.org>; Sat, 31 Oct 2026 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zVzQM3Xf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A2F10E10C;
	Sat, 31 Oct 2026 18:01:07 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8974310E2F1
 for <igt-dev@lists.freedesktop.org>; Sat, 31 Oct 2026 18:00:10 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-8446af403b5so1150575a34.2
 for <igt-dev@lists.freedesktop.org>; Sat, 31 Oct 2026 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793469609; x=1794074409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NEhM7wx10rGdRodalwfTtRs4GfDnLsMeh5TTw3hT8zc=;
 b=zVzQM3XfNXnYjseX2NHGBsRUa0X5HWRp9MVLF/9geAZ8s+4bxR92Hzg9OsurhqGili
 Y2l31cKM/UFUl7zMnxkeCPfrX3Dm1WhNpR/9YzQP1qQYsydqZDCDTQi7EjrsHyiHBSJq
 KWXAXdKHSCq1SKkbwEO+IFKwBHerJlOXRBYKVtbi66ErJW5B+KXPwNyfQgUnnby3Av5/
 Qwuc2R11Ae1lTvgTBgLXIvoZukCvlfC6O1Vz+kLhsL0YpVWn3AKQUgs9bSeP4XlGKmsm
 V6uZGQ82U8FansyOOwHE/MsFYLLWMOxkIy34lBWVWcHnlOmbbEU9BeWLhliN0eVmpm9d
 XVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793469609; x=1794074409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NEhM7wx10rGdRodalwfTtRs4GfDnLsMeh5TTw3hT8zc=;
 b=wQAVgcumBalL4pIXQlQf+0/DvZpJoxPeULXR2O8ipyqRrsWYZHNoPcGHPjz5uNByxp
 eI0+wK8/CIilhG6E3OT2s0WfSC6OVy/d+r4avOQbjCN+tRGo04L7ypdeekovx23e9oMV
 0RGh5RQzq3EUHm3hWHW59s2mZ113qSVBFIz4s++QkDkkU2vbvLCH/VPydh6oQUzgyAcs
 tQX7oeh5/4f/AvTHY17cJ7gjBwa7B9kvse6/jongOrXwV8QOkIlbRpLwwGv+YhQowuiN
 KDsTNwkaiZJRpjgjrOU4UPK8OVOFmzlTQbL9zMRNQYIgmElMrjguGfl33IY/EM8ERzYX
 NnCg==
X-Gm-Message-State: AFq9FYLh0LQ50IgEergYq0hNi7Li6V2VHk22xpoEFvVTWKbbnrPnGzwm
 HpscFAMChRLGjSyU7fvAYnkO8J6A2+jqvbzpcAebisdTn9QHyoENPLwlZeGlVul7
X-Gm-Gg: AYBFou3hyj3SjsdzOxEvugyBzTm8mHGJ9YIVnzbisXr1fwcyVhX7xoWgHx/l8+eYqcl
 7t7boA2WHV0+qVeRu0pOZ9ufTnfavEtF2NcoPrvRN6NH/HP1hb0IqMg4G5eWedcqRXZ4lHRFpn6
 y0v+8OUn3GpWxa83uCVUVp/UAsnZr8Ve9YABNc8ftD3O+3e4KLL12e/5nExTJpW1ls2SS+vb4RC
 jel+efyMuWmRFHKkCKRuM/9oA9l+pwAb0BCEMx2stO4hvLE6Ql4nbFBAJ2CyGgj2VpS2HhFkg1W
 vWZvAZ+/C+sggq4HDXlPyMGyiQoKx2h/6uCmU0ektZCrWjEiRA+Zc1qfuVefRmP5Q7gg9QWQh2R
 ZepTP3pTeWixLsvzbYgFnRKBMhNVbQJ74ndzgXEoK2qH86l3RohRS+2OC/N6V/wdkkUOKtKXN+R
 82zF51OrSW+ODKD7YrPT05gXRmzMdAV/tJ0iTAK3QlJFcLd7kF52S3hFbFA3KLNTrz55q4Mnl9m
 9hS4OgXkrJUhWCQn6Blikn661/lqDtDKcGqJQz2BcqcpfdWScxZ60wezzqevVt+z9ur0JYhnb/N
 CLwH8whfH6ZM5kvX6lv7EDBz63Aa8aDlQavDdyTYbmZjGUF2PaEY4M7iUDGvEl6v62ka9yUz9Ac
 JXWGWEcUfmgQ=
X-Received: by 2002:a05:6830:2641:b0:7f4:d1aa:2f32 with SMTP id
 46e09a7af769-85d364d1dfemr4110292a34.11.1793469609505; 
 Sat, 31 Oct 2026 11:00:09 -0700 (PDT)
Received: from localhost.localdomain ([72.12.197.23])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d354d12f2sm4897102a34.17.2026.10.31.11.00.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 31 Oct 2026 11:00:08 -0700 (PDT)
From: Aditya Tipre <tipreaditya@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, louis.chauvet@bootlin.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 swati2.sharma@intel.com, tipreaditya@gmail.com
Subject: [PATCH i-g-t v2] tests/kms_writeback: Check CRC capture survives
 writeback
Date: Sat, 31 Oct 2026 13:59:59 -0400
Message-ID: <20261031175959.2294-1-tipreaditya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261025182420.52258-1-tipreaditya@gmail.com>
References: <20261025182420.52258-1-tipreaditya@gmail.com>
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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

Signed-off-by: Aditya Tipre <tipreaditya@gmail.com>
---
Changes in v2:
- Use my full name in the author and Signed-off-by fields.
- No code changes.

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

