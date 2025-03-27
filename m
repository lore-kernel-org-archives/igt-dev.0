Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0658DC3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 16:13:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB3A10E178;
	Thu, 27 Mar 2025 16:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="njBMsWb6";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F6F10E178
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 16:13:40 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so33089095ad.2
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743092019; x=1743696819; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z3GqIjCVjCMo1ZZMK1Ld4bQZRxlQmrxZDkA5VzqCb5s=;
 b=njBMsWb6PgUw/NUJGZoBkUCvgb2MMD2B8lh1b/gWpg8zMQKbcfWzIuzEHGA3jiihPI
 IIrS3uqMfVN9MssO4X89OZCLE+CiMFymM0Z892pPnK7yzz1gbH9ZvVV5ktfQPGZvU9Fg
 VcZ8/lAo1bdTOv4Hwj7ieILmYucpvs+yTmjYKghs6IM11E9ce0UD8O7cO6yQrPOBwGtD
 GgECbTTjNgJAtn6uraeBQsfzV38+cDJ0wev05geA1I8pHMd+AaYSk3qLInDT0CjIkw2p
 ZE9YJHw9JHQ9MLhY65BBoSNbJ+cs8HuX5yjpo4LgRwhuaTjna8F2dY3ZKZxjJ7ud+Oih
 jXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743092019; x=1743696819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z3GqIjCVjCMo1ZZMK1Ld4bQZRxlQmrxZDkA5VzqCb5s=;
 b=NRXPf2xZ14e9W6aOQQ4edWdeje5hPgN0rgJpBOSfrcqDFI3mtHbd4zdw8aPVSQx8yO
 UXXKpZzOtL4Oag3Urbcd/6Y70V8W4AmWg4FuDrcStZ0Cs0dffxFuSsgtOkNJoYV/7X/6
 NGaPi0PCrL27F5HUIPh+MCc5AC1PviIMMlETD0gyRcz6rmJLOxzx8N6hyKOf8yYYZ7Mr
 6poDnJxL+EkR3dCrGsX9VzjBt6RARmSz1vlTfXC2nfTHSmERcmhyQ9k1YvGWL15chXd8
 eh6ATXNF9SCg9cOhxt+Kt27Xj8kgmiO38QcWeiv57DZVtlXS6LVKPxGAKqxHRzfA2R9P
 CDDw==
X-Gm-Message-State: AOJu0Yybs5bv0wYHaqh3RnmehP5YvtWvbhcLZ2KmhiwPR5GqA4jRiZl+
 3WPVSFL1zCXj4pXZdn935WmNRIxbxOC7IXhbmq1mcWPZgW+HT2KLRMoCK0Dd
X-Gm-Gg: ASbGncvkP79KhpZF3P5rWWQccPUYe4btkuyjeeoGnyCD3ld8bSy7yQLloEFp2vzGaD/
 wNdIctbq+LrncIAaSRs0yCVSBD8QmuzRVmYX1xc9JVMHvTOmC+08eoxtBZvGHkJY6BPNzF7WEnN
 uXG9QpB6YaStKbd0XF/CUR/YTA2kAsjvxteG7AmWivjUn/bJoel0RX9YXuEhTcUGkG+TA8q2lff
 7hNeHm/vHcOs4Ri35eaoZrjLKd5da4mnH4vbbo2IvD+hqEV4k8zEM5tPU73m6wD7pWVyzK10CWb
 OGkqq7lLbE5JHS08ZFnfgKcMWsuI2x13CsH05TsLB/WEhc+gbA==
X-Google-Smtp-Source: AGHT+IEAddqgmkAxsWpsydjy2NKFyAUmgnWTKHm+moK0HeMjJVFl1GVMOsQR/0RVKBokSvX8mffe3w==
X-Received: by 2002:a05:6a21:3992:b0:1fd:e9c8:b8c3 with SMTP id
 adf61e73a8af0-1fea2ef612fmr5954209637.26.1743092018948; 
 Thu, 27 Mar 2025 09:13:38 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af93ba10863sm51406a12.74.2025.03.27.09.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 09:13:38 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] lib/igt_fb: simulate i915 linear fb behavior on xe
Date: Thu, 27 Mar 2025 18:13:23 +0200
Message-ID: <20250327161323.2330254-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

even if all framebuffer as marked as slow on xe
let's still use cpu for linear framebuffers

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d62a94e51..9fc1bfc65 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2602,7 +2602,7 @@ static bool use_blitter(const struct igt_fb *fb)
 	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
-	       is_xe_device(fb->fd);
+	       (is_xe_device(fb->fd) && xe_has_vram(fb->fd));
 }
 
 static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
-- 
2.45.2

