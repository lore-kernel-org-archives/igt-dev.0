Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7DAE6916C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4F710EBF1;
	Fri, 22 Nov 2024 15:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oH93Y5rR";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A9F10EBEA
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:51:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC51A2000F;
 Fri, 22 Nov 2024 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732290705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66QzY99VcWis0H80NAMjVA2SlYhMSybYV4TiIPO50iI=;
 b=oH93Y5rRvla/11hvv2QbFOpW2fSOBgnCRmSG8fyiHIUqj4psm494lGM46slh9M3S2Kk3eG
 bfDbQxNdZqR6pEKK6qY/hCzemi9A6TCX6DEka+08OtLT7Ux8ENJFflGRPgiOP/Py13VQC+
 2QwuMFLiL2NhI33flZS4uoG8rQBNh7gxXQlhrsYQ3Ox3j3bCcvEJY87VANl6p6eblNQRNM
 1JfNPvFrA5aYjLjjd8KKj2Xf8qOy/BlrgKJFcfDnaYDIQTbgWnCmwrFwKhGQTth2rdXTNG
 2vmWQbeAPL9Riw+4iQ0N7LkBYBAHGw/b/lvFe+Hv/D8Ccvlb4JA7pQARYTVNbg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:51:38 +0100
Subject: [PATCH i-g-t v3 5/5] lib/monitor_edids: Add new EDID for HDMI 4k
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-02-monitor-edids-v3-5-1798f58167ef@bootlin.com>
References: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
In-Reply-To: <20241122-b4-cv3-02-monitor-edids-v3-0-1798f58167ef@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pmj4DT9Gp+9bblPBBXLEmlH4gRnqAnV2LOEhOlitZh8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKiK3vYz5Tr4H3+mq+tfX+W8R4MXvu+KtdLPf
 zRYpxBMlVyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CoigAKCRAgrS7GWxAs
 4twtEACPOGpE9bWf1MnUeKHIPHlUfVhiGLP4/OQ0O9CngdKFTph8q9jWwNpEc6vdaIg34KCVlCR
 8PhRhAGlfgFVCdXZseH61NtFfG6VpfXUQDWZunPVUYK3LEuyMOdmd8lyLjQ/d6p0U8lQu+QwJaq
 SKOKgY5nI9QbdKMiQ5orV0EoYHO+cGaBpJaLgnq1pxyeg7ivImecN4hHn+fBnacGs4gQnF38HMx
 /STza+jpuQXR3hhhvr/LQPEkaHH4tdQOS87EmSt84FgP0rZvWTm6+5R28HcdQWz+s/VLRPddut2
 9Nn+nohxzPRNU4ZXYXkD7in7NvAZYxhYAHcX1l6QnJifFyhX6u/nsz46l0ajcXQ4cOD4SPkHngc
 Q86XeD18ShGdxhiFl9BXMhacfTO2p06QeXyu6iowIBngalwDr3ezwleGar0oY82UahWOAxBWdIv
 XNVSmF44+eOg0vfLV7YgIgNl7KLp6RV+oczF3N64cvsPMyltC3uYqqJw/JlVK9JX/CbY88k2/Nl
 pUAsOfnFT0q2GQ/pBWX12kBunPpJDnnKXy/q65wcYPqzob+/W4AQOROP7LqFBm0YS2ufU/Cy7Hf
 KDorKx7R/7iPrpk1PufFj3tUYTdMjuGQ2+6joLrQd9s6ClZePAj3ZLbkKupFQZ7pqrfDWCQRu+V
 uQLEOyClSg422Kg==
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

Add EDID for the HDMI screen LG HDR 4K.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 3ff331e9f7c2a48858359ca41f4aec1f7ec8204d..3f5c38982886297cc768cb99ce26d6e0f883520a 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -50,7 +50,23 @@ monitor_edid HDMI_EDIDS_4K[] = {
 		  "5E00A0A0A0295030203500C48F210000"
 		  "1EEF5100A0F070198030203500C48F21"
 		  "00001E000000000000000000000000A8" },
-
+	{ .name = "4K_GSM_LG_HDR_4K_HDMI",
+	  .edid = "00ffffffffffff001e6d4f77c75f1500"
+		  "0521010380462878ea7ba1ae4f44a926"
+		  "0c5054210800d1c06140454001010101"
+		  "010101010101a0cb0046f0703e802010"
+		  "3500b9882100001a000000fd00283c1e"
+		  "873c000a202020202020000000fc004c"
+		  "472048445220344b0a202020000000ff"
+		  "003330354d414e4a43335a37350a01e4"
+		  "0203427223090707830100004d010304"
+		  "10121f202261605f5e5d6d030c001000"
+		  "b83c20006001020367d85dc401788003"
+		  "e30f0003e2006ae305c000e606050159"
+		  "5952a36600a0f0701f8030203500b988"
+		  "2100001a565e00a0a0a0295030203500"
+		  "b9882100001a023a801871382d40582c"
+		  "4500b9882100001a00000000000000af" },
 };
 
 monitor_edid HDMI_EDIDS_NON_4K[] = {

-- 
2.47.0

