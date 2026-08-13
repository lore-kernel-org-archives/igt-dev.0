Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C075DC5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 18:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE4D10E2F0;
	Thu, 13 Aug 2026 18:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cXdAMuUJ";
	dkim-atps=neutral
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B6310E2F0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 18:42:31 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-930edb4362dso19699885a.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 11:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786646550; x=1787251350;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:mime-version:date:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=+40iO+7DuogvMRtRyygOIsY7CFf55VI3v08Lm94+sDs=;
 b=cXdAMuUJqP+HaU/qMUqMMpvPwVcyGMe9Vmoppe6mqMm2Pkaouz8azTR1ngvEu5Wmjl
 bgF9+fAnZRI1wtw/U8Px7Knl6DpOSkOIjjC40jcdC4LYHF+Sp72DxGIskREfeGnQr5Uq
 gHciGuOKsH7h+eUaar1WM9zfH3LTjPMSP+UGZSB2Qd4OjsFgINc8wAmtlRQBfZRszwAP
 jFYPRJjyQ37sxfFBKD/7yp7zXb70Wg7/Y8rur7lCbKVsIbOpkKwbNzRaHbPImS57wg5q
 8yoVEToo3wsV5+8fattA6Lrg1L+BQJqmQ68MpelIHbpkVE2OVmDHi0e1JBfjHlmpxKp6
 xswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786646550; x=1787251350;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+40iO+7DuogvMRtRyygOIsY7CFf55VI3v08Lm94+sDs=;
 b=ib/ZNjMgHJRdQRYnKD6V8Dfi6xfg/fsf65vDK6NT80gMOjb53+l+2dOqoc/w0wP4jp
 CZHDKI/UepZr1ghCRV5hQUR3+tcR+iCUCj/E7L6y9RNq5EVvmOH+twG69LoY0WO9tmBF
 D1VT7FWyIUaRJQma8ydkhq6TWlBylGkF6MXfU+0rmb5S/BrqiLVSKE438sg+VkhrpoVn
 e3L7qh9EokPTFe6iWwgi4H/ddii1MebGn+DeLAhbQPmvv1k/VUva8DbttQ4x9vzDpykV
 wHDn5SM6+1OVo9cWkpSrv3CzJNlNzJ5nhcHor0aST6MXEYgcsTYFqrNMivIxoCFjD9UA
 DWRA==
X-Gm-Message-State: AOJu0Yw+8v4aQUyMRye1g/hfdGBGd30LX9uMY6HIKncU7lHwemQ/dvmy
 kgCS8UsmJTwJurOQ2F7T8MR6QazptPZzHxIyeouo77gEe2xLi4FU41g4jQ6uSkHHIrnui74Wc2W
 zdXu53bKFxSeLsBAcrFV1X/Ldx8WtXrZm3zEKUIXplg7fNURlQUyXPgS4UnBIew4eeZW2Y8ZrVt
 iGV1lxgdjbBrixCfXNxeeFFEpks6iF68tsuxIqzM+/Of6VE/EuYYPsrpia7fy57A5tzmo=
X-Received: from qknry14.prod.google.com
 ([2002:a05:620a:914e:b0:936:c78d:8d54])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:a20f:b0:936:af32:aea8 with SMTP id
 af79cd13be357-936bfa33feemr761805385a.31.1786646549987; 
 Thu, 13 Aug 2026 11:42:29 -0700 (PDT)
Date: Thu, 13 Aug 2026 14:42:27 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813184227.2532503-1-markyacoub@google.com>
Subject: [PATCH] tests/unigraf: Mitigate EDID cache races and zero-mode
 fallback panics
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

When initializing the active output geometry directly following an external
unigraf_hpd_pulse(), the legacy execution queried the DRM software cache fo=
r
the current mode.

Because the kernel utilizes an asynchronous background interrupt thread to
negotiate DP AUX EDID transactions, dynamically querying the software cache
right as the kernel is processing the HPD pulse frequently yields 0 structu=
ral
modes. Furthermore, since igt_output_get_mode() does not return a clean NUL=
L
pointer when count_modes =3D=3D 0=E2=80=94but instead returns a pointer to =
an uninitialized
geometry plane=E2=80=94dynamically assigning this blank pipe downstream fat=
ally crashes
the test execution suite when it attempts to allocate a 0x0 coordinate bloc=
k.

This patch stabilizes the execution vectors fundamentally:

1. It replaces igt_output_get_mode() with an active, polling drmModeGetConn=
ector()
   evaluation loop configured to block until conn->count_modes > 0. This en=
forces
   strict timing synchronicity between the unigraf HPD pulse and the kernel
   DP AUX handler.
2. It hoists the mode fetching logic strictly before establishing and bindi=
ng
   the software pipe to the CRTC, guaranteeing that the baseline hardware p=
referred
   mode is secured before any DRM surfaces are allocated.

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 tests/unigraf/unigraf_lt.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
index 81e6ecd3f..0cac014e8 100644
--- a/tests/unigraf/unigraf_lt.c
+++ b/tests/unigraf/unigraf_lt.c
@@ -38,19 +38,45 @@ static void init_output_and_display_pattern(igt_display=
_t *display, igt_output_t
 	igt_crtc_t *crtc;
 	struct igt_fb fb;
 	igt_plane_t *primary;
-	drmModeModeInfo *mode;
+	drmModeModeInfo *mode =3D NULL;
 	int fb_id;
+	int retries =3D 10;
=20
 	igt_modeset_disable_all_outputs(display);
 	igt_display_reset(display);
=20
+	/* Get the current mode */
+
+	while (retries--) {
+		/* Force an active hardware probe instead of a cached one */
+		drmModeConnector *conn =3D drmModeGetConnector(display->drm_fd, output->=
id);
+
+		if (conn && conn->count_modes > 0) {
+			/* Found dynamically probed modes! Update the output config */
+			drmModeFreeConnector(output->config.connector);
+			output->config.connector =3D conn;
+
+			/* DO NOT call igt_output_refresh here! It would free our probed
+			 * connector and replace it with drmModeGetConnectorCurrent. */
+			mode =3D &conn->modes[0];
+			if (mode && mode->hdisplay > 0)
+				break;
+		} else if (conn) {
+			drmModeFreeConnector(conn);
+		}
+
+		igt_info("Waiting for connector modes to repopulate after HPD pulse... (=
%d)\n",
+			 retries);
+		sleep(1);
+	}
+
+	igt_assert(mode);
+
 	igt_output_set_crtc(output, 0);
 	crtc =3D igt_get_crtc_for_output(display, output);
 	igt_output_set_crtc(output, crtc);
=20
-	/* Get the current mode */
-	mode =3D igt_output_get_mode(output);
-	igt_assert(mode);
+	igt_info("Final Mode: %dx%d\n", mode->hdisplay, mode->vdisplay);
=20
 	/* Create a framebuffer with a solid color pattern */
 	fb_id =3D igt_create_color_pattern_fb(display->drm_fd, mode->hdisplay,
--=20
2.55.0.691.gc56d675ccc-goog

