Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EBACA0EEB
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B9E10E191;
	Sat, 23 Aug 2025 02:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WjKWZ7dy";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33AF10E18D
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5CA291A0DAB;
 Sat, 23 Aug 2025 02:12:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 38902606A7;
 Sat, 23 Aug 2025 02:12:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7A5D1C22D089; 
 Sat, 23 Aug 2025 04:12:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=921Mhv25PrmYdhbgf3jnZazlC46uZKMoN7TRBs3oc/8=;
 b=WjKWZ7dyk3UhAZ5Y0e18eVOhhLUAvK4Of6QjCrs5nLisvsbMB21SM/ytVkgWVaMs1DZtYK
 UVPzXLvi+Q77TufEGKa8m/wQaqxpuD1//6J3xDikFq5cC3nrpDqxIh0tc1sDXHuz+W64g8
 ff3tIjOtSkSSVMgBmqRMHbXFdAvhSU0tektbp5oyZHptawylDFystDOHNBrgmIR7r2B1Fn
 wa4OsWSZN34zeB2Vyrv9JBBxKk4EtcczTWJwzcI/nJl9HOzIEGlGR1APdqs/XDc+EBGx8C
 l7eJxdmNn9H88GLqoELYNasoPS6M8+iQnPxMJqg4d9sxr/BAGd52fwxg5Fx+mQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:49 +0200
Subject: [PATCH i-g-t v3 29/29] docs/unigraf: Add unigraf documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-29-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=hBsix+otEA0OMvs9bjXTx6jEWE5HZNw9zdUAkqMnQjI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNYKfiLbfRF8cFHH6ihhI/KAxop1BfOwqcAC
 c3cTakj8bCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjWAAKCRAgrS7GWxAs
 4qwIEADFBN2w9mskBiEFbc3nHpc7zlqqu4ZX8kpPcDfWKqQlweR4sJPB6dr9ta2GKfxhsWNhTL2
 NhuYNypm23NkR0DfqiDXcADxUvX95tLSTfctpQ7y5AXA7MOXDcYqh1Wy7xuKyiBC5LDnypJdl7U
 OgpH713jLKJmSK8bVFd9on/a4dTZSWLLUs3IsQT4bl43p6JH0fZeFl+Mxbz3fvWzVV6udILRTmT
 nBXI3ersuVa7vUtlxoHrFnAccmI/lIiB5WsN1qa53ap1TFvepV5R3QxtImqfyd5gilJYZg9++Rv
 UGIzp+BOOVU+Hn7WHBJldJDN9SqnZU43jTHfNhLBvz5hYMv/lscQ5UW5/wEwiGOu6Ty6/Fj0NBr
 yIF8GtMcHZXMib6l89MOTZx3vd91hxc+CFa+BXXAV2XK1mi/fr9lEoh3UgSsYSPBz7JYqLGryLP
 djdFfzvHZLPlESOdZJLZ8/ZJgCEWqwaIDgbipWKug3CMDhOA5B4kll3V2ZoLsURNfSFL9UN+Ebe
 Vi2itk4rTBkVN/5qS5mYW2oMjd7H1RbZ9dCpIc7+LCB0Bf9o52Nz7KtL8bPPIqRX2UHtnpzLqcp
 fsMmtqAowfXewfjr9XpdwwAOMxRJNhOhJZN0/vvnP6+yx08gDGIWfhvkTuzIxWHMIZfNwK8EuAJ
 OL3v1kupV2HlrLA==
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
index 0000000000000000000000000000000000000000..49225a6f4e5190825e62a30e74df184ba6dcb0f5
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
2.50.1

