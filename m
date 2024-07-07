Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F60C3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 08:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD4810E2C8;
	Mon,  8 Jul 2024 08:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yuka.dev header.i=@yuka.dev header.b="UMYAKF8w";
	dkim-atps=neutral
X-Greylist: delayed 341 seconds by postgrey-1.36 at gabe;
 Sun, 07 Jul 2024 11:00:05 UTC
Received: from mail.cyberchaos.dev (unknown [139.28.205.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E26010E071
 for <igt-dev@lists.freedesktop.org>; Sun,  7 Jul 2024 11:00:05 +0000 (UTC)
Received: by mail.cyberchaos.dev (Postfix, from userid 1000)
 id 357BE1B3E1206; Sun, 07 Jul 2024 12:54:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yuka.dev; s=mail;
 t=1720349662; bh=p2nD0fOkra0JKI5T4xwtyX3KEGV4L3wRxQg7LvQrADE=;
 h=From:To:Cc:Subject:Date;
 b=UMYAKF8wW8srMHDZ5e/kxswrs7cmfpyQL+JlRfRQwTIfySDNyam20wDb4WT0czP1V
 1twM3+Glc+PTXT4k8cKQF7kdczfYQljR2jCqe8LUjbnErWTlU74aD6LrriWi+eikKR
 dpdsMom8mVjfeWebucZRLjrrX/Ri+yxRgD0zPVxg=
From: Yureka <yuka@yuka.dev>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Yureka <yuka@yuka.dev>
Subject: [PATCH] tests/intel/kms_pm_backlight: add include for POSIX basename
Date: Sun,  7 Jul 2024 12:54:11 +0200
Message-ID: <20240707105417.1288665-1-yuka@yuka.dev>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Jul 2024 08:30:47 +0000
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

fixes build on musl
---
 tests/intel/kms_pm_backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 8672afa7a..c4006b8be 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -44,6 +44,7 @@
 #include <errno.h>
 #include <unistd.h>
 #include <time.h>
+#include <libgen.h> /* for POSIX basename */
 #include "igt_device.h"
 #include "igt_device_scan.h"
 
-- 
2.45.2

