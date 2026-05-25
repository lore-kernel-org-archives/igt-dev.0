Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FEECD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 20:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C53B10E40F;
	Mon, 25 May 2026 20:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hPbpKZok";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F5A10E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 20:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MASSdlEoHYDifDEYSehLzccXbTyLoXT/FdIrdhafZ6Y=; b=hPbpKZokYqVVmjRxtwBhZwJvGg
 Lhcz5m02lhYEfN9tTp2D4uadgYB2qQj+bQmbmwSpcrriBDYXKjsyOHwXKzE0vgh4Ud0DkFbjLGqSA
 sEidLGKvNA4OISwfRnCSaItGdIHxxnphsbCKMS6ymMiH9SrO3dKGCmcZoRTMQVr6LfC8F8z+LR/cQ
 7qhSEJDENWtjPcf2YOtydR+Bj1NvdTIqjFTqEpFoe8xZ5aMTKLmcNf4sEGHXPgWD5gVTQ323ZRhig
 4+mIUoH/JNin/zO6loackBGZ4CgLCuR8ObaY/g65q3UbAS7R+uyWweXLxZ1GW2fOdXqrwWr4VfWXG
 hkR5URuw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRc4k-0089fG-Bb
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 22:39:03 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/6] tests/kms_colorop: Add early skip if pipeline is
 not supported
Date: Mon, 25 May 2026 13:38:22 -0700
Message-ID: <20260525203827.3155622-2-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525203827.3155622-1-John.Harrison@Igalia.com>
References: <20260525203827.3155622-1-John.Harrison@Igalia.com>
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

The test will skip if the requested colorop pipeline is not supported
by the current platform. However, that skip is halfway through the
test. Optimise the test by making it skip immediately.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tests/kms_colorop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 4db83470d..ecf33ae15 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -220,6 +220,13 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_crc_t input_crc, output_crc;
 	int res;
 
+	if (!colorops[0]) {
+		color_pipeline = get_color_pipeline(display, plane, colorops);
+
+		/* skip test if we can't find applicable pipeline */
+		igt_skip_on(!color_pipeline);
+	}
+
 	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
 
 	/* reset color pipeline*/
-- 
2.43.0

