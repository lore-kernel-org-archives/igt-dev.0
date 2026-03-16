Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F87F53D71
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C2810E3AB;
	Mon, 16 Mar 2026 16:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Tna4yuoT";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280D410E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1C3B41A2CD4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E5C8A6004F;
 Mon, 16 Mar 2026 16:23:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B2C48103721FE; Mon, 16 Mar 2026 17:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pWDDNEC1B1pZQ4XGJi3+HaFiG2zwP3mP553qujq9XQw=;
 b=Tna4yuoTUyhJzrIqkKTtEvl4tubG3pn0eF9bnKrYR2UXseJzBxZz763pXPeUKPIkaswfhD
 I6ONemBBnLb4xitcJ0dMBrMuuVgV998c96Z+gwoA2PGxESEXyvjHCTE+eI2xSuYQW/zIOt
 e7uXs9VckOS4IBXRzjgJM/DUhp9fWffxDbbHLFD6E+oyczfCr8TWKTce6NvSO9ZAt3yQLv
 o4bsYRDkTJ1OKwOEw+5zYae9qBqpLBgblQgSoB1vxPcDZiENK+0QlM2aXN+1NqBHA9bFj2
 B+i7nDg0J36Wi0G1PAT3eaz0iHRmp11ucYHbE7dCBVPrQDFdRMPtxdteO/P3zA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:45 +0100
Subject: [PATCH i-g-t v9 24/49] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-24-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3849;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PuZ5jaVEVr/Bp+bJyvKaor0GVH1ubk46WCnykASlVqQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6M7qMDG4CiiNNBkXdHmmFP4Qv0dyhUOpr3J
 xLWMw2FPwCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKhAA/9GoC4r4wHfonseOJRafvMcOdd5doBlDB
 qkkY/QrAP6F5vQsM2PVn+eZH5JNX6szpqHCzgXvBGdRicSajo4ROO1ITbuMNttv/hYRXhewRIsq
 JdLu2QkpTdGEo5T1IpngMMPVf+iQvhu8iuLjotB6G7OB1ofhtDflmTl6ypvrPa0kVRaPPP7ifna
 vy/xNSenGKoQ+q7pOU2VZX3yQw61n7gP4zF3vCIvuNJUMt2ytB/BEiQDE8GgyS4Dm0RIbieZmqh
 FvvPWuDM2Z7oFNoUSCdCO8LVizKNY75NuMQ1lVfWOxCeozaUBwoIoPJeUVrXykSLc8jsm3R2qGp
 JwKvxSlr0m5cP5TN6X0BkfTM/6T33DUOMylw1iQcj4cXAkDJqaeT4aC+EsX90Hc45YoCU03i/zR
 qaLZdoPPFfxpsIxNqgJRIOxPX+r3npGEwfdPiMMhDkTpHhrtO2FwzDXV747wFOXrJQqmeXcsqQd
 eucmUOJST4U02hvq2rwuViPzJ1O/Rg27dIF1tuTxZbJ6wIDz6KZ/A4A/iuvXeO7hhdgOdrgwsXi
 zkNIKDBlNnKoVmTjRBDhhTxFGM5bDWx6Q3P1Wl02uG2DV207pwx0pWM8UCeqbsVSYT/7EwtdsKg
 o1VFztUwm4C/aFTOgijfQwJzy8MRo0d/1xACIPYEYBqAsOPKYE40=
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

As multiple input can be present on unigraf devices, add a configuration
field to select the proper input. By default it will take the first
available.

The configuration can look like:

[Unigraf]
Device=UCD-500 [2434C620]
Role=DisplayPort Source and Sink
Input=DP RX

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index cf760357c6be..43179d5fb600 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -41,11 +41,21 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_DEVICE_ROLE "Role"
 
+/**
+ * UNIGRAF_CONFIG_INPUT_NAME - Key of the input name in the configuration file
+ */
+#define UNIGRAF_CONFIG_INPUT_NAME "Input"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
 #define UNIGRAF_DEFAULT_ROLE_NAME "USB-C, DP Alt Mode Source and Sink"
 
+/**
+ * UNIGRAF_DEFAULT_INPUT_NAME - Default input name to search on the unigraf device
+ */
+#define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
+
 static void unigraf_close_device(void)
 {
 	if (!unigraf_device)
@@ -124,6 +134,22 @@ static int unigraf_find_role(const char *request)
 	return -ENODEV;
 }
 
+static int unigraf_find_input(const char *request)
+{
+	int role_count = unigraf_assert(TSIX_VIN_GetInputCount(unigraf_device));
+
+	for (int i = 0; i < role_count; i++) {
+		char input_name[UNIGRAF_NAME_MAX] = "";
+
+		unigraf_assert(TSIX_VIN_GetInputName(unigraf_device, i,
+						     input_name, UNIGRAF_NAME_MAX));
+		unigraf_debug("Input %d: %s\n", i, input_name);
+		if (!strncmp(input_name, request, UNIGRAF_NAME_MAX))
+			return i;
+	}
+	return -ENODEV;
+}
+
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -138,10 +164,11 @@ bool unigraf_open_device(int drm_fd)
 	GError *cfg_error = NULL;
 	char *cfg_device = NULL;
 	char *cfg_role = NULL;
+	char *cfg_input = NULL;
 	int device_count;
 	int chosen_device = 0;
 	int chosen_role;
-	int chosen_input = 0;
+	int chosen_input;
 
 	assert(igt_can_fail());
 
@@ -165,6 +192,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No device role configured.\n");
 			cfg_role = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_input = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						  UNIGRAF_CONFIG_INPUT_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No input name configured.\n");
+			cfg_input = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -207,6 +242,25 @@ bool unigraf_open_device(int drm_fd)
 	}
 
 	unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
+
+	if (!cfg_input) {
+		unigraf_debug("No input configured, trying " UNIGRAF_DEFAULT_INPUT_NAME "\n");
+		chosen_input = unigraf_find_input(UNIGRAF_DEFAULT_INPUT_NAME);
+		if (chosen_input < 0) {
+			char input_name[UNIGRAF_NAME_MAX];
+
+			chosen_input = 0;
+			unigraf_assert(TSIX_VIN_GetInputName(unigraf_device, chosen_input,
+							     input_name, UNIGRAF_NAME_MAX));
+			unigraf_debug("Input " UNIGRAF_DEFAULT_INPUT_NAME " not found, using input 0 (%s).\n",
+				      input_name);
+		}
+	} else  {
+		chosen_input = unigraf_find_input(cfg_input);
+		igt_assert_f(chosen_input >= 0, "TSI:%p: Input %s not found.",
+			     unigraf_device, cfg_input);
+	}
+
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 

-- 
2.52.0

