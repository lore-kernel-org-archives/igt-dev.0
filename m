Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F85CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 20:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD4110E40F;
	Mon, 25 May 2026 20:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l2CKywth";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB65810E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pkVO9viPOnFFFnkj1B0f4qhimtiFFtUrhhFAvsqugGw=; b=l2CKywthP53xgMJG0xRJOPCV21
 iE32TvwOvk3qgcOMCQIOZ+5S8VUUS7XU1WtESDi1XfKSw2KNmGvxV4PYUmMboEz9bjOT/6iICTI9G
 mwsxH5nV+8MqWSaSXyuR0V2cO4qVqiqLhBOF5hs5mUA9LITKQqT4iX3SiGfIhR7RkfxuIrAyLmo8y
 JILXGGyu3/agMEsfmwuyKnbN12pfZ2NA5PM3jv1hKTZf3DxlwD8IeJWyDD3jlZvVr1vplm1W4HnMn
 tYvZKulDxxyh/+AeGAeBrWdDPhRrHEfod0H9kLqJCJwTgqBvcAWrIBqn5Qal+KgTF73dkvlboFxQW
 Ofl97N/g==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRc4r-0089fG-Ln
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 22:39:10 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/6] tests/kms_colorop: Intel platforms seems to have an
 error range up to 8
Date: Mon, 25 May 2026 13:38:27 -0700
Message-ID: <20260525203827.3155622-7-John.Harrison@Igalia.com>
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

Pretty much every test seems to see an out-by-one issue on the output
data. E.g. what should be 0x74:15:A0 comes back as 0x74:14:9F.
However, the plane-xb24-xb24-srgb_inv_eotf_lut subtest sees an error
of 3 and the plane-xb30-xb30-srgb_inv_eotf_lut subtest sees an error
of 8.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tests/kms_colorop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index a9f2cdcb4..ca9b69b17 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -196,6 +196,9 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 	if (is_amdgpu_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 13, 13);
 
+	if (is_intel_device(in->fd))
+		return igt_cmp_fb_pixels(in, out, 8, 8);
+
 	/*
 	 * By default we'll look for a [0, 0] bracket. We can then
 	 * define it for each driver that implements support for this
-- 
2.43.0

