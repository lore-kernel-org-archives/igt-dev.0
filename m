Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79729E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 18:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCD210E514;
	Fri, 10 Jan 2025 18:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YA7yCTZR";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A55310E511
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 18:05:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F30BFF80B;
 Fri, 10 Jan 2025 18:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736532352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xUKeNtdnzzgqovG2v67je2kovKicVF9bKXcn49nOy0=;
 b=YA7yCTZRyOGa2txOcoHRoocrp3gS366RtfRDI8GBMfME/hJmQG2YA3kYxde0Wk6Ba/1jfj
 ZD/sUzIMJkxwln+GXvzcQuRWxsM4Syn9K63A56HTmqqIxGwg4qtTtQhBiBMLDkAlIPv1HG
 obYMdZ6iIublJDmcIjVNDrYRKZgr1nFlEcT2OlFl5qSn8s/++NH9UdPjdayIgZKFXpMkM1
 RsrWEJT0CSjXWj17Bz0oCxieDsC5aYYjQHOvCG8jEfb9pB5ehe8tJSc/GuPFrYAnAoY3Si
 XCUYOn/kTaKgTxT4r6yrZGa2IdICHX7f1/jMOrTK27ZVzZzpDUIKsj37vlAbUQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 19:05:45 +0100
Subject: [PATCH i-g-t v4 5/5] lib/monitor_edids: Add new EDID for HDMI 4k
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-02-monitor-edids-v4-5-aef77d3e0f50@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HW8aC5+pMY/wrgNrpss4ptMD6pkcC1bS/ChKw77FoEM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngWF6f2WQxNwhP+DnTpeLurBlGMglm2d7yPE+F
 AnKIsQoJpSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FhegAKCRAgrS7GWxAs
 4qnvD/9sa9tHkyPR7KJ/zaBT/JLyphzghz2CltYZNsTGLZtBdMXUM/DgezLAHizPvwZ+v1W8dFB
 fT+jhhftF4nuSxxWAbX2toL4kMmyWFHASKlxOcOG0Tb6NQAyotiIwBM4/+jz0S8XZHmuITlJP9k
 1wzfDMGlcJX2hbHEs940p8GgzMI+f8PxEp0DqJmpv30rGbi6g/wVaBTVgUWJLms0MFMAwsHB6L9
 COyrMwm6Sv8HGlT/wwDRxIo3pEqX1kM9Twuntq++iDLD3CqvyQzMt0QCLFnmyqeDF7D/2z58KYm
 LzkRw6F+vpDlZmVq3tiXTZ/fN+mJwW5ePy7G2KV559o6cp7iHpk5zBKOmLySmOri+S9cVzZolr3
 5v494cAsVh0atjTt/KoS4mHFiM+XX/s1kNqOIj7IRyfK9oJ8L2R6b/SmJXLviP6BRN1aHxvUV2d
 wVQdZx0pgsUFowre2DcTidsB5JpLBLVYr0KYgRiLlBjUSLTK02I1S0GBlVfCo71wJ1DR27WgQc2
 vQzh4pdjq27Ntb3fvp0ebSjStRMPp+kuAnUhiBV187bHWccJVH5toHX7mklsWrt+pkMqse/ToXV
 023B4LsnhKoSdZNipCAV6mgWiI7HvBCTZtYkOmm2JkteMnQJ1UtkFBzWMN/bjygCmPYyvS4PpJH
 ABFBXljO3/nOBng==
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
index 26dffb7bfc3a2d196e1303ee94ef2a7947096f1f..589a76a8af3f471d5b72c630fe77edaf2fd6658e 100644
--- a/lib/monitor_edids/hdmi_edids.h
+++ b/lib/monitor_edids/hdmi_edids.h
@@ -49,7 +49,23 @@ monitor_edid HDMI_EDIDS_4K[] = {
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
2.47.1

