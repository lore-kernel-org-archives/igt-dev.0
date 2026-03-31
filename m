Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE55FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9A10EC7C;
	Tue, 31 Mar 2026 17:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MTE9FvJS";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBAE10EC39
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B63A3C59955;
 Tue, 31 Mar 2026 17:11:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C6CE6029D;
 Tue, 31 Mar 2026 17:11:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37757104504A8; 
 Tue, 31 Mar 2026 19:11:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L1IFifgD9SsYJaAuUBXD6GNBSUloFCFyszI9WfBNdBQ=;
 b=MTE9FvJSRIacymX4l/CmO7+Gl+Vspef5RXmXvOCer+0A+mSqUxEucciGJbBgbw5Gk8nInj
 YaL69pM42rDdhNvcT85ZtL3DXf9tv0aTnPymlTohm4WSdBM6FfNL1xKrNmRbG/4HC9kXFu
 mp7KXvsInhKuUJhGe1I5vhpM57l86EtShL21aN4wF1Dk/r0AvJT0+ymcvyUnhqYB0/RTpN
 9XsQx/JfupkTw4U0AE0YEksfN4/PjhL0On37872c3GLBhkshTVDfI93q+taGgCNzyvNrS7
 E5dJ2oHWucf9uI1i0yFuCiArYzDikTRvgbhFPNU7z5Q18GeXRsdnmAj/c2ijTw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:31 +0200
Subject: [PATCH i-g-t v10 14/49] lib/igt_kms: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-14-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=t1D45M4YePeHyi0CcKrh7b0L0cBTXfcmx0ZhgDbpoOA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA9X1HBfPu6fEp9cT8i28wNQSU/kAEUstUfu
 sDbp4PhnMWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIOoQ//ebCQ1nRmrj4d4Tr2GoepWp1DoQ1Qmxj
 n/4+P6a9zpvsSGkEZPMd12qmUwyBYBlKXNdQ+oJzTIWPtaHijRNJyrfkXNqX9panNsS+6RcRwSb
 v9oAPZxzuXkpKpqUtd+KmNqfhKUxIhWO1zkKJKoWWHrooCNSrJOyLnTxSu8DatVpyyXke6HIrTX
 GgJPi7xlBdUObqQEACklQsV8ex6sm3Ry0crNUXZJCYw+BkullB3+fBSbLmLsJktSH7WhOz8xi9Y
 qAt3l6XlL42zIL7XCpz0vtZ8buNPG2/rKW4FT0pjTIZYaM8FIh1h+PmLQQKprp0g4sQ2uNAXr3J
 KbhZGBmKlOy7crcB9yuu0JFCl+qfP2l882OXqGfN0g5f+MpF6cbPD8Xydl+b+fgZ0wnCj1lIEVa
 vlPxOQXlO4zySuKCW1fiGWqRUZrtYRbr9d1ysUPCQyPLLx7WThdAre/rsZn/7j6bVTOetbQkEoo
 CwkVJaO7124EMbvewwyWC5xPG4J4Z80NdczKcjGF44jnqtIv9Q8QtxHhzEE+bXOUk8jIXvbbq9U
 QMChg0Z1XSt+k+BXYdbDfMXjCL5xEJ87f0domvNi3SYWoG5eCEorX3GjXPrneMbGLTq5qGq7+vD
 xccskXSmt5nOQ1rIrNfCwXNF+TJ52qFM8wzPelDBoZGU+rVsCC4o=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

Const qualifier helps to avoid unwanted modification of a pointer.
To help avoiding those errors, modify the function signature to
use const.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f3166d0ef402..f340548bc3d8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5128,7 +5128,7 @@ int igt_display_drop_events(igt_display_t *display)
  *
  * Returns: String representing a connector's name, e.g. "DP-1".
  */
-const char *igt_output_name(igt_output_t *output)
+const char *igt_output_name(const igt_output_t *output)
 {
 	return output->name;
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8dc06a8cd808..36b11f9b51df 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -601,7 +601,7 @@ igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 int igt_crtc_debugfs_dir(igt_crtc_t *crtc);
 
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
-const char *igt_output_name(igt_output_t *output);
+const char *igt_output_name(const igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);

-- 
2.52.0

