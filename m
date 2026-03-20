Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FE21098781
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798E710E466;
	Fri, 20 Mar 2026 13:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N7e57SKO";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFD910E466
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:46:25 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2a871daa98fso5106115ad.1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014385; x=1774619185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6b2i+WXi9a8f954JHJbUiKlHQVevO7374TZrsTsuMjE=;
 b=N7e57SKO1DabB6YaiZUFJVqHqGl9cFUN0eR6EsdXhmt3SLsbEH/UTqnwh+7HWnM6U+
 a5Jyn0L0s2RxoReNiQaPyldzOZ2lDncg9M93NptKnP9My3GZJbtz5aw9j87rA6iFmaVs
 XgbyngYaA3BPcixuiz16KHNnBy/FdC9O/3oxMTp9lc4slxKJ72dq3oNexmTfzLqSH7UP
 xhFCf88t3MBcsWZFQUswpyaMVGG4qJTSxfpqpSqOccSCU70a3tM8j16zjGi0ZgX2pDgP
 W8wepwhk8VF8mWV3Jc5Hf38oHDkgJVz6mtQsooY4/mJEcey7M5cp3Q+XXpBgUF2KcigG
 nSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014385; x=1774619185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6b2i+WXi9a8f954JHJbUiKlHQVevO7374TZrsTsuMjE=;
 b=plHg5/denPxL24C+AVh4TM972iBuTYxejGXJfgplsUw4322vcI8VEJZSzcoj56W2+B
 7owR6iGmHdCS3qUZuXAajj/nhOm3GORDVT7R2qiUJqw7Xn3zc9oD84pIP7KcPTbWLgCK
 CiubOv3cHYzYS3royKIYDGrcSUjwrBpT9NT55MgxfEJqBjnaNKvUzLjgj2OO4GKjOI9/
 M8nIUbO7lst1UUkJGKCG9y4Yq37OdRSXOPnoTXH+GOiClJUfvEg2OCGasQh290VXc8Pl
 /yhyDmSpF9VrrNA89ABfgQK6CF/wxvKDTB+W2rYYo+lIV04Wo5QsE05+ccI3gIzWXR64
 HtOQ==
X-Gm-Message-State: AOJu0Yw7uwN78DrsIVSxan5LnW3NyFH+PL1yTtnI60hsdBAg+sK7bdyO
 xd6P6KckTuTz0PoKoQPP6sE+Vz8Byf19YblHWlUAA6azpjt8rp4hlUxjbLGblH5o
X-Gm-Gg: ATEYQzzExgfOH3YxTBaEwdDuon8Zj9pAWQbjapb4mZWodccs+7kOWmqh0jHXYHZgLRf
 FhcLeK2pMB99fvYNYN12zRijaH7ExszjPj90cZzKCm0cPKsdshWTYY8tsr36rDuPJ6h6qWbKEMn
 YfsugGjfO8x9j1qEnvxJvc6zfcNdj337R7F2v+/i2dKAshHKshxy+aAg560kfqqwsLwlKRGgbaq
 ojjin1KeeYfWAGZJjU+sz8SiTm2wtGwKZLybj0nadw+8DKTvZPYo1Axl3tm+KkbcT+c0kAMm/vM
 XEvi0slQxcV8jfvGfjUg4wa1VeC9ySy4Au/brADFRkTI4HSwbzgiM3D6lKzpYq4Mxp/wmIRFMTO
 2J1iDz3ddlveXvsw2+c9hV5FX7HzmW4FDBICujYbwHjo8ml6pb1xsddPbMOdIGOE+yIXn8X9QpQ
 vnZDCKYgrNHDWg1ISJgfH3VFy0HapV+qU6/ao5YTLZriCeK2wcTHd0X9827i29FQ==
X-Received: by 2002:a17:902:d2c9:b0:2b0:4579:adc with SMTP id
 d9443c01a7336-2b0827a4d1emr28472045ad.33.1774014384818; 
 Fri, 20 Mar 2026 06:46:24 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b08369617dsm32436125ad.71.2026.03.20.06.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:46:24 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/8] Enable Vebox engine copy on Intel Xe driver
Date: Fri, 20 Mar 2026 15:46:03 +0200
Message-ID: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
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

Here enabled Vebox engine copy of framebuffers and force 4tiled yuv
framebuffers on Vebox path.

Juha-Pekka Heikkila (8):
  lib: take out duplicate assert
  lib/intel_batchbuffer: make __intel_bb_create gt aware
  lib/xe: add xe_exec_queue_create_class_gt
  lib/intel_batchbuffer: add intel_bb_create_with_gt function
  lib/intel_batchbuffer: move engine class selection to helper
  lib/intel_batchbuffer/xe: add bb exec path to use specific engine and
    gt
  lib: Enable Vebox framebuffer copying on Intel Xe2
  lib/igt_fb: on Intel Xe force Vebox copy on yuv formats

 lib/igt_fb.c            |  52 +++++++++++++++-----
 lib/intel_batchbuffer.c | 102 ++++++++++++++++++++++++++++------------
 lib/intel_batchbuffer.h |   3 ++
 lib/veboxcopy_gen12.c   |   2 -
 lib/xe/xe_ioctl.c       |  20 ++++++++
 lib/xe/xe_ioctl.h       |   2 +
 6 files changed, 137 insertions(+), 44 deletions(-)

-- 
2.43.0

