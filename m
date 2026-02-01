Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BA9E83061
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B765710E535;
	Tue,  3 Feb 2026 08:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="OYc7nowi";
	dkim-atps=neutral
X-Greylist: delayed 12361 seconds by postgrey-1.36 at gabe;
 Sun, 01 Feb 2026 06:11:57 UTC
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com
 [162.62.58.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4D210E004
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Feb 2026 06:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1769926311;
 bh=uxyE50yluaZUUGqNz5+8TuicIcylLkhqQTi4De1FHgU=;
 h=From:To:Cc:Subject:Date;
 b=OYc7nowia3xAwmYGXmxxBUrlfEvuSbQGSV7LyCwXdQxO5RQDPGb8y1z4PR648rBt1
 /9JubB4r9GPXRFwCtchl0l1/SvrwA02AAzpGizCMnj9st0iPpHG/7qDrM7E5nVORYr
 XkRL1LcRWtRgI8E9fNy0086X51hK4nD1KRPc8fsI=
Received: from localhost.localdomain ([171.223.89.62])
 by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
 id 2F130AA6; Sun, 01 Feb 2026 14:11:49 +0800
X-QQ-mid: xmsmtpt1769926309t239pe4qs
Message-ID: <tencent_009881AF754F22143F3943B76A2645C05A0A@qq.com>
X-QQ-XMAILINFO: OeJ9zRfntlNPVN6ywS0pQZvU8H1Tvq/8sDUXdv62p7m4VTh9i7/l7Cikvxglwe
 cx3zMdNDJCvZ8XqGQKzG2Lt8NYzCtxPtKF2TMzb3a/FoSf+8odhIKw9ZIGl1vgCIh9y73Rr6/ah/
 gad4VfTavXdTWq2uNbcRUmykXvVKtUorYCax26CWvkOQuB352/afw/WRvEcd9hoT2aoqySydHCeg
 8DXNuijGk+tY2Pqc2kqOMsEnDjdwn/1Ze/5/3GIBKthgSZQqDx5qI3klY7y7EdOebnJwcf00bIoX
 H52CaLbhwKNLvtTQLMy/LGmWkbohCupxgAz0S4CCZnbIrafncGsQwhGmJzGre0Mnnly/loq+I2Vn
 SS4REyhQMB4I8NlqB/iiQL0Dvex//tFtaDkzZUshR71vNyOA8eS7GtI3hAKbpBvagIZ4htAc64LJ
 KNKyg9uzqbSZHk2MDqowzLdGHHHDoYRjaqXUo7bhYBKXVMC22I5+Euh+0pvosG4bWRWMhy08tktV
 pnVAcy5esW9WbOpKUv6SYqOpAzhVAjPKIKx1F7kIZb6DCgTePe1/KIdsUp5V8HcMQblUxzAZsrth
 2wm3V3liYccG8ohgbEOkUPhzk1lspKsYFun5gxIj11PEZU9tBPY+pRqRQd0rVRXgQvLeZcrFkPiS
 v7lN0aATb+R3UlBVoKtUZcfAyMb6Qm5Gmf97uBVYTJEhtU/LbTAoz7dfvOhvrKVFppKs6p0ZST9c
 6FktVaQNmWvtjtmzjiny66hdEzTXemBYTZsjYkB2Qkr+w4YwFDJ4/xze0RdC/uBZ2ByvK9nWDXSW
 v4Gn9PuRBdk7NDEvHgguuiWs7B7dMCD1X7Mvb+1hA+yqHJJSnLbGd3UTaSlqsyQhcZkw+dR0mcDu
 TEbyv19RKZNCZItflrIFJbetdh7qKr8zMyCpTTHyiUyFCcis0N2Kny6lR8KK+HvTehQ94zPJEObv
 BtMefIh0nZ5KZmckHWhoz1dLkltW/o4RzGhBF9ZcMwt0dZ/en5jfbvJ7wZhQ1DfMs03R7i8nkDb5
 X4lzyf805efzW6hm5y/GiTY1WsMwMksoZIHgVM62v7xypjV/1Ko+utw/aD5/knAlq39CSjsg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Renjun Wang <renjunw0@foxmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Renjun Wang <renjunw0@foxmail.com>
Subject: [PATCH i-g-t] tests/kms_plane: Allow planar-pixel-format-settings to
 pass on VKMS
Date: Sun,  1 Feb 2026 14:11:43 +0800
X-OQ-MSGID: <20260201061143.178953-1-renjunw0@foxmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:00:46 +0000
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

Set expected_rval to 0 for planar-pixel-format-settings tests when
running on VKMS driver. VKMS currently accepts odd width/height for
NV12, odd horizontal panning for NV12, and odd vertical panning for
P016 formats.

Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
---
 tests/kms_plane.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 21d80847c..57adfe199 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1313,11 +1313,9 @@ static void test_planar_settings(data_t *data)
 	int devid;
 	int display_ver = -1;
 	int rval;
+	bool is_intel = false;
+	bool is_vkms = false;
 
-	/*
-	 * If here is added non-intel tests below require will need to be
-	 * changed to if(..)
-	 */
 	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
 	if (is_intel_device(data->drm_fd)) {
 		igt_require_intel(data->drm_fd);
@@ -1325,6 +1323,9 @@ static void test_planar_settings(data_t *data)
 		igt_require(intel_display_ver(devid) >= 9);
 		display_ver = intel_display_ver(devid);
 		igt_require(display_ver >= 9);
+		is_intel = true;
+	} else if (is_vkms_device(data->drm_fd)) {
+		is_vkms = true;
 	}
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
@@ -1337,12 +1338,12 @@ static void test_planar_settings(data_t *data)
 				  DRM_MODE_ATOMIC_ALLOW_MODESET,
 				  NULL);
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
+	/* Test odd width for NV12 format */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 20)
+		if ((is_intel && display_ver >= 20) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 257, 256,
@@ -1358,12 +1359,12 @@ static void test_planar_settings(data_t *data)
 		igt_debug("Odd width NV12 framebuffer test skipped\n");
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
+	/* Test odd height for NV12 format */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 20 && display_ver < 35)
+		if ((is_intel && display_ver >= 20 && display_ver < 35) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 256, 257,
@@ -1378,13 +1379,12 @@ static void test_planar_settings(data_t *data)
 	} else {
 		igt_debug("Odd height NV12 framebuffer test skipped\n");
 	}
-
-	/* test against intel_plane_check_src_coordinates() in i915 */
+	/*Test odd horizontal panning for NV12 format */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 35)
+		if ((is_intel && display_ver >= 35) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 810, 590,
@@ -1401,11 +1401,12 @@ static void test_planar_settings(data_t *data)
 		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
 	}
 
+	/* Test odd vertical panning for P016 format */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
 					    DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (display_ver >= 20 && display_ver < 35)
+		if ((is_intel && display_ver >= 20 && display_ver < 35) || is_vkms)
 			expected_rval = 0;
 
 		igt_create_color_fb(data->drm_fd, 256, 260,
-- 
2.47.3

