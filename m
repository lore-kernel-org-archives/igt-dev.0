Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062451098781
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2A110E466;
	Fri, 20 Mar 2026 13:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M9IHyRQb";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8995710E466
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:46:41 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a9296b3926so16271485ad.1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014401; x=1774619201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63Gm/FFn0TR79YWmL7Ds+rPbSdgB6XTpUYt9Sx4nb+c=;
 b=M9IHyRQbna6fpQj4WDg7KsXdppl2MyBQ2YYEPHa3u8elFmk38GUL9QXOR27r4YqkNP
 p648QcqswJcz+8QfKOIFf02u2t/iuHh6c1Bube8TKi9u+4gRtOTOhzBIyfo7BWUD52OM
 msRE7vJ486UsawVizNFj1pjkdYY/G8NhMO7vSdZ9L3a6JNgwoZrzS6yvpS7UXR2kS3Vz
 ZYTMkl0y3jAB+08jIEfo4RExiN98AruTYkjZx4O9OcD1M5VuUYbKkEh9+8+uDgfsPzMh
 OhRLmzuwPOy7iqvUGpVPyY2gAEoDIFgkJcak/Kj2nLnFtbfDVVAyrY1aw2LkS8t9zImh
 Z3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014401; x=1774619201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=63Gm/FFn0TR79YWmL7Ds+rPbSdgB6XTpUYt9Sx4nb+c=;
 b=mTjRfQ4zkGjUwNfeHvaYcBhPtiW5QU9QSSZR1gdwm9nFniHvY9sGVj3qxznpFw3u2U
 v1ne36V3bA1gulyLvT/B5dhdX8rwG6UWhFfJNcAL/8yxA8st2Jbrf0U0CErS4cuRQkYb
 xy6bjtstO/M7ElPSk8Qrw63eA+T3G4d673qhfyuuZJbkmnzJOMeFvG1fTF6pcohNeh/A
 3RzlDGbcGJAKDeOvfGdf7SCVu6f81W6HKB1dNyRguqyCgPyOdYIellrZ7FGsE+iJ95x+
 GfASpxuE+oPwiTDq8CaicB7elwhWQq4PhmF9CXMooSw7TRdxLt1iT4rpSfxogEbmbwBb
 AiQA==
X-Gm-Message-State: AOJu0YwiCg8bJAm3Ksp9NOwYqeLMqUU4CQQQ2c4q1184wnLiHx0AkNBw
 Q3KGPxmxdn4/OVbLYQQtAJUmIds+vDHgU6IO1zNo/E1g9mlxyRpBbU5e5K3loCi9
X-Gm-Gg: ATEYQzxISftbJEqYDQ/eD+9oVlVd3TdR5hD/XmuaeS/95SuG7iYRrf/olthR2LlAjqd
 F+QCzN9O5u6Fzyk3XCl+kfmT3EQOlbmGyuW25JRDJdBNxih4f3RIAPXNw2V04z4uNBLFWOK6g+o
 /xUWITRchshHyBvWLoMB+DTRZybNd78kspTZB3VCm9OiRw7Hyn/NrffI6YnWr+IMnBO0dxR4cSA
 Fohul/fJ0mr+gy5aPFsvj57hbsZWEm6KMGYRw21hJKNGwTAHoyhDjDpSDMMZBGOFjH2aErSa8A/
 8XPKvfFTrqoSdxxr3M1uRt5p2Qrvz8CtptrcfHfr/Ssy7f3kfwS+Rc9p22F9+4lE666ypkWKvfy
 6xS2bH2mFXgAy2HJARlsLF9Bn1mz60yG6FMrHKvAr9yGWm5mjzhKWeJ0UGV3rBp1cKhSUWN/RrX
 lqSzLvpko5Bx0uy9Zdp8RPDcWc1JkMibYteOXEtSMOLQV+DJtT6UtjpTDEu+N81w==
X-Received: by 2002:a17:902:f709:b0:2b0:71da:4ed7 with SMTP id
 d9443c01a7336-2b082769f3cmr26772765ad.25.1774014400757; 
 Fri, 20 Mar 2026 06:46:40 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0836556desm34497935ad.47.2026.03.20.06.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:46:40 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/8] lib/xe: add xe_exec_queue_create_class_gt
Date: Fri, 20 Mar 2026 15:46:06 +0200
Message-ID: <20260320134611.876379-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
References: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
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

