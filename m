Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D94EA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5206010E35F;
	Mon, 23 Feb 2026 12:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="V9aH1gsZ";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919F710E38A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 81A14C143C6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 66D985FD43;
 Mon, 23 Feb 2026 12:09:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8244410368F8E; Mon, 23 Feb 2026 13:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Q0NnLZmotD2/sCoNHFLjCUzcRZyZjWsGtT2ELJsb7+M=;
 b=V9aH1gsZe/XNjNwJcxdNDpyaEg9XOBD5N8mpS/W/i2W3WUGTU8s1nAN6Q4Xghsny1zHJWc
 dR1X0TFl9mc7eV1WUXeYpcDqRutvcDDJgCHopYAi20RnDaGnajkW2c3a9Rjb6U6Z9zABwU
 63MndYrd4uJmAV4TkUkXeyo9Q8AwG5Ykzwl5hLkh8W9CbexG7ry09OKlssbBJzHyDfrfOq
 3LUuslB+zYJhGxYvKpTLCRnMhC4vblzy6P7D/bAUvrfpwc/reBZ3PsWJUnKrJb76yEpups
 i18AUjZvdbmUt70lCi/xdaRbqEIVTvLk/bQpA9JzSGbv6M7Tt60QdGlxZjUddw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:52 +0100
Subject: [PATCH i-g-t v7 45/48] docs/unigraf: Add unigraf documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-45-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3663;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3MoGbib6M/vjbZn42lzsjTZxhno9ZfmBzA+wzmP4sdY=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGmcQ2zIMjWCixtRua2sGDc9FoVbXcW8X2teLbMDNlGMEOkX6
 YkCTwQAAQgAORYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJpnENsGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjExLDIsMgAKCRAgrS7GWxAs4uF6EAC0JHW+b/bQzzqzecPV7XtiybnnhBog1BvPk+Irj+t
 7hJOvSr3CSkZ6OzQ0jpoNC/n8Ka+QjqtBSTf+64bpvLLj5EKUuvfVhTUXCqls2kxFtbL8ebGmPK
 /S5cwXUljV5zJrxwvbtfB2sA6lQLFmnfk6ycb2CRSoxm9HPny1/R766CUv3smCGPiM7+hY1+Qr2
 MmskpNg4NFPj5W6L12WRgSnHzygLRk25Npy7wvSucKTeq3Cwu6Cj3Nn9G2senypgTG62ILu4TVw
 KPYjmWyeEOkCkMnI37zV13ls1tvfDxTjDsqsF52K6jkH012seNS7NqZZ0A4hk0JIRDl98ku2SGN
 KkglGABFjHOBvhUK+Eroo7jD5y3ss3eyBXbXaZmWKLIOSPbRklBqe9uF2f/upEnDyVrD4l1t1P0
 QJWks8YJsvxcu+2/UoaTIXBftO4n7Pa5X2NFP8Is7SI7fMBIAxWPiHHza7VSGNnkE+qv3gTSBAN
 yCvteYvORxw3ND1hTFKXIA/8h1twjBqqLlCM8jiZl9CnotYIgsWKJXzMfaVGxJABVWA+mNWQXdY
 MbJcGBkXjf6yTEMhLLEnVq8AwUb1uOYLYfzy+EqYU8m5pQKFO79H4k4z+8K2ZpzgJJTaX5eZvO7
 X0PzI+KBLiP5hs9qCFC9MXo2w7O8NWVzTqQrjVea7ig==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

Add unigraf documentation to explain how to compile and use it with IGT.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 docs/unigraf.txt | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/docs/unigraf.txt b/docs/unigraf.txt
new file mode 100644
index 000000000000..f8e56868b01a
--- /dev/null
+++ b/docs/unigraf.txt
@@ -0,0 +1,81 @@
+Unigraf Support in IGT
+========================
+
+This document provides information, instructions and for Unigraf support in IGT.
+
+Introduction
+------------
+
+Unigraf devices are a set of devices that can be used to test all sort of graphical
+interface and signals. See Unigraf website for more information about all the
+capabilities of earch devices: https://unigraf.fi
+
+Unigraf documentation
+---------------------
+
+All the documentation for libTSI, the library used to communicate with the unigraf,
+can be found on unigraf website: https://www.unigraf.fi/downloads/
+
+Setting up Unigraf
+------------------
+
+For most of the unigraf devices, this should be as simple as "plugging the
+unigraf and plug the video cable". If you need to install some license, upgrade
+the firmawre... please take a look at the official unigraf documentation.
+
+Compiling IGT with Unigraf support
+----------------------------------
+
+Unfortunatly, the communication with the device use a proprietary library and the
+underlaying protocol is not open. To use the unigraf you need to install the unigraf
+SDK, grab the libTSI.so and make it available on the build machine and the DUT.
+
+Deploying the Unigraf with IGT
+------------------------------
+
+Unigraf may work out of the box: by default if IGT find a unigraf device, it will
+try to connect and configure it to use USB-C input. This allows running most of
+the existing tests without an actual screens.
+
+Here is a complete example configuration:
+
+        [Unigraf]
+        # Choose a device using his name, you can find it in UCDConsole (installed with the SDK)
+        Device=UCD-500 [2434C620]
+        # Choose a role for the device, you can find it UCDConsole
+        Role=USB-C, DP Alt Mode Source and Sink
+        # Choose active input for the device
+        Input=DP RX
+        # Set the connector name used by the unigraf device. If not set, IGT will try to
+        # autodetect which connector is used.
+        Connector=DP-2
+        # Set the EDID used by Unigraf
+        EDID=DEL_16543_DELL_P2314T_DP
+        # Enable or disable the use of Unigraf's CRCs instead of the CRTC CRCs
+        UseCRC=1
+        # Set the number of emulated MST streams (0 = Single Stream Transport, >=1 = MST)
+        MSTStreams=0'
+
+Current Support in IGT
+----------------------
+
+Support for the Unigraf devices in IGT is found in the following places:
+* lib/unigraf/unigraf.[ch] -> IGT API
+* lib/unigraf/TSI.h -> Header for libTSI.so, not provided by Unigraf
+* lib/unigraf/TSI_types.h -> Header containing all the relevant values from unigraf SDK. The unigraf SDK can't be used directly because it is only compatible with windows and c++.
+
+Current unigraf.c features are:
+* Plug, unplug, hotplug pulse
+* EDID management
+* MST/SST stream management
+* CRC calculation
+
+Current testing are:
+* All igt tests that require a display and use a CRC (kms_plane, )
+* Basic EDID and MST tests
+
+Planned tests:
+* Link training scenarios (link rate, lane count, scrambling, ...)
+* Bandwidth constraint management
+* HDCP content protection
+* Display stream compression

-- 
2.52.0

