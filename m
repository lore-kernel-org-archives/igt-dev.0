Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E0C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 15:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205B810E2E7;
	Wed,  8 Jul 2026 15:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QFdpnnYS";
	dkim-atps=neutral
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com
 [209.85.215.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACE210E2E7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 15:04:05 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c88da04b719so775643a12.2
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1783523045; x=1784127845;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8MMFy1KCzh/XJIbuLgy7H7YGRrhZBF/gc/rgfjK0IYs=;
 b=QFdpnnYSdgAORVrjxg9tYWz14BW2Qr/9KdKd5jl/SoVIoIMiShBAQ1i5GIaijrCvCs
 Ifq2aaYPMgnUDXe2JOiLpBlE613fi8s2oYjRjpB5XS2vJe0uLiagSNcknXvxYSQNDqPW
 vGWR1BND17aZRw8dwH4g6P1WrhJzqS1/C5jtqbwYAgwp4TEw6HYmRnYEC9hu8ybZtEBm
 uGb2HtuR0DpL7dz4xIE59+D3q2gGk+aqTYL7WerwFoHfH6AV5psus8pQg2czRwdPoE/u
 nTG0+ZBPQ+tElsF9pgjXxoEPLAGiwYTlP2ylIhZm1kHcAdG/x/hjYeGm1SlsbyvqE36y
 DlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783523045; x=1784127845;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8MMFy1KCzh/XJIbuLgy7H7YGRrhZBF/gc/rgfjK0IYs=;
 b=JctpZGHTFgTAVBkcU01Mfh3N5lrvScCYZ0q0tnLy2ICNSfl4n9B0WiQpmKOLtMiWpQ
 e5D6/YJmfQNLFYGQbT1MZTafjDITejrJdKZ29ZT6b1q1Tu1obuOmzjK/GZfbAtF5TdQt
 g8tlTAXVokd5arc0Q0P01w/ufo1K/FBBTnmOI9nUgF3mAEmptkQiOQ+MH8j9YBglA0Y8
 gBva98xevYdKIi/qmHL+sVIMWeZlZ+ILNDpTq3CorzEyW1M+4RU9VpEM424DiG0imcB5
 85pGVC+TrmkL5LJI+I9OSj6V1zBecwGDSrUMNgCXSwHlNR2tULq3VCErBRpnQdUjOfng
 pnFg==
X-Gm-Message-State: AOJu0Yx2xt3g3e3HKjXlZLZStCHFeqtgMF2mtfdxCvtF91BlY6LiFIfF
 staJk4320u0WJ6sp2c+ORqDoN5lV5txhQcOkMtGfqZXBl/V64DV9laxWz2O8BQHpyLSN6q5k9PH
 jjsOpqM4KGCK150Lqw1ZwbZUlMQxY3yZvYc3TFMrzbDFKfuXedTJh6SFWUJGvSyrSLptNviJccI
 1JhZy0DsO45dKckImKODPDdoFHkxEVwLsDtsdrJinDcLzJWm5Ln4+/5Ggi5vUDq8CxrmsXk79t
X-Received: from pggi5.prod.google.com ([2002:a63:cd05:0:b0:c86:2164:967d])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c996:b0:3bf:65b7:22d9 with SMTP id
 adf61e73a8af0-3c0bcb7e30bmr4020070637.41.1783523045109; 
 Wed, 08 Jul 2026 08:04:05 -0700 (PDT)
Date: Wed,  8 Jul 2026 23:02:24 +0800
In-Reply-To: <20260707102711.qjparlbi7zedneon@kamilkon-DESK.igk.intel.com>
Mime-Version: 1.0
References: <20260707102711.qjparlbi7zedneon@kamilkon-DESK.igk.intel.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708150223.2148857-2-jingpingjan@google.com>
Subject: [PATCH i-g-t v2] lib/igt_kms: Fix plane type check in
 igt_crtc_get_plane_type
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

