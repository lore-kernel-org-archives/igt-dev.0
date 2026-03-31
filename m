Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A226C10F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E52C10ECEE;
	Tue, 31 Mar 2026 17:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="day7XqdD";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD2210EC48
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id F35BF1A30B4;
 Tue, 31 Mar 2026 17:11:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB5686029D;
 Tue, 31 Mar 2026 17:11:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B415E104503EC; 
 Tue, 31 Mar 2026 19:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977089; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7+xPJylRkxbrBvnv0YsNSkdYobJz2dJGtlTKyLkmXRI=;
 b=day7XqdDXTebUcYvg7wn5IHVJsv21qBVL0mqkrv336vgp1wa66bBu4l7XwCbt4ey7Fb/lz
 LbJutC6/eIILwzzphlqInisI6H6oMjofXhuTJy+syyhm09Dv2U3ms8PkXcjb16FgL44uB/
 emKRwoHHnvVj46U2T2wmZACY5prQfaqqZPKFDikJOqcXvpgXHejOCwXXbKcbQhaBNTrSm7
 EJeVuE0zBbIFXWhn65+tE0rEFI3SCI3NNHPcJ3gt2NA0O5GowMlGhJm2Y0kSa+ctSjjv6c
 jBj+HilWdwkCpfxQJ1i/YJhY5s/IF5/uOJcnRPOBi7UhQXh1EfGOTsmjAMbcbg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:12:03 +0200
Subject: [PATCH i-g-t v10 46/49] docs/unigraf: Add unigraf documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-46-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Xm3FkUka90UsC2uddmVjJjdLuviEC33FaqTaBaebGSY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzABCEx1P8DlzJLbsrfhhY61rFVSxIzuWPghEG
 DpVkSDEc7aJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOILKQ//c8bObVI2SDGfnQRgBed5ikPUpp9e0hg
 EFOzyPRqTy43NwsWk85G5w+p8grI5UOCME178uyaLaf8xV3mLNc3meviURcbnFDNNXPj6+iGnuV
 jK8wYB9sUMCbodhH05+ZI/AsS81RFENlFgRTYkQAPT52L1E+w8Pf4aRdfTMmUToirakfKXenr5N
 /EHscP6+Lx6zxv4BR98fzBRzBxi3OcOmZUAiE/mUuv0fPrNdmS+z3KHCW02SWyqpj4HgV7bI8z4
 zykADJ4Pp0+HwZ7K6s/G+QohhtNTsX1YUJJF0MC0uOJf1FkjhGzhJ+LNTaBZ4R2A+hm4787Fq1m
 rWwmE8H9OQPadO4EWC8byoFE4LoCCE/awuZB/gZqKMqJBIXeKH1S69p/WRosBK3BS2zXx1H9si4
 RAGMjpWnEpGZCpicfRRZzCaSDu2GFECRQNlaXqDQANKoS2LZ5IJ7r+vndpJozMQTFi8arBKBkm7
 E6THRMnek8O2rHcxVxbNEj1R95xKoeZVhyVZb01w+pXohZUfC6jE9RelE4qlf/VCu/SK0IoSIit
 3AuTzutN7DZT3/bmqKY5NcmDME8mfy9HprdXWjOR7XAvEEsovPdX8V5Ue7dPuXISoshAD/1dTeS
 LbK0sM8rihBDjNfluMxsYv1AuCfUYrfWN1RqwVz22VU8f+lx/qQU=
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
index 000000000000..37996a2ef98b
--- /dev/null
+++ b/docs/unigraf.txt
@@ -0,0 +1,81 @@
+Unigraf Support in IGT
+========================
+
+This document provides information and instructions for Unigraf support in IGT.
+
+Introduction
+------------
+
+Unigraf devices are a set of devices that can be used to test all sort of graphical
+interface and signals. See Unigraf website for more information about all the
+capabilities of each devices: https://unigraf.fi
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
+the firmware... please take a look at the official unigraf documentation.
+
+Compiling IGT with Unigraf support
+----------------------------------
+
+Unfortunately, the communication with the device use a proprietary library and the
+underlying protocol is not open. To use the unigraf you need to install the unigraf
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
+        MSTStreams=0
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
+* All igt tests that require a display and use a CRC (kms_plane, kms_cursor_crc, ...)
+* Basic EDID and MST tests
+
+Planned tests:
+* Link training scenarios (link rate, lane count, scrambling, ...)
+* Bandwidth constraint management
+* HDCP content protection
+* Display stream compression

-- 
2.52.0

