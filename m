Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345C3C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 18:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AF310E51A;
	Wed, 14 Aug 2024 18:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="awHHNiQ+";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB8A10E51A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 18:54:35 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1fc692abba4so1509185ad.2
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723661674; x=1724266474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SbCVfYCdLMfEgkLpGFNZ8DtfW2jFT8lS57rfwmVMja0=;
 b=awHHNiQ+KkFvSiKTsMNbuSnWS7Yiqq5chQeuSzxuH7QmXwo0vgmzotbe6vEtjJsGS2
 9HWhC9RyqaGgy4Uhi0v/vOupQZ/wjVy5me7RinVytEmX20fxetB9l1XM7C47tY2mPbjV
 JAC8MskG2R2mqTZO87tz4ZTET/zu2MVnPjBh+ZK+9z5Pp5Jdmvx4D3dUQ1Gea81yn4t9
 tQCvaF0cO1F3Ij/jHZxoP1tLyuxn9hLuRFbrZGUjbOZg+ss2x6iZdt8HPT4uQo1fQp/P
 zl+urU5l/1Cbj3a754KPpYSa/gvBJs4zOZNiwOAd5zmLH9fEFnNYPijfgfuEGDDn5bN3
 G2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723661674; x=1724266474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SbCVfYCdLMfEgkLpGFNZ8DtfW2jFT8lS57rfwmVMja0=;
 b=qGLCS7NyA8zzWOsqaKN+Q/yiwhxX4YIBvSOpC+6cog5PBYMKlMfVSe4fVn00nQE7xF
 LQK8mg1Ic39z7WEDB2rwxjxGj67uXadvt6DjjZ3yry5+emPNs2N9zuX3rNN8GBsO7ulM
 +v/0cqBTRAsZ1VHQfFbxPJ6SVHQhrYCgBnd60UOwSlFLarM9nzPxmwTclS8G1VG2NdFK
 9EMUiTC3mlYhzqiW/JtNKnQpkIlxjOaRClczIcY3nodXbvtG9UaL7tsY6LVfuJcPLRow
 wrmLX7RgFA67MyEfa5oBngt8hCdVhFSN731laFacsTeXHdGpCMKcDmi9waD0HkuB2m/t
 RCrw==
X-Gm-Message-State: AOJu0YwnKWSsQtF1LTt+uXnT5jamaVPnL+4ghJhIGtjDQaccf6dB+RPy
 N/mEIB9tKUsQK55e9LwzCaJbooV1B4nGrJkfDYspefpsum8EIXrlXO7Now==
X-Google-Smtp-Source: AGHT+IHL8WQ5c6L1FAItLSbJhlRPWRJApSW7DgxcJIG7ObDk5dkAxMgWXIS7RnZ7A807RbwPoYl5FQ==
X-Received: by 2002:a17:902:d4cc:b0:1fc:52d9:1047 with SMTP id
 d9443c01a7336-201d651edf7mr34814945ad.42.1723661674381; 
 Wed, 14 Aug 2024 11:54:34 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201e94b5be6sm5239625ad.100.2024.08.14.11.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 11:54:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH 1/2] dumb_buffer: Remove invalid-bpp subtest
Date: Wed, 14 Aug 2024 11:54:25 -0700
Message-ID: <20240814185426.70418-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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

These allocations are not necessarily invalid.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/dumb_buffer.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 1d4bf296c53e..579d2f906b6d 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -136,25 +136,6 @@ static void dumb_destroy(int fd, uint32_t handle)
 	igt_assert_eq(__dumb_destroy(fd, handle), 0);
 }
 
-static void invalid_dimensions_test(int fd)
-{
-	struct drm_mode_create_dumb create;
-
-	memset(&create, 0, sizeof(create));
-	create.width = 4032;
-	create.height = 2016;
-	create.bpp = 24;
-	igt_assert_eq(__dumb_create(fd, &create), -EINVAL);
-
-	create.bpp = 32;
-	create.width = 0;
-	igt_assert_eq(__dumb_create(fd, &create), -EINVAL);
-
-	create.width = 4032;
-	create.height = 0;
-	igt_assert_eq(__dumb_create(fd, &create), -EINVAL);
-}
-
 static void valid_dumb_creation_test(int fd)
 {
 	struct drm_mode_create_dumb create = {
@@ -397,9 +378,6 @@ igt_main
 		fd = drm_open_driver(DRIVER_ANY);
 	}
 
-	igt_subtest("invalid-bpp")
-		invalid_dimensions_test(fd);
-
 	igt_subtest("create-valid-dumb")
 		valid_dumb_creation_test(fd);
 
-- 
2.46.0

