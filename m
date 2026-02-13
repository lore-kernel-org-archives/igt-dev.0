Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2E7EDF173
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 15:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC210E085;
	Fri, 13 Feb 2026 15:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lgCK1xub";
	dkim-atps=neutral
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11E510E085
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 15:16:36 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-82311f4070cso622447b3a.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770995796; x=1771600596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PTDvCiYzZMJy4+b03kq9CLpSzDcgOfeD+gcyfmGG3RU=;
 b=lgCK1xubCShfweVOGKEHGQzSP0bNAHtEh8buGWFnOFTel73X1ORdr3P3LhVpLw8cp2
 5mr0m1BsCavH7j5OpXkQSrg02sda4/+98ZCRskgjVLWLxuZSUtXr8upLXRpPUJhGKBsQ
 HJyF8LL8q5fxAkidSwLuqY4opSedyfVTK5bLeY5WZd9HisScfff+0SZ2xuHeqJpj3rXF
 47aVAcm1C0D/KQ42pzlQo/2lWVdsAREjC+hztfoLDZHXk9sF6yIcbR6EqlMg1S82NiSk
 h0uYjQ25EqaDSZbYMQtmrcU5Zf39Lo3Yl3VSYMhnSlQT1/uZ4fPvzWx4QWARqPI3U7lO
 IGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770995796; x=1771600596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTDvCiYzZMJy4+b03kq9CLpSzDcgOfeD+gcyfmGG3RU=;
 b=DnVWWfuzLl/NPoDDr6FH+ufJ7JQuWan2KLr0srcRkQPfQ8LZ7UHFMuHn6cRdVs8LxA
 JZgq1EhMKwfGV/3ZFboGLxOB9OFJGUEItNH5JJ5D1rYKVTwk7TINtF2uTEmbndRPlthU
 bSnc4CJ759gHk8IOz+wLMWMOf8WaJ9Xr7vdkMG1t4VgMxQRXYtw4ak6UCqD3G5u+pv0a
 JRaRjIOudRn73V1Z8zUuieFOCBZdW2662pxWfUlQIPj76Wn8gtJcj0ahwBeMbTllUimD
 33kIw4FCGcwEm9Z9sk+WNLNGM5P9BTF4jHzHn88NaRQZVLjYUdQYmDcu2sH/gPnjg+Dh
 VpdQ==
X-Gm-Message-State: AOJu0YzdOLdQGiipRmA8ctMCoAHDrNZY9apU46xOjg0W2aRAZkonMsQ0
 isJCzk9iO6mmWBj4SPupkGh/qYQfdVPk102VnNopunNW7HK1kdkMZUQ00L6ZwRIs
X-Gm-Gg: AZuq6aJmcllCzbnOq0gw6muXdr9JqFspf2e//lxpuUTCOUxnf8C/a4UdFLxrpwgKqTc
 nguKZkKy7BtuHo4BqAB7L9x4ZuUhO2qx8tHgeKrcmYy2v8y368zl4ewXG4FaMM7LQBprEOvQvmO
 637HVAcQjmmIlwdu+332bt7dh6iwhx/iK6QoOUjcX6d2PXuoScu3hS0B19HSLBrXhC3IdvfFV36
 0A0JkWDIaLnVQZLuZbpsrO4v6GqwrXnugRu1JEhXU9w76XWDdXyrZ0iUVms9Rezwa3sXHM1Kbi3
 /R5KhhVzn78g39hTJaLXPOnIOiRBOe/P9M3PcEA3txkCv/cBCX8qrNhAz75xOCZY8wf95geiaee
 HP+UQIO3vRin5CWmruSidnGpUAKAA3Kz8ktefnws93fCiUVnoUPualgxbM2vm+Tkv+vw3+GxGDM
 /aObGSWVG46Yn33LLswrcpJ8n+i3ZEaDXpkmz3C7knkpGeevuxfViduuPRBS5a9A==
X-Received: by 2002:a05:6a00:430f:b0:824:36b5:3b27 with SMTP id
 d2e1a72fcca58-824d5d30e9fmr393489b3a.15.1770995795840; 
 Fri, 13 Feb 2026 07:16:35 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6b94b80sm2883815b3a.55.2026.02.13.07.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:16:35 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/7] Enable Vebox engine copy on Intel Xe driver
Date: Fri, 13 Feb 2026 17:16:14 +0200
Message-ID: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
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

This is to test Vebox engine along with other engines. Vebox is forced
to be used when tiling convert is needed and destination is not linear.

Juha-Pekka Heikkila (7):
  lib: take out duplicate assert
  lib/xe: add xe_exec_queue_create_class_gt
  lib/intel_batchbuffer: add intel_bb_create_with_gt function
  lib/intel_batchbuffer: move engine class selection to helper
  lib/intel_batchbuffer/xe: add bb exec path to use specific engine and
    gt
  lib: Enable Vebox framebuffer copying on Intel Xe2
  lib/igt_fb: on Intel force Vebox copy on yuv formats

 lib/igt_fb.c            | 49 +++++++++++++++++++------
 lib/intel_batchbuffer.c | 80 +++++++++++++++++++++++++++++------------
 lib/intel_batchbuffer.h |  3 ++
 lib/veboxcopy_gen12.c   |  2 --
 lib/xe/xe_ioctl.c       | 20 +++++++++++
 lib/xe/xe_ioctl.h       |  2 ++
 6 files changed, 122 insertions(+), 34 deletions(-)

-- 
2.43.0

