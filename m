Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346DA103E198
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA18810E856;
	Wed, 18 Mar 2026 15:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mb6UCWgz";
	dkim-atps=neutral
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6622C10E859
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:05:59 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2c0bb213b16so17454eec.0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846358; x=1774451158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63Gm/FFn0TR79YWmL7Ds+rPbSdgB6XTpUYt9Sx4nb+c=;
 b=Mb6UCWgzMj1QqIQ1HSpD04dCWD6dURrwYl+PK/mWm/3+i1/AV6l1Uaw7fDblaGvRcY
 cGwqyZOv4j5g8ZVVrKEDVpVITu5nZJdgdcKBTqdtuLIwNJgLtiMTJWbyWfoopqcZq5gy
 Ftv3JPq7+mD3ixD+ivNC84r6F7pBa/WUnxknLutp60Ws7tz3EaPBLR/hIxcNQ7Fdy1dQ
 8EE2/clF2XHYmvQniIuHCWh1hs2rL9pOUq39bdqcqpIycBeZlrvSw6d962kfz1Qc3p1A
 1JZlYW4E6wFXHzpooab79Pg23DJ6Jhxb9CJL5McdAni5mZ3mpnIa05jls8li5Fam0Br+
 iNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846358; x=1774451158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=63Gm/FFn0TR79YWmL7Ds+rPbSdgB6XTpUYt9Sx4nb+c=;
 b=gwcesG05kWDTaV1nVNXHkOuV+LBvOzsHBAlahW9nEFr3YDgCllh/0ACYoGB/FtsTae
 CKmtEiz3zJRu9mWoibkCTVKZ3rV6N1RuKc3G5NmshjiTij9VKkw7GJY9PQaMkfndQ5IJ
 I7GipcoPt9lcsxaUO0IlVprbC4j5mXrY0jgrd7FkfdbsptWeIomfmzw4C5iMOCztioMX
 fi01M21UxufS3z9AhF/ZIebTK7LmoD2cKIrSx4lFdoEVLGVn/KEj7MUvBW1W0rY4Xl0a
 wPnk4Z7l5XT0VyZdYStzRxi8B0yusHe0qz/j15iPboSX212I3nuoG9rgsn6Qh6eynvts
 h4aQ==
X-Gm-Message-State: AOJu0YzohO5lAXo79gCAKBUy9OC/VSDY7j4ltoZDjlPA7OOGqAUgSu8+
 TIq7xo9FSIoiiyM8GLAyX+YfIZjYCzJc4LZGKYaPAVmi0dZqvuiewvswnhpKojWc
X-Gm-Gg: ATEYQzxXPpjga4SsoIcmWH2dXfbglD8rMpWjFH+IdwLwiIN7hRWfNgDcD72yo78xLL7
 bDI8TuFqnOJYPDheRHmY02A5OZar6aZL83i6ZlLXTLjQenHS745PdDxSg2sjZfnErJNot0zk2YG
 QBap8RpQ7xRlUjJfhXiglWLdd9dJ+6NSBVc2OZXs3LgZ2tiu8h9VEYiRPTvP3IrDxd0FB9Sx4wQ
 H3N5NTJaKhoKlVUwd7LPWhA7ExZ8+XEe4nXxLTkPIvjIhVtHABk7EDXlBens+JJ1lEdCclCSTjn
 f2hT1ouAKSkCKKSXO5trqkcutGvDuLgLFzjSM/dpjozoXzzc1iJJV6mJYIsF9FSblIXyf7Ir2bv
 t+9svBqnJJWLLt5lLE/7ikGuNgAUZXwzrwSvrO9ZzW5GE0qG92gnrG6ZMu0yywB9sFinH+0RBwB
 2Gp4aFfVBSJ1l2WO/1sFAVUBWEDaIGLr6JnMwJruJntrVBQPUsJhpKYJXl1JDG
X-Received: by 2002:a05:7301:1691:b0:2bd:d3f3:b0be with SMTP id
 5a478bee46e88-2c0e503eb7bmr2183862eec.20.1773846358198; 
 Wed, 18 Mar 2026 08:05:58 -0700 (PDT)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e55a53fcsm5142276eec.24.2026.03.18.08.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:05:57 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/8] lib/xe: add xe_exec_queue_create_class_gt
Date: Wed, 18 Mar 2026 17:05:12 +0200
Message-ID: <20260318150517.4049206-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
References: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
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

