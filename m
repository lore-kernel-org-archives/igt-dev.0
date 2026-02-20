Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629EDC5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78ED10E1D0;
	Fri, 20 Feb 2026 16:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BwaU6jXy";
	dkim-atps=neutral
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC910E1D0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:17:39 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8249fc726e9so1169621b3a.2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604259; x=1772209059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IIkH8kWe0eTqfszr3w26iiMvpNkCHd7PyMAo7RLXhAA=;
 b=BwaU6jXyJ03Qws6hY2WwvThPEDz0mhHBSI1LsgJKz6hd12QfyNWvv7+UZBKrPw/siS
 KgBYIOCPv8Oyc4aWnII7iliLZddWHcCTCttNNlG2Y5M30R9erfwXTrpFWpFbRjHqsaTS
 EeTbhe1t/wUtXJtP5P/fmsV/SW4sBcpRGQ1Isgc8UIhDP6zzTu/ipwityWhhRG+JhX41
 I8DTh4wYhnlKPRagA1jB4rh4dBBDXoGESN1oJ5AxiMqCStg89yW+nX2ZTZuPRGcrhoNm
 7LCK2o3VfbIKwZfBVpZyUK7PSEky/7YKy8/By4vJ0C+nCPqRAfW6GetNw5Lhk0oC/hfi
 MiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604259; x=1772209059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IIkH8kWe0eTqfszr3w26iiMvpNkCHd7PyMAo7RLXhAA=;
 b=wqNup7oJR3pwdkEaf8u0ht74jXE676lQlvWa8TTgQ0mO3jr3CfV/EH3Wb572BCT2wr
 prB08fmqqzwzVrFuZQAYRlxjA0U4eBjgqj8vDh4HWKHHFCQr1TH6+WafU1fnU1Em4ArL
 D+Qm54LVPPMaUSYm9dtAV69liEcGWFav+kGv7CE8jSDjuvC4gQnAIyWPp5uRnjWH9zkR
 TxldasbHTwmA94V9VUFUo+rPOm8y1AqrBFfikLsgcuKWPHxZipy7EYl1bnabDst1VpOV
 5cnDDbrGkoK+Oxcux3DSR+W9ZHGha4L3SLJ5kF/b5HKXuJo7GRPbLDUk4YW3vTKhfO2k
 bIlA==
X-Gm-Message-State: AOJu0Ywu+DrkeqiWUzBQxTSc60rzQHjF5LlqWQLhUrK0TpvcUqtvoWsi
 sic3We2oUWs/wvaiJqfz5D30cI0EWHipxJdLx5tw8Rxt7wJU2qzttyjKVBwZtauo
X-Gm-Gg: AZuq6aLFgQpPO6hLzoF7xtSbmqToMcMWHDIZAeAV0rfNXiclDnEyhoCOQVd9VuR8uvT
 VE9C2jwjfp2YSvwzRnf0Lcj9Bdf9QT8dkKgSCsUKPP86XhGHpOrYAm3fB6OFw5raL02GWZxsiRD
 D5gsKwqt3sCT32r4DCocEuyqfTkkd6RrsEI7qU5Zi/9eViq1jQZGhphu2x4A5jDrkxrCU0scClQ
 RX7NiVp2wL5lShjHmE68rxoMukOhsVGDbZzfGX/NIqBFwTjDbZ4pZzqymNw7BIGEc5TQrvK4aQ2
 zZ2260U1nuQTnFwndA6Qo/ntn/p4fBTaYfDWR5p5+dKeZC7R12cAfc4V+UxR/mF5WKC1xscqPs3
 fmU3kWPdClXgHSmVR4KZNlOw8ZUL+J4L1V4WEvAB+zoT8+U2Fa9y79GuEp8vefgSmjjJydxT481
 +f5JyZ+h7v7ulW5mQJTT3r4kgG+GyF5dNc1gpBgIsUbqK2uAFKTD6BY963/jfCvQ==
X-Received: by 2002:a05:6a00:a804:b0:81f:4944:c38c with SMTP id
 d2e1a72fcca58-826daa6290amr366471b3a.43.1771604259064; 
 Fri, 20 Feb 2026 08:17:39 -0800 (PST)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6a29f0asm30980546b3a.9.2026.02.20.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:17:38 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/8] Enable Vebox engine copy on Intel Xe driver
Date: Fri, 20 Feb 2026 18:17:10 +0200
Message-ID: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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

Here enabled Vebox engine copy of framebuffers and force yuv framebuffers
on Vebox path.

Juha-Pekka Heikkila (8):
  lib: take out duplicate assert
  lib/intel_batchbuffer: make __intel_bb_create gt aware
  lib/xe: add xe_exec_queue_create_class_gt
  lib/intel_batchbuffer: add intel_bb_create_with_gt function
  lib/intel_batchbuffer: move engine class selection to helper
  lib/intel_batchbuffer/xe: add bb exec path to use specific engine and
    gt
  lib: Enable Vebox framebuffer copying on Intel Xe2
  lib/igt_fb: on Intel force Vebox copy on yuv formats

 lib/igt_fb.c            | 49 +++++++++++++++-----
 lib/intel_batchbuffer.c | 99 ++++++++++++++++++++++++++++-------------
 lib/intel_batchbuffer.h |  3 ++
 lib/veboxcopy_gen12.c   |  2 -
 lib/xe/xe_ioctl.c       | 20 +++++++++
 lib/xe/xe_ioctl.h       |  2 +
 6 files changed, 132 insertions(+), 43 deletions(-)

-- 
2.43.0

