Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FBFD25B61
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EC710E6E7;
	Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="B+fW6Uts";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FE610E6DE
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DC3094E422F2;
 Wed, 28 Jan 2026 13:15:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B3D216071F;
 Wed, 28 Jan 2026 13:15:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94658119A8812; Wed, 28 Jan 2026 14:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pz8Trs5aby/AXIeZDYzRvSZh8zmpfPPyAIUK7AcT+0U=;
 b=B+fW6UtsRXv91CqO27Trmt5x6ofSy79fytPCgUN6P7NSv9A4qD+xGpjV0x4elKOVqtBSPU
 2RvOjrCEsMXdtWgYa3t/ItfhThOSqs9XsV+9M+mDbEhtkMOfT3YDG1ODumNZhxJqK5JlA/
 2LC8U5tUQTH06izjeld0QmAgFBhEw/p+xEaCTFTrtbGVR+PLIAdcF4sVP2x71HtrgOLztc
 j0GUGfj0nCk8/UDZE4qxEJ838VdamD8/6xwjmlytLVIF/Xa4sJQOyEemJFbuKVp2lZB2dW
 zks8rabsB7PmdMLaBijfXt2u/AEBNHUsRlh2dkTbNATjIdH2LHDcHVmOhLs1pw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:16 +0100
Subject: [PATCH i-g-t v5 45/48] docs/unigraf: Add unigraf documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-45-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vlrPXU7QS89ODF4iEDwzL/ggY+YKVupU3S8LVg38Ir4=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvNeouOqgmRImCFk9j5lJX0Xh2NP6t1SHmbR
 mWjWhX5ZkeJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLzRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLcMRAAl6+skJ8DR9uXxydaOcy78u2bnI1KH6g
 DEpEN7bV1/z1ozxkVXiq2N2XcfdIooMnXbl6te6mDkRg3Yatsf3ZUqdjeLmM9IH/DoBRZILqp/n
 7sKIh2IsePG5qj7Z83nhNaURIF6nzFYroAfXV4912GfPJd7gfcub0erIz8stFLtacppIMAkL06T
 Jpdh0JTdCqWfxtLUY8aUsd58o85s59USJQQCHcYajrmZyG45SeDwdWUPfWCcC9CS16VKCjJeibJ
 5Hs64ietzy3M5XetMovrp76HktYN7WSSRSpYCk4rqFsVVRIYFqKs8xvA0I+K+9wLdBMAFwE+7nA
 w4dzujDcnMr5M1Hn1Rw9rvvdAE/FljLv9pHzCmUMCQyPutOmeUTcFaZNdTg9GbTlzBuxrXcO3O2
 RsAuDS39h8Usb0GACkqxyK6nO5BAFHsuDkv6k4tTh6XK2OZGnzQDME3R7fBNgdns7xRQff6ykLq
 NCLrGfk1r5pgI59lBa1s7Kt9zkXlc7nW291n3YtKb4w0vpN97T+gMgMLEWkcCzfoVhcZbqYEPBP
 T5TWrzf1gx8p8SHKAW+kBHrl5qqzePc1B07XhzjOcmYpNtr3AcIx7/k+s1cDseZf3tj1PJd5ZgJ
 ZApWK7Cl9FisPwB/JbLXKYzJnUGk/ZhrURn0wfshO+PF4E0Lbgjo=
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
index 000000000000..49225a6f4e51
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
+can be found on unigraf website: TODO
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

