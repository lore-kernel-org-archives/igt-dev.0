Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CFBC48BC4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 19:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B533310EA23;
	Thu, 15 Feb 2024 19:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Efy4b1Nd";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D8310EA23
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 19:21:20 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TbQ0H47VJzDqxs;
 Thu, 15 Feb 2024 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708024879; bh=Lzi17FEmtl+I6SyMh2d6qjaBCeOW3+L0xwIhcXfZDKo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Efy4b1NdWDOlY3H1ca1h223Vo37elSHGpL7IEmUpfNYw3QF9n9jMA23UQdB3MgXPk
 5kGxvlOjhaK44dzRQhsRXTyWxiQRB4h5GuUxALiVU9B34NLGcze6P9e+KfKII0kdIK
 oJFEjf0X173aP5lUHn3of1wU/b1qI53g1K6lBv/U=
X-Riseup-User-ID: 90A2B64C73F547AA473CC68B88EE7F9003CF4ACD56D073CB47CA553744B21F45
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TbQ0C36FZzFskl;
 Thu, 15 Feb 2024 19:21:15 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 15 Feb 2024 16:21:04 -0300
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Enable DRM_CLIENT_CAP_ATOMIC before
 enabling DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-duplicate-calls-v1-1-512afbe1bda7@riseup.net>
References: <20240215-duplicate-calls-v1-0-512afbe1bda7@riseup.net>
In-Reply-To: <20240215-duplicate-calls-v1-0-512afbe1bda7@riseup.net>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

As stated at [1], we first need to set DRM_CLIENT_CAP_ATOMIC before
setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS. Fix that.

[1]: https://docs.kernel.org/gpu/drm-uapi.html?highlight=writeback#c.DRM_CLIENT_CAP_WRITEBACK_CONNECTORS

Fixes: 3642acbb74f5 ("lib/igt_kms: Add writeback support")
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 lib/igt_kms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b4d0d7612a2..e18f6fe59882 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2747,6 +2747,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	display->drm_fd = drm_fd;
 	is_intel_dev = is_intel_device(drm_fd);
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+		display->is_atomic = 1;
+
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
 
 	resources = drmModeGetResources(display->drm_fd);
@@ -2795,8 +2798,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	}
 
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
-	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
-		display->is_atomic = 1;
 
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;

-- 
2.43.0

