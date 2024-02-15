Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994C0C48BEC
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 22:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3762A10E8BA;
	Thu, 15 Feb 2024 22:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxPyy+/h";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0508D10E3C1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 22:19:10 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1d7431e702dso13162765ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 14:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708035549; x=1708640349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=43YnMUblHf0CtZKufKenWi55ER3TwwkzwWJcELPPLnc=;
 b=bxPyy+/hPNxfmzWHXyJnqNhWfTSnWs1lTQFIjn/nQPMNUZsN5OSPlqks4ymyai37c1
 34TdZmLmLIlIRPT90fY/oLpePygpkyU8lWWqFGXCdc2sTog8VMnyN41ec0qfT0oYyeGd
 1qLx/5/eBe1yoJIgS0ltRDPxNItSWe3fZJhQLeMSsJ0mjf8cO1zvohfDzG1TlWe6xzDz
 9uVdNCZ+es6uvuz0FrEx7Fe49dVvGYgcWwnltx3TeV/tqh9npNm+mHiDk0FNidt30uS5
 q/ZJhhqbeCZSbEkJr+FLNa2HULJHjoocxFJXmJtxBl0qrTjPqDPUc3iFqr29rZGfSzmj
 V2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708035549; x=1708640349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=43YnMUblHf0CtZKufKenWi55ER3TwwkzwWJcELPPLnc=;
 b=c9dePbf4ke1AzvJ1f9k4c0vqmWwXRJ0z8m5WdLGmpAaYzUiAH+RX+BSaT/AlbMm334
 VYDddoC+sIkpFrWE93OcadRWh0vZteMzwZHQ/D2dxybN3LByWt1ZqW97kfEdsLwP8cOD
 RxdQk0N+5OpuQMIXZ8ICadAGKqbc57EUUQCjwXhd8F8XhfULWxT7+nvhSaEWM+frEGw1
 zq56fbZsNUq/LhVrvFscMRO3fR1yanTxky9N17eBMq/eGTauBtG7GaObVBkd7d2JF315
 cLuKhe3UfJ1kpDT3+KCtZlkrPYIMDTn/FszAeOxiRk9k5eE/de/guxO0QDt2hfVF6va4
 C6ng==
X-Gm-Message-State: AOJu0YyVDHlWMCmYF/FTH83id1vJng1C88zI0KGq7TuOyuA4P/WTbeD5
 mMrj9dMqBpf3uSrJFxGpmBFp+igY1VLhVd+PGfMRn14qktqJKjtUryA573YE
X-Google-Smtp-Source: AGHT+IE9w6YidWi5p8Szgrp9X6UHi+fcGAJgNuZDo2c8hF0gEdZNyS2h8xoCSxoIT+81Gk3TxdzOUA==
X-Received: by 2002:a17:903:264c:b0:1db:2b07:34f4 with SMTP id
 je12-20020a170903264c00b001db2b0734f4mr2897455plb.13.1708035549323; 
 Thu, 15 Feb 2024 14:19:09 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a170902c79200b001db86c48221sm1736647pla.22.2024.02.15.14.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 14:19:08 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t v2 1/2] tests/kms_bw: Use reduced blanking mode
 1920x1080p timings
Date: Thu, 15 Feb 2024 14:18:59 -0800
Message-ID: <20240215221900.327042-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The previous timings don't work with the ti-sn65dsi86 bridge that is
used with some of the sc7180 qcom devices in drm/ci.  Let's switch the
timings so that we can get some kms_bw test coverage.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_bw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index dd10d640dc13..f1d2a1b64577 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -64,12 +64,12 @@ typedef struct data {
 } data_t;
 
 static drmModeModeInfo test_mode[] = {
-	{ 173000,
-	1920, 2048, 2248, 2576, 0,
-	1080, 1083, 1088, 1120, 0,
+	{ 147840,
+	1920, 1968, 2000, 2200, 0,
+	1080, 1083, 1089, 1120, 0,
 	60,
-	DRM_MODE_FLAG_NHSYNC,
-	0x40,
+	DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PHSYNC,
+	0x48,
 	"1920x1080p\0",
 	}, /* test_mode_1 */
 
-- 
2.43.0

