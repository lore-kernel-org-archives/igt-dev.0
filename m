Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1672F105F7A8
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE0C10E041;
	Fri, 13 Mar 2026 13:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D3g5UjaX";
	dkim-atps=neutral
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30010E06F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:34 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2bea03c64c1so1113565eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409953; x=1774014753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63Gm/FFn0TR79YWmL7Ds+rPbSdgB6XTpUYt9Sx4nb+c=;
 b=D3g5UjaXOwcFB4mdTNx/MEc+ou6R17rMO9we2Fs0rl6y4wtHW1iprQElKi/CiVzX4C
 a5rKjn6ll77wMXzJCBY/SjNPSM6BIkDaLMXjdxLT06ovR2bcek717VNWp8Lx1r2l9w5l
 Xttm56/OxYXl+0ozklFaDOv0oUf21bllORvAb3TgDkywdxrU9eQwuzsZ8jjMNsJZ/tIY
 xmYQTiTszRsm53XsC8tqluchNCCBJtawVXzFKzKPs6kza2sEr9TmY9KvBpBu4FHUJeAj
 +0SQTwEarbePNa1NAdnurIbbW3g37h4INbs9rSykYM+8EeJ6XBWgllbBzxtKSoj9ve6o
 yRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409953; x=1774014753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=63Gm/FFn0TR79YWmL7Ds+rPbSdgB6XTpUYt9Sx4nb+c=;
 b=cmQx8QnVlA1h6BBRDdbJj7JdVzL4SdnLOtSN6rDcdmhgWKQjSpJI0XkL29UdnwdG6l
 iKBLys3T91rBoBPOfOKoLooo3ilJs24v9dBQLtI8mvEHi+gJ3HgjYGBd8s6sgOoX//L6
 QyhdzJQzIdp0o9DCT0fRlrxlzp9fKxtiy2Pn4wP6h/ykaRKYwgTqMn0AFbLJIbwVzwVw
 PEcyYED/NCAfnRUtXhvhgW1ApOd1Cc7RuBIhjX0oi/kkEhG9Qe7bK/Kw9OqNjF9tQ/DK
 bT2jzPoGjGOnYOhkXFVs94NIZIEH/B9yhihrwKTGHp30OURhWyAbgWrgIdcTItDlYUcN
 M7cg==
X-Gm-Message-State: AOJu0YzBxRGmslsujadijCa6Ihbze+zwnHwI4TImcp7hPZl2q2i5UaKE
 sUwkTQ3Jxsog3vY5AZQQtWSViXtEzJ/w9DTHJ9/ZHHdODCEyrpNMv+fDJir42sZF
X-Gm-Gg: ATEYQzw1uBsbfGoMRxgAf+qx3AvNbAFx6GhPJ68whKeZgDzEQQgztYyQ41o8sG9A8nW
 bEKPI4i6JDIo8cPTirZqwq41SPqG46qsQ0gDsy5XswswVlWf+tScJTvIESBq+/RaBlZeV5ngGDC
 ClmfZU+xsaAAnx3PHAMGZ9dewT78Upkn/i2o6X7PAHmRHsqJ+TzANeFRoJF96bFuZOp8V71d91n
 y2J7aAaT0HFLL6mggpb+8iAXLOxeK7MFxGMoKDSt9dXWqC0be0rEErjj/LwW4JyBWSqypoj/HqR
 0VvSpugMfYbTixbtBg8RzWpreS2/vXfoY3iAI6WvUi2e0Fz8GfyO0A9pg/y7H3qcnh+WbkdlHWu
 rNv0+397AOTXdTUMXlSzK5cgEUB4daORlwu4Q5bFEA+4NXiE+fIp4ugoXDaOufaq0vyAze5bXQP
 t/MC4vTl5+2ptbu7cFEfsjFogx1MDFGb+chXvEKi7H1OtSEUptD7urd32AidM=
X-Received: by 2002:a05:7300:6ca0:b0:2a4:701a:b9ba with SMTP id
 5a478bee46e88-2bea5508ca7mr1256561eec.14.1773409952828; 
 Fri, 13 Mar 2026 06:52:32 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab57588asm2695969eec.31.2026.03.13.06.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:32 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/8] lib/xe: add xe_exec_queue_create_class_gt
Date: Fri, 13 Mar 2026 15:51:58 +0200
Message-ID: <20260313135203.1782240-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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

