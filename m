Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4379F4644B
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C34F10E26F;
	Mon, 16 Mar 2026 10:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2hd6fqoK";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6729910E25E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 526CC4E42627
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 282D35FC4A;
 Mon, 16 Mar 2026 10:23:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 35F3610369F3C; Mon, 16 Mar 2026 11:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656638; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=S87UgFzvvilr08SmPMFzsSjACHbvg/6oYzWUnTuX0/c=;
 b=2hd6fqoKPi7YHcxtJN3gSiIfMGDCRb62ubVo0DWW2VaYpaiiCHTpoALb6ITGtGQ86WG0V7
 SV5S8JO4nl9Yq3gdmgg7NtjPWuc/Il+Omoe1O3GR9PWswivLYMbxyIlZDOYMPx1uRflsC0
 VM/3NIh1I0ueC1VsziCc2Ql9rTwPRUkdnXBFpGVVwLEIrX/H2I8TK1Or3g5TgczQMU2DrC
 8MiUx0ohWxa1oYGVYF8SGr9YTy8bxVcZQNHxQmVMsTQyGxOavvAuTTbETWouf7cE58diKU
 akgUo4pEXXCjH39peMivV51A70OyFQjIdx9Db440w2A9HkMBh+hv30KNd7+oZg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:22 +0100
Subject: [PATCH i-g-t v8 14/49] lib/igt_kms: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-14-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vRZNBIzASKvXevrwcvO61P5bFt8T5yCdIFbFqTKHgFg=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pQXH9J3oUtlGLD0oMsMn66f1NiSqL6EdhOt
 3Hy4zRhlVaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLO+g/+JjA90cx4zf6vcDnqwDULL5Bg9UfqV8I
 7DEsDekU7+XLlsWg6UnrHE9CeH3vHVLIUWzynzD7UjcR4mzyYiiU+l74+QaNX1yluQuGQN2ZGyi
 29cGOYt2RiamNKfCZpOkE1oYUchEFNyUf4gfR5aGPs6XK19bMh2pMiKVl7KmhQMc9NMAKkVgk6G
 w0V6V/vg1Grwd8NOQ31IBuap4Nb3K/0/7dLKa5zBtJ5doC3SyJ9KK0FxPLkf2PBqQtNAim+kbZ0
 4igdKe/LsqCZg9WSFDZI+BBeCrLBZG+W7oCAaNAxmY1R1Pva278lKNyPBpIZygLD/Lg6UjSZp0q
 TkzXN+lErvKdUgzfAwyuEvAN1qH9Bb9HNrHhPVYnRNrcS9YBltt/hexNVm1+DjX6PvEFxZCiUDu
 6WGVpuxn72k555ezHySIr/4UggKHt/I4opBOCtxK91xD9xFlQ268S2CxfAn8tXhMKVItEh5paBB
 Le+HFOuXYYWnCc3RXeoG7ARZ8MwIKHzQYxaHOKU7NgnHtRSzGur6TP+2NZ+F9nU2ZySz7+BX/I1
 bQOHqTZNj3fUAW1AmXGG7m54L3lpvP3IywriRxxERroDh3FuJ2ZF5o9VMAub+U7THPMb9T9bUYa
 tk5XKlVhECGkPe1Kktfx/Hfyt3mm6I/yKV/rt2IGcyu1JwMI/K78=
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
index 97292c5c3dfa..f6ddf25756f1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5125,7 +5125,7 @@ int igt_display_drop_events(igt_display_t *display)
  *
  * Returns: String representing a connector's name, e.g. "DP-1".
  */
-const char *igt_output_name(igt_output_t *output)
+const char *igt_output_name(const igt_output_t *output)
 {
 	return output->name;
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6298738b452f..aa1599592e68 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -598,7 +598,7 @@ igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
 igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output);
-const char *igt_output_name(igt_output_t *output);
+const char *igt_output_name(const igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);

-- 
2.52.0

