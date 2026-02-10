Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBF9EA8130
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D12C10E5C8;
	Tue, 10 Feb 2026 16:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTnfsGav";
	dkim-atps=neutral
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com
 [74.125.82.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7961710E5C8
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:13 +0000 (UTC)
Received: by mail-dy1-f194.google.com with SMTP id
 5a478bee46e88-2b82c605dbdso2264642eec.0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770739812; x=1771344612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfR0q0MwxIkTwYUVsYjAFlJZjw+9ZDL9Y3z+KbKcgUA=;
 b=fTnfsGav2z4hz+0ixKJuIJ/bRiEt1YN+gsdayfjZvnTtdv3CnVtiynIZ5B/rF25pqT
 SPJCuvLIbNrzX6mynNLaIej84iCrzKbuPk1MZZJDFc9M0OHxap/vpJB+ReQz5sBG8TA3
 cJOj8yRS2ttFNUPC369rzj4CF98qK25yBNPM6XqEzTN1gth+MeMcoZyfQcEfvrkany1S
 v9HFFxDEjo1vZU5u4mEBvWuh070mbBtATmHGqnPDrMILgnRYeqjuvP8oOf30t0uJHt7k
 wKCXj+/rlzP8Zwoca8oInEYxyzEOMXs2ffz6qD1bci+aN2dXVTS6XRs1mMz532US7fK8
 ND6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739812; x=1771344612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kfR0q0MwxIkTwYUVsYjAFlJZjw+9ZDL9Y3z+KbKcgUA=;
 b=rSCDlItK/yzXqgBB2jdcK+02Q6erxe2+5pJq4Cnt4HwM53pzv2qSuF8IKi3aXlo7fc
 dna2NZb6cc0JryNP6kmyt98gdLzAOmRJVJLO4+RW1iqhaGj/rCRYj7Ks6ajnEKZ0j5u0
 P4EDMgxWgVebFHsC26s9entdxhZNREDycLFYZv+TF5HjpzE/41D4ka7OZEyx2NNqkEfg
 GoVPMFhoMhfpjXDnydBqLqddhvVEgw9brp2saMzkGllukWMguKP4t5wloeYNo96qw0oB
 xC1+5qxTy7Mu1JOOHEgHf2m/OErLONdvqA9vh1Vcpv90f1cjR2OLauYfYs4/iQh8jvFx
 koFA==
X-Gm-Message-State: AOJu0Yz62XIbwwoema6W+Al9fvlq6uk1xN2oO0HY1wq1OTNmfzZuPYcG
 O1cwNR6N4ll1zXjoEP3reyGv6qOezhmEaExCKVJFN1etFdQ84eglB2aQKmHJCiUMcWw=
X-Gm-Gg: AZuq6aJA2UqzwTDq3xS0pT4paunhbnKDuXbiy93T0F8rPUpvtVSoJeeo9hTIdtitgJT
 mQIhwDj5A/F2DGww3/iAzG2EEG3IyRVY5yWiirdfq1MqUMtY60Ob8lsqPFcUyuYRDSZPywrrPRu
 wu4s4tdXmBkm8l3cppIObzF9tx8aHPZ18D6mskL5TOkzZuqpZO5xWLwea08C1lQncCH/BADpsPi
 7YJU6uQAGmGTMpL6smPdhBogl91rzd3pCdKQjacf1gIDSAhc8Qq/SFsT8oKr3OFeA7MVN9cv9NL
 /qmiSNzgd7lF1jT3GnAbZE9x52cwnqa5RZUBmoVQgEwmDkDsT/B64XztiDGn+1WEfG/Es4KHB6l
 05yMlx1+0UsWvhNdHa80BJWo4xfnW5ZYl3XhJY98fkUBgWu9+hndgI+USRc3jAf3r316ftRXi9d
 9kE7HTVWFTeA4rpJt0Ux8zhJOCipKgnOXXPL8sjP8Y71xKuA179OQ9r5nVJ1vs
X-Received: by 2002:a05:693c:37c7:b0:2b6:c617:f795 with SMTP id
 5a478bee46e88-2b856486ab7mr7096476eec.17.1770739812356; 
 Tue, 10 Feb 2026 08:10:12 -0800 (PST)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1270433abdfsm11590072c88.12.2026.02.10.08.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:10:11 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/7] lib/xe: add xe_exec_queue_create_class_gt
Date: Tue, 10 Feb 2026 18:09:36 +0200
Message-ID: <20260210160942.2219370-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
References: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
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

