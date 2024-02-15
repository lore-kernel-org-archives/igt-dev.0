Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044C7C48BC4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 22:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853E010E3C1;
	Thu, 15 Feb 2024 22:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lCipxz/s";
	dkim-atps=neutral
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5ADA10E38F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 22:20:41 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6e2e42fb159so632801a34.2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 14:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708035640; x=1708640440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zx7Th+0oqAGfWwCG3rp02WtbgMKRd1pKboasZUJ6Ja8=;
 b=lCipxz/sPYsPY6mycSdbbCJ0ibkaLRfWniNtqZv5aLyQROQofhh84Qtgu34cSq05a/
 sv63WoFWkWLQhOe2ZDtMkCETUqxbD5w3fna7MlBsy53lwFTtWuXELN+lNta8GefUUrto
 CG+iICUS4ACULKt7Qh1LJr+XLJFG95MC3JLxJY2WUphaZDACwz4LCFtceZuqjhORCucM
 OvIJVafDXPq0UnArMifhiKJcqPwZM+LDAqiAjeQt7HdiF0k4mTrde0+vBD6AlvDeRjd7
 bf7GVmnaV+hgviXHGeHbghMnt5XDtWqgnuTWth26UTFrlj4xB0yllnZGyYQALpH5znaA
 HkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708035640; x=1708640440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zx7Th+0oqAGfWwCG3rp02WtbgMKRd1pKboasZUJ6Ja8=;
 b=mw98d9GUJI16rnC+43fBh68LlpiyZFF0SXSbelM1cGLMDp57OMzATHIFpvkbCqS10/
 itkxuuZAbWDOe7iuGLjc/J7B6BtctMYBl4or6Cz+4w11QiqF45kQdo9GgdJiMbiO/IqJ
 wkdHYsqh85G2N1edNvp8nHLHBJLe3gRzrHpPt9soiY/OGq8tW/hovfBZ+Q0Wzfoh1c5H
 jgJwIWNfS7TjwS+RIV0aYbvmbe68GKZOZfrJU/SLk5wpLsodTEwwnPeXspH3P1aWweai
 a7Jlj0gXxSvsQmxlN2DNW8Z8eNyWe+QW5V9KitUZGrshHUhh6prNmndGM5PZR9Q8PGWQ
 WsOw==
X-Gm-Message-State: AOJu0Yy4tXxB8ipihPBZxZnZDg5nTUrBZzfC6XzE2+ewqTSVpWGEFrZT
 gN+kGUagEcQfWZJhBhSlsvDCWgJ3rfXco6Ty9S4y0M93zU7w8yRrx1NEweox
X-Google-Smtp-Source: AGHT+IFH1kZhkqF7y/T7xyI2U+i1xx8V7PaGPWgCereXWj+1vgqP78zXrDAfNRZDIRPBl6KisI2H6Q==
X-Received: by 2002:a9d:4d95:0:b0:6e1:4d:d283 with SMTP id
 u21-20020a9d4d95000000b006e1004dd283mr2570138otk.22.1708035639736; 
 Thu, 15 Feb 2024 14:20:39 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 c28-20020a63725c000000b005d7b18bb7e2sm1903203pgn.45.2024.02.15.14.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:20:39 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t v2] tests/kms_universal_plane: Re-work expectations for
 non-intel hw
Date: Thu, 15 Feb 2024 14:20:34 -0800
Message-ID: <20240215222034.327548-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Rob Clark <robdclark@chromium.org>

The expectation assumptions do not fit for non-intel hw.  So re-work the
expectations and add msm support.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_universal_plane.c | 58 +++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 6a39f93cc5aa..a6e11777d04e 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -402,7 +402,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	sanity_test_t test = { .data = data };
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
-	int i;
+	int i, ret;
 	int expect = 0;
 
 	igt_output_set_pipe(output, pipe);
@@ -432,29 +432,43 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_plane_set_position(primary, 0, 0);
 
-	/* Try to use universal plane API to scale down (should fail on pre-gen9) */
+	/* Try to use universal plane API to scale down */
 	if (is_intel_device(data->drm_fd))
 		expect = (data->display_ver < 9) ? -ERANGE : 0;
-	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
-				   output->config.crtc->crtc_id,
-				   test.oversized_fb.fb_id, 0,
-				   0, 0,
-				   mode->hdisplay + 100,
-				   mode->vdisplay + 100,
-				   IGT_FIXED(0,0), IGT_FIXED(0,0),
-				   IGT_FIXED(mode->hdisplay,0),
-				   IGT_FIXED(mode->vdisplay,0)) == expect);
-
-	/* Try to use universal plane API to scale up (should fail on pre-gen9) */
-	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
-				   output->config.crtc->crtc_id,
-				   test.oversized_fb.fb_id, 0,
-				   0, 0,
-				   mode->hdisplay,
-				   mode->vdisplay,
-				   IGT_FIXED(0,0), IGT_FIXED(0,0),
-				   IGT_FIXED(mode->hdisplay - 100,0),
-				   IGT_FIXED(mode->vdisplay - 100,0)) == expect);
+	ret = drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
+			      output->config.crtc->crtc_id,
+			      test.oversized_fb.fb_id, 0,
+			      0, 0,
+			      mode->hdisplay + 100,
+			      mode->vdisplay + 100,
+			      IGT_FIXED(0,0), IGT_FIXED(0,0),
+			      IGT_FIXED(mode->hdisplay,0),
+			      IGT_FIXED(mode->vdisplay,0));
+	if (is_intel_device(data->drm_fd)) {
+		/* should fail on pre-gen9 */
+		igt_assert_eq(ret, (data->display_ver < 9) ? -ERANGE : 0);
+	} else {
+		/* Could succeed or fail with -ERANGE depending on hw limits: */
+		igt_assert((ret == 0) || (ret == -ERANGE));
+	}
+
+	/* Try to use universal plane API to scale up */
+	ret = drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
+			      output->config.crtc->crtc_id,
+			      test.oversized_fb.fb_id, 0,
+			      0, 0,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      IGT_FIXED(0,0), IGT_FIXED(0,0),
+			      IGT_FIXED(mode->hdisplay - 100,0),
+			      IGT_FIXED(mode->vdisplay - 100,0));
+	if (is_intel_device(data->drm_fd)) {
+		/* should fail on pre-gen9 */
+		igt_assert_eq(ret, (data->display_ver < 9) ? -ERANGE : 0);
+	} else {
+		/* Could succeed or fail with -ERANGE depending on hw limits: */
+		igt_assert((ret == 0) || (ret == -ERANGE));
+	}
 
 	/* Find other crtcs and try to program our primary plane on them */
 	for (i = 0; i < test.moderes->count_crtcs; i++)
-- 
2.43.0

