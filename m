Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066EBEEE273
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 00:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C23310EBE9;
	Fri, 13 Sep 2024 00:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="YNJ/Mzk2";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CDD10EB26
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 00:44:56 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X4b6r2dmkzDqT2;
 Fri, 13 Sep 2024 00:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726187988; bh=gXIL4uBij97qeXqhORACAK8HKRORY4P6KDfw2SiC3+A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YNJ/Mzk2+nEv++MqGhu7GyihLvqDzPTgf9qLYu83ReGelp6sB2YCQY67j18KjcB/k
 353EHTi2JNTxwxObsEdsQL5OEPAiKYIlvad57YBmMX13um9tvmFMh/pF7Zlqs9k00O
 9djLqpQ3M7cjcamSqBUODIG0ZJV1gN5XJ3hFsfQI=
X-Riseup-User-ID: AA50030E9DF787029A09F59115EE016A1D3CC5A5DB07920CE2C07E1214FA8D41
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4X4b6Z755MzFsZP;
 Fri, 13 Sep 2024 00:39:34 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 12 Sep 2024 21:39:25 -0300
Subject: [PATCH i-g-t v6 01/12] benchmarks/kms_fb_stress: Set
 DRM_CLIENT_CAP_WRITEBACK_CONNECTORS before igt_require()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-kms_fb_stress-dev-v6-1-71e9a65397e9@riseup.net>
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

After commit dc2d7fb4f978 ("lib/igt_kms: move setting
DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback") igt_require() no
longer sets DRM_CLIENT_CAP_WRITEBACK_CONNECTORS. So set it before
calling igt_require().

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Fixes: dc2d7fb4f978 ("lib/igt_kms: move setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback")
---
 benchmarks/kms_fb_stress.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 00eaa0a4931a..804bb81a4cf7 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -145,6 +145,7 @@ igt_simple_main
 	enum pipe pipe = PIPE_NONE;
 	struct timespec then, now;
 	double elapsed;
+	int ret;
 
 	data.kms = default_kms;
 
@@ -152,6 +153,10 @@ igt_simple_main
 
 	kmstest_set_vt_graphics_mode();
 
+	ret = drmSetClientCap(data.display.drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+
+	igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
+
 	igt_display_require(&data.display, data.fd);
 	igt_require(data.display.is_atomic);
 

-- 
2.46.0

