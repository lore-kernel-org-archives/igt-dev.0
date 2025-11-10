Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8512BCCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D63310E3BE;
	Mon, 10 Nov 2025 13:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y7N/u9hr";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C2010E3BE
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0C41BC108F0;
 Mon, 10 Nov 2025 13:39:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7A15D606F5;
 Mon, 10 Nov 2025 13:39:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7896310371909; Mon, 10 Nov 2025 14:39:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6Z3tIHhutuxyxseoekuOemZ4tke7jyOyQwQvVVa7SJk=;
 b=Y7N/u9hrBoLfJSHsFNTRQ3FCxyVpGz+4L3hgx22SX3RjYP4kREmG6bW/l77qLRPREAufix
 kpBGza7fxrQXS2gYgq27X0r2bUNM6IzuSBNY/gs+y7i6wu3SjzvZZWmd3f6GV+aCutR8JX
 lfHRaSOT4lOUcvZNSu9qsYZMOsA9pjh+ucWsICT/UdXHztbKakj1tbKodyk72rvEkVSJi6
 tiIRxFV6sclMP8pTQuuD8ydav/hPdciZN9B9gFNi+7MFdHodthUdOKfpWOqu6g/SB18KEn
 l08LSLfHpdIWO4D9oX1RUN53xB/W1/cL7xA4X8sxF/d0aMinow5OukGqDLL+wQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:15 +0000
Subject: [PATCH i-g-t v4 13/46] lib/igt_kms: Add const when make sense
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-13-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=v4h+/wQwIshdXKu0GZWcWsCpwagwox8Q+1Wju6QS2o0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesOJdmtWcMyP6VCGqpKz6nBacKvScW79YUjC
 4ZPTzB3IYeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDgAKCRAgrS7GWxAs
 4j6READAhE/9yQ0nfNLPEXM7tbSQaMZEFZh92xEvMQBLLuAtmPmdfP82iIEjV7h6WuXL8ne30so
 RbA3wQjzJclMQcYEzv27E6ZpCC4vfbm1zhRiBzorQo1iySugGgVAjKSTkjd/UC2msO70NO8lgGB
 ct+3uEfU6xzYu3eB4/EwVKZyZUC+e2uHdxgjH+iJqFY72r/xG4y5Udd4ZSUf6XXOX/drLO2ZeoT
 z1I/Oo2+LnPxIUh8UjtqeBBAfzZAsxpS34njsRbksO75otq56yFEjRg3Gd24yxtJGl0FZ6zHAAo
 LCaTnk27qjKtGn08Vqy1/R7gagDEBEfFO/tg/9rnuv5tNcFSL8gZPcRej9RevRFLk320QE0fxiH
 fAjqr9GuEe7qRqYxkC6NqR2++/wuIMOhq4h8qF+1YQqcn6HXm39pK3PWqY3f7chPSkKZBaXo/Bf
 Mh+8VZOVDMLnC6HEw0CaK7usiEVrM9unrr5Y+zwuPtZ4j514LK0SnvKAZ+jL7FLBwIBYj4BaKpT
 lZxYdjmu4/caH7mew0hr9vMNjDTHJzeaNdNOOVGWjHWkGs1CHEL07td3YfAOpWVkvGQlwd6aDdF
 ivefUOAa3jz6jmr7zY6S9L++TAP6fSvRf/Zvm9F+bUOGXY72CRp0qzzoTwAQD2gxz3dQZTE/jzE
 kz5Qs9LOGe6hYew==
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
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 27c0947bcb7b..3d73f338cc80 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4819,7 +4819,7 @@ int igt_display_drop_events(igt_display_t *display)
  *
  * Returns: String representing a connector's name, e.g. "DP-1".
  */
-const char *igt_output_name(igt_output_t *output)
+const char *igt_output_name(const igt_output_t *output)
 {
 	return output->name;
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 21057c62fc05..9dc0362300aa 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -558,7 +558,7 @@ int  igt_display_get_n_pipes(igt_display_t *display);
 void igt_display_require_output(igt_display_t *display);
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 
-const char *igt_output_name(igt_output_t *output);
+const char *igt_output_name(const igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);

-- 
2.51.0

