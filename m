Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0671C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 15:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F42410E2E7;
	Wed,  8 Jul 2026 15:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="E4JPweEm";
	dkim-atps=neutral
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61EB10F160
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 15:01:32 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c9a700dc0eso8909595ad.1
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783522892; x=1784127692;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8MMFy1KCzh/XJIbuLgy7H7YGRrhZBF/gc/rgfjK0IYs=;
 b=E4JPweEmldwdfczeANO5L1B1qrtZFbMWleqVKyFp6Va2DwQXG4KUJF/r3PNqeRLWGY
 RKfVhi8f5wbV1CT3yLason/8h1Y0rRIomnp6ROFrWCQvnyqy58ni5VGsHMxaiui45GPY
 NizuUWvmDrMfhvmdm2metio03RUATK+GFOK6t2gDmhutBaN7Oyz9fRRf1cM5irKXq+Ou
 CGPljsoNAouUv6clpi0r5xp1UhzWPC+UPA9U1fmxPIPEWSlj+eP2QmiGNG4m7FaLq3Wj
 jXvgpaZ8fB3ui+sUXL3DqX6/z0Qh3cZNvpvdrWGgZLPPXz4YKcHSgHgLrjb5+AmF4KJ0
 2iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783522892; x=1784127692;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8MMFy1KCzh/XJIbuLgy7H7YGRrhZBF/gc/rgfjK0IYs=;
 b=cfOfvXh5IjZLEkBq3zOk4hlIzZ8bbA6gCtG1iLLm8me98Dp06GVquAw7y7fYRzaVAL
 Vbjk/UCvImcPMLGwLoNDAQb8IBXqZBD/iy31K/ZEVpvUvtTsclh1ZhOAiRKfiU+e7LCh
 kQ2JbfkHOzWOd0Wr/fOGYYjcW2B2F3WcQXwajpOOyiqH8Bn41X3WS+YPgCs7oKbEf5aV
 hW+CjATAR3OooOfrhHPqdxqeqyKvaNipU/LDdMvYzqq99JfCUfJ6g1g7Ap0wav0MIA7i
 bTiYGu9KC/t8as1k6qBQrmRTFJiORLmGvZrsCR9lionK4VdQa1vXUgx/wfRXhVzC2FPQ
 MVdA==
X-Gm-Message-State: AOJu0YyXZvY/HP2gs2CTZwE1nIeqD0aUXbWop8o9XOq938ooVhfU/KaK
 Negf/gPGErN7pbrBB+fYv+p14hNHRTg9FRkMgBKTCrjAxEPseAYd5Ui0E32qoN6YRcz7QJyj6aT
 jx8iNHGH8Fpe7ir98qGDRilyf2Nzlku6vACRozVB+9qZ2qmYXw1s/WNa1hCH9CgdsFdURRBtJRf
 S+8dNNMNnW1DQcZkafT45nSWyQTYPi+dfbNQnhOP4FEAoUhcVznLUrZ/Nh+ImSTLabHr9aylmJ
X-Received: from plbv22.prod.google.com ([2002:a17:903:44d6:b0:2ca:cb8d:7da7])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:da2d:b0:2ca:e62c:9e96 with SMTP id
 d9443c01a7336-2ccea38490cmr29538445ad.5.1783522891645; 
 Wed, 08 Jul 2026 08:01:31 -0700 (PDT)
Date: Wed,  8 Jul 2026 23:00:55 +0800
In-Reply-To: <20260707102711.qjparlbi7zedneon@kamilkon-DESK.igk.intel.com>
Mime-Version: 1.0
References: <20260707102711.qjparlbi7zedneon@kamilkon-DESK.igk.intel.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708150054.2146786-2-jingpingjan@google.com>
Subject: [PATCH i-g-t v2] Subject: [PATCH i-g-t] lib/igt_kms: Fix plane type
 check in igt_crtc_get_plane_type
From: Jing-Ping Jan <jingpingjan@google.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Jing-Ping Jan <jingpingjan@google.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
---
v2:
 - Cc Swati and Karthik.
 - split condition with additional branch
 lib/igt_kms.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e20307923..ba8223dd2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3534,7 +3534,13 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crt=
c, int plane_type)
 		}
 	}
=20
-	igt_require_f(plane_idx >=3D 0 && plane_idx < crtc->n_planes,
+	if (plane_idx >=3D 0 && plane_idx < crtc->n_planes)
+		igt_require_f(crtc->planes[plane_idx].type =3D=3D plane_type,
+			      "Valid pipe->planes idx not found. found plane_idx=3D%d, "
+			      "type=3D%d, requested plane_type=3D%d\n",
+			      plane_idx, crtc->planes[plane_idx].type, plane_type);
+
+	igt_require_f(plane_idx >=3D 0 && plane_idx < crtc->n_planes,
 		      "Valid pipe->planes idx not found. plane_idx=3D%d plane_type=3D%d =
n_planes=3D%d\n",
 		      plane_idx, plane_type, crtc->n_planes);
=20
--=20
2.55.0.795.g602f6c329a-goog

