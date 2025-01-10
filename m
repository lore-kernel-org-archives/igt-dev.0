Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB0DE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 18:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A0210E50D;
	Fri, 10 Jan 2025 18:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E+q9SAf9";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B179610E08F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 18:06:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C967CFF80D;
 Fri, 10 Jan 2025 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736532351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyACjY/eUf9RjeMhQy6m9QNRlxHr7iaqlU25SvkbouE=;
 b=E+q9SAf9YRVm7CT0KkEWNq/wM0zAR8yHaezTB9ZRbDn7CghnYo3b5FiMwks1b27qguG0Gn
 cB4Q0+aBlPQY2YYWaWcMYPgqIj+LkkW5IjzDadLLCHdLhGiF+c2G9qMIRp7y9rU13P+Hof
 IPnZubxviyeD7nx7WvVPTcXNCKUNygTK/1p8peGmLOTdsA2a18QnM1OLfVR7jozjc//E15
 lBq/G3Wg2bHpsnYa8DsQDLVbIgPfFnVmfrpL8mLjbq1Ch+TIOvV4uIBjN82N9/Rr16izKo
 x5I98QzSaUpjhLUFyT5pk3gtixoVRCejCk1YbnFVg9PZy9n4vu6RkSqRfi8JNQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 19:05:44 +0100
Subject: [PATCH i-g-t v4 4/5] lib/monitor_edids: Fix missing names in some
 monitor EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-02-monitor-edids-v4-4-aef77d3e0f50@bootlin.com>
References: <20250110-b4-cv3-02-monitor-edids-v4-0-aef77d3e0f50@bootlin.com>
In-Reply-To: <20250110-b4-cv3-02-monitor-edids-v4-0-aef77d3e0f50@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=SWDXl144nVcexa0lFeZpa8Z0P5KqVeEWs8Rmwmg40Rw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngWF6wuDugBHBTyUaJWN1Jaa1NuvJV6TekwfSJ
 xRrKoPVMrmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FhegAKCRAgrS7GWxAs
 4vrnD/9iyEmYlKFqTOjersDyeVwTbIpaYuE/CIiS0Mp5M0oVkAN2C7FGKPC39Gpp5EqFureYH+q
 DOzxyK2f/tltuSrygbfEEjmYBAhXdsjqKyQsW6lnFhQ/NeSSHTAZuwaz0ncpT5H1cPCsWqXHKWY
 Yp4FCugmz2Z+wSb88n3QvqTv0ScetcpKQFAw2WzI3d2ng3qi6tCBRyA93m8xcH0OawpSJtF8BdL
 UWLl/vsZM7sCNbwzvrXAPrWr38R55PN0SBf+qV7qegGbMpz7YXAaYNsvXDLg1QAcBdsGx7ubO/S
 76pjJnKEKrqKPzSzeGU+Chnu5o7aD+Q/B1roB+mYWKys3DyAWVDdImgdIXqcYRPmnxDzYsgMPot
 ww5awwwjPklGGxdBHNLJ7m7BDfJYPo3GR+FUdqZTkHg+czWKlWmZhQ2eBj4LGsb3LrgqI6Hns3Y
 bkWNqwPR0oKDhTtzQGFzq7Vo8tp+SzMOQcf5fU25bpfDB7kDQBM9X/cngV1uVpZEs1+6j/xnkEg
 RBUD0U59akano72WfNVXxFp5ww6S4ruKOenX6YTXPnIgx29S/8ouEqawN9eBijL/MpylhKIDLBN
 Rq+wPCCGLezBv2ICbjv6irr/pDvmFjRi/dwHHGoUfEmEBOACiUZtMLAysazn5FbwMd1o+Tz56jE
 0mHIdrctPtkh9vw==
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

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 3984241775c3d8e0f39732bdc41cb44f491ce62b..26dffb7bfc3a2d196e1303ee94ef2a7947096f1f 100644
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
@@ -430,7 +430,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "60350000003200001c011d8018711c16"
 		  "20582c2500c48e2100009e0000000000"
 		  "0000000000000000000000000000000a" },
-	{ .name = "",
+	{ .name = "GSM_50294_M3704C_HDMI",
 	  .edid = "00ffffffffffff001e6d76c401010101"
 		  "2514010380522e78eaac27a355499b25"
 		  "10474aa1080081807140614045403140"
@@ -482,7 +482,7 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
 		  "5011000a202020202020000000fc0048"
 		  "50205a5232343430770a2020000000ff"
 		  "00434e34333132303836580a2020007f" },
-	{ .name = "",
+	{ .name = "HWP_10582_HP_ZR2440w_HDMI",
 	  .edid = "00ffffffffffff0022f0562901010101"
 		  "0b170103803420782afc81a4554d9d25"
 		  "125054210800d1c081c0814081809500"

-- 
2.47.1

