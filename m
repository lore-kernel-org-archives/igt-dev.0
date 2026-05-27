Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8FCCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 19:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E43110E32B;
	Wed, 27 May 2026 19:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MP1BBL88";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AFE10E961
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 19:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SWSvh7IPBZVtei39TWDdLFas//jp0qGhy44C2eWLCSk=; b=MP1BBL88C1cTa+3tS/04NK+uwH
 /tAOldGd7OmZfNbFzaXlYaoKUi+kDqIDWNT+aLpjGK2jhIEK6+MDHtkkQOCr3Rf3Si8pFJxJup/cg
 w7BK/+0f0sJXHA6eGVCZhdqS+SpRJ+02KclTEuXZ0xioO4xPq2PFkZyvbUInpeDlib7Smba1hfjr4
 d3DnrScv2XDPqPcj8fxPclVTRQDREf45DWordQa6ZkWl6c4n99CCy/pF31zd3pF5V7txrzJr486Ox
 boTjpRE1BJpO+TcMin8DvXuHzoxW1I5tsVBujzDcbQ0bD8j9XFhg3epL15ojsQwefMx8xPEiAEwyj
 1HFFzcFg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wSJma-0092ni-OK
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 21:19:13 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] tests/kms_colorop: Assert that the CRC query
 succeeded
Date: Wed, 27 May 2026 12:18:38 -0700
Message-ID: <20260527191839.639696-3-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527191839.639696-1-John.Harrison@Igalia.com>
References: <20260527191839.639696-1-John.Harrison@Igalia.com>
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

