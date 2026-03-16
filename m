Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A9FF4644B
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3F510E39E;
	Mon, 16 Mar 2026 10:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="v+64I//x";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B835610E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AB5F51A2E28;
 Mon, 16 Mar 2026 10:24:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 801E95FC4A;
 Mon, 16 Mar 2026 10:24:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7153B10369F4C; Mon, 16 Mar 2026 11:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7+xPJylRkxbrBvnv0YsNSkdYobJz2dJGtlTKyLkmXRI=;
 b=v+64I//xHhMzgzvm//+o3ZuKIfUs1aAx5WMT71J5s5IHTsWCi7LBxqzeKgPihZq8DZVi3j
 7SGvI9DTwi6hKza2UgzELLY440Fx0R2RkH3jJ+mR9uU+rK+5VGIrmxynGwzzlXzCtSPya+
 8XBn7Myyj7LAXdeHaTFmUZEWTqGA3iiPC6vKqjbu/MM6wVhYQkmb51daUfYluFmEBqAF6S
 RlmjxJU+t95GnC+kHqKi4OnNEyL2mBgWZUTFFzxjI/nyQIRqAEEzXagcLiUDnrJIhTOkNG
 L/XCiqtbi6dMjvuUujJAyeV95K0wCGAt+q3R03DFxx9NCkls+S7faeFdEaPAhA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:54 +0100
Subject: [PATCH i-g-t v8 46/49] docs/unigraf: Add unigraf documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-46-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Xm3FkUka90UsC2uddmVjJjdLuviEC33FaqTaBaebGSY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pUq061XroQGIBjTcBO2mhFhv9Fr114lfB8b
 uTfLh1bQdyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKGYA//XalDbCTCYubgpLQKSBGCByOOnxIWm/n
 v2sQQw0t/2qGXL1CT5NUOJPJhyh+t7dvMyNNBkClXnp4YtLZjRU4smJDb9DGHGI//rpiUjAhHWR
 ecql074WLZNQ0JnrmdjGOJurvTmxtSEn+temLaKyOu8W0iDzgedoD8NmhbGsi0XTGCLH9wjxYfn
 a01x3tlYIeW7OuRpqXTP0Pq5Wh0/6p5qmcRtcAiiECdO7XfEK6INA/FnYYExWRKNpkLOJeBWP0b
 XH2PeWioCjAadsDS1//AmfR/OJBvqsPxmNF5B9qg76/rz5bgqyktVTkK2g4GI9mFKeRSSGRTUux
 tOCL+pELDJkN9u/sy+IVpQJrhzX06oGgKw8SO+FR+58sudxTh8WyRdK8M96VR7fquLyeCTxuyvr
 GM+apY76GWzKGUmX5slMgIxM9VS0ZhZx9Ilm3nyElzw2+ti+iVpGjNUJiYvPQs0rZmEKR5zh+m2
 AJsv6IhdDpm5AqJ9pIY9LEmRnz2I1oihtnaJ4itGc3a+7p16R/JF8Jnzmm5BtKmTHHd3ZZBrcVp
 zuI3rkikXLzetGMeELiG4felQ8YJ6K29iGA8ed66in8qX3FTBfoioq00g+8e7EtpTY3V9OL/jtP
 Co8fqQTxqODsl74G54+91fUV0V/B57EuBmfVCPm1wfXxLj+ID4cI=
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

