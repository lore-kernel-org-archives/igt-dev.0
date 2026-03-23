Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18837F483D3
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B788710E15E;
	Mon, 23 Mar 2026 16:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SpvLC4UF";
	dkim-atps=neutral
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC2A10E15E
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:29:26 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2aaf59c4f7cso1823095ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283366; x=1774888166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X7A1FeAuXVO7OiQor6X0y4FY9qaXqv4O9Yrxbl8pNVI=;
 b=SpvLC4UF2BPMjo087lWdlSVr5pA4WIWjxxhBzSkIDR0e5G4bF3ARU4roRI8e9/tLKa
 JaXs3s5es1aM5WUahphpu35xhlsxLyACMrZ67Vx/5E4T7TP/5ivQmevJMbmOxESEe022
 pLe1WDRYzfNHfJJjfZo9gI+twPl2jvSlXX/YDDdmknjZWI/TtXDd+M2OA/FUrm/WtoIp
 kPhrseuBLZePky6hEPvyiKZWnjRSRwTmgoVefGZO/V+YQDTmi7z9AYpIEHWT4UBgvxRs
 pr5N5Ty6U4chaMSoiuDxPwSINIZ+o+9QvTwE6jIXHdFid7dpGE9/+fHWyfHDFfR1maYT
 G/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283366; x=1774888166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7A1FeAuXVO7OiQor6X0y4FY9qaXqv4O9Yrxbl8pNVI=;
 b=ZM6Pg/mwVgHGc1pD6Hma7zh3WWe7aKlqaOMspXP3/j1HeV6e0xp89/oFGITqHF9PHF
 PTeRs1E6wKL5kCgcWL4QL0wYP6eXO/eEISqnpmlqe+zQV1ebEPzxrupCXt8WL4nAByC7
 WdtJcX9Xpq3tP0LvwPLDDZAV+Fb2sJWJwyLBZ8f31YMf5dGlR0wJKHU69coh8XZOWXVl
 InH2MagvXBLbMgBTfvCPssdH639TcATbq7daKk1NEMwTbZkwF5kVqbJfrYJlO/S35Nyw
 4IvocDZfCQjaZLOE/JssPwzbqZoKTEicxlWWr4pbNRfwBsKpqMpU3iJqJnuM5c8LkRk/
 Ig6w==
X-Gm-Message-State: AOJu0YzPaEHsD9R9mRJUlLHoFyNg/FSdH/ovA5E20xVnUWlInOjdou5C
 r26XW+BO9wFH1IE/hOzVUfcHRiuQNsWeHBrdu3OZB6qfsnHqarYFpZq6xIlemKEI
X-Gm-Gg: ATEYQzxAac63lWCDq2aYDamx9lNeFihLe+98lo0MQn7vtj9X9ltZKH+ZfO1pDWBDCqf
 PCxatjRcF/8KMK4EE4+QbuyRoNC0AWpEqe+I9qu0FD3DfpPQPUw58dZ1bFw5MImviON5AGFOydF
 149O+OYHB9HsYTl3lplxAspUWesBJdy39YkvBqRoTxj897HitWa43YB+mqtlAC7OZx0/rN5J4L8
 bBp7TQs6IfrTZ4gTuzfmpMVdbkwNzFbcDf7HuFXcDyndEmuFoJZQl+YtgAUpL+sOFjnipFlUBKq
 UnU3B1Gggan1Bkd3d62d37rWvpl1pLzqG1EZaKm5wkcwgOZ1vkeDSl8Ipt8UBqBxUtIa77gvh6S
 k9x10Wex4ihK4sn14gVAhwgwE0XPPB2m8xnLW+DCecwK4hoQS2dQjTeLJs3nk11drjkiFXRthWt
 5/NasHgZe1FL0XzY/JVu/GKY1rYoBpk5EdIlIaFT/D3iNVSqrZfWVgqnNywJbHSQ==
X-Received: by 2002:a17:903:8c8:b0:2ae:46b9:c653 with SMTP id
 d9443c01a7336-2b08278b310mr109715895ad.33.1774283365617; 
 Mon, 23 Mar 2026 09:29:25 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b083516aa6sm157689885ad.9.2026.03.23.09.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:29:25 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/8] Enable Vebox engine copy on Intel Xe driver
Date: Mon, 23 Mar 2026 18:29:03 +0200
Message-ID: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
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

 lib/igt_fb.c            |  53 ++++++++++++++++-----
 lib/intel_batchbuffer.c | 102 ++++++++++++++++++++++++++++------------
 lib/intel_batchbuffer.h |   3 ++
 lib/veboxcopy_gen12.c   |   2 -
 lib/xe/xe_ioctl.c       |  20 ++++++++
 lib/xe/xe_ioctl.h       |   2 +
 6 files changed, 138 insertions(+), 44 deletions(-)

-- 
2.43.0

