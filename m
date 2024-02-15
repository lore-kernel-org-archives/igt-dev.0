Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA36C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 22:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1D110E38F;
	Thu, 15 Feb 2024 22:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V9tqFNuT";
	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774B410E38F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 22:20:03 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-29041136f73so1165558a91.0
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 14:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708035602; x=1708640402; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VTmDaiUmKalCdQ7M090qGeOc/1awLaqKyDXE+NJmRoM=;
 b=V9tqFNuTR62/qd+zP3OWRbmYKEjCniAAqY103pMYV2WfaprVgLCLSLCKsgPPgoYFmU
 q88BEeWZjnqqZ0OSZsxWG+2dXUddEnIt/hHyLy7KWZDdxnSHhH6TYvFvMe24uhcN0672
 n+NTEhT4Nh0yBy0t3EUjLgsRV65l5aDseW2dq4RSjLQPVYUjwEjJjJ1lahilTgSiCCZt
 mZasWMSOYW74e8k2utauOKjwhKtdnkjl1sX7+abu3qx5tYNqi7LhzEV3FViWAFDE2j7R
 nu+9pQEAzrxCcMQQl8pR+WSlb+hVZ45mB5QFCPAt7Td6CrRXibfFFpwQoKKaFyLDj62n
 OPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708035602; x=1708640402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VTmDaiUmKalCdQ7M090qGeOc/1awLaqKyDXE+NJmRoM=;
 b=fI3tiPfsNrNXNCVsFPNZ9PBgyYHoPV2BGJ/4kJqrHUS9JuUMtP/OXbUc4oecF9iRri
 q40/vaazijzBqrB4z9t/jbTQrZ9CJJkWvxtG5QJyKS8tAsKXGHzVqPOwyfH+kn8qzWq4
 XPmgJLwtbrDhs0PaZeb9mObl1Hk/EsOpuZnH3mKXH5zOg6SDXHGDBuONogo9oawZJb80
 V8km/08Ao4d94skQk93ybam5M9Psi2tF+2uG8PS4aeNyWh3ac6994qQgXGUShKIkG5/q
 QaeE31UPYcTJvg+GRXpcnESlx+VEx0F7l9Z8hu5Ck+CaAIzGrW+9VbO4+Lj3moyYYl0o
 FHVw==
X-Gm-Message-State: AOJu0YzJQIK7bd3nOZDAOKRHXw93cz8eUdQLCPIsPMafIL/A2dPwnMU5
 csRXMCVBoLgYyF0BlaaCZNRs7qu5VMAQxWzw5ADCVV0UPAlGSPBKEANd3ovj
X-Google-Smtp-Source: AGHT+IFleT+wo5KMo6na/60UBhsXaDuKIrJ3NZtrqgCZF/dT9T60il2KzZmCjgMvu9uP4Vs8HtWMIA==
X-Received: by 2002:a17:90b:234b:b0:299:30eb:f687 with SMTP id
 ms11-20020a17090b234b00b0029930ebf687mr573322pjb.16.1708035601687; 
 Thu, 15 Feb 2024 14:20:01 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 qa14-20020a17090b4fce00b00297138f0496sm4003476pjb.31.2024.02.15.14.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:20:01 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t] tests/kms_plane_cursor: Skip unneeded overlay
 requirement
Date: Thu, 15 Feb 2024 14:19:57 -0800
Message-ID: <20240215221957.327322-1-robdclark@gmail.com>
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

Tests that aren't using an overlay plan should not require one.

Some qcom devices only have primary and cursor planes (but those planes
are not restricted to a single CRTC).  Requiring an overlay plane even
for subtests that didn't need one, was causing all the tests to SKIP.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_plane_cursor.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index dd33d8129626..5b3cdc06901b 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -91,7 +91,8 @@ typedef struct data {
 } data_t;
 
 /* Common test setup. */
-static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
+static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
+		      unsigned int flags)
 {
 	data->pipe_id = pipe_id;
 	data->pipe = &data->display.pipes[data->pipe_id];
@@ -100,7 +101,8 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 	data->mode = igt_output_get_mode(data->output);
 
 	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
-	data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
+	if (flags & TEST_OVERLAY)
+		data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
@@ -123,7 +125,8 @@ static void test_fini(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 	igt_display_reset(&data->display);
 	igt_plane_set_fb(data->primary, NULL);
-	igt_plane_set_fb(data->overlay, NULL);
+	if (data->overlay)
+		igt_plane_set_fb(data->overlay, NULL);
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
@@ -167,7 +170,8 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
 	igt_put_cairo_ctx(cr);
 
-	igt_plane_set_fb(data->overlay, NULL);
+	if (flags & TEST_OVERLAY)
+		igt_plane_set_fb(data->overlay, NULL);
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
@@ -333,7 +337,7 @@ igt_main
 				if (!intel_pipe_output_combo_valid(display))
 					continue;
 
-				test_init(&data, pipe, output);
+				test_init(&data, pipe, output, tests[i].flags);
 
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
 					int size = cursor_sizes[j];
-- 
2.43.0

