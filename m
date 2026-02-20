Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DD7C5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175AF10E811;
	Fri, 20 Feb 2026 16:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XrfDdyW3";
	dkim-atps=neutral
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1223110E811
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:17:53 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id
 41be03b00d2f7-c54f700b5b1so1429853a12.0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604272; x=1772209072; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63Gm/FFn0TR79YWmL7Ds+rPbSdgB6XTpUYt9Sx4nb+c=;
 b=XrfDdyW3gr6vV9qw72D72zepwjfFmHiVqwDR6SrtdHrcBvXfvaq33QxZ3P3sKf2Tzl
 B9GOY/I8Ogb1rA2RlegUUlPZqKeHW/o3sMagr0tDqblfHbvqGRXGc965so5C+PzGsucU
 LEwTteJJRVpyzeAQkEsn2ufd4OQ2CoXYS9kvTzQXYS4R8n7LreDsrueVnAx92Vla6GMt
 nPpdkyekWnOYYYx9k8hC+idjj4jwCLXosVm4TDQQZYaliwZxWgKhbSKsOgqQJ98GNIou
 258sU4HPZr1rEr8kU0OqUgJFDS17CiPP1yDwqkhRtv/K2TjA6A4utOTbpjOFRHh6LlZR
 jw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604272; x=1772209072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=63Gm/FFn0TR79YWmL7Ds+rPbSdgB6XTpUYt9Sx4nb+c=;
 b=Aq24z+CYSnM8NrzbymtCQYZYVlJ34mto+S/mdGOWx4wWTVsb4xIRlH1Uqy4dgl9Ff3
 KF6TMpPKW9WDhB/3e4mUPXLaiPfGvLK0e6JvWwU6+n1EnMkOPjKt3Qju+AXm/FfcfwZb
 J6Z5jTVEX0odRQZ52fnxOLC62imnX49ctAFLwWzPam0QWwoGqWmz87CLigoFs8x8wCXK
 n6yYnG5KR118oLsT8EZJ5ehJiqgV4uYXLXoL/48HLUjau1V9aF4SdkNBeVsIjlR6ehpZ
 hp8VMDP0hTtWPeh3l72wGGJYBvmToqR4VY55Huu8T0qKliMbIQAQLSjCd3wRFaZc2Sqc
 0TDw==
X-Gm-Message-State: AOJu0YznA0n8VLO1w5vocBWfr6UbucHOK6aMnxpv4OpFNE9XhI3iX7Qr
 /ca0E33e1/Nqib11Oy9ctBiEMixLN63OSQAT0Jn5vhSJ1aofo+tjiXddEhawM8dizvg=
X-Gm-Gg: AZuq6aK6Ar3Noz0zZkz3k7YM3HlN0A6CVzEcwhqxvCq5kj77bvPas5wuZMnC2E7jeEF
 nGuypBjIz2/womj4xCZSH6c62FqiASix6lF/BoISumXqvojIkoOvEt1kX5hbUdomIztk5bEGnsT
 NFsmBX7aAhW1WofOYfymGnbD0N4tXFrJsf+WZxHzRK87ZNIiFHLuAriIvmkQPBRFaDoMO5HX61B
 XFxpK7llMeAcAr4r7pVeRsHN3t/mPWqbhoUSsoUmBAdrwvKsgN6cJ67078ZSvmaDQxACWz8ZWQO
 WDuaMVvwnmr0S4oB0cvrlqN5qVDWbhracPMrGkGAhyzW85bpnFMIYw7dFHS3o82W4x8CMUahgoh
 XxXlz+YC+b5m3JKrkSzdvdr8a/3fFPwBa1uaPCEAHtJq5SdtKFq/u9/Qm/amsHSLcrdzsZCIsF4
 +9uyMau4atxsXje63eYY0RHoF+YF6WZH19FGT3aWWTdh0fV033f55dGAMhjhFdRw==
X-Received: by 2002:a17:90b:17c3:b0:34a:b1ea:6648 with SMTP id
 98e67ed59e1d1-358ae7c4268mr230712a91.2.1771604272320; 
 Fri, 20 Feb 2026 08:17:52 -0800 (PST)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3589d83176bsm3578656a91.11.2026.02.20.08.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:17:52 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/8] lib/xe: add xe_exec_queue_create_class_gt
Date: Fri, 20 Feb 2026 18:17:13 +0200
Message-ID: <20260220161718.652862-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
References: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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

add function to create exec queue with class and gt id

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/xe/xe_ioctl.c | 20 ++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 16aae05c9..1aa3b43ae 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -503,6 +503,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	return create.exec_queue_id;
 }
 
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       uint16_t gt_id)
+{
+	struct drm_xe_engine_class_instance instance = {
+		.engine_class = class,
+		.engine_instance = 0,
+		.gt_id = gt_id,
+	};
+	struct drm_xe_exec_queue_create create = {
+		.vm_id = vm,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&instance),
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+
+	return create.exec_queue_id;
+}
+
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value)
 {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 3ea651063..fbc4fcf99 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -83,6 +83,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  uint64_t ext);
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       uint16_t gt_id);
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value);
 void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
-- 
2.43.0

