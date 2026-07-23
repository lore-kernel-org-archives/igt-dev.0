Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D686C531CB
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 09:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B208A10E494;
	Thu, 23 Jul 2026 09:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="K1GsydC7";
	dkim-atps=neutral
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7360510E494
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 09:18:09 +0000 (UTC)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2ccafc5e82cso7988165ad.3
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784798289; x=1785403089;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5mg4LNEqawIy7ENC3P9vK1TAXsZ7Bmzm4os3hy1d7YI=;
 b=K1GsydC7RD3p12CFVAowHtouTovFa/EWYSqWGPwQb2IhgC3CAwGnjvSDthUjC2HWWm
 IFSftpNSH+3niUEXOS/IYXs47HBe6lYs5Lm8K9Q1H8Kt0tTzmxJb8VwN+nuAVHfYyrHi
 ykyITSgwKKSOwSOXBY7eOLT7RGBUvE2Qz4KUdfNdAwhEL1PKZzEoTc031GN6AK6XAuTY
 pQqkzhsS9503i6qAuP0Z2GR1BjU0AwnQmeQ9xjqh4kRAjYn+kfaKTIBrEn4L3zzf0LRd
 9dw3CTGY0f7I3h6ytP5maYuw3ymMAIZl1uU/tGJMyzKlI+Purjx2++LGQQ4FZ3Xf4tft
 OIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784798289; x=1785403089;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5mg4LNEqawIy7ENC3P9vK1TAXsZ7Bmzm4os3hy1d7YI=;
 b=sfrIA8mvMDAKtLNy3wNqXTWF46h3YniVhMy57NHNdfy1aceFGHc3YIQJacl8FSpioz
 DW8aapfAanqZ8ig45IRCtdoMdF0sjXneZIOTsUxaQ9ktN1RKO5kkawMBmsrrZHnCdjjV
 J1rU4MnVxn+tPelpeGmgPcg7cg9mm7cdCD8gLiX+kzh5MQcukL9ml+lNp4HCQLntivEN
 AacVnMakJc0Q9rKLeA8V7kvqtHb41/Dhcp+i5XJboQ9whcGVi53T8eomWptw8LRdXQt8
 MpvhQ1JYFiNZ0DlzzO8xoArDpT4AvzhTos3F+tIx+De3+BFUhlH7TTqb9DzjLT3V4NEu
 m6eg==
X-Gm-Message-State: AOJu0YwnijZpEcjm8kHVF12Re1wZZQ/KbjYTSLKw3d4keglmMz7VImfM
 EfudYQkK5QxjXfiYA28CkhydqLC/cCWsDzl1d5RlhXpkyQuEx3pZ1VXkoo2ERSFsEZhkN4PTNDt
 ac0zC0BJCy6yhyaLOMCBDVoFH6I+ij01ob59oiDTL1FESTGbEgvWUrBa8u+3SPO1QSPGRdFvCUd
 xqvZVG732ZHS/kAKnY3MJ8ozNy721+dE0ZFGvqvGksB4hu7uDhFj45i0fqMbYkxuQsxfiHhcoF
X-Received: from plbnb7.prod.google.com ([2002:a17:903:15c7:b0:2ca:ef0c:f8b2])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:907:b0:2c9:fa31:850c with SMTP id
 d9443c01a7336-2cfa6c7985fmr26365445ad.39.1784798288307; 
 Thu, 23 Jul 2026 02:18:08 -0700 (PDT)
Date: Thu, 23 Jul 2026 17:18:02 +0800
In-Reply-To: <20260715125711.uke2opej6fski6cp@kamilkon-DESK.igk.intel.com>
Mime-Version: 1.0
References: <20260715125711.uke2opej6fski6cp@kamilkon-DESK.igk.intel.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260723091803.3883040-1-jingpingjan@google.com>
Subject: [PATCH i-g-t v5] lib/igt_kms: Add plane type verification in
 igt_crtc_get_plane_type
From: Jing-Ping Jan <jingpingjan@google.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Jing-Ping Jan <jingpingjan@google.com>,
 Chris Wilson <chris.p.wilson@intel.com>, 
 "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>
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

Verify plane type matches requested type to avoid returning invalid
planes.

Fixes: 5426dc0a889a ("lib/kms: Skip rather than fail when a suitable plane =
can't be found")
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
---
v5:
 - update Chris's email
 - update commit subject
 - print found type value only
v4:
 - Remove unintended changes
v3:
 - Moving condition after old one
 - print type string instead of enum value
v2:
 - Cc Swati and Karthik.
 - split condition with additional branch

 lib/igt_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2eefb773b..6b4d58237 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3537,6 +3537,13 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crt=
c, int plane_type)
 		      "Valid pipe->planes idx not found. plane_idx=3D%d plane_type=3D%d =
n_planes=3D%d\n",
 		      plane_idx, plane_type, crtc->n_planes);
=20
+	igt_require_f(crtc->planes[plane_idx].type =3D=3D plane_type,
+		      "Unexpected plane type, found plane_idx=3D%d, "
+		      "type=3D%d !=3D requested plane_type=3D%d (%s)\n", plane_idx,
+                      crtc->planes[plane_idx].type,
+                      plane_type,
+		      plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY ? "PRIMARY" : "CURSOR");
+
 	return &crtc->planes[plane_idx];
 }
=20
--=20
2.55.0.229.g6434b31f56-goog

