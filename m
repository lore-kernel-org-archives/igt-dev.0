Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA61EEE273
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0907010EC8E;
	Fri, 13 Sep 2024 00:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="ce2fvzoi";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4315B10EC88
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:56 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b7J0nmczDqqr
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726188012; bh=s6yAnGbNY3FX2BIvcQExBlWXRTv5MAz88OUmY/uqPbE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ce2fvzoiF3+DLNqPGKB+qcnI8ji3f94qGUObYv4DQPKDvF/xsfY9tuwpyZNM1klEQ
 DFiLl6qhlGQqejlF7vOF1/R77+jp3hUAFB4gFOgMpqBgREkLTJ8MggiZFyqVThNOPV
 Zccq+h424dVgYXyBZ5qiE+dYxKVxgNp65yPpf2T4=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4X4b7H5p0Tz9tLw;
 Fri, 13 Sep 2024 00:40:11 +0000 (UTC)
X-Riseup-User-ID: 3B2A70001943FA7AE5AC5D1A23EADCE309A8C425DDE1C97B8371E5A0D78AE2D8
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b7F3VpnzFpdt;
 Fri, 13 Sep 2024 00:40:09 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:34 -0300
Subject: [PATCH i-g-t v6 10/12] benchmarks/kms_fb_stress: Create a
 benchmark for primary plane formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-10-71e9a65397e9@riseup.net>
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

Create an benchmark that tests the performance of each supported format
for the primary plane.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 0adb296304fa..57df3ae2bac9 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -324,6 +324,26 @@ igt_main
 		stress_driver(&data);
 	}
 
+	igt_subtest("primary-plane") {
+		data.kms.primary.enable = true;
+		data.kms.overlay_a.enable = false;
+		data.kms.overlay_b.enable = false;
+		data.kms.writeback.enable = false;
+
+		for (size_t i = 0; i < data.kms.primary.base->format_mod_count; i++) {
+			data.kms.primary.format = data.kms.primary.base->formats[i];
+
+			if (!igt_fb_supported_format(data.kms.primary.format)) {
+				igt_warn("Format 0x%x(%.4s) is not supported by IGT\n",
+					 data.kms.primary.format,
+					 (char *)&data.kms.primary.format);
+				continue;
+			}
+
+			stress_driver(&data);
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);

-- 
2.46.0

