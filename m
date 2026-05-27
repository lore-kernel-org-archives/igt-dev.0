Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C011CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4C010E97E;
	Wed, 27 May 2026 19:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eTWTOjMW";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C2F10E975
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TI0jV3+yCUQz+AFVSXTR9NcDU+KwwSAiDRPqbF9RzXY=; b=eTWTOjMWzWUZ1uFkh/6DAM2zpQ
 Iw34j9FcUDCvTvY5s0DXFXvCC++vPdNUnDh4q2Dx8crxhY9Av0o4hqz32qWZ4ldGKGwZQOx6n5pri
 Y7hWAyqamSN4DvOzwrFqpXiwixMfbk8U0uX2RXE/RLRFeWjCJ+U2bp31QtY1NRF8z50RSthAENxNu
 BZKWWZrH/ZQAs9xhJMRGhZAfr0FDQHqvbbMS01wRRjKnxVxV4VQghjrqdKra1IrCWFXdyM1db0CCw
 D4OpEoG+6l2LiFLdMv5e5/L3uNXYFiZfVmEUWH06WIrgQIZjv27mmuCGE6le8RuWCg0vJXeCzV0wR
 SMXxle3A==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wSK3U-00935c-Fi
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 21:36:40 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/5] tests/kms_colorop: Add BGR pixel formats
Date: Wed, 27 May 2026 12:36:11 -0700
Message-ID: <20260527193612.651624-5-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527193612.651624-1-John.Harrison@Igalia.com>
References: <20260527193612.651624-1-John.Harrison@Igalia.com>
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

Intel platforms only support BGR pixel formats for writeback. So to
run this test on Intel platforms requires enabling testing of those
formats.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tests/kms_colorop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 4db83470d..57f017a6d 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -31,6 +31,8 @@
  *
  * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
  * @XR30-XR30:				XRGB2101010 framebuffer and writeback buffer
+ * @XB24-XB24:				XRGB8888 framebuffer and writeback buffer
+ * @XB30-XB30:				XRGB2101010 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -402,6 +404,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
 		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
+		{ DRM_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, "XB24-XB24" },
+		{ DRM_FORMAT_XBGR2101010, DRM_FORMAT_XBGR2101010, "XB30-XB30" },
 	};
 
 	igt_display_t display;
-- 
2.43.0

