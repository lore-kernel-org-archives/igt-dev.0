Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48350C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 19:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01EE10EA26;
	Thu, 15 Feb 2024 19:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="Kg5wCmLG";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190B210EA25
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 19:21:24 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TbQ0M4gfSzDrD6;
 Thu, 15 Feb 2024 19:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708024883; bh=9iAqPq87X4nDXSkWxi6VhUy1TsbINuXqxUoL6nFqBSE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Kg5wCmLG7P1ivx/kefArA4H4jRzoIs48flu2rK2Gmll9xEZ3iBu3W+W7j00Ehf1vC
 OIze6AgbPN6Q+KQynu6pX1ZKNq9AVqkV2k2zqoO67w7QA+6P2pEIrgVVfA/PO8nYDs
 P1L/5aq4oPAONVF9PffUOZr6y+nA9fX6b4lWVQS4=
X-Riseup-User-ID: 6C39F9EF385E9CFCD9585A075A8B1A0AAE38410655480C7CC05987312E26C013
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TbQ0J2BGYzFs0B;
 Thu, 15 Feb 2024 19:21:19 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 15 Feb 2024 16:21:05 -0300
Subject: [PATCH i-g-t 2/2] igt: Remove duplicate igt_display_require()
 calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-duplicate-calls-v1-2-512afbe1bda7@riseup.net>
References: <20240215-duplicate-calls-v1-0-512afbe1bda7@riseup.net>
In-Reply-To: <20240215-duplicate-calls-v1-0-512afbe1bda7@riseup.net>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

Now that we don't need call igt_display_require() twice, remove the
duplicate calls, previously needed to expose the writeback output.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 2 --
 tests/kms_writeback.c      | 1 -
 2 files changed, 3 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 9a0e98bed8ad..00eaa0a4931a 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -150,8 +150,6 @@ igt_simple_main
 
 	data.fd = drm_open_driver_master(DRIVER_ANY);
 
-	igt_display_require(&data.display, data.fd);
-
 	kmstest_set_vt_graphics_mode();
 
 	igt_display_require(&data.display, data.fd);
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index cda13b850dfb..6cd685b37af2 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -563,7 +563,6 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
-		igt_display_require(&display, display.drm_fd);
 
 		kmstest_set_vt_graphics_mode();
 

-- 
2.43.0

