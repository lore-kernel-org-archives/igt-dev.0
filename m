Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11794C41513
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B6010E5C0;
	Tue,  9 Jul 2024 15:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dpem74Pb";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44F610E5C0
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1812F20011;
 Tue,  9 Jul 2024 15:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXJKZ5+cpLwuUC7xNqLYfjYSEHw0OEracmPrQV0T86A=;
 b=dpem74PbCtqQuNP0M0B6NORD7tBu7w+c4HuUwUEEfI5O9vHeKi/JcExFWM3tCjT4qUOUUc
 SuAwb29X1nPL0e6a0DgByu8Fg4JlrTfSl37LZuQ3qs3ZcaSpMhH+9ZsJtGxqo1fvU8KfNo
 P5keQN0Y23sCw1CLnJ2ZrEiUipLDhy6mnHBQ5ULxXxAu18u7fTdUtzQkaymadTLQYbF8ib
 8K0yVmhCdt8mJ04vUIAvjQqS4p8LBLvXy022wTKPN3AH95MfA1TwHmghljEw9unBK16d6C
 y2J7Brcg0H7nOrNfYhy2wBbp1W6smdqqxMAwGRR5mdixlDdYc125REecCylacQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:55 +0200
Subject: [PATCH i-g-t v2 39/39] docs: Add Chamelium v3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-39-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5884;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/Y70a23YsNO7vCVeJubTMJXCRrdRy2fwH2hwHJxOSL0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjVibMp4EKXE4K6qsJBowULIkdWJ4rkrkXTkok
 KPzXoqzUpyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmwAKCRAgrS7GWxAs
 4gXAEACVQM6pyu1MnP10SvStUSTTaSiVbFENNqM0QoRRXK3R6TlUdTTu8kqLS5Akdt7dvPErE3Y
 ArUUFd8bU1cV28Sk9skhEYfZMx97SUQ0Z+6ybk+9pTx7GrutskiSOlWILLWY2xaAIHEexl7AuLd
 SnTNm/X1TFtwfsNlQAL0pZmjuY2J3+jdAy+LkqW22W52hckwrDxNorTQVJeAQrNoTS7ev0Sg5hB
 yy/KiU5QsnA6cXUwGDueUJdVcV7PYva23Omlf6jQn8HjKXAcfkmHgcAol8+cI2dcLAWEaOnkYDZ
 2lmC+pavFNAH0DXM21Lx3JvxbvJOudsilH1r7942xTAOjRjqHVmJjSstVhj08nRqnTW1RWj+Jw9
 MqfFqvzvW7/84Cp1lt+3QPZEAuunKEJ60KM8i53IsRb9o5hDvrjYbILVdTowqZRXu2eEOR9CB0W
 +iSresSLO8bEfXJvLWa4+vIbpNFtQoR1OILmn/keR3x0dksEWxpgm/NJtMVu5C2TH57QiwvV820
 bePg1WljNaVJ0Ol8P/hrNfS8BtA/F1/wXqkxuEStE0mYUvDAQwVHziA2NpSokJ3eEVAFK8u5Rok
 5GLVepL05LRv2tMpjH6pFGVfPFr0yCogp7KC2XawURTJuq+sXn+V6OO+X3kcV0SGI+l7ppppFfm
 +Aqw9ECylScy5fQ==
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

Add documentation around the Chamelium v3, its new features and its
capabilities.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 docs/chamelium.txt | 90 +++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 83 insertions(+), 7 deletions(-)

diff --git a/docs/chamelium.txt b/docs/chamelium.txt
index 64f851c2841c..3179b39dc155 100644
--- a/docs/chamelium.txt
+++ b/docs/chamelium.txt
@@ -19,7 +19,10 @@ part of the ChromeOS effort under the name Chameleon and was later made external
 as part of the ChromiumOS effort, under the name Chamelium.
 
 A new Chamelium V3 (Cv3) was released in 2022, which is built with different
-hardware while maintaining software backwards compatibility with v2.
+hardware, using almost the same API with chamelium v2. Some features are not
+present in the chamelium v3: plug all ports at the same time, take a screen
+capture of a small part of the screen, audio recording... The main goal of the
+Cv3 is to bring MST support.
 
 Chamelium V2
 ------------
@@ -41,7 +44,7 @@ While the FPGA is used for logic control, the CPU runs daemons that allow the
 board to be controlled over the network via a XMLRPC interface.
 
 [Current limitation] Cv3 hardware uses an ITE chip which allows only 1 port to
-be plugged in a time. This limitation will be fixed in the upcoming iteration. 
+be plugged in a time. This limitation will be fixed in the upcoming iteration.
 
 Chamelium V2 Documentation
 --------------------------
@@ -50,6 +53,12 @@ Documentation about the Chamelium is made available by Google through the
 ChromiumOS projet wiki:
 https://www.chromium.org/chromium-os/developer-library/guides/hardware-schematics/chamelium/
 
+Chamelium V2 Documentation
+--------------------------
+
+Documentation about the Cv3 is made available by Google directly in the git
+repository: https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/chameleon/v3/doc/
+
 Setting up Chamelium V2
 -----------------------
 
@@ -76,6 +85,16 @@ and then configure eth0 like so:
 This document supposes that target PC's network IP has "192.168.1.1/24" and
 the Chamelium's network IP has "192.168.1.2/24".
 
+Setting up Chamelium V3
+-----------------------
+
+To setup the chamelium software, you can refer to the chamelium documentation:
+https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/chameleon/v3/doc/first_boot.md
+
+Once setup you can define a static IP address with network manager (a nice TUI
+is installed: `nmtui`) or use DHCP to set a stable one. It is required as the IGT
+tests will need to communicate with the chamelium.
+
 Deploying the Chamelium With IGT
 --------------------------------
 
@@ -115,6 +134,16 @@ example (only Chamelium.URL is mandatory):
     # The URL used for connecting to the Chamelium's RPC server
     URL=http://192.168.1.2:9992
 
+
+By default, the IGT tests will perform autodiscovery. As it can take some time, you can
+manually define a static configuration. This configuration will be trusted by the test
+and no autodetection will be performed, so if the physical connexion is not exactly
+the same the tests will fail.
+
+As the Cv3 brings support for MST, two different configuration format are used.
+
+For chamelium v2:
+
     # The rest of the sections are used for defining connector mappings. This
     # is optional if the same connector type (ex. DP-DP) is used on both sides,
     # the mappings will be discovered automatically.
@@ -142,6 +171,38 @@ example (only Chamelium.URL is mandatory):
     [Chamelium:VGA-1]
     ChameliumPortID=4
 
+For chamelium v3:
+
+    # For physical ports
+    [Chameliumv3:<port_id>]
+    PortName=<drm connector name>
+
+    # For MST parent ports
+    [Chameliumv3:<port_id>]
+    MstPath=<mst path of this port>
+
+    # For MST children ports
+    [Chameliumv3:<port_id>]
+    MstPath=<mst path of this port>
+    ChameliumParentID=<parent id on the chamelium side>
+
+To generate the Cv3 configuration, you can use this minimal file, the
+first chamelium test will perform an autodetection and save the result in igtrc:
+
+    [Chamelium]
+    # The URL used for connecting to the Chamelium's RPC server
+    URL=http://192.168.1.2:9992
+    ChameliumAutodetectSave=1
+
+As the chamelium is also used for emulating display, it can be useful to plug some ports during "normal" testings. To do
+so, you have to use the options ConnectOnAnyTest and, if needed, EDID. This does not work yet for MST.
+
+    [Chameliumv3:<port_id>]
+    PortName=<drm connector name>
+    ConnectOnAnyTest=true
+    EDID=<EDID name you want to plug, leave empty to get the list of supported EDID>
+
+
 Chamelium V2 Port IDs
 ---------------------
 defined at: https://chromium.googlesource.com/chromiumos/platform/chameleon/+/master/chameleond/utils/ids.py
@@ -150,12 +211,27 @@ DP2 (located next to the VGA connector) = 2
 HDMI = 3
 VGA = 4
 
-Cv3 Port IDs
+Chamelium V3 Port IDs
 ---------------------
-DP1 (top left) = 0
-DP2 (top right) = 1
-HDMI1 (bottom left) = 2
-HDMI2 (bottom right) = 3
+
+Four ports are available with the Cv3: 2 DP and 2 HDMI. With MST, 4 more virtual ports
+are available. Obviously, as the same physical port is connected to different hardware
+emulation, you can't plug all the chamelium ports at the same time.
+
+
+DP1, at the top left, can be used as:
+- Physical DP, port_id = 0
+- Emulated DP, port_id = 4
+
+DP2, at the top right can be used as:
+- Physical DP, port_id = 1
+- MST DP, port_id = 5, and its children 6, 7, 8
+
+HDMI1 (bottom left):
+- Physical HDMI, port_id = 2
+
+HDMI2 (bottom right):
+- Physical HDMI, port_id = 3
 
 Running the Chamelium With IGT
 ------------------------------

-- 
2.44.2

