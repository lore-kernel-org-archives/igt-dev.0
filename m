Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C094CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3877210E97F;
	Wed, 27 May 2026 19:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FNLCXnYl";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8751010E975
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PvPr2b3jSEiml5LRAuawHp3FBHV93/PXatX5v9tHwPU=; b=FNLCXnYl23qQiAoV0c8W8PTJ63
 snXNunJYqopQ/0eI6d85ypX1SpvzEhts8fHIF/eNKdGjoB79Vkl6ZByT9nqIG2tn0sAoCrjVilo4b
 8/3Uq2ttOR/w6Rqdw70POovuO8fblhGEIk9J78BHymEVPccp70EpER7LGmqbq4f+PvVTDb/qnG+/j
 UtsuXyNGOVYTu6EC6vzk+Qg3SWpu8C0dYMM95/LGUemHfT8jsanmcklNl4tNpfhtwKROblDjDtnGM
 ++WBjwAgUZa5xhtdzfDlFaSReFpn8Nh4zAHYjBsezPCxUw1dQdSuKh/57rsR3HM2xAS3Gz8h3goyP
 7DBAyKMQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wSK3V-00935c-IA
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 21:36:41 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/5] tests/kms_colorop: Intel platforms seems to have an
 error range up to 8
Date: Wed, 27 May 2026 12:36:12 -0700
Message-ID: <20260527193612.651624-6-John.Harrison@Igalia.com>
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
index 57f017a6d..c7747d8c5 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -186,6 +186,9 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
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

