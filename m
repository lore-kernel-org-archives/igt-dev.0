Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43F6CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C54C10E6A7;
	Tue, 26 May 2026 14:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="s3G078QM";
	dkim-atps=neutral
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44CC10E685
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:43:54 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-135e88b8e55so2530732c88.0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806634; x=1780411434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hzkeRf7dCKIk3kKlJ5GtjX8nBoDy8sgkrTOVcCg+GxI=;
 b=s3G078QMlQ9QfPsbyKQ3rtVY2JKp1Ya55W9oqMfAMKIKJ3xeUkQF2rY2GC/ahw6fEw
 8XO6Am8r9dGY0ivHw6qlAHsbS0KE/zVdm8zxuCNnEJrh0yO+xiUjf+60fVcKM13WGtW5
 zaYIKO6Jdacupt3wUyzad+5j3+pFxx9DUPous8JZdJDZ+7MuckuZAGbFaF0z2O7Hr2nY
 qAr66PrcYiksUk8+0Mu0iOuEKqaAFkTYz+XFYmBjlPmrWMX6mSK2rvK7tjrKNynFvk/V
 an5QBeRqtN4dL8MC3DQjfdK3NQ17iFpUeyusGhtbC9Kn2MpefZXbLBVx246VxIlZbmeD
 xsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806634; x=1780411434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzkeRf7dCKIk3kKlJ5GtjX8nBoDy8sgkrTOVcCg+GxI=;
 b=Fohhz1ybo5kO539DtaJwyD1hsju4GVEWcb1MEIV+NiAxUfQQWQTPoY+IPSh6xfok0P
 gwiY1NyqxJCzDeAzqFz0seAU1b+PM5d03k0iiXfgxZ6jDOyoOA5LBSqGSybNpN3Z8Nx9
 f5I0FzyTESdfxR71oWIjv6XOibFatD3C6bFr5XY6qYLOyAXg9cqSucZfxwy5/OeEH1E5
 Ig+aG5ZrG6tKawjs5q4UwAprkleAwIVTwahwTyyE7KJPCUQn0Mq/lFQlcjgzhHebqDBn
 8YvVXx4RnM4MQAE9DXW6Z1qGld9ZLBkzPHDbUswH7GXzFCfTDhwW07sqEB+fL/quRZUS
 uCzw==
X-Gm-Message-State: AOJu0YzW4gARBfRtQptOINNHAp38uOboEYh5cQ5U4zN2I8MU4UALR2Ot
 sXT8Z3uhC7+/2bAoaxWkNAalCPhNTx9/77FXNYZ5bY1ovIBP0Ky+sODkSQD4lDMI
X-Gm-Gg: Acq92OGuKx0yS9uqp17f+yS3dNCbpqPAOlLr72rEKNTrq0Z7W6phLjDoJkRKQfaisZq
 zo+xPnnllr9GFwtz8JR4N6bHJItYS2bn8R/rdnyg0ZX4QDpdNrjlfBWNnA17EXZGDusS1CQgB7W
 lLZwTGNMDzWCpbvptAc38OdbSE+8UCYeaYkeSaHP6iC4L5fkUWvn0jf3v1ddB0XEM1LWyDjvOI6
 Z3/nfCGSD4l6mCxo3FqLDO2A7glu9mqJIbZCsNbBo1rro5pONdvX1BlpGiyt26Z4p5y/qSszowt
 35wKGLpkbeTOXWdNL2QfHDyfn/Q6tfdZd6Mr3zsz6hI4kF6VrR1QwJVKGwXTwLSoSmTwRd/S1F8
 9VEDlaoYsKMj0BrMfzcaNNFbTp/RmJPx0d06NpggiDEIm4p9axil9mgX9e5UbFJ3R4x1CB+Gf7Q
 ASxmQ3Uf4i6lpI90hswQNNBzGebnHk35dvGNswRY2t78RVpmLlq12gR1Px9o8=
X-Received: by 2002:a05:7300:bc97:b0:2ed:6f94:9d9d with SMTP id
 5a478bee46e88-304490264femr8248655eec.8.1779806633918; 
 Tue, 26 May 2026 07:43:53 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30452230dddsm13653330eec.17.2026.05.26.07.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:43:53 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/9] Enable Vebox engine copy on Intel Xe driver
Date: Tue, 26 May 2026 17:43:34 +0300
Message-ID: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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

Juha-Pekka Heikkila (9):
  lib: take out duplicate assert
  lib/intel_batchbuffer: make __intel_bb_create gt aware
  lib/xe: add xe_exec_queue_create_class_gt
  lib/intel_batchbuffer: add intel_bb_create_with_gt function
  lib/intel_batchbuffer: move engine class selection to helper
  lib/intel_batchbuffer/xe: add bb exec path to use specific engine and
    gt
  lib: Enable Vebox framebuffer copying on Intel Xe2
  lib/igt_fb: on Intel Xe force Vebox copy on yuv formats
  tests/intel/kms_flip_scaled_crc: add 4tiled p010 to 4tiled p016 test

 lib/igt_fb.c                      |  53 +++++++++++----
 lib/intel_batchbuffer.c           | 103 +++++++++++++++++++++---------
 lib/intel_batchbuffer.h           |   3 +
 lib/veboxcopy_gen12.c             |   2 -
 lib/xe/xe_ioctl.c                 |  20 ++++++
 lib/xe/xe_ioctl.h                 |   2 +
 tests/intel/kms_flip_scaled_crc.c |  13 ++++
 7 files changed, 152 insertions(+), 44 deletions(-)

-- 
2.43.0

