Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B62CD13D8
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5F510E3C2;
	Mon, 10 Nov 2025 13:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aVLeoDWk";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62CF10E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B71961A19A7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 86034606F5;
 Mon, 10 Nov 2025 13:40:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49B8710371906; Mon, 10 Nov 2025 14:40:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ls71hxRclezvD237yplTg1+q/r07RDHo6itz6b1oRKo=;
 b=aVLeoDWk9NT4nlC75y4RrcOXr0+jOI3h5r/vFC1usVcZF5/2PDVAk29nGpK2zKREbaoL2I
 8FKaWUDHBPnV0+wJd4CJpzbz48TODKidAb+f1heSswpeh28hMTsnrpG1MYFN8N88fZ+LEh
 ktuI37lB6dHgfosLYsS9iKHTVnBmIaDVWPz4+w/GZDt1cuSLlw/aSpLKbrDvADiQec93RC
 SJBR2qMRe0XHNwrtLg+8dRr4mmD4Ig4/wWKXQQELR6zMTadY1RFAY0dBQ6VaAZ/Ttv081y
 7gGrGC5elM/k+pfWdtY/H0uK1UxnJJuL+F1RMDQlAaiOQ3geMBuw5s8MEW3saw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:39 +0000
Subject: [PATCH i-g-t v4 37/46] docs/unigraf: Add unigraf documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-37-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WSbOf2L5bFj7DWr00Q4EdmO8BQAHLBnhiuAjgJZmvuk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesSSUlc1QRyMbMIBmC5lSbF6LLh0JX0tCwJ2
 UrwI36nSTOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEgAKCRAgrS7GWxAs
 4m02D/4vedDkslcONypkuBLa3TNjJtFP21pt8To/DH00Tqu6r5xz+lQY+t01Gy/8RQihXpE43zL
 h34o5beOj0ObbVLNGJASw06pVreHVbYT87jjSoTR2ZwLwu+KU7kx00ILwwvZxQdYy3xC55B+/8W
 RnSlIB34YChNwlOqEBhxpif7W38hnkkMpxlRtXgvUucDnoS4FJ5s+nREtHbQnKoBn/ahNJjDoeq
 j6tM7T/w5dM4Nel91f6HnCFJEdi8yv0lvIWHs7GXqQ69Asc0p2njczSJOQCcsCxsH0MnAopqA/L
 exe1cdYuTtSShWIIdBv/MrwkNjKZiuOTOPXY2sKljO5orKmbfIWvK9TZaCKwk252+/r0G1FpKrf
 lYHGHtw1XzKJ9PRySZATQ4Lcf8PHeo+oPxmYG5rtSTn0nn+ahi4HdJLn1o/RBa7UxU8wSHokq8r
 yd9Ly4f6cOB1Qn9hr9M3TBqo7fb8EJM7M5U6WyMuJyQn5B7wQsVgydoZRNt8uSXU/shh3qDn2u9
 hO4Qtlwc1JjD027vLh8sUIHlkgEk/IopUHuBVousClzi9pJwgsdZIzuuauFq/LrLWOFlwBeqfpw
 u1qDQkiDDc/GQhDJVB4ZgcTFll4sjBa23Bnc6X5kT/oQ7Kl6gYUdAzcCCSLR0OuIi6Upnh6r0yw
 kLVlLgjb2BwAJ4A==
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
2.51.0

