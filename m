Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD12CD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 18:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4A610E3B7;
	Mon, 25 May 2026 18:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sbGjQU3/";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D18110E3B7
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 18:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MuBqOO2LLSHo22pa+L6Gu6WXCqdbxhiW7sUNlfZhBsA=; b=sbGjQU3/n8Yjahr/hqok4vVIW5
 L1euKSe1v3f7vHIyR6l7b6HI6RO7PSCgyBItEgfWMOWpfNZp9TfvQ1oF/j1VOA8MJoBZckEXTRrd1
 ph74bFGg7y6z6RR99FgWia8ruVIDwQGnN0M7Y49hbQDwLIdROx4zePaFfPwrKEK2hi61PYOriYkdI
 rKDp7YXDZVHxRMGG/rYfWg8dKEjR7cB4lJfO386WfxMRDt7qDf6Fx0l7c4Uy3e73wppgSRcfXcMgJ
 S/6oA32yr/IGh+fxACCcWdN92P9eSYB9LgagQmWKbqTt/PDl7d4Nyant0BBXnyKcL4WIXz2Qj+Wb1
 e522FAxw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRaEJ-0087eT-2J
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 20:40:47 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/igt_kms: Fix for closing incorrect file handles
Date: Mon, 25 May 2026 11:39:32 -0700
Message-ID: <20260525183932.3139043-1-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
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

The writeback fence fd was only set to an invalid value if writeback
was actually enabled. However, the cleanup code would close the handle
if it was valid. As the uninitialised value is zero and zero is a
valid handle, that meant that stdin was closed at cleanup!

Generally not a problem if clean up only happens at test exit. But if
a test wanted to close and re-open the driver, then closing random
file handles could lead to problems.

So make sure the handle is always invalid irrespective of the use of
writeback.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 lib/igt_kms.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e20307923..0f1ce03a9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2764,10 +2764,9 @@ static void igt_output_reset(igt_output_t *output)
 
 	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID))
 		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, 0);
-	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR)) {
+	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR))
 		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR);
-		output->writeback_out_fence_fd = -1;
-	}
+	output->writeback_out_fence_fd = -1;
 	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
 		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
 					 "off");
-- 
2.43.0

