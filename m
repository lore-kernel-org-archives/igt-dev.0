Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39173F557F2
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 09:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9650510E480;
	Mon, 20 Apr 2026 09:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="O/HzOqx4";
	dkim-atps=neutral
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB1810E431
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 07:49:29 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-82f70ae35c0so1331722b3a.2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1776671369; x=1777276169;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vlWn9PfI0x4nvhP4jbZIDLA+j+Zjip0ZfbDuZ5V/IOs=;
 b=O/HzOqx4kAb4ODJDGAsKmjUuFmBIX9pO6cSik23w23WpVf/WS9/B2YLZllD2odR0cy
 FBQRu4eACTk6RCTImm9Akaj2xsYlGRj+EACbdzWHGyPVUJk9bG/Du0n8VDJ4hwfTCFiS
 ize61KDzgCodQRdciz5sWWrsafn2EyPlUfD5vRGWw/3oQsmt8RKvkuFPN/5GQNGWlazz
 67X7VnFWX9Mh0rHpZihfMQrVk/xwfLbHj7RoT7sIFiaqGEPOGzWD0kvN6qFAk7wEZVWg
 p/OnwxKR7WrmNOXiwKpGyJz3ZDzEnZpPlxDgxUPPPbVXuxYzQ/Le6VtU7dTVboUVaPpQ
 gziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776671369; x=1777276169;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vlWn9PfI0x4nvhP4jbZIDLA+j+Zjip0ZfbDuZ5V/IOs=;
 b=A5PpS9Gbfh/aAl7kuc6UQ9yUq6C9N1fz4+vUYHQVSyf2PaNxeXNo+0hzP3K1Z0IYzA
 GtfCeOoWmQd3Lg1SBlBVpmduCAgamp7oimdeJ9pumXLzFCDPjk7ARHU15oN/EzAmy2lk
 pPU08c35Yhm3TbBS432V5rJvdF/snuUh8cYGvZLtOuGFP/8vAKOyb4KLI14Cp14LUlMh
 ZVpNUSYhHxpHSeyeDN7i3N5K+zDWx62Q6sjlXN9KLPnAeNyJpRYlVS4mg2cnqLGOmjqi
 TwmN5hIAXcCe2OtGyDkMG4WFYBd+OyaEEInTZRWOYR54bv5gKiXl2T4Lk+uwMadv+NyM
 ueoA==
X-Gm-Message-State: AOJu0YygUAnYpb+Blo3l7EqKY5ojLJkAeLsNRXTSrMA4WSvsEgLVVCyD
 99JA5Luqj51Kb0eY+q1yh4jkQ59XVsJTM3O94o/Ae+rdFvRc1+yXiDKLa0n2s+d/049PBK3wbOt
 FVo17PvRLjl1sdVTGBOajRrThs5F5hm9mef9SBq55/W/jAT4LxgszS5cVreZjECMy9DBnprb5CL
 fizk72/fPiHLEkbYMWfNi2XRwfgct8D6WI6har01jc3QRw+oxIM5etsiFayYUHV6G2ceOwYuAV
X-Received: from pfbhw10.prod.google.com
 ([2002:a05:6a00:890a:b0:82f:812c:bb6d])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:340a:b0:82c:ae0e:dea with SMTP id
 d2e1a72fcca58-82f8c8c39b8mr11062793b3a.32.1776671368937; 
 Mon, 20 Apr 2026 00:49:28 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:49:25 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.513.gad8abe7a5a-goog
Message-ID: <20260420074925.1710024-1-jingpingjan@google.com>
Subject: [PATCH i-g-t] tests/kms: correct index validation logic
From: Jing-Ping Jan <jingpingjan@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Jing-Ping Jan <jingpingjan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Apr 2026 09:26:27 +0000
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

Based on the original implementation and the comment above the function,
it appears the expected behavior is for the plane indices to remain
consistent with those in crtc->planes. Therefore, after swapping the old
and new primary planes, we must update the index in igt_plane_t to
ensure it matches the corresponding index in crtc->planes.

Therefore, we should expect the indices of the old and new primary
planes to remain unchanged after swapping them.

Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bec96f267..405a04640 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *display)
 				igt_swap(*old_primary, *new_primary);
 				igt_swap(old_primary->index, new_primary->index);
 
-				igt_assert_neq(old_primary->index, 0);
-				igt_assert_eq(new_primary->index, 0);
+				igt_assert_eq(old_primary->index, 0);
+				igt_assert_neq(new_primary->index, 0);
 			} else {
 				igt_assert(old_primary == new_primary);
 
-- 
2.54.0.rc1.513.gad8abe7a5a-goog

