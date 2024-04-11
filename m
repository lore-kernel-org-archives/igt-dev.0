Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EE8C04FF0
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4BD10F08B;
	Thu, 11 Apr 2024 18:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="NOvDUqYq";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267B710EFD7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:51:30 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4VFph22Cknz9wsc;
 Thu, 11 Apr 2024 18:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1712861490; bh=n2RNLopU2aW5m4ERyfVt9QUYSbyoj5P9HNVlpT0OYzg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NOvDUqYq0GPSkGBiYMdcMv65kzO4P5mMWTRcVLhw8RfS9GxFWJ/mvRLPYpmiEmJuB
 cXulyuMbRROQrbBynPmByqtqiJhttvTo7Zd4hmCuUi8Joilj+VwqLVg3pCrjU6F4J1
 z6/y2pEkLa4M8y8JfkBVKFactBp/1ozAMl3O2Lis=
X-Riseup-User-ID: 37ED73533FD4AF32DADD6863D27366B94952E26AE9040ED4ECA48F6AFE5FB1C0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VFpgz4BFfzJrkm;
 Thu, 11 Apr 2024 18:51:27 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 11 Apr 2024 15:51:12 -0300
Subject: [PATCH i-g-t v4 2/7] benchmarks/kms_fb_stress: Log the KMS structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-kms_fb_stress-dev-v4-2-7a8f3a419ebb@riseup.net>
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

In the future, the KMS structure could be dynamically changed. So, log
the KMS structure to the user.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index e9c051318ed6..8d4707f5a8c0 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -8,6 +8,9 @@
 #define FRAME_COUNT 100
 #define NUM_FBS 2
 
+#define RECT_FMT "%dx%d%+d%+d"
+#define RECT_ARG(r) (r)->width, (r)->height, (r)->x, (r)->y
+
 struct rect_t {
 	int x, y;
 	int width, height;
@@ -187,6 +190,22 @@ igt_simple_main
 
 	gen_fbs(&data);
 
+	igt_info("KMS structure:\n");
+	igt_info("\tCRTC:\n");
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.crtc));
+	igt_info("\tprimary:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.primary.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.primary.rect));
+	igt_info("\toverlay A:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_a.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_a.rect));
+	igt_info("\toverlay B:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_b.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_b.rect));
+	igt_info("\twriteback:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.writeback.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.writeback.rect));
+
 	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
 	igt_assert(data.kms.primary.base != NULL);
 

-- 
2.44.0

