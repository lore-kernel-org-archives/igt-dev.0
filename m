Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4498BC4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 22:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29FC10E38F;
	Thu, 15 Feb 2024 22:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V+gKDqO4";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040B810E38F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 22:19:12 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1d70b0e521eso11504525ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 14:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708035551; x=1708640351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dikFntM4ZYeH5GLnssfSqzujLjWyAwZ2Y0+y6OQCkI=;
 b=V+gKDqO4whZWbvAQMz93iStVRaBkjlaDsNK+77jp4+K4YdfgUhPqWLPd51vKSIKooD
 0CXNknXkHuZFcuNvlWhjpR2SyzcAsc49GUx0IJFRtqg1QC5rRQkeZvh7oEPVlD+neS5Q
 DoFq8BEOd3nh3ukLi5099UNLOxVpOIAo/go1+BdBY1+snLT1B/TW7N9wDPOFxMvf9nJ/
 nVW8xNwga5CeEi2d3VPLSGyKS3hcRG8nRbhRhJKytSjEhjjrKDkcTO/L4M4/NoZCHCHS
 34lGS/bj8oi743HDe0BfgUkGzkLpsTX1viO7iDCxquc9o5Pwqz4tNeiwS1oBTcFB3+QU
 YlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708035551; x=1708640351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dikFntM4ZYeH5GLnssfSqzujLjWyAwZ2Y0+y6OQCkI=;
 b=ScOgTHC3gFyQ89xPYtRpC7RYxdwK6Y5lfnWWjDTzgYSU00HFrAowp7tCC8nYB1SKXU
 2sany3r0cK8m82YKErCWa6SSM19rF6QGylrIid4GfcmUwwmnKgXiKO6tBJmdKjqY4Ko7
 nByJxgK0mulCnteyhH4zZDIE5lNjWx+xD5Wb5vCq9cYAIVobZ8bnYh2aqw5qwfG6GmQd
 EYN8kFc+t+kzUn1b3yawZT5+i6J7+XOK9stq5WyHMa8++cULgvGrQ63mJO+UYundetAR
 SxpYFtDoj6hxIQYQsiDhjgoGt0tyxAXaXHEMhYUwKk1s7R+E9U3O8wfS5VFSlKXGt9Q7
 emNQ==
X-Gm-Message-State: AOJu0Yxe0pmP24gwzMGtSmwPPW4C3oB0hYaqNZeUtlIBhzS/2jvx8Ht5
 oq49fi9FBrj+IZANGasX0SXkjdhVJaAzfDaiLoGvj2ZTHMmu54/+ktBHUqmB
X-Google-Smtp-Source: AGHT+IHePaXcvhWdZLtkA80PSpqWuGh+uo2yHcka71+I2CrxEx4mjAlU3jsxHWnXuM7ED8c8MAF3aw==
X-Received: by 2002:a17:902:7597:b0:1d9:bf6a:cffa with SMTP id
 j23-20020a170902759700b001d9bf6acffamr2749703pll.45.1708035551463; 
 Thu, 15 Feb 2024 14:19:11 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a1709027b9800b001db3099d6fasm1739010pll.119.2024.02.15.14.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:19:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_bw: Add 2160x1440p mode
Date: Thu, 15 Feb 2024 14:19:00 -0800
Message-ID: <20240215221900.327042-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215221900.327042-1-robdclark@gmail.com>
References: <20240215221900.327042-1-robdclark@gmail.com>
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

Add an additional mode so that we can get more kms_bw coverage on
sc7180.

v2: Add missing comment listing subtest name

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 tests/kms_bw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index f1d2a1b64577..96b19199d4d6 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -47,6 +47,7 @@
  * @1920x1080p:       1920x1080 resolution
  * @2560x1440p:       2560x1440 resolution
  * @3840x2160p:       3840x2160 resolution
+ * @2160x1440p:       2160x1440 resolution
  */
 
 /* Common test data. */
@@ -91,6 +92,15 @@ static drmModeModeInfo test_mode[] = {
 	"3840x2160p\0",
 	}, /* test_mode_3 */
 
+	{ 207800,
+	2160, 2208, 2240, 2340, 0,
+	1440, 1443, 1449, 1480, 0,
+	60,
+	DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PHSYNC,
+	0x48,
+	"2160x1440p\0",
+	}, /* test_mode_4 */
+
 };
 
 static void test_init(data_t *data)
-- 
2.43.0

