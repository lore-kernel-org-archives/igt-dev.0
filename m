Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD362105F7A6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8796010E041;
	Fri, 13 Mar 2026 13:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jf0k/wyA";
	dkim-atps=neutral
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FB810E041
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:19 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2bea8a1c040so703607eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409939; x=1774014739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9LabZwdRVOBbHCL4bt1aArLLFTzr38jWSlWDrBFNGjM=;
 b=Jf0k/wyADga8v8/SBg5AIgXhOUWdfML8mFvODJqddyjNu/F0br78IkipQULPkueBz/
 83IkoYZrooexzhnHQ5mpAehyuGcKILqNliKLzfU3IJ3XQoSB9Q5mSmB//+SGzKicy7La
 DIgd59YMgSANDWx1VuiOoMdQsTDP68PsnIEO0gZJA4KSrBpXWRM5mXb/JHmbLm2A6xf5
 9mxhdtOxALwSqOejMD7pNIq/pZgGKpIx/NhQmqA07eLQql/zFZAaEGhXi/VeGDphY8bA
 JSUzwA6Sd2AsO16xQUB5chLlQaI6K5znHZEe0Z0PmU9xQr/CGU+QbIDiLsu9QWVouUwN
 o7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409939; x=1774014739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LabZwdRVOBbHCL4bt1aArLLFTzr38jWSlWDrBFNGjM=;
 b=H5NlQ+/wCPG//H+LyLCxUa3r3JZlFf0pFyJu+De8DmRCa4gfsztfjMbeY13DKOpseJ
 R9MQtsx0qWuQEhiRVp8ccZN1R7/9EQA8yr8Wzi0WFrz0u1Ai2taPIZI/osGlwb6EU7d7
 5RSnRlkNcgzi/xDQenzBjGTx7qo8O/IzNxEdsPpL4SvK3lKWwZKlnB8k5rgzQq8CQioK
 B4og9IdrqzuWKlQNk1wHZRy2esm3EWgfmYKZv7Itj+aKCU/hvbq7VFHfcClHvuHCGhET
 CDbdMMXLP4LxQ6CjLEDlxM77yf3uM5VdxtkZqzoi9McGZYddkHtmxzCWVonvzPu8VckN
 WsLg==
X-Gm-Message-State: AOJu0Yw8Di6I5qhXjbl3LzdmLnHVmGPfk1CdTsdD2B5hNeYF1G83ItKo
 sM2ShpcP7TV7+iBmOQjBb4O991dHxYZXOdo7kTAxl2eP5sfXURiSCYEeDTZI+Ilc
X-Gm-Gg: ATEYQzxJ/jKLj3ZQbGVvlsoCqrV5jH5qLc9mKq3m77Tu1Rd5EigU7xMTArfn6sY2KET
 dgYkZrg3x+K5MuhWgCZ8pOxs0gfZk2LvbrTE0tVgW2vTKMaZTvJ38euiNgN0lWoiinsDCwjC1+7
 RDoHM/dzaWqAcBfJ/D+7MvWPVW8lkY5mo1cRua+TZ4g5Y9CJjiPpzlc0cEfdEDILAJdgaQke0My
 GYycggfJJz7/EEhdOKgi6cBE6UX3Pvd3JCxs8SQ6mgAW5PqCXhSg2RGjq25P4HonFOwLDQ1W3RN
 neYuvQUTTiJaD3uallu4KPARd1iRjJd1omgLtae2uwAXXwPgZi4ZGeq2xAiQBoRZLhAKxZBUKfU
 iPxj75XjspEZFW1+gpONUOU2AkVuGse+H6LaZMXBAw5QyJy48J3oaz8GmGgY+a0X6hxQcspk0rE
 xXmzlqstkmCKdRgn+/25kpEAfJotLuRkfKHKJMJW3XBjJXBU+zcz+qOl+ocpI=
X-Received: by 2002:a05:7300:8608:b0:2b7:2664:ae9f with SMTP id
 5a478bee46e88-2bea53915d5mr1453069eec.1.1773409938578; 
 Fri, 13 Mar 2026 06:52:18 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab526db0sm3097808eec.20.2026.03.13.06.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:18 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/8] Enable Vebox engine copy on Intel Xe driver
Date: Fri, 13 Mar 2026 15:51:55 +0200
Message-ID: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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

With these patches are seen issues when selecting gt other than default 
on devices where there is maximum of one gt per tile, this probably
need to be looked at separately.

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

 lib/igt_fb.c            |  54 +++++++++++++++++----
 lib/intel_batchbuffer.c | 102 ++++++++++++++++++++++++++++------------
 lib/intel_batchbuffer.h |   3 ++
 lib/veboxcopy_gen12.c   |   2 -
 lib/xe/xe_ioctl.c       |  20 ++++++++
 lib/xe/xe_ioctl.h       |   2 +
 6 files changed, 140 insertions(+), 43 deletions(-)

-- 
2.43.0

