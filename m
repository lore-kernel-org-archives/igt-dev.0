Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258D3C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 04:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D197210E2EE;
	Mon, 29 Jul 2024 04:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Sbd2W/Ou";
	dkim-atps=neutral
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06D910E2EE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 04:38:53 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dff1ccdc17bso1541526276.0
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Jul 2024 21:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722227932; x=1722832732;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SYHJGKEkgdhaG7bRGLBkeEYYySospOJCtu4D4EJ7ygM=;
 b=Sbd2W/OuY/wGVdoYEN4PhZw1bjlA8g1OyP3SA8+EhtzYSq6KlLpceCvz/Qyf2De4j1
 WpKEVvzUdhiTxv94/oPee9EMk7c9J0+GYy7nGthWhp0Uz2z7dGns2rz/RouFsusbB5oc
 7ltTkfH9xSlK+JTp4/QFcZG+snaWjDX8/hhcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722227932; x=1722832732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYHJGKEkgdhaG7bRGLBkeEYYySospOJCtu4D4EJ7ygM=;
 b=agcG243da4UQZA/D6Z9YgYcRiP1loH1lCOd/oXWiQIJFZkHPs0UmglZi8olVMjzIiR
 vAQwjiM4niZeoKBtjdySSYcV8Z+jhDz75/Jq762vKgkIglrTNFrwSwGofcRZZsS16cp1
 GEw8Dx2b0z/jpJHZUlO0RvVHvdCk/tIXramqUv7dPim5QGb6ePqYml07PN/tfeujpcYf
 6QRgr+PQ4tgyS/5ucBAJnOUZRhwDNnVAqfeBBUey1ff4h+/b318MC5jIk/+n4rIhoy0Q
 jGgVVyEr7+j/7OxNwk1/ovw7KetapRuVstE6NN3/kWMLcG5+IleTta/Y6jEnyxDND5dp
 E86Q==
X-Gm-Message-State: AOJu0Yy6mEnRX0EyNqmsAtAbh3hvuFsuYIA+7LTzvffPO9cB1NsgbdBL
 jFp0CUW0FEFwSN34q8MddZGQ+Rt3PgR+GehsfXIY5Kx3RGGFwc/qdMRLdN7+M1/euWOLsuMDbYc
 XY6TJ691MwEbUSFZUqkqtyAi9H7KFG2J0VUCewf8/BUiIiJ0ZtCEA/SiAJHtWJOUYpg9TL2rrto
 XMbKQt/oO/KYQa2UcdkcnGgGaQsXCRtxVHRcIp0wa9o9OOrKw=
X-Google-Smtp-Source: AGHT+IEsh3s95TohaE4pkNwU/iY1wNQcAKp721xts9N84GGxTEPtNSdAAXaO1l3c7Wz6CliQhYLoiQ==
X-Received: by 2002:a05:6902:2d05:b0:dfe:73d8:4593 with SMTP id
 3f1490d57ef6-e0b545c0a2emr6000637276.48.1722227932274; 
 Sun, 28 Jul 2024 21:38:52 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead88c19bsm5963392b3a.183.2024.07.28.21.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 21:38:51 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, Ian Forbes <iforbes@vmware.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t v4 1/4] tests/vmwgfx: Removing incorrect assert in
 mob_repeated_unref
Date: Mon, 29 Jul 2024 00:37:53 -0400
Message-ID: <20240729043846.1892343-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729043846.1892343-1-zack.rusin@broadcom.com>
References: <20240729043846.1892343-1-zack.rusin@broadcom.com>
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
2.43.0

