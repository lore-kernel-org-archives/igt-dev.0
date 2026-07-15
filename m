Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D19BC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 09:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED8510E127;
	Wed, 15 Jul 2026 09:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lIzFFfKB";
	dkim-atps=neutral
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com
 [209.85.216.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A1110E127
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 09:24:24 +0000 (UTC)
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-38e2f61c09dso329202a91.2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784107464; x=1784712264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=w4o4n8kJCb6EpiER1uXZrSWOigLjd8BJjO0vbdOa3pE=;
 b=lIzFFfKB9+7jRdHtXs5A0t5LpbSSZTHnAL2TkZNSYWHFDkWbkvstKgQxhmj4BCkHGA
 Q1q+xxzRAe0+jU9yLHuOgu7X0cYygQ7NCxqdWdVqD/479ygh8z4cBCtFgBBbpq6cHBmE
 mu10VTIkxWqCMHNPY5z31r1BXnepNPpHZrbSxcisY+EYltBH60AE4/yT2YUQ5m7vPMV+
 NkV0t2LadfhciaNMd65pvSa+XOS69x791Gq1pC2n2HCgO9aEe3wb2yuEzpwX8yNW6Svy
 QfsRUR2878x5xNKCBFwcwyheoMTp9cDJ1CfxmIPEJDd2wSdeObbgc1XzVU2aRYUwxFUX
 YMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784107464; x=1784712264;
 h=content-transfer-encoding:content-type:cc:to:from:subject
 :message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=w4o4n8kJCb6EpiER1uXZrSWOigLjd8BJjO0vbdOa3pE=;
 b=srMvDTvYvkRehKDeMg7qfykRVdN0nIqEov4uMPN4uelbOrtTtoG4mEqGSNKcVXxanH
 rGdv8Eaiapf3qsb91BJPPYEQ7akMmSwlWWyEkMiEH+P/4H154cbliP7PTKEbIWEeuz/H
 OYKxdukMIUE8RLXVANWWvNhweMqGGR5hASl4jL/FUbgzGziIK/moyWuAQPq6YSXDAoe7
 2UXNSpPtSJ7sbr8XXc3YgZQZM9et4i9C8VskGHeo+tUub4L7+8l+cBKMfGNV3fkfGx8y
 pAtwFm1LB0WWLpJyqvQIy/aC5UKEC+defY4StJj1tpifex4MZZhWWShVHYs+fTUOpQL4
 VeQA==
X-Gm-Message-State: AOJu0Yyu5T4ZDej3+cYfN0M9EdkYzCCgs9kZyH7kvFRK4CKkRv+Nrytj
 mB2rLBwe1RRwsb7moQFgwJ+r4fN+AXRzm9ZD6oKYO2edg7EFaSKOxL7L94nxk6cFjmwhJyHAfZH
 mVXvkPH2ypdzMjCFgU5ixabhhyAmg+xuUQp8Jo4zEWUQEddwzBLKGt1xyjc7E1p1x8vnmkXBnD1
 LdL/+LYl3Gqfr0wGw97JaB1bEo0qwo339TbXE1kWGAjQ/OCZqcaUPGDfu3chTE3LIb0FjTCqHq
X-Received: from plbkk14.prod.google.com ([2002:a17:903:70e:b0:2c9:bf2d:8df])
 (user=jingpingjan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2383:b0:2cc:670d:9b1f with SMTP id
 d9443c01a7336-2cee9b58fb6mr71244195ad.28.1784107463430; 
 Wed, 15 Jul 2026 02:24:23 -0700 (PDT)
Date: Wed, 15 Jul 2026 17:24:13 +0800
In-Reply-To: <20260715091541.1010895-2-jingpingjan@google.com>
Mime-Version: 1.0
References: <20260715091541.1010895-2-jingpingjan@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715092413.1355785-2-jingpingjan@google.com>
Subject: [PATCH i-g-t v4] lib/igt_kms: Fix plane type check in
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
index e20307923..65bb556bf 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3538,6 +3538,13 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crt=
c, int plane_type)
 		      "Valid pipe->planes idx not found. plane_idx=3D%d plane_type=3D%d =
n_planes=3D%d\n",
 		      plane_idx, plane_type, crtc->n_planes);
=20
+	igt_require_f(crtc->planes[plane_idx].type =3D=3D plane_type,
+		      "Valid pipe->planes idx not found. found plane_idx=3D%d, "
+		      "type=3D%s, requested plane_type=3D%s\n", plane_idx,
+		      crtc->planes[plane_idx].type =3D=3D DRM_PLANE_TYPE_PRIMARY ? "PRIM=
ARY"
+									     : "CURSOR",
+		      plane_type =3D=3D DRM_PLANE_TYPE_PRIMARY ? "PRIMARY" : "CURSOR");
+
 	return &crtc->planes[plane_idx];
 }
=20
--=20
2.55.0.141.g00534a21ce-goog

