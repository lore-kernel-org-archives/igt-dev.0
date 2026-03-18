Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E46103E198
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44A10E853;
	Wed, 18 Mar 2026 15:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fqYHAtDg";
	dkim-atps=neutral
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C30B10E859
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:05:45 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-12732e6a123so2426416c88.1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846344; x=1774451144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JAJ6gAiL6Qny8058qd+v6WNvCTYensB0Dd5YLptt1xk=;
 b=fqYHAtDgFc1tT2VO/aKKkjyBqnvOAnNUt256Dl/DFCWnGPRuoHTPDgJFqOrsv6N7Gi
 37HZTH4vdvXyrlwWAkgMo2Nha3hN0CCkaFOvWyk89sXC6860Ym+otcha1X67PeAvUdMJ
 gqMhTtCD3VMCcIoVzhAn2SvxLTwZXt/W8crdYXApSU3ZXo4WgkfbSBr62XmugLg4+T8m
 Tm6aiNJ43iBQ4W+JGPu6dK/tjqQXXQ0p+mnNRI0SX205Gp3L+nW2HFqATlyoozrFusEQ
 IXsaf7Ob1Xbz04mBneqC3Aw6216GpO3fhUdyztqJnMEmRnX9wvnzKspCdkawUUkkibBx
 oubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846344; x=1774451144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JAJ6gAiL6Qny8058qd+v6WNvCTYensB0Dd5YLptt1xk=;
 b=hA+NH8yo/lw5QXKILU8FZohC9meGIkeFWifF6RJCFzkSs8gX2vK86E7Bs4zYyiDkHl
 pv6MpdEVJ1kQLkwrYS5jeDozUK4wAV00O/yk2UfpRcjQtVZWtlV7othykdrgKdw/WhkT
 FykJxDR5rJ+6tYfMq7xtZd518s+jWLTQZGNODpGB2xbljBC87gn4pQherryM/G0P0c56
 MMwAqlZ756JTrnOM2YSjn/NYdhAArCcMwIXW/8CTO6Fg9A+dTi0oP0ujgBgGdgKiSSJU
 tg8RHB4AJaAMVv8/bx6sWD9o3Ubrd/yyIhS6vfcfNsmWDEf62X72gDCFaWEurgh45w1W
 /h6A==
X-Gm-Message-State: AOJu0YwfBATyjrr0TOCFF7gJff1vtF40ziXNIzOkGrtmlEXkhsHHt/AG
 jCumi58l1EsVu/LSm5oMto0Hvqp2otgKfUrmKf77TWiCOaa9y60+uvcKGVKRuF0X
X-Gm-Gg: ATEYQzxB4yD/fpZGuMWFZJniNxF5Hcj0olKxX7wTpQ9YuosXKsG/45cUxLQgpGOjTrA
 KwzKpuuRCXAwmR6adXQDVFAEMSIrfQttz54Oh7kNs0xvIw5+qH0IunrOSW7vIKx59r36+NYW5XZ
 0+9oTEwORbLXS0109fiCAxkStHRbtJeD9c5rWWhdJTAe6tM2TDaCFiPDi76cgfs/b8MPZav/Eek
 lAVZX4zaOezRrb4GQGic08t9I3+f4nFKJpJHkMRP6yaORmyhpccIL9Wn1wnQNFoC563I1/Ofkx5
 JdBnsM3Yl9nJVOw5+jzWgCf2KFPKwh73iqnnwyzQE6hJEsAyc8FWnPWr8Pn2Htlz+LhQmGGf4wT
 /d6Lq2lL4hRf8q6/7VtBVeXewLG8BgnuXEXK1jzce5WCH8UPwuwThJkdheW+pLIASWpIBZXkfdR
 3v/IQIanLQkxikRHeJid6zg+iqCOkBo7/EbecPGrl8WrEv2T2autP464DJkFoT
X-Received: by 2002:a05:7022:459a:b0:128:ccaf:85d5 with SMTP id
 a92af1059eb24-129a71123famr2037064c88.15.1773846344021; 
 Wed, 18 Mar 2026 08:05:44 -0700 (PDT)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-129b3e8dc1fsm4944256c88.8.2026.03.18.08.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:05:43 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/8] Enable Vebox engine copy on Intel Xe driver
Date: Wed, 18 Mar 2026 17:05:09 +0200
Message-ID: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
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

 lib/igt_fb.c            |  51 +++++++++++++++-----
 lib/intel_batchbuffer.c | 102 ++++++++++++++++++++++++++++------------
 lib/intel_batchbuffer.h |   3 ++
 lib/veboxcopy_gen12.c   |   2 -
 lib/xe/xe_ioctl.c       |  20 ++++++++
 lib/xe/xe_ioctl.h       |   2 +
 6 files changed, 136 insertions(+), 44 deletions(-)

-- 
2.43.0

