Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074F5CD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 20:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34BF10E40B;
	Mon, 25 May 2026 20:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KvXteCFD";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510C810E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 20:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SWSvh7IPBZVtei39TWDdLFas//jp0qGhy44C2eWLCSk=; b=KvXteCFDqySeEwc7hFxWAidpgu
 wbA0fTrXiutDEBzEqsU0AQ+3Q9rdBLyHeOs49NkbrOrlS4ZwBxIDprlmhwJymk3J5UWt8cqEe5z8c
 uhqvCspXALXAi+9WpwwG34b9/BAio7UEszp2s25SnzhJ4tI5allbgQDABPf87PcKlmt8718vuosK2
 KucrOy5AmDR+AQ6FSGV+dAaSDglL/IIajh9BLl7FTRzj6SWq5qH6fC1JL2fCpOweD4NBTOcStrcil
 EO80MBS7WBGb7jkkPip0SZS4lgJsRZPn9m6H+8shpPyyvfbiETwAEPSGaW4fZLSVsasrewfE0Krv/
 BAFQDpDQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRc4l-0089fG-Rr
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 22:39:04 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/6] tests/kms_colorop: Assert that the CRC query
 succeeded
Date: Mon, 25 May 2026 13:38:23 -0700
Message-ID: <20260525203827.3155622-3-John.Harrison@Igalia.com>
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

The igt_fb_get_fnv1a_crc() test is not guaranteed to succeed and if it
fails (e.g. due to an unsupported color format) it does so silently.
So add an assert wrapper to ensure the test reports failure if it
can't actually get valid results.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tests/kms_colorop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index ecf33ae15..77d25cda6 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -227,7 +227,7 @@ static void colorop_plane_test(igt_display_t *display,
 		igt_skip_on(!color_pipeline);
 	}
 
-	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
+	igt_assert_eq(igt_fb_get_fnv1a_crc(input_fb, &input_crc), 0);
 
 	/* reset color pipeline*/
 
@@ -243,7 +243,7 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_get_and_wait_out_fence(output);
 
 	/* Compare input and output buffers. They should be equal here. */
-	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
+	igt_assert_eq(igt_fb_get_fnv1a_crc(output_fb, &output_crc), 0);
 
 	igt_assert_crc_equal(&input_crc, &output_crc);
 
-- 
2.43.0

