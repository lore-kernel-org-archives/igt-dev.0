Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFE4F327AD
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 06:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5FE10E7EA;
	Tue, 21 Apr 2026 06:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="URFo9bzV";
	dkim-atps=neutral
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5D810E7E8
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 06:43:54 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2b45cd0bb96so39920865ad.3
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1776753834; x=1777358634;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=IHG27JOA+AqXGrM8x166srJ9tNRN0rn8GCWTDPXRUgo=;
 b=URFo9bzVFY1EUQYq5WWRGPKo9UWIKl+Q6cDQEpGl8nYf7HYhVN/onkQREnURXFn3XI
 F0nuqIe4Cxe6UrvJoxY2EnJ2SgZxULSxIR51LY5FeLxJoMUb6jtoJjFY+Y4ekJxUVpjZ
 vkoN1pN02qxJIK7RTLNKsYJQRj2xNQf4U8SI6MnRhw4fLbkyRX3X9vPdcyBYvdQJJMjr
 p/2JZf3RnFeI88uxWV+HUzdrwpSwTV3ZEiE5XpImjesRWgK1oLAB83JUf0034oZTW4JP
 Ve5KA57s5PtfTj/cya8m8mso2JQOAbHLSYYZcjxD/umkHkZa1CWizQLHOcqzJnak2irj
 JjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776753834; x=1777358634;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IHG27JOA+AqXGrM8x166srJ9tNRN0rn8GCWTDPXRUgo=;
 b=UCBbkAJ3NzxrM35HaIDrxCbw5Wo4lZe43GTTg3JaFqQIKqrtZt7+RkwgTeK5x/RGej
 Haz+a8zQXxg58aKRBPgI48ETiZ97cCM7zX7vfgUhrA7bzACVtse+tQmF03IPu9LBlGzX
 f5HqY95isAu1ShW6DBPERHKEunpP7g3S75/A3WDSdlAx4fYj8O+GNIibOGHNVdygMevo
 oNpx7AeQdbV48TDPWtfayrlN1780lFm3jjZ551zeqNCfNEDwSWL7zI/42n9bAqeoTfod
 4CTYNifV30kskzKx9mjEPnjT/Q7cNf0otBRcfpxtdV0pEwgF1Mgr32rVQpsmXHQN9eRc
 Ck4w==
X-Gm-Message-State: AOJu0YxqfzPX5s3zL3CXz8rrpTjzwZ2jdktTZQSvO6dgj9mSAcpsTKDe
 QfR36MmATLaNV6aXOO3W12tqf72NgCQICz6a9FavDUS21s0B7QdzzeD85rIEFS75ptvOVSkx2dA
 4TxdgBj3E9FQFfy0myaho5ZQW1O48lFzBGYX9hNccd+DkNuWrNDJP1dGXyFAj15iLhv9qvnw0fI
 mzP8ZRE3B1fAEwBiO0+vJPmmYt3Ewdlirng+Zut4d79GpOYBesYt1KF+tnmZXnICEoQSBr0h1/
X-Received: from pgdc22.prod.google.com ([2002:a05:6a02:5116:b0:c76:5cd1:8bf6])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:72a1:b0:39c:cdb:5d81 with SMTP id
 adf61e73a8af0-3a08d8a4436mr20253732637.32.1776753833970; 
 Mon, 20 Apr 2026 23:43:53 -0700 (PDT)
Date: Tue, 21 Apr 2026 14:43:39 +0800
In-Reply-To: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
Mime-Version: 1.0
References: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421064342.2851479-2-jingpingjan@google.com>
Subject: [PATCH i-g-t v2] tests/kms: correct index validation logic
From: Jing-Ping Jan <jingpingjan@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Jing-Ping Jan <jingpingjan@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
---
v2:
  - Add Fixes tag to the commit message.
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
2.54.0.rc1.555.g9c883467ad-goog

