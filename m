Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0424EC43602
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 10:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B0D10E34F;
	Mon,  6 Jul 2026 10:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XKo965OD";
	dkim-atps=neutral
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9633A10E34F
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 10:06:47 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2c8018f11fbso32620155ad.3
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Jul 2026 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783332407; x=1783937207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oj5iEbdx6aqBxEqS+rSCY++3iuAgmjtM5f+0fxfNe58=;
 b=XKo965ODCram5rfCD5fClMbHAeMAtudpaaoGaVT3VLbZn9iojIeG7qAgOrAgppGdVa
 Xc7oqYhgxVM9Lu0ZFUKqUhZLbuid9/PNFql+MGRqOsFsWSDC5q8gv5fpI2AKBCS3tryn
 EUfRi7N9YZW7Sp5kpwJP7GfxTQ+NELUblJkZ1Zf5pMntl/nfJg8TVZGJH+MQJGI28vrb
 KReJi1+3uIb2yjP9y1pq95zadut8mhzalv7cohKPr9eZ5ikeXJMVpyVVmsezcXgxCCn1
 qZ3OZ0WlnOGf1i994hPArU75WXQ1sTnHs9kjNn/N55RZrY4o+CY1tBA/5qYn7CBUxe4t
 kz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783332407; x=1783937207;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oj5iEbdx6aqBxEqS+rSCY++3iuAgmjtM5f+0fxfNe58=;
 b=BZ4fVMUnLk22+Qtg42BtCWMMt18nc7W96702k3xdce4jkH9/Iz1WqzIzuAAwa5CUDk
 gBqMMRcG2Clc0Gpg+poD0QmpzA3tie9PQA7f3dzoHvrYiL8ZjQ525TRdPZaKPlkmxDJj
 b2Ua9CEWaPonHIyiSgv/tABC/vdFq7tlCoBhyf4H0/TDW/c1ysMWuRj+K6bmcYaWCkc0
 XEKBfGZkKdWjggT83n8K+BVsUOmyjtZJwF3bqDEjypK736zyQhdoI6+fGSBHFdP0o0uR
 cGq1tMz/7VIsmkOtJD/IpEvIgjVCDQeQrA+LyxiuME0XLsCU+BiyUZ6QR2FUpeaCBkzi
 udHg==
X-Gm-Message-State: AOJu0YwOqsAnvDAJhWxdvGwZ6EdvppEJzBEzbGFDOmIylI9mCEp+ll+K
 TpccCA0JxtY9nGIgQnJYUuR0L+1FhVdviRVvTgYVgm5Q1MM3D7RLtfzSNlMeQ1mKc6AfaKgAM1f
 /1bDkAqnFdnddP3yE226hjO9JelTBHIVjS7KfeBg7xsVeZVrTNmhjBZDFK3MlBELELld9u5l3H8
 SUTqfesGnu5eSDbi4ikE/rjEpxW5F1tIWb2c68UUBD35lit8rV5RYybBBfNXqtXYqs/2eqQ842
X-Received: from plec11.prod.google.com ([2002:a17:902:f30b:b0:2ca:dd72:56ce])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce12:b0:2ca:ed57:8586 with SMTP id
 d9443c01a7336-2cbb9eb40dfmr91356145ad.23.1783332406703; 
 Mon, 06 Jul 2026 03:06:46 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:06:25 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260706100626.1042084-1-jingpingjan@google.com>
Subject: [PATCH i-g-t] lib/igt_kms: Fix plane type check in
 igt_crtc_get_plane_type
From: Jing-Ping Jan <jingpingjan@google.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Jing-Ping <jingpingjan@google.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>
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

From: Jing-Ping <jingpingjan@google.com>

Verify plane type matches requested type to avoid returning invalid
planes.

Fixes: 5426dc0a889a ("lib/kms: Skip rather than fail when a suitable plane =
can't be found")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Signed-off-by: Jing-Ping <jingpingjan@google.com>
---
 lib/igt_kms.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e20307923..43da9a6d9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3534,11 +3534,14 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *cr=
tc, int plane_type)
 		}
 	}
=20
-	igt_require_f(plane_idx >=3D 0 && plane_idx < crtc->n_planes,
-		      "Valid pipe->planes idx not found. plane_idx=3D%d plane_type=3D%d =
n_planes=3D%d\n",
-		      plane_idx, plane_type, crtc->n_planes);
-
-	return &crtc->planes[plane_idx];
+        igt_require_f(plane_idx >=3D 0 && plane_idx < crtc->n_planes &&
+                          crtc->planes[plane_idx].type =3D=3D plane_type,
+                      "Valid pipe->planes idx not found. plane_idx=3D%d "
+                      "plane_type=3D%d n_planes=3D%d found plane_type=3D%d=
\n",
+                      plane_idx, plane_type, crtc->n_planes,
+                      crtc->planes[plane_idx].type);
+
+        return &crtc->planes[plane_idx];
 }
=20
 /**
--=20
2.55.0.rc0.799.gd6f94ed593-goog

