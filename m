Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12463C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 14:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9312F10E040;
	Tue, 20 Aug 2024 14:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MAybvSwP";
	dkim-atps=neutral
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDD010E040
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 14:43:10 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-2704b6a6fe6so1636970fac.1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724164989; x=1724769789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bgo5HAwi6mVX7QhoK9GzfwyH6LOU6u7Hgvk3XV1P60k=;
 b=MAybvSwP870b1imN39L4mEt64XLdzRle0LOywGnJSJ4apTt8A1908+xD5RgwfMD/dJ
 0+FlsWlKZTQWOQTaHWKGplH18Spa9q2AwhwCUKhiyuqH5vdg5xE37aIU/uU0IwzOnG3n
 I8Sr7/PGPVakNizcsyKBVEuAE54DsKXWrGNRuYHtrSVjpB0qSJgOPIGdMLSSx7U08d0U
 S6TyeW3zHLB3UxSlSpdhfv4tgspzrMDox8b5h9CDfdXluBpKQyRMVUhmUkPHvVi0yT6C
 nv0gaR2RA+upO+V3djxgSoH6xJreG0kdQDRtwb4CLw7KIn4oeFuQV/pQc1pHCZL8Fc2A
 IZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724164989; x=1724769789;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bgo5HAwi6mVX7QhoK9GzfwyH6LOU6u7Hgvk3XV1P60k=;
 b=qev3g1l6vAuOjxb26/i9y8ClWq2xaGB2Wtjg2SzwwqJoiXgXnPLj7Vhk+mPQeeholO
 LFCj3mibdUYMlDTamvDGvom67AHfDBItt4/howyt2vdumaD4X/gbrPJUHWHURBhkZPVT
 ZRGH0jo/fikGjQCYGoLeXDsTOsoxvD+Cf/W0X+JEJQQgNXopShsEM1bVSkAIL3l7Fv/x
 DXSkqcyhUokBE9MjVzBe1BYjer8dPxvCfM/Gb5mJvy4YY/V25OKCf9y+o6D7GTJZKaoT
 Wwq3jBJS2Qs6JeHVAb4EKi1PmklhKbmiHMGNEbKuTWje3s8xqz49Llfw/JDsGzciFJyk
 PWCA==
X-Gm-Message-State: AOJu0YzMrqQU92k1zCnwCO+vla7DJBd/2SEAPMGCPn30nfNsKozbvUmS
 9t7CjIBKKddeX6CuTC2YEg0bVpt3PjJLmpdacFY8LB3eRC1xKpWS65VvPw==
X-Google-Smtp-Source: AGHT+IFd0UHbnXRA38JIqpa2eqUCcoFgCVVVtjYEhaN2OKD/0rDy8pM4YG5Nhiv6CeiUTJPv7iuDEw==
X-Received: by 2002:a05:6870:d152:b0:261:52d:1aef with SMTP id
 586e51a60fabf-2701c5b5376mr17075149fac.49.1724164988712; 
 Tue, 20 Aug 2024 07:43:08 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:bd02:d0ce:e791:dc08:a375])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127af187bbsm8291832b3a.160.2024.08.20.07.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:43:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: [PATCH] tests/device_reset: Require a PCI device
Date: Tue, 20 Aug 2024 07:43:02 -0700
Message-ID: <20240820144303.140707-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
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
 tests/device_reset.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 8ed3ef5220fc..40681931c251 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -200,6 +200,17 @@ static void init_device_fds(struct device_fds *dev)
 		igt_require_gem(dev->fds.dev);
 
 	igt_assert(device_sysfs_path(dev->fds.dev, dev_path));
+
+	/*
+	 * Platform devices do not support reset at the bus level, as
+	 * there is no actual bus.
+	 *
+	 * For other bus types, other than PCI, whether and how bus
+	 * level reset is supported is left as an exercise for the
+	 * reader.
+	 */
+	igt_require(strstr(dev_path, "/sys/devices/pci") == dev_path);
+
 	addr_pos = strrchr(dev_path, '/');
 	igt_assert(addr_pos);
 	igt_assert_eq(sizeof(dev->dev_bus_addr) - 1,
-- 
2.46.0

