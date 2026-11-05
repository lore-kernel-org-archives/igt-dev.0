Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E3606A31B
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 22:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UdyElfHO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6270310E9B5;
	Thu,  5 Nov 2026 22:58:50 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F6B10E9A0
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 22:56:50 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-843ea301d60so70207a34.0
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Nov 2026 14:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793919409; x=1794524209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dJG9EjcLX0J+je4F8kocncl8s7YZhNKoH4ApuoT+Q7M=;
 b=UdyElfHOhsFFgt0yGmYrEf/t91BIKLeE32M/h+ucCjBlYmntxplz0SKyIy9ISts4Co
 ndplwWJpLesCvRB/eDNOiNG2NcgzBK2omPNk33y/Iofc3o6jDKDbTUmTmC4vrtBa3FRr
 2Xa1XCKHOmZVM/izWT6tO3f1yhmMh7SQr28iJ4KpcZpXwCPz2Z1VOhnUnEq3rCuqSSEX
 sZNKDT4bOkbaXCvea+BdUVd4nIxOHyIt51/BTZrcc4a7UpVkugMDXIRrSZ+3nZt5L+Yd
 glMHTjrp8X/3HJ2SjIg1Yrkszo3kClFyIeF3Y/4f9S90zrMRJmH2d+wlYuRqy1cYbNDa
 2Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793919409; x=1794524209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dJG9EjcLX0J+je4F8kocncl8s7YZhNKoH4ApuoT+Q7M=;
 b=eQ06FIcivCr3eXf4zn4PIDi68beqximXYGkkfGlEWIBts2wjjSzGVAdcvCx9RpfD1k
 TrrgGxHACECB98tBefFoVyfz/oa1Mo/2ZbjHstvF20q4e5QEtfQ/jwyVqHmQ/7h8SibL
 Yrcr4WB2fizHl7lsvqks5WUXxruoqhlF1KJ8xbXuzDa1dSvPOwwcyqSjoy+ZCMDm5kDK
 PlGFAlzkGYcbmoSwIaS1UsQFn4JqUlTtRhi73J7hHJ6f6hiYH1gfnB4GQ45H6XmFQA1X
 fCsHO+CjZWhpkv5hUrew0sNykFrqObk1gC6ySG49cLAB2z8BiJH0+lDvXQDLKn9k6Pow
 DUcg==
X-Gm-Message-State: APuU4Z9hRsdX/AW3WokQ/UnjwVSqoHmdPAyktTs1DCBiKw5cWPygEZyz
 rqVitW7V841GHWlaQxub1+50jHhlM6Kys5i8wL0d0wINmvBOdtfY9OMMMak6lYDO
X-Gm-Gg: AYBFou3fzC2FcFdDRjMi7wsMct2ukL3A+sbAy/j+epwJFqDE8HmhW5TVdND4DSrKyz5
 qjK4/ZKTSG4Wf0evI6IM9BUjXSy6TmB+reSpJRj388WD0FOOzCcEs7Vp32AKxRGO9lZRDNmwJ04
 7QiGsx224eHBMLABKRQ86DGtAbfEwXtzz41u/6KSmnXU8e1glVLeJKCIxe/lV1NoSZwGsjDRdM4
 eNBnQW7M1s0pWRxTQp03/Uk4mW8KaHYBLKtYEjJ0EGj/dzZB+lzzJzj6xCuLbJCZiZWxRWX/q2i
 A0HjmmiUg2Z6LNWv8mIezC0kCJiFggBglKOc4N8dytFWtpbOpIhDnL7BpNKiqotkcDDJRwTSZZ1
 8F/nJ7Koz/oKb9xOcUD1YTibDP79vu3fJTlBVbcHHkpYLvlmAqz+CPcmFv5dcqpVD1KYt4ZrrOz
 Cvzk7LVIMjcwL3qe9NpV/WSTjlv28Xv67lH2vvbxJeFx7q0piKf+1gxcZ1w1cxtaA/YauDra0Tj
 3ZsPAeaeGO3DKwZaY+X4cBs2Hm0h7zz+vXXb1cGNz2inP2KZHxllFwRVZtHpeUCbBcE7JqXv3nh
 zCxWIiQKfun8BUD7m92QicMvjFLSC+x6e7xDv2GFVk2hJZwLtIDG+8qwTtVY4UT/oc1oQGI3gZj
 tAdaSJ3yh8Fg=
X-Received: by 2002:a05:6830:2695:b0:817:fe44:989c with SMTP id
 46e09a7af769-85f1cfcdef1mr897832a34.19.1793919409069; 
 Thu, 05 Nov 2026 14:56:49 -0800 (PST)
Received: from localhost.localdomain ([72.12.197.23])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1dbf3741sm553742a34.9.2026.11.05.14.56.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 14:56:48 -0800 (PST)
From: Aditya Tipre <tipreaditya@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, louis.chauvet@bootlin.com,
 sowmiya.s@intel.com, kamil.konieczny@linux.intel.com,
 karthik.b.s@intel.com, swati2.sharma@intel.com, tipreaditya@gmail.com
Subject: [PATCH i-g-t v3 2/2] tests/kms_writeback: Check CRC capture survives
 writeback
Date: Thu,  5 Nov 2026 17:56:28 -0500
Message-ID: <20261105225628.4123-2-tipreaditya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261105225628.4123-1-tipreaditya@gmail.com>
References: <PH7PR11MB6796FA8DDA56651E65E018D2E5682@PH7PR11MB6796.namprd11.prod.outlook.com>
 <20261105225628.4123-1-tipreaditya@gmail.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
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

Add a VKMS-only writeback-preserves-crc subtest. Complete the initial
modeset before starting capture and establish reference CRCs for separate
red and blue input framebuffers. Keep capture open across four alternating
writebacks, wait for each output fence, and compare three fresh CRC samples
with the corresponding reference after each writeback. Do not allow
modesets once capture starts, since they may disrupt CRC generation.

Clear the pending out-fence request left by the configuration probe before
the initial modeset so the subtest also works when run independently.
Use the final fixture to close capture, disable the output, and remove the
two new framebuffers so subtest failure or skip also cleans them up.

Check output fence status in the shared wait helper so a signalled error
fence cannot be treated as a successful writeback.

On ARM64 QEMU with one and two CPUs, the new subtest fails with a CRC read
timeout on the unmodified kernel and passes with the VKMS composer-user
lifetime fix, both independently and in the full writeback suite.

Signed-off-by: Aditya Tipre <tipreaditya@gmail.com>
---
Changes in v3:
- Add the preceding writeback-fb-id completion fix so earlier subtests do
  not race while reusing the shared input framebuffer.
- Restrict the new subtest to VKMS in metadata and at runtime.
- Explain why commits after starting CRC capture do not allow modesets.
- Release the new framebuffers in the final fixture after disabling output.
- Clear the configuration probe's pending writeback out-fence request so
  the subtest works independently of earlier writeback subtests.

Changes in v2:
- Use my full name in the author and Signed-off-by fields.
- No code changes.

Validation on ARM64 QEMU/HVF with one and two CPUs:
- With both patches applied, all four existing applicable subtests pass on
  the unfixed and fixed kernels; both XRGB2101010 cases skip.
- The new regression, independently and in the full suite, times out at
  the post-writeback CRC read on the unfixed kernel and passes with the
  VKMS composer lifetime fix.
- Disposable probes verify FB and buffer-handle cleanup before DRM FD close
  after partial setup, CRC comparison failure while blue is scanned out,
  the natural baseline timeout, success, and skip.

 tests/kms_writeback.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 550d603..e277752 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -64,6 +64,10 @@
  *
  * SUBTEST: writeback-pixel-formats
  * Description: Check the writeback format
+ *
+ * SUBTEST: writeback-preserves-crc
+ * Description: CRC capture remains active across completed writebacks
+ * Driver requirement: vkms
  */
 
 IGT_TEST_DESCRIPTION(
@@ -321,6 +325,7 @@ static void get_and_wait_out_fence(igt_output_t *output)
 
 	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
 	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
+	igt_assert_eq(sync_fence_status(output->writeback_out_fence_fd), 1);
 	close(output->writeback_out_fence_fd);
 	output->writeback_out_fence_fd = -1;
 }
@@ -541,6 +546,8 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_output_t *output;
 	igt_plane_t *plane;
 	igt_fb_t input_fb, input_fb_10bit;
+	static igt_pipe_crc_t *pipe_crc;
+	static igt_fb_t crc_blue_fb, crc_output_fb;
 	drmModeModeInfo mode;
 	unsigned int fb_id;
 	int ret;
@@ -713,8 +720,68 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
 
+	igt_describe("CRC capture remains active across completed writebacks");
+	igt_subtest("writeback-preserves-crc") {
+		igt_fb_t *colors[] = { &input_fb, &crc_blue_fb };
+		igt_crc_t reference[2], crc;
+		int i, j;
+
+		igt_skip_on(data.dump_check || data.list_modes);
+		igt_require(is_vkms_device(display.drm_fd));
+		igt_require(data.supported_colors & XRGB8888);
+		igt_require_pipe_crc(display.drm_fd);
+
+		igt_create_color_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.0, 0.0, 1.0, &crc_blue_fb);
+		igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &crc_output_fb);
+		fill_fb(&input_fb, 0x00ff0000);
+		igt_plane_set_fb(plane, &input_fb);
+		igt_output_set_writeback_fb(output, NULL);
+		/* Discard the out-fence request left by the configuration probe. */
+		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
+					  to_user_pointer(NULL));
+		igt_display_commit_atomic(&display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* Finish the modeset before starting continuous CRC capture. */
+		pipe_crc = igt_pipe_crc_new(display.drm_fd, output->config.crtc_index,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_start(pipe_crc);
+
+		/*
+		 * Establish both references before writeback can affect capture.
+		 * Do not allow modesets below: they may disrupt continuous CRC
+		 * generation.
+		 */
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
+			igt_output_set_writeback_fb(output, &crc_output_fb);
+			igt_display_commit_atomic(&display, 0, NULL);
+			get_and_wait_out_fence(output);
+
+			/* Require fresh frames without stopping or restarting capture. */
+			for (j = 0; j < 3; j++) {
+				igt_pipe_crc_get_current(display.drm_fd, pipe_crc, &crc);
+				igt_assert_crc_equal(&reference[color], &crc);
+			}
+		}
+	}
+
 	igt_fixture() {
+		igt_pipe_crc_free(pipe_crc);
 		cleanup_writeback(&display, output);
+		igt_remove_fb(display.drm_fd, &crc_blue_fb);
+		igt_remove_fb(display.drm_fd, &crc_output_fb);
 		igt_remove_fb(display.drm_fd, &input_fb);
 
 		if (data.supported_colors & XRGB2101010)
-- 
2.50.1 (Apple Git-155)

