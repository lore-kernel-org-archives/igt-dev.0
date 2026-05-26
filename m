Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8E7CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D6910E6BA;
	Tue, 26 May 2026 14:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y832yejC";
	dkim-atps=neutral
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F3810E6B4
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:44:09 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-2f7020a928eso15632439eec.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806649; x=1780411449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZogo/wHKPUCeN/faouTlP8Ia2UKY0fm+PUeut/hMlQ=;
 b=Y832yejCJbUR4a02lB6Fv8XC38DJbPI/FxbXpE55J1lJLCb/kfluPxsj0CA41Tj/au
 W9NZpKYyKXnaWKE/fPImIvmdnePdMG0VRt/WZLmxfEf1TYNjUkRsPSrVJCtssvMqsFju
 +EKwDv4XeivX+7KaAVuCnHDL6wO0FuZSQB25DdmAOVIda3/V/VIln/qLSMRAjjP5kBw4
 BwGlfWuEHTQ2xJOrY3SOfGYPeRW9/HTOBvx/1VM1q327H1p012uwBapgYPNwwI5MaeWS
 j29my4HX75CjoYi4yZ9bQvyfu4Tph+obzTZVuh98Tcekkj4xkDkyA0T8cak+8qB94E1/
 mUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806649; x=1780411449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rZogo/wHKPUCeN/faouTlP8Ia2UKY0fm+PUeut/hMlQ=;
 b=HFila2MWHUdiAfB6/xmrY+VR9T70m2kEsqDGN0Mio61xMt+fkJDHx/v1zIdqGZIYvk
 IJ69dot4cy48mTVqlpbMkPAzQ4lF0CcX2UXBovMVYxBXRHMHFG2pdKaKC9WczaKW45oL
 ZahD6FEl6aNSEaSK/l1biO5+dI3xKmYeK1S8fgDxpkjDvqgNgmYmUXz8tG6Fui/A7vbU
 /Aa1qpEJ4kp9inH0ntdBsGtNFbBekxCO72T3o9ihkKvx3zsNsjc7zv5O0i43BvgF7gLJ
 BDnmYwG5szoGjNpl4Pk3eJhb/NTyM6KPUNZNQz1G2bZtn5DECQhPHG5ReChudAPm0Vhy
 so0g==
X-Gm-Message-State: AOJu0Yw57HyuWU+F5zaa66tlAQvgsZAJXmBS/PmzblE/UN+vVnKWOm4k
 DNxVubAnvMHZd9Pv466dwATh7OGHCGHGxgToSAKgqYErEw0oLS3bqHUPxmlr8S+4
X-Gm-Gg: Acq92OEE5M/PgbhMDu8PsXqVjPO3CqJMyLxUd8iMmmgWKiThUQ9ZadeRf8sVlSZcsM5
 ww6M71j4NRqCoGqJvn3l5CLxkDi4nSpGWJV6YSAjct/FmeLwfPqo9YzGt8OMOP0gubq9eVUn3ZZ
 CEQVdf2LZHXFyX0HvUA5SrkXWM6+ReNnuY/0pGHyQFGZoG+s831ttO/6j2nNfL8aPohPirPPik0
 ZL48FA7OQ1QHPBGMlwx4kAVgyrtlpBwzIm9gmK6K7QysL841B4OpnWiF3GDo0ei0VlY6Q+BPMLL
 WcVlVUbxaFgjcUsc7Xuvlnxjop6qoOmV8XBeJW1VnsIYqFrRvUrd3vb8LFmxLQlybW6eJCfA3hj
 RGfl07nEzRmn6j+TG2mBrpb3Njq/uSCtw86riV8utGnNI4AdRdETIhtWLYBTQ+4gkAyKwQc4AGg
 ywu9hUHkwZfxX7mJ7K04SennS3du/1LveqW04qKe2UijNo4+3qV9DVVpDwprwpF10totWIXlLom
 TjoFWkZ
X-Received: by 2002:a05:7301:e2b:b0:2c7:3a7:c792 with SMTP id
 5a478bee46e88-30449184590mr9520106eec.20.1779806648704; 
 Tue, 26 May 2026 07:44:08 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30451ef4719sm10520099eec.1.2026.05.26.07.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:44:08 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 3/9] lib/xe: add xe_exec_queue_create_class_gt
Date: Tue, 26 May 2026 17:43:37 +0300
Message-ID: <20260526144343.2531299-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
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

