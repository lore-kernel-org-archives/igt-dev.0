Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67176C25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 12:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C3210E691;
	Tue, 21 May 2024 12:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T4O0Q31p";
	dkim-atps=neutral
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE4110E691
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 12:26:56 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-602801ea164so260547a12.0
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 05:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716294416; x=1716899216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f6qvnggl58dPlqp9XyBN0RtHHYURrSJba5CC+MvE9vs=;
 b=T4O0Q31pASh4OrEzj+t51dW3V8L6U6y/Imf69yeLwKaS/jOHfpYfxsDRKP3/KX+9H0
 2XBY+9T3DWNLckoqlguF7PU0iXSRPtTDwJ+4W99b5m5mj790FtgWTHVcYVn7+Xh4QP0w
 MTWKBeD1hf/3lF31V0Tuecai6f+gW91wEpEeDe/dPSet99ku4HRL7m0uziHQITzWKCQf
 trieUhODbkTooanx0ttVYHXnEvTdNlZ3ImZS2Rjq8uyXOWl4kYuEkKKyZRitXT60uI5R
 SfARENCJiG4DIFa0PLZwWus+3a4LL05PLqUS3tVzZON7iwxP4Tnh6IxuMEbAP3I9fphI
 51rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716294416; x=1716899216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f6qvnggl58dPlqp9XyBN0RtHHYURrSJba5CC+MvE9vs=;
 b=KxQLVVELEH8Ajw7l2FdsX0il85fT05b6dx5cx606uT+dnLm4cMOud83fQsI6Hzerop
 FnbSMokIXR9yzIN3ykrbTPcpi3MOnZQ821f4dA7IBdppPytDZW0OAoaPX+7mu0hBPQBY
 TtXGLAdSwq8gYRj5lRndz8xNLiLvy7HfJRky+uY0iRljmlATx4tvQXSYKt7jXX/TLoQb
 fIkXhVcd/DL6RyBEij4RXOnp+DI1Iuovt7K6kcZV16lXnfQosm5o2pfQxcsCeVHPNhI6
 lP4wXFABV/NIvcISarTvN0l58wKITQcgZPXo/dFo7npW1aOWMDlUpXmGEgmHa7i8TjJL
 oIsw==
X-Gm-Message-State: AOJu0Yx9vjJ6oe1WfaPQqM0kX/uBAWFbvaFjZpDWpOpKvNUyjoFC5z8V
 3Yjl7RHIHF8TKqstXWjkl1yD/wJdaZJQ+fywxyYTNUPPR1B8RThP8WpZEiqEGSw=
X-Google-Smtp-Source: AGHT+IHzbCdw0JhnKzwmOjFNzkak7ne20kybDEFVMnbTfHZo+2Aye7OApFxqz/l2dsC1w/FeAnRBhg==
X-Received: by 2002:a17:90b:80a:b0:2af:ff3:e14a with SMTP id
 98e67ed59e1d1-2b6cc3429a4mr28400501a91.16.1716294416030; 
 Tue, 21 May 2024 05:26:56 -0700 (PDT)
Received: from localhost ([192.55.55.58]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b671056613sm23889947a91.4.2024.05.21.05.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 05:26:55 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/kms_plane_scaling: reduce unnecessary work
Date: Tue, 21 May 2024 15:30:15 +0300
Message-ID: <20240521123041.1119357-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
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

These tests are not crc tests so there's no need to put special
content on framebuffers.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index acb4a1da1..3f63d3cf4 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -597,8 +597,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	w = ALIGN(w, 2);
 	h = ALIGN(h, 2);
 
-	igt_create_color_fb(display->drm_fd, w, h,
-			    pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
+	igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
 
 	igt_plane_set_fb(plane, &d->fb[0]);
 	igt_fb_set_position(&d->fb[0], plane, 0, 0);
@@ -1050,18 +1049,14 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	plane[3] = igt_output_get_plane(output2, 1);
 	igt_require(plane[3]);
 
-	igt_create_pattern_fb(d->drm_fd, 600, 600,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR, &d->fb[0]);
-	igt_create_pattern_fb(d->drm_fd, 500, 500,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR, &d->fb[1]);
-	igt_create_pattern_fb(d->drm_fd, 700, 700,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR, &d->fb[2]);
-	igt_create_pattern_fb(d->drm_fd, 400, 400,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR, &d->fb[3]);
+	igt_create_fb(d->drm_fd, 600, 600, DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR, &d->fb[0]);
+	igt_create_fb(d->drm_fd, 500, 500, DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR, &d->fb[1]);
+	igt_create_fb(d->drm_fd, 700, 700, DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR, &d->fb[2]);
+	igt_create_fb(d->drm_fd, 400, 400, DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_LINEAR, &d->fb[3]);
 
 	igt_plane_set_fb(plane[0], &d->fb[0]);
 	igt_plane_set_fb(plane[1], &d->fb[1]);
-- 
2.43.2

