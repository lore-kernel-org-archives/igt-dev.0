Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A5C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 22:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD51112DDE;
	Mon, 22 Apr 2024 22:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="bnvpN1Ff";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA3E112DDD
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 22:18:53 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VNfmD6ph3zDqh4;
 Mon, 22 Apr 2024 22:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1713824333; bh=R22MIFf1iuIW4ltQZhRCm7BqeHlAVSURhu8GC1xCyaI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bnvpN1FfzzR9d3KpUDo0X9mXyXTMQJyXg0CDFneIrqVg8/ey7gD9JEPAqn/Q72tR9
 pMCod9Pit13FPlIzw81o9xBJAdB5hnF4ao9/SElPz3M9L6TqPm8sH4aJJY4fzLjzhs
 xKK2h8anDGkZuTcL/+hCKyKKD4pHzeFl8Vi2CAjY=
X-Riseup-User-ID: D0302C2837B97D2C9991664C4AE49AB4784F14AD38EDC08CBAFFEFB6A8A33791
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VNfm95yZvzFv5M;
 Mon, 22 Apr 2024 22:18:49 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 22 Apr 2024 19:18:23 -0300
Subject: [PATCH i-g-t v5 8/8] benchmarks/kms_fb_stress: Create a benchmark
 for formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-kms_fb_stress-dev-v5-8-0c577163dc88@riseup.net>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
In-Reply-To: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
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

Create a benchmark that tests the performance of each supported format
for the primary plane.

For VKMS, it tests the performance of the conversion of formats to/from
the ARGB1616161 baseline format.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index d2d6b3e65eae..5535339cd287 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -295,6 +295,14 @@ igt_main
 
 	}
 
+	igt_subtest("formats") {
+		data.use_overlay = false;
+		for (size_t i = 0; i < data.kms.primary.base->format_mod_count; i++) {
+			data.kms.primary.format = data.kms.primary.base->formats[i];
+			data.kms.writeback.format = data.kms.primary.base->formats[i];
+			stress_driver(&data);
+		}
+	}
 
 	igt_fixture {
 		igt_display_fini(&data.display);

-- 
2.44.0

