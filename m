Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C9FC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 09:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB8510E15C;
	Wed, 15 Jul 2026 09:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uWlbZtYc";
	dkim-atps=neutral
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9675B10E15C
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 09:16:16 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2cefa1a2be6so16389095ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784106976; x=1784711776;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ysHLGsVlQvx0Sr3ObDE4KQLg+ohZmKzx48hRIgYcTmc=;
 b=uWlbZtYcusNyn6we5ZgX+HtIxf/eLSx7m/tow5BMvJzbQzpDQhW6lAJ5mW5tNCsecS
 zVltqCj6wiYFk2q/5cOBHCDh8xxk+9YxoJAf2+dY4v+twuoPcLErLlQ53yTpmpLw/mER
 WqDG1E9JtrfrWwcENxNAdal5MkB2yD9ryEVe09hhnVoHVrb+umCHA9eebJhSe0/n+XxA
 muPFA6jscXtc3CtVBc+rirZX4UjXl3Zmauw6/JddnZGExKkNqUwkvTTdEdVObVQ2vsYE
 bxpNtr1pOoMq6dzdKf7JzxmyZB+9EVaZ0lXDQXS7436sWsWBzVhIKPKyNRGF621UGp5b
 os0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784106976; x=1784711776;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ysHLGsVlQvx0Sr3ObDE4KQLg+ohZmKzx48hRIgYcTmc=;
 b=of4A1Xjc66xjra1fvdhU/2p1MjYbhNhC9c8NZT4CjAqVUS1Z4ldCoME4QmBEDGUkra
 efTZ8JphREufYkXRHu+/lD8FGYoXTK++KkeUTx/voN2bFTZB6HDrINitIEpcJsS1uPio
 TSOzBI4JuKXibhSkDd2oF3xrlmy6ZG68vIQOFhOKqB4N8Wb5jUih41Jic3R+46nDwit1
 7nW6AhR78vNwyyhkktPUGM+057vcNIPqZTdjb925yxcs0M63cI5CUDxakKkZuDHC9ZoA
 cEy9OqDGhwYYY5YIQeqs3/wL0hSjUfzFDI2IcXWQWknuSdRUjM4rlcN+u85LvAs4Av7r
 JItQ==
X-Gm-Message-State: AOJu0Yyc0/wX1BOsxRcEjLIEAFTu/id3LUVg52nAsajMedihY6tq5/lU
 LbKZOoerpjIdQ4gHJ2FRanpG4yW+afQjSHP02Y7Xdf15SEMiThpaGmV5rsJCP/5fE/7qPl4vt6P
 7GGETJGx5Z3Vw3gchLPI/q9XeKWUL0o+wsDZZFA0ASC0MS/fLj85zzay3g8W5mXor82Oi/HYKQG
 RZCbhqneDUP5jGb3SHbilz4WxOACDOM6JfKuLQ1oeR0ypA20V8LHfZ/aN5JB2L8WFCdkRxUXW9
X-Received: from plbmn4.prod.google.com ([2002:a17:903:a44:b0:2ce:83ec:5961])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32c2:b0:2c9:b48c:fdde with SMTP id
 d9443c01a7336-2ce9f285258mr176058305ad.26.1784106975720; 
 Wed, 15 Jul 2026 02:16:15 -0700 (PDT)
Date: Wed, 15 Jul 2026 17:15:40 +0800
In-Reply-To: <20260714164357.ntqp5zmpqhozqw4p@kamilkon-DESK.igk.intel.com>
Mime-Version: 1.0
References: <20260714164357.ntqp5zmpqhozqw4p@kamilkon-DESK.igk.intel.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715091541.1010895-2-jingpingjan@google.com>
Subject: [PATCH i-g-t v3] lib/igt_kms: Fix plane type check in
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
v3:
 - Moving condition after old one
 - print type string instead of enum value
v2:
 - Cc Swati and Karthik.
 - split condition with additional branch

 lib/igt_kms.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e20307923..2c425df08 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3534,11 +3529,19 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *cr=
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
+	igt_require_f(plane_idx >=3D 0 && plane_idx < crtc->n_planes,
+		      "Valid pipe->planes idx not found. plane_idx=3D%d plane_type=3D%d =
n_planes=3D%d\n",
+		      plane_idx, plane_type, crtc->n_planes);
+
+	igt_require_f(crtc->planes[plane_idx].type =3D=3D plane_type,
+		      "Valid pipe->planes idx not found. found plane_idx=3D%d, type=3D%s=
, requested plane_type=3D%s\n",
+		      plane_idx,
+		      crtc->planes[plane_idx].type =3D=3D DRM_PLANE_TYPE_PRIMARY ? "PRIM=
ARY"
+									     : "CURSOR",
+		      plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY ? "PRIMARY" : "CURSOR");
+
+	return &crtc->planes[plane_idx];
 }
=20
 /**
--=20
2.55.0.141.g00534a21ce-goog

