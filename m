Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF960C52D7F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 18:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E1810E51B;
	Wed, 14 Aug 2024 18:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TzVtnEwM";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590DA10E51B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 18:54:37 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-201df0b2df4so1848185ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 11:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723661676; x=1724266476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImWm9S0qV4Zz9buy3eWqQEbZivXMtfBFaXbG2chfQiU=;
 b=TzVtnEwMxUwJshsl+ik66r0tADlqO8ygR3nfoaji0WXi7ufNQHRi1vkYdY+Y9fRdr9
 vfaFDolW+mVnyzASHX2y2vuh6qJ/3cNjCa//K7lZtv7mKnCrD2v4CddBFF4x7EfDPRG/
 2ANvZA9a1haukLVxwWvnNabaD6GKEuyrwzVsFMOlcVQ8YbaSU3zN88RJ6McYKZsRm4LR
 Tiji/WKhKa7F7iiqyEPEgadXowWM4dmiTqFijisQIUQN3VVbj5pQmTv3aYX1L3YGfHC8
 Vb4Pkk1B4huI4nr16YsYi7O9xUXKlhs9w7I/uFqPjjNu5yq7AWfFno7FJF+SbJLUgsvB
 DMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723661676; x=1724266476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImWm9S0qV4Zz9buy3eWqQEbZivXMtfBFaXbG2chfQiU=;
 b=Wo3dgIGuQEjIJfvyeXkUIPaKFE2VjSUfrccv07bWVqjGYJeDDtd9yjRfrf5lUcnXNu
 V1zDpoGJaZwOjWpxQcfaRnssCtN6qOy/+YI5aD2V4kIJDG63xcO208tob50HeavKphxw
 ufZOBtTJqcAphKWR/IEovYlXy+crdZ5BP/tm3MrDcPDH1SOaRD0VpCnre2XZQ7ARk+bK
 Z409aHrWTmWaBVGbtV6zO+7a68yqSh7kUYakP9Te62FjUJImTao9eQOoImRe+MoXFglx
 Jieu925w3lySyQ49p69Y1PJpW1RRpxpVa71PwtH6KGU7Gglt83SnD+ksFbCdWwc5+zWv
 1U2w==
X-Gm-Message-State: AOJu0Yz1vFSmDil0ObA4iiHBNDgFuuv9NP1z43aeiQu/K98IIUactQgh
 84oOlXYDAC7TIQdcaDWKwkOfk6U6vyTQy8zaa48E4/I/z/HYRa/m9MKZyg==
X-Google-Smtp-Source: AGHT+IHKKeyQgkEM/0t+Kit7w0hVjDzBULmOO9P5BD6Mr0dvCYvY38wi2NRLZcPx02a/fPWlxPs0vg==
X-Received: by 2002:a17:902:f686:b0:201:eb45:30a4 with SMTP id
 d9443c01a7336-201eb45320dmr17073575ad.9.1723661676260; 
 Wed, 14 Aug 2024 11:54:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd14d08dsm32683005ad.109.2024.08.14.11.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 11:54:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH 2/2] device_reset: Require a PCI device
Date: Wed, 14 Aug 2024 11:54:26 -0700
Message-ID: <20240814185426.70418-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814185426.70418-1-robdclark@gmail.com>
References: <20240814185426.70418-1-robdclark@gmail.com>
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

Too much baked in assumptions that the drm device is a PCI device.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/device_reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 8ed3ef5220fc..c49f94e2faed 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -200,6 +200,7 @@ static void init_device_fds(struct device_fds *dev)
 		igt_require_gem(dev->fds.dev);
 
 	igt_assert(device_sysfs_path(dev->fds.dev, dev_path));
+	igt_require(strstr(dev_path, "/sys/devices/pci") == dev_path);
 	addr_pos = strrchr(dev_path, '/');
 	igt_assert(addr_pos);
 	igt_assert_eq(sizeof(dev->dev_bus_addr) - 1,
-- 
2.46.0

