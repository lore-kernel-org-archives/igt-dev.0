Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE43C636EE
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 17:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3A510E4AD;
	Wed, 28 Aug 2024 17:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="k2hjocDZ";
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8481110E42D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8536024000A;
 Wed, 28 Aug 2024 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724866025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ez7F8+5uRxZDbRxExu0c416eKC4ILbOtRS3JP9TVoiI=;
 b=k2hjocDZZqq6WP4BlSR3DsvJQoPDev3KlUtnJAdMacZvL8Vj6cUoL9vHEt8FPS4LK+WbN9
 3SCgsLwHpm7L+UkbEeT3K3Fx4CwYh9mUTKvF5Pm1fh0Z62688rz+LOj45l85Qv1g+rPKSJ
 PwWFYZMahqhSWRc3MAi1iIQj0kJcQKXJWsW2Q4XJIykelwEE5DjIBwQ7niHrd93ylejpBr
 2866h9wvDenE1LMpE5xD97NJsue8jF0D8EsPzMEU2qqm/f/T1UQJHkgTI00ohKrcOmRYlo
 eHGzeRlqTg3IdESocFwBsayure2hkoHtUNwuwRvPJHu9gS0gvttN7k6UIiAmiA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Aug 2024 19:26:39 +0200
Subject: [PATCH i-g-t 5/5] lib/monitor_edids: Add new EDID for HDMI 4k
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-b4-cv3-02-monitor-edids-v1-5-29c846bcf251@bootlin.com>
References: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
In-Reply-To: <20240828-b4-cv3-02-monitor-edids-v1-0-29c846bcf251@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=W7JkUSvNMr++kfa+yw5Cacgt13n5GUbPs146+Z6dXo0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmz13kT/ofS3AOFrHkH5hhd+XAJDfYO4c2knZ6K
 XYxvAADm/iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs9d5AAKCRAgrS7GWxAs
 4ofMD/wP1Zeuh1kZz3DLzfgbxylivaR8LkMb2gh/SywXsgF+jt2X9evD0d6CIZGN0+f795HZMhx
 KFshccifonitStNj3foK1K+Gn1ZT0hvFdJxJ7+m9nLy25UUwp8lGfJiN8vzgfOLZyiDL7eaFM1Y
 kxd7UFgm3O2PXgkaB0tBtaeZHxn5xp1pQzw2wn1QIPIJIcxWEz9qk/6WQf5d3O16PlqEtx9jd6f
 v7ZBbluomECQ05+2uxAodMMUx00myvq4LRIT9c9TtX1CVzmlCk2OE2Mg3/YzTZXX4K0DIkttuVA
 yNrbqrVqYYMsbQWUe4ZeHR/DXj7G50YEktNEz4vUkJlNMxzCun93/sxD5NGKOwC0V7HRsxNbtvt
 1ZsUzYhZ8JCbS+C9Z0hkP2B92F1zhzsu7y1TeGG6NEe4tHGkblzjwuWIAB5i+xpc+W/+nRoHJb7
 nA8CTbS77RZvsp6bNkRnfC6iPJTvF5Ycz7IGkuJmSNkYavfh4D5SYJnUzz1Zh0lHKRR9nJeGdSD
 Kw5gTFL1xsI2Y5NsVs/hRh/Wsf9WBj+7bBllnobtfPr/Oe8qIe9Yo4R50uXbLSyK1FkAYoO1oKl
 8fbtBLIMH2T8v+d+nJhf9/kQvCZjyeP/r3mkhhCWZVmaojF43OjjruqQU8vYQYvsiLtshtJBf21
 EfG+02NvfXVlUrw==
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
2.44.2

