Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9FFCD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A754D10E937;
	Wed, 27 May 2026 19:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JsyN3ann";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B8F10E95F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K2FiosZt3Kl8Ec59LU8hq6vm8qDxpKYdDk9ltl9VHAY=; b=JsyN3annIzlk0Ad+oe7A2TRjPB
 t4vscSoWMOc8vq5DaIGD2Zxs7HYHLdjvSxELfv4oAqVd2ahiPfOhfVtFAm1s8Hrpmai4e94iR5HtN
 aM7adOlYBw/6FCNZ+DbehlPXdBJ1peg7R1ByX3GZzrrMXkvRXoRErBLmQRwL8jsqcU0zyWNPcerCf
 2R0tGDQXMSaP0lak4oxqjokNFdHIdwA+rNqE+NxzwjjJeED4Clypqi4a/L/GS6LX2CPWzt9Vk9JXI
 8L4OErMndPXZJ3JmDhEfXFMkhdYlBDDvAk3OIiT2q+eV9XtNms++BRouVuaoSlOInsyNi7BVJ06nr
 /fS5nlbw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wSJmc-0092ni-31
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 21:19:14 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] tests/kms_colorop: Add cleanup of writeback
 connector
Date: Wed, 27 May 2026 12:18:39 -0700
Message-ID: <20260527191839.639696-4-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527191839.639696-1-John.Harrison@Igalia.com>
References: <20260527191839.639696-1-John.Harrison@Igalia.com>
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

The kms_writeback test has a particular sequence for disabling the
writeback connector before exiting the test. On the other hand, the
kms_colorop test just exits leaving the writeback connector still
active. With the preliminary i915/Xe support for writeback, that leads
to lots of timeouts and driver errors. So, add in the writeback
connector cleanup to allow kms_colorop to be run on Intel platforms
without killing the system.

Presumably, the timeouts and errors are a bug in the preliminary
i915/Xe implementation and need to be fixed. And therefore, having a
test which deliberately does an unclean shutdown is a good thing.
However, this is not the place for such a test, this being a test for
colorops not a test for some random mechanism that happens to be used
to test the colorops. See separate patch to add that shutdown test to
kms_writeback instead.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tests/kms_colorop.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 77d25cda6..f0cfcf405 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -67,6 +67,16 @@
  *
  */
 
+static void cleanup_writeback(igt_display_t *display, igt_output_t *output)
+{
+	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
+				  to_user_pointer(NULL));
+	igt_output_set_writeback_fb(output, NULL);
+
+	igt_output_set_crtc(output, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode, __u32 fourcc_in,
 				    __u32 fourcc_out)
@@ -493,6 +503,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 			}
 
 			igt_fixture() {
+				cleanup_writeback(&display, output);
 				igt_detach_crtc(&display, output);
 				igt_remove_fb(display.drm_fd, &input_fb);
 				igt_remove_fb(display.drm_fd, &output_fb);
-- 
2.43.0

