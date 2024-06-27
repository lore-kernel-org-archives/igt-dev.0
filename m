Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20623C30659
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 19:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF44410E2D9;
	Thu, 27 Jun 2024 19:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="fwGxIr9X";
	dkim-atps=neutral
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059F610E28B
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 19:56:23 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3d5611cdc52so1008847b6e.0
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719518183; x=1720122983;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nntNSYHChyuc/ZtYSFpc5ynQY4/oU+dsCU/SVXUYrg=;
 b=fwGxIr9XYcrhFi04TWHnA4uJoihgUOC/8Fze1AfOURhqHLQaiE1KxmMh5JVLW8f9Rq
 9GB8ekVbNT0TM6gpgA086ZInPN5jz8nKyqNJaVxJLIml6WrOje3oDnUSH2/x0CS+eNUc
 MuP3vv3ptRStoc0KKzvNsfIxZXxb06Q1rQWRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719518183; x=1720122983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nntNSYHChyuc/ZtYSFpc5ynQY4/oU+dsCU/SVXUYrg=;
 b=ajtPuBeTSAGzHcbm3IIhRNXrLaq3hP80EOwXgdq5u0ZQrPhJxfQvlNia8e1KzBL4ul
 BhMsIKUNvOESXBoAza8fM1i9TIDcxArPL6HpKYEmlniEpxKCRDcl/Fut3Rc/CtIsBCu9
 E3a+c9yHnjveUjQeMEMawm0l/fOuOxZAe9a6s8kAArAoAphqhYwDKlHOlDZV4S5reges
 2/dt6hCvywbrixBK1F0CMQxmtz1GHRcVOTJsIrMqHNHSfldkwskJkOKPDphCsq4ifnLg
 eukp+w6vYb9TQN9IZbVq5l0/1V4TNdSJzx9Zu2RCIaq5XqU/Hgd1e4K4qteSmurPANmW
 keEA==
X-Gm-Message-State: AOJu0YxhFTRZW34U2qYhceokApM8361ffV02xcpjyBuu2vBVUoTXZW3B
 LlruVsriFXgkIkjp5QlrKL+qXmJt94SNqlJJ6cbGpaYq71pRITYH28gUuUXjrZmSELEtrBSk/Jb
 lWmfAN2qHK8IMttDp9WAvnlk5/u/uJaITybZ0ZzS68xXVlp/pdU6/P2cPsGU0OE99x4W8HAGCaq
 acz8IFYwmmOJVsUFKU4PRBz2mSUCckxEZPsgKYAhy5rNJorJzlzQ==
X-Google-Smtp-Source: AGHT+IFj7JQPJ4b9AsMCUUF4SqZlUfzDPMiA7iOUdXIsxefJO1NrQCImQ4oXm3EBkxW/MF5dgtHSdw==
X-Received: by 2002:a05:6808:1a21:b0:3d2:2b5c:5192 with SMTP id
 5614622812f47-3d54587d80cmr18306196b6e.0.1719518181079; 
 Thu, 27 Jun 2024 12:56:21 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d692f0b19sm9231885a.98.2024.06.27.12.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 12:56:20 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Maaz Mombasawala <mombasawalam@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, Ian Forbes <iforbes@vmware.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t 1/5] tests/vmwgfx: Removing incorrect assert in
 mob_repeated_unref
Date: Thu, 27 Jun 2024 15:56:11 -0400
Message-Id: <20240627195615.3695848-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240627195615.3695848-1-zack.rusin@broadcom.com>
References: <20240627195615.3695848-1-zack.rusin@broadcom.com>
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

From: Maaz Mombasawala <mombasawalam@vmware.com>

Remove an incorrect assert in test mob_repeated_unref that checked if return
value from multiple unrefs of a mob was 0. This was a bug in the vmwgfx driver,
since after the first unref it should return -EINVAL.
This bug was fixed with buffer rework in the vmwgfx driver and now the unref
ioctl behaves the correct way.

Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Ian Forbes <iforbes@vmware.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 tests/vmwgfx/vmw_ref_count.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index da4b41f89..92d49dbd0 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**********************************************************
- * Copyright 2021-2022 VMware, Inc.
+ * Copyright 2021-2023 VMware, Inc.
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -256,13 +256,11 @@ igt_main
 
 		/* Shouldn't crash on multiple invocations */
 		for (i = 0; i < 3; i++) {
-			int ret;
 			struct drm_vmw_handle_close_arg arg = {
 				.handle = mob->handle
 			};
-			ret = drmCommandWrite(fd1, DRM_VMW_HANDLE_CLOSE, &arg,
+			drmCommandWrite(fd1, DRM_VMW_HANDLE_CLOSE, &arg,
 					      sizeof(arg));
-			igt_assert_eq(ret, 0);
 		}
 		free(mob);
 	}
-- 
2.40.1

