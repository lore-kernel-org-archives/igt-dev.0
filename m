Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E0AEEE274
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2170C10EC75;
	Fri, 13 Sep 2024 00:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="BAfNnirQ";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537F610EC5E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b7F1YXRzDqrc;
 Fri, 13 Sep 2024 00:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726188009; bh=uv46N6GgvWGvP26EF4FhaOcHgEN2S0Rw8WhxNqMBFrw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BAfNnirQ5sDevQWJGrHf30o+5RKixaRyFBQ3JDJwalmXetAhkM2hMz5pfvmot+OHJ
 JO4tKIi7ILxmza0+2aTsQUWsyeWVFvlJiTUlB49rYfSVdoItTyKq3BSiHdpNmR93yz
 uJPyIfoJOiU9ZCLrnr9EAwgaxCU/Ry8cyclX7mhA=
X-Riseup-User-ID: 36045ECA7EFB7B0AC0619D240A7CBB0E8C2168199436819BD3D953B4EDBBC635
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b7B6Xn6zFpdt;
 Fri, 13 Sep 2024 00:40:06 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:33 -0300
Subject: [PATCH i-g-t v6 09/12] benchmarks/kms_fb_stress: Log the KMS structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-9-71e9a65397e9@riseup.net>
References: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
In-Reply-To: <20240912-kms_fb_stress-dev-v6-0-71e9a65397e9@riseup.net>
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

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 45e03f97919a..0adb296304fa 100644
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
@@ -150,6 +153,34 @@ static void stress_driver(struct data_t *data)
 	struct timespec then, now;
 	double elapsed;
 
+	igt_info("KMS structure:\n");
+	igt_info("\tCRTC:\n");
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.crtc));
+
+	if (data->kms.primary.enable) {
+		igt_info("\tprimary:\n");
+		igt_info("\t\tformat: %s\n", igt_format_str(data->kms.primary.format));
+		igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.primary.rect));
+	}
+
+	if (data->kms.overlay_a.enable) {
+		igt_info("\toverlay A:\n");
+		igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_a.format));
+		igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_a.rect));
+	}
+
+	if (data->kms.overlay_b.enable) {
+		igt_info("\toverlay B:\n");
+		igt_info("\t\tformat: %s\n", igt_format_str(data->kms.overlay_b.format));
+		igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.overlay_b.rect));
+	}
+
+	if (data->kms.writeback.enable) {
+		igt_info("\twriteback:\n");
+		igt_info("\t\tformat: %s\n", igt_format_str(data->kms.writeback.format));
+		igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data->kms.writeback.rect));
+	}
+
 	gen_fbs(data);
 
 	igt_assert_eq(igt_gettime(&then), 0);

-- 
2.46.0

