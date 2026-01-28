Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E963BD25B5A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06B310E6D9;
	Wed, 28 Jan 2026 13:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Zq9OoZUR";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995B910E6D9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 05AE7C211E5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E3BE6071F;
 Wed, 28 Jan 2026 13:14:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93E4E119A8814; Wed, 28 Jan 2026 14:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BWx7rNUIr1psbc8Et3zZjU9RNSsRLpIuHI9stsd0/cI=;
 b=Zq9OoZURNC2+EPV9bv/xydxrtNtT/rX9nk88D81+O99/LylJu2+Xr0Kz419dgvrUdBmwu9
 1VusI6bt61sjj6EH9IfpJ2oKRgDsHJfDx+6q7J9tnD7TJlLjgsVu6ayKFcp6RXyVaYUUZD
 YNEc8CwDDwUam2llfBgp89PL4nSnfqMETT/fDO82JAQDreAU292BFwrVXDl0b1495Btcx+
 FrBquRT9kIQt9+zbFxZOKMn2MNzGj2oz0D097nn4H/zKMNgK28ttluVPGUSjf9WJUJc8Uk
 UXAyJasJF9hk4+Ot4KpnNlyKoOUHDG17FriIflwPrNzRulMRkkC0d/Iuq8VSaQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:44 +0100
Subject: [PATCH i-g-t v5 13/48] lib/igt_kms: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-13-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HP7ACEljbhVvm5I/UWr/WCi+AFcrqsBwCMiSp3TGLBc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvJfYjwEzjvuYIS+5VF8BJqRWuXEp+8WgKx0
 ASycCGVNmeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKvihAA08y1yg1YuISzI8Oqwb0Mdl8HWFnV8BW
 64x7nW+lGq+w8UeY5z83ozYJVHK/xUbX1d80epB3HbCVsEUyIIl1+s1/i9Q5RZofmPnk1ilb3fO
 dGJTjyv3/YpPsuxtdopcwPKljWDQJH3bY4sZBo/secQrJIlGNlyvWAF4k0yPAlo5LOGVPluVk1h
 IMHnzK6OTxBTNpTOa0lSjchfexGD9mHRRDIFGVY/VNO6gtKMF2hVokIDCaYGJbWvTvkokineCWP
 3mCX4dvied9HURYeDSQ3F0x/jCmpnfzwoYRKOwNNG47J7Wa6yBzE7yktnjup6xm3VOI8myUvUhz
 yHNSjZknyk6yGDBWukMcpEhzoAJ7eg3U5V047YDl66zZkXD1wZmA6t6YUxPDdDnBfuQShzs2uWw
 tx4PApmQktlolm24l2zdZQHgPExL9sHA6YbjmnZ/H+2vfZYJpBlS8TDHUu9GnFi1OryMkENlcVV
 DZx2s6I4UPOfnRb1Tj2uD5z1vLP+fgl6O5uBb6ePHljBgubRwRNGtEpTqdToP1N0RiUuXMSiegz
 Aho1xNMcMhcq73x5cR4I5aORIthhHq+60+Q5uJL0rQhT/mxrseEuPDxDFWg/Q3zGNk41FRncMxb
 S3acXorlbaIwr3JXA79WjNPpbd8cDZeY3eMWg/liJx8bzb1yZcPw=
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 17fd6a22a3e8..2cd21278a9bc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5183,7 +5183,7 @@ int igt_display_drop_events(igt_display_t *display)
  *
  * Returns: String representing a connector's name, e.g. "DP-1".
  */
-const char *igt_output_name(igt_output_t *output)
+const char *igt_output_name(const igt_output_t *output)
 {
 	return output->name;
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7cda645206de..af9586a2edb4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -598,7 +598,7 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
-const char *igt_output_name(igt_output_t *output);
+const char *igt_output_name(const igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);

-- 
2.52.0

