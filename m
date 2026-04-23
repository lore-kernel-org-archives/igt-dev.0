Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B4DF99344
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 09:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63E510F020;
	Thu, 23 Apr 2026 09:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PijFiiXU";
	dkim-atps=neutral
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F044A10F020
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 09:28:36 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2b79f4b35b7so5927795ad.0
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 02:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1776936516; x=1777541316;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=j1JMmbHulaDjMAWykEfHxoXYq9/Md2xa0bLjWwA3CL0=;
 b=PijFiiXUWrt46h3+b3IERMBtelFqNjtlXGGYIicaH3LWm/3zgH8kXYLLEujiYOrm7v
 xPR//4IlDvganMxkGX6De3Ih7PO80kO76pH6fXw3RfzsOLT9RSGhR/QdTv6zfV2AbU5p
 FWUp2Nyw9TR20Ox9BPXid3V8uTJUD92OOKo30YDF4CRCZT+KLmN9uNzArO+XUYAzS9rf
 cjKJNAJjFTfACvH16Dd6ova0RF1uww5cgkybWofSzsXeo+m6Xal+fwQ6i0VKNrz+nuYR
 YOZaRwkGytUoR37Qcs/NqGTWgA+bs4ym00YE4HOIWdeDvhdAi7CAX+5jgoudAg2UUtGG
 pL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776936516; x=1777541316;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j1JMmbHulaDjMAWykEfHxoXYq9/Md2xa0bLjWwA3CL0=;
 b=XTamQKoyDAphuc+3ViTalQgeCBBkWzUgVXJcG8CLZFvPWPs4Dcf3C+ShUdTEXwr2cO
 MGqUkIp42Lv9Zj3NlJ9N0srwR3AQa0+EfoLf9d8xGWu8x4vaxPYJAZnbAZl7PluqNAqU
 XrvsziFZAD9Tw6Rp4UgEBLGHS7LdNMrlozwzuQbAtAGqiKkI9k1DmIxD1j8q3zuLQFmB
 JWbbJibYD/Dmc1uhh1wDnKbXEhO6GJ0ALhya+Hhu26GFpFlSA8HPWXkZWTKsuTdbUYkj
 469J8VcZwr6TkP/7TF7XhPrup+c0NhwGrmC0xBWCe57gdp0bqUzBu/ho37LvoLV3x1pC
 hyHQ==
X-Gm-Message-State: AOJu0YzkqmggT/AWxg841kjtQX0P1PCSVU6XZtR8ey8CBqdW1OuhLHFg
 gKwExYgLoOZVYfr3ZJZD12K4lP8LXEwx3ThdjdN+r/72LNtQJTBLmq/gxS6p0OJEPw3wc7v3RMY
 Do5QmB2dkdeSym1u32K5BTn3RhMSZ8JlxgeTUPu/b2E1WjeUfP0g3SLwYsh3Ef34Lxt84H7m4bR
 OYv8sZFa4BvGYvUnzqgceotbyxJQZ7SzbH8PRwNgMUoelqPiuXl7k+Lshnz3PKfKQ36ttNJe/f
X-Received: from pgct19.prod.google.com ([2002:a05:6a02:5293:b0:c79:65ab:b3b4])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:430e:b0:39c:4cc1:b934 with SMTP id
 adf61e73a8af0-3a08d8a7b65mr29862009637.34.1776936515992; 
 Thu, 23 Apr 2026 02:28:35 -0700 (PDT)
Date: Thu, 23 Apr 2026 17:28:25 +0800
In-Reply-To: <CAMYCwo5YH+WBOGbDu4uVPgRkQ_N1T3bTZ2fdUSMa7dr+Jvzjqw@mail.gmail.com>
Mime-Version: 1.0
References: <CAMYCwo5YH+WBOGbDu4uVPgRkQ_N1T3bTZ2fdUSMa7dr+Jvzjqw@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.rc2.533.g4f5dca5207-goog
Message-ID: <20260423092832.595471-1-jingpingjan@google.com>
Subject: [PATCH i-g-t v3] tests/kms: correct index validation logic
From: Jing-Ping Jan <jingpingjan@google.com>
To: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>
Cc: Jing-Ping Jan <jingpingjan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Fixes: ac37e1174cc4 ("lib/kms: Pimp the primary plane swapping")
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
---
v2:
  - Add Fixes tag to the commit message.
v3:
  - Add Cc tag to the commit message.
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bec96f267..405a04640 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *display=
)
 				igt_swap(*old_primary, *new_primary);
 				igt_swap(old_primary->index, new_primary->index);
=20
-				igt_assert_neq(old_primary->index, 0);
-				igt_assert_eq(new_primary->index, 0);
+				igt_assert_eq(old_primary->index, 0);
+				igt_assert_neq(new_primary->index, 0);
 			} else {
 				igt_assert(old_primary =3D=3D new_primary);
=20
--=20
2.54.0.rc2.533.g4f5dca5207-goog

