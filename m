Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D45C3DA4D
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6038C10E5A5;
	Tue,  9 Jul 2024 15:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WB8p4DGu";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62D10E5B4
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1F2920017;
 Tue,  9 Jul 2024 15:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fD1OXzu3/mObBGIQJjcmILoxosKOK3Nx42x67b5s+XM=;
 b=WB8p4DGusunkEnjBb7588nDyGFwW+ZNPyqVJip4R2ir66KlSmAMi8KBuIu2E+jdgs+F6Ky
 txlf1n/rnu02ukbIb90QqnZ4vF2GpTQ777/JDc8QLM16uRzVOc0/UG4ZflU2cCh9/f+tJs
 4Y8QgMS5V2sf2ApBIym2hcim8PFt0LT1pdQQ4saLV1YzGiXxCpWtcBVc4Emp71h5160zJS
 jygHiKGTGfP1P10mseSfR5cyUJZqqw3Ocql0xyfEK7bVq1YpveJmv7/F/ha4fLgwvotPEb
 wDZNuKmma5IQDIszbQfpCQdiQqEgBe7e6OW7cSevHegl9duGWMR2ylu1SGTI/Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:25 +0200
Subject: [PATCH i-g-t v2 09/39] lib/monitor_edids: Fix missing names in
 some monitor EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-9-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=aZiJ4OURHKoQiaNRRMc7VzrXBjvrN3YO4SIG9ZsKFwg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViX/GFSK5LQpDJYrvR4s/aIVlRAgmzWf+Dok
 MQghaimrH6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlwAKCRAgrS7GWxAs
 4uaoEACOBZvTYhXM7wZ+tL5zXMckMd8p9EGrqHPyzAd3qgfD8zNihMVETdM3anEK/XsNdCyC7IG
 llXUDIbXsv1QFAw+1J/z12xZ0nx9b2ECnYeCoBLdWiANKLtPojgi07Jq4H4Rovh2LXFzq+m/761
 MXNBju1XfKykLzJpqP9+TXtuNgrIb17PWcpC4f8LfsJilusDLqsKZnVOgAni5akfj9VZPyYSIlt
 uuX/k2qhdi6jJ2v7zx4rLREXgLFJBL3CqqHTIKqfRuNQBjzRr6x1tLBAUHWGpzVTka10lM0S0hd
 TFIdgT0O09hqArRs2xjyob9PQRJLy7Deh79VSIGSYNibQJkurqvzMsKcrBIxyWwRR/ccQt4KlEH
 q1ecdJyafbs06XX7PadaV6bujH2y7ViC1c24t/E/SBwMDGshBuYKfEK53Ul+UtkexoH6dIp9eVC
 x0sJfcfiLCJUj2Cyja/X6W4y7qQAny6/e7cWz3uTg8vBbuHh1lClKcfoegpUdGe5xIXX2jEfaa9
 JQ4QG3EEfpj1xXylXQkiNk1b4RxI5Cs8eZibfbk9NbvZ7kXcg2XausB9W5YC8Kb+XMD7Jie9Ibj
 1ogRMpihotQlj8pdPGYOH/SxJS/8NFrOheRgEspqkAtU/3/AHEqkAg9OjDg+/tuQ3qoROnIn06P
 AXJTF142wXg67XQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Some HDMI EDID did not have a good name identifier. Add one to avoid
confusion.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 573e2149d5d3..8bcd1f31b458 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -241,7 +241,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "33333633493056465320000000fc0044"
 		  "454c4c20323430354650570a000000fd"
 		  "00384c1e5111000a20202020202000e9" },
-	{ .name = "`",
+	{ .name = "DEL_DELL_2407WFP_HDMI",
 	  .edid = "00ffffffffffff0010ac17a053575930"
 		  "0511010380342178eeee91a3544c9926"
 		  "0f5054a54b008180a940714fb3000101"
@@ -438,7 +438,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "60350000003200001c011d8018711c16"
 		  "20582c2500c48e2100009e0000000000"
 		  "0000000000000000000000000000000a" },
-	{ .name = "",
+	{ .name = "GSM_50294_M3704C_HDMI",
 	  .edid = "00ffffffffffff001e6d76c401010101"
 		  "2514010380522e78eaac27a355499b25"
 		  "10474aa1080081807140614045403140"
@@ -490,7 +490,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "5011000a202020202020000000fc0048"
 		  "50205a5232343430770a2020000000ff"
 		  "00434e34333132303836580a2020007f" },
-	{ .name = "",
+	{ .name = "HWP_10582_HP_ZR2440w_HDMI",
 	  .edid = "00ffffffffffff0022f0562901010101"
 		  "0b170103803420782afc81a4554d9d25"
 		  "125054210800d1c081c0814081809500"

-- 
2.44.2

