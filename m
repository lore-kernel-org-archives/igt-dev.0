Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0285CC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB6F10F08B;
	Thu, 11 Apr 2024 18:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="TwTHrXjw";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103F310EFD7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:51:51 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VFphQ3SJqzDqD7;
 Thu, 11 Apr 2024 18:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1712861510; bh=4ispZrZs2BMxLvxa0Sy9Cwj+4RvfX7RrBCcqtE8RiGA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TwTHrXjwK5v/MWdATuduTBkawaGLF0wt5i+P44S9c+KVhEpUw2xkHLHB45OftEYOY
 OLOL6P0FJb/BnBPpMcP04Z9uN9dScALc9+0/b7aI/eBDPZsrvePKcRKck62WE6Iife
 RJZ3/Qkx+nIIOftsxkcHWw1wpshyftDwBxqDz5vg=
X-Riseup-User-ID: 78FDD4CB9E5C56D063E8421E4D5ED5A504E51F3DE6FEDA9F59E936608A39DC80
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VFphG55X3zJrkm;
 Thu, 11 Apr 2024 18:51:42 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 11 Apr 2024 15:51:17 -0300
Subject: [PATCH i-g-t v4 7/7] benchmarks/kms_fb_stress: Create a benchmark
 for formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-kms_fb_stress-dev-v4-7-7a8f3a419ebb@riseup.net>
References: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
In-Reply-To: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
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
index 7c5db2ce5af7..9b40264e0818 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -322,6 +322,14 @@ igt_main
 
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

