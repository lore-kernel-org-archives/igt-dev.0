Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DB0E81BD3
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AB510E0A2;
	Mon,  9 Feb 2026 16:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DSdST0QB";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62B410E0A2
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:32:21 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2a7b23dd036so15076705ad.3
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Feb 2026 08:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770654741; x=1771259541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HDVkSk+Kvwnn8LSFppJfl59ynW2fwi6cg5LUY9cEhE8=;
 b=DSdST0QBazzeOB2p5DtDC4ue3zh46FePb55CyWS5CQPgG3QWX6xwyr85f64WcaUQ4+
 r5yI4Zsm0OPdTJTyDhQe9Xv5G4dVhLW6fV7U73h1wYz1Zx6Alxn2dOq2Lbq+guvD1Lwn
 4Nrgldh1TarBFPNSScViAn/BhidrGZleSra6KaEqE22FNdG5lLm0EOeay8sNpEz0U3nZ
 it+mLKeoCx4XqM92KoLba4fGmVsXv7E2tfeaMTZHeo8beW+4cjXTzf+pborcy9kauShd
 MJ31MDVdmQ7pJhJe5sc3rwAkTXThcQHP4H+iXYGnpYqcHRtM/TEZ+wsXkzjCVvBD8+p4
 bHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770654741; x=1771259541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDVkSk+Kvwnn8LSFppJfl59ynW2fwi6cg5LUY9cEhE8=;
 b=F/YdrJYyThfbSb9MNw7H69bTzZiOV2dTlB+yP+DqIr3ALQSF7Knx4GLLMwaLtoIDps
 UTEQ9ouNeuhTdUQT0gNI3oU4lxkwb1uozt5axhy67NyeIOqFI8Jp4YG/u4x7CIzUvTIu
 Yp721R/svSQKaob8DpBW++UR8oLCXvVvCCinenCHuKfALj3AmQEUmbzIxbDiGBgxsVYl
 GKVaqv7dyMXxh/Rcp5e8+6rCLCFvMs5t9mFW4/28XZJtn1U5Vqlafm0R8uTekXMJfSIz
 HBFYyGivGf45D9Od80/TVwaqMYcw9YP83Ou3wCJrQ6i1fyApFv+1aPiso6DQ9OJjvZRL
 i1xw==
X-Gm-Message-State: AOJu0YwV/j8tYopsbSgHPAHriYSKPIeg4vt/5C26rL+Yp8pRG09MRVTa
 asWysxPFJj2XOKwEpXRkbWsBeAlusiKj3yXgl7kh7l8TdrG66J/hB/dM19GRZRYT
X-Gm-Gg: AZuq6aKjNbk8a82GYGAxvRMuvdSisS/ShSyYEDOloqlVH7srNdcksOoX8MjaU27RL3B
 YjijhIbIirFTN0+K4W3PfTxHYiWYctDhz5difCbJpBL+BeNX3aQs/tGX0tLu39dBxh6KsPNqSi5
 2nj+gf/Wv0bUaPn+l996nOH+i/RYjZI3H0Qv6idV71oiiVW+TifaLKCHr1oKx/KYGmca9ZO5rVO
 X4yhorFUzuDGPEva28vFQ8Dx/6fnMdR1N9NHV7FZlSePiXtvf6Li7vJsAvPsX5utLlXJXhN4WZC
 yf/UBs0DzjUcVbMob9v5qh9NYXvv6AqBR+QA8sstQPC7YGzQCebvwINigJGqedkyRmv7BJTNxfL
 UZ6bB9ye8Oe07ABnj+Dx9SSVSn3ussDwIKjozwX0rXr4Y+kMP/xvVS/4w4UT0QjosK22c+JpF3J
 hoW1Cbf7TaPc2Gyv6UjbEselP/3uRRDxFrZWKuBDgU2SHDhpyMgw==
X-Received: by 2002:a17:90b:384a:b0:354:c6ac:6e3 with SMTP id
 98e67ed59e1d1-354c6ac0943mr6747683a91.32.1770654740812; 
 Mon, 09 Feb 2026 08:32:20 -0800 (PST)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-354b45ad3eesm6810882a91.5.2026.02.09.08.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:32:20 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/7] Enable Vebox engine copy on Intel Xe driver
Date: Mon,  9 Feb 2026 18:32:06 +0200
Message-ID: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
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

Juha-Pekka Heikkila (7):
  lib: take out duplicate assert
  lib/xe: add xe_exec_queue_create_class_gt
  lib/intel_batchbuffer: add intel_bb_create_with_gt function
  lib/intel_batchbuffer: move engine class selection to helper
  lib/intel_batchbuffer/xe: add bb exec path to use specific engine and
    gt
  lib: Enable Vebox framebuffer copying on Intel Xe2
  lib/igt_fb: on Intel force Vebox copy on yuv formats

 lib/igt_fb.c            | 49 ++++++++++++++++++++------
 lib/intel_batchbuffer.c | 77 +++++++++++++++++++++++++++++------------
 lib/intel_batchbuffer.h |  3 ++
 lib/veboxcopy_gen12.c   |  2 --
 lib/xe/xe_ioctl.c       | 20 +++++++++++
 lib/xe/xe_ioctl.h       |  2 ++
 6 files changed, 119 insertions(+), 34 deletions(-)

-- 
2.43.0

