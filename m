Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF1DEDF170
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 15:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CDA10E819;
	Fri, 13 Feb 2026 15:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bHZ7QtOU";
	dkim-atps=neutral
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5316010E085
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 15:16:46 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-2a95de4b5cbso9763075ad.1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770995806; x=1771600606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfR0q0MwxIkTwYUVsYjAFlJZjw+9ZDL9Y3z+KbKcgUA=;
 b=bHZ7QtOUbN9bdQ4gR5sYTauzIuRR36py0UtJfDT2JPPeJzF0rFhNv7VG/kA5iGYfQH
 Ovj+bE6sg9N15+6kB3NvFRNZx1m1ZUA2lTTCxQi5+MVsDrHUyBi6V6ZLhotNajXz3APa
 KXmk64Gmn60jmfmKN/01WJW48MhAE/i3pA1qgj4a7hEV2286dpOSKmpWExvSd2ZbaKg2
 cr8KrvZHbxLLGDDMUMBdrb8DUYS01Jnx10PEgsAy34z2+UMLn8tgGTtohTyKRV+3s8HL
 u0iFL1LNWdGD1+BV6Q257zc3W/D8M3CQYGmohwdYkLxTd3PCe0JYlm7QvMXsgHfHo3l5
 8A8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770995806; x=1771600606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kfR0q0MwxIkTwYUVsYjAFlJZjw+9ZDL9Y3z+KbKcgUA=;
 b=DXfNuoHZ0Q2W/kSxD0+iTip+pzK1mVd9YlZZJGwtjM0gCMvGLfchxIYvhcMnpKZmDH
 i7qq0IL2yX2XtYn2A0io8ZhW9UOH+0QC03B6aLUWFuqTlZ3iuDzK12gzhrMwgQZ/7n0b
 u9qnqdMXLFdis9vht+/0b8YPc3Y29UUisd/Tb7mjRRMUzL3zwNqONf9YV+2kbMNJX4J3
 9KagtXws7V6qOYBOkSqL0/nWpPMDFfQKjoGBcUe+zW1ZcfBdvpzkDHpl1q77ApMvWTk3
 Tjlw6B/nG2MyFJDLITKIhLVEW1SdsPHkW5n87rE+VA67vmadQx22wftJ8xeZKgHwDZ+G
 Mklg==
X-Gm-Message-State: AOJu0YztYVvU1S81O6o9wTJBvcGK4RYLPIWSYqTOo4sFSRcV6p34Gydj
 dcCYbNoDsQveaygdT318ji7BzqhM+GtY1RkgvzzHvjmDv1M+IGCihlZXWhs3fbRBZuM=
X-Gm-Gg: AZuq6aKKyWG/4o3/1gHxGZ2Ddj6Tf7ks7zMor6dT27zPrLjO83EAcJ6cMxusmyV9/DQ
 sl3UJAn2SbbCujS5Pl5yPPfEVxMNsjRBX9BxaWb+KikSgaGDfijiON19Qbg8sgcg85jBFQj3BjR
 DU77c8V8cH2uuAJ37YJhQ/uNsS2/5lxkGgswFPi5CP8ZLqEmXwRuQ+KEvwB9pEUIM/AtKILP1/c
 v4acLO/bVEMxuIwrJQ/h1GrIbaq5lDP9Wfvy0/ddeYVAv26chaO+QVtddX2d0qvMIyd7W2wqKsd
 VOGkeyJipjkdpStITvlGgcygSn1mTJHNodQtinUZpCf8SvuVZgijgcbMwMAOf9FyChGaWxl5ED6
 bhJ9gw0PWU7EmMbDwzjmQ/bN3gsC5egPCGnbvV43Uh6q9CLwLm8aD5Ot6u9ABl+eSs7exauujJx
 Q4gdM5Q92kxY/63ioBQ09v9P5b3HWgn18EQwb7IarWT080p1dHnJfaKQSamUYPFA==
X-Received: by 2002:a17:903:2f85:b0:2ab:333:22e8 with SMTP id
 d9443c01a7336-2ab4cfbc6b7mr28305355ad.24.1770995805528; 
 Fri, 13 Feb 2026 07:16:45 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2997aebdsm87439665ad.66.2026.02.13.07.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:16:45 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/7] lib/xe: add xe_exec_queue_create_class_gt
Date: Fri, 13 Feb 2026 17:16:16 +0200
Message-ID: <20260213151621.1552677-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
References: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
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
index 16aae05c9..738985192 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -503,6 +503,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	return create.exec_queue_id;
 }
 
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       int gt_id)
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
index 3ea651063..e4fb5e838 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -83,6 +83,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  uint64_t ext);
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
+uint32_t xe_exec_queue_create_class_gt(int fd, uint32_t vm, uint16_t class,
+				       int gt_id);
 int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
 				 uint64_t value);
 void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
-- 
2.43.0

