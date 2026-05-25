Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12966CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D2510E3B7;
	Mon, 25 May 2026 16:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ksCqMATZ";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D29410E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:12 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-36622412e97so7375685a91.2
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727152; x=1780331952; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLqybRUmwRjmonKelfWXZZ5z9fXzlLIAI3vVsSky1YU=;
 b=ksCqMATZ+QfmNu02duU3xJFwdM0aIPomoHv5iLJM/OTbzPeQ6gTXoIJeESiyP5zi8z
 rGY+HT7niX+qGJ7ozysyc31VoTPzz6XzYM0F19FOj9JCPrlw5rY9UDC6hgz4RSliD0O0
 6oVWFHUxGlRvStarMSat76hIpRVCXFMHIwyn9g78niqq+coGstIilxeHbl3qRKSQeCYj
 MGzn3K28jnRdfwnjILTT47Bg/BweXYbro2iQ1JPjo2poOYAEX4eRV6W17n/S3PzKRzKo
 1y4mX3m1Y6+KYfP14GNt7HJAiKtxuZgkKpNzjACbxvGqvQCOBtPGm4bG9oXLw16QsRBJ
 Ylwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727152; x=1780331952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aLqybRUmwRjmonKelfWXZZ5z9fXzlLIAI3vVsSky1YU=;
 b=WYnjVCZx4c80cNxJqazKOH6ZLz9VqX4qnscvxNUw2t4r7L2XV08n7UEz5AeKnY9xO7
 V1/vrmQ5YRbzO0UUFv6VGfy+ah5Sl66PvTQRAl/GAJV/gvz3tBvsm+FJ4/kS3cjAXkpO
 ADGH7L8iMZxIabBVITdXRI/ugFX7ieViRRKSrhsu77BJJdYbpDw3IV7McA1LZpsDy/p0
 AKgRrm7vz6IAqC6EdBNz5iomTC+extemqF/DFh99z/a+nXvbdVQBQGiVXeYTS3uXo/Y9
 F8pVlURPoxJxkqMHA79NdkFnmyVy7IFYgT6UBxswNMRQ4XUPX65LAP5O8uCblal/w2AX
 vQmA==
X-Gm-Message-State: AOJu0YzaozDVonyR+2CPaCyhJBRnAUtYLZAutHHZqq8Q3p5cE65bcPaA
 pexczt4uf8Nc3vLqkJbXqozJ9LHgy4Cl7jHeauJ/s1qyaSZLq/v3ob2Zunajg0DG
X-Gm-Gg: Acq92OFuY0jl4PP9T+zmNVlj/EltB+pRYJqv7lyq3lgig35MELTr95q7o1DWPjACmWa
 XfR49zvXw3CYIJXayCzwTLgHXKTtvFgxjFdKSTdaI43MzC9zMQUdzVmQU1LPNJGKudxb8Ens7et
 w/jKcaK0jeQusymZwhxZoBNiqrP09yZ67kYFGYhOi8vVTfPiQDlyYAOUGV78fqjpjJ4LUvFb774
 7+5nwLBucmw0alxmr4Kf9RuM/+paPM0iXZMTL1G8jKkHtUk0J+1mMmERy+xGZZly7BEF6xZtnZC
 vd1V/lBcHYHKkvvjTHK0rbMpxv0dx6gY3fmYYztZHUDQCc1Ioop9tWY2qNQH0rjUMxHORHn2S2M
 /HawiKE4tQlaxR7PDm7eWhX/XnSvey/odwvOsRpYwoL3C8CAEBu0ZNeiu925Ki8CBDS8Y9h0bgs
 RbCgJ3D7bLot1sUfa8VV+9YWW8Ya/hTYkHvJyvBDiA42gui1/+vrypI9KNE99Dsg==
X-Received: by 2002:a17:90b:1d8c:b0:366:33a6:9921 with SMTP id
 98e67ed59e1d1-36a67422decmr14278356a91.4.1779727152024; 
 Mon, 25 May 2026 09:39:12 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a71dbeec4sm10571106a91.6.2026.05.25.09.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:11 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/9] lib/xe: add xe_exec_queue_create_class_gt
Date: Mon, 25 May 2026 19:38:44 +0300
Message-ID: <20260525163850.3493602-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
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
index e13195e16..c8ed99182 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -508,6 +508,26 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
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
index 768f77246..bf40fb6bd 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -84,6 +84,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
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

