Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99C7EA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F1310E37A;
	Mon, 23 Feb 2026 12:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VcAydrUU";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C4F10E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:08:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A30474E41030;
 Mon, 23 Feb 2026 12:08:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 783645FD43;
 Mon, 23 Feb 2026 12:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D85910368F8F; Mon, 23 Feb 2026 13:08:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CowynX/3UDZSeBoJdEVUkzhUT+rxrv4Bgw05koBm0/E=;
 b=VcAydrUUtlF6S9SghPiC+V5FTp/6NVIJBMEK+PRd9mewLQQNbtXCAmPnszaPN2lHlVuucj
 FaVlnjX97s1UW6K2QczyPk0fsF/hoEaNG023HGh2o10h0GeK2QUsiaObF59uHT4SE5eETQ
 c6WSZkIqTFwJ2KrkCav33yJfq5dU0sowQwoZO6+LShDq/fapMuLAYbLV2P1sMgWnWSDNyC
 +Rp5J8V4QSgEu4GyPBbYCuVpYPayQZtRvQqFjj1ihbiSTNW9bCMyZ0hgcWFMJk3YmghzMO
 i493PciiauFe0VKriMRTxnkCqdpPOwI88gbv8dHJsRKbRiBvltzIW+MBZwrU2A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:20 +0100
Subject: [PATCH i-g-t v7 13/48] lib/igt_kms: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-13-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=hy9bGU7RY2+TQUmDCmQ8/kDt/KBv7tWvUhmwYRzVe9U=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENoZhoOjkKg7SXRcsIm/JP7/HUfTb11e6lSC
 HjrFlAEyhuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLrXw//XWwrCiSdC3T9mT0OUNdTQS8xx3JXud4
 HgJ55C6s8Pb1TwClLJgRgGpiG8Gpl1SNpsewNgs0gtYlWlyyyFFRjdlWTeFs4jUMZGJcbUxblMA
 Df8jg+upR6/evuVkeeq2+J+UAkSWWeWx9RMWbbndCqW7n+Kjz4DulY0Qw+4ZrTnyvC/QrOnqnFY
 ypLLXNryFCAXTplM9U2nocKqIfZBYTiCT0ENUbSl/dPYqcj37NpuD4Zbt4jyHVwJFPj7Wfc3Uyk
 S0a8xPlVVFFKnib7UsnJ55lqc5H47yfdjU/+qS6+EPQ7MAtklHVCN0S5y1Rq4TIjfnLaRt4atlN
 SkXuWPo7woOMWzbkpvUhJhHV8VFXr/3kSvOVnWNROMEM4gS3V+dbSe3LZn4DO1l6+xQD0cu7zNr
 pzWl5dmA750uGtFZV7h6RicBfAe/sLzcC3D2np9JchcVmGFzexQGy8P3J8PXV9/oXPj9PBmS6ao
 mWZKjdc/PUVlPekDovq35URZX/NOrPmr+8J5qhP9xXVuiMrzx5TURg2QRuljM5FQ1VByGssKfUx
 Nwme4LT6N6BmbKEgdG4dKftHFP44Q0hZTOMf3MmRLQoZYr5OUvdwzV35DbRDSYA4VWIDIZ7lj/E
 C5sFFNS0RcwdwCht5GXVlvi3NLKT2RKjAKVNRARsFKo/PmSrbvXA=
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
index ae85d06a9b51..05d07ece6d9b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5137,7 +5137,7 @@ int igt_display_drop_events(igt_display_t *display)
  *
  * Returns: String representing a connector's name, e.g. "DP-1".
  */
-const char *igt_output_name(igt_output_t *output)
+const char *igt_output_name(const igt_output_t *output)
 {
 	return output->name;
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 568d863f2dc4..2399ec3069f4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -590,7 +590,7 @@ igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
-const char *igt_output_name(igt_output_t *output);
+const char *igt_output_name(const igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);

-- 
2.52.0

