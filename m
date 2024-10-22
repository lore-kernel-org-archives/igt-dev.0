Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92127D2C54A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDF510E683;
	Tue, 22 Oct 2024 12:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NaB0jwTZ";
	dkim-atps=neutral
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF8410E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:53:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 972366000F;
 Tue, 22 Oct 2024 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729601608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9vSvfZ2iLxhwthTF4wz1Z81e/TC5UlVKuyscLqvKhc=;
 b=NaB0jwTZyfx+DsEz20CV2Uwezm1T9ZFb5cVhy6yEAW7OBdNkTVm7l1mimj291cm2FrG3qx
 pl1NGuJZ8K8FHFAcieOqyyF+hBLUN+tiNJiuvddJMg6r7e9MjHIB4NmWSEgBpW1+jqe+FA
 PC/nXQokmgHtLo6Be080bM5bIyCF4BXDDHpY8EmFBw7n69h0yVgELXMhBWUZ/wstowXahe
 mWuvbo/dTF580rkVbTe4hOpoYY5ZPKfBu3xTyv8T4+9mVUocw0gH0uTYiEcBDMNdjmrnPV
 7zxBcgnis0PSwZkHgmpnnFM9icIKxJWvuI/6hfrLdXk4d+0FZee40OIKtED8uA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 14:53:14 +0200
Subject: [PATCH i-g-t v2 5/5] lib/monitor_edids: Add new EDID for HDMI 4k
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-02-monitor-edids-v2-5-7634786c21e6@bootlin.com>
References: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
In-Reply-To: <20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=yiECqOknxjsiKb2aESluLt2yPV75shzJgVTtLNi+tC8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF6BCmVTig4eOsCO4+MKg8Fkl6uuLgtYy6cQJn
 8lxgpDSzuqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxegQgAKCRAgrS7GWxAs
 4ou5D/9Uw2j8VSnOy5b6LXVQp/bHUkLuWyczcQ92UHilo/nX2pk/ZEP4+DHdwR6fdphXNhZxWPM
 Hu+Vz6gVC3uL3Vms8ZLrubxb2AD0EoiELtNMDMzZmHv1IQpwp/iCL3FCt/ly48+qVJWN5RIpH+H
 Y622pZBoiASgI0neWQ28YA9IOcsYiKEd36kVxUVea7gLzytLFU58iBjeVUgJU2LJg78IEEtg6DC
 U/TlBkoU8423GDLNEjjdo2Hl6uk1hUsy20XsexOmL8EkvqKqS/G1Dfeze275z760hnnTaWm3ugn
 +/w5/DqYofkWVp2KVJdsLqWK5Wwr+PJBkInVWasToy7u4K4K4LBz7I1c1dtdB1vzan4DBFor77b
 c5aDs5A31seYkbDXUF9yO47YMgRg1jmF49jbXVudbv5aFgwWCOVldea9FNWOW/d6Qmn7VjbRxAV
 P2a2MtRJrVWwHdLHUWFPbuOIh9c94dszNIycGr6kAo1Aj2RHoklJOT8y3moESagew1VoaLcDS4B
 wPT4m6K1TZ92v9o5j0HSXlw8AQV+v7rEqmdLdtdNF3QDedDznDpzX62rknMyUWpidi4NcxQxeR8
 C1w9nBv8/iKFf7b1oT5Qux3e6m2HxLW3C1wIxZGrAf/8hVObpcIS+SAibxkYfGECstIxK8RkJie
 8X13dmWlfmNJNOA==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/monitor_edids/hdmi_edids.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
index 8bcd1f31b458..cc6820d96231 100644
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
2.46.2

