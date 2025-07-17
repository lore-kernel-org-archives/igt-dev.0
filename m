Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179DCC87FCA
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F72E10E898;
	Thu, 17 Jul 2025 18:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SCdisL3e";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02F10E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EDD5442B2;
 Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXyQu38vhS1xqbTtHq6pKinczK9wbDHm2qS7y0HPlSk=;
 b=SCdisL3elUNDniSj727w6qMe4gN5DwrfJDXCUqKocIP/Q9jaUfTafaGvpf0T4G02mES0qt
 7MWfNKMdNh+13OkTDx4O+XvfrQS++RymrNRADawpX35ti9fike2s/0jYDuHzVf0P5oTCrx
 NC63JsywruyuzyRULUik8N+o9SUvQ5N9JwSVteZ9XpueLj4pyqBRlUQR9B41Fp2lkmSfyj
 MW9vmnUuKtEUGHAiEjjwYQsaruJeK7D52i4eQm15g7i68IjS8xKt5Lys4aHZqrDp8oKzCG
 yQ+dPCQsHuAbs/gInq9H2Tw95AHZ1Xw1rmfS4no7EGncFXr79qZ9Xkp8gODrfw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:40 +0200
Subject: [PATCH i-g-t v2 20/26] lib/unigraf: Add connector configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-20-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=d+rcZK4IAt8skygpzybSwv6x+Bbs/TS6pFSPH7UDaQM=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGh5RQ3IzB1Gx3OQusDSH84Y9xdtkIF1zXAzdF3GMpA4EnwEV
 4kCMwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJoeUUNAAoJECCtLsZbECziiugP/iH/
 kigpdXkd/7sM3dP1DZiR7AIdybJWrtJCpQ58cRonPKsCFj4ARml9K0XM7p/CBF9Nl1/uBqDfpsQ
 54IeqCnzfe3nZN1Nf0DuMytLMecFw72d9xjwBpcotPi/XCQb9yOnKxdgoTtGE0lwRcm5K1i5O1K
 Pay6G/k838UaV24hjunvyfxpSjAA/YCkfDKADcVYPwFnOJgVYFT9VvWpQfHJML/p6oT+vaNNOxe
 6pG/tTxr8Z0snhGpM9m9iCfktNg85KYg0OMWJq2coexQtguMD+PVXOpswoKjj3gs0keI2y6nZ4p
 bwoWdM5B7NcOSJl9BayUFm7mfLib2TDGvgNzptSuLVgSiKKCVEIBnnYhCHZ7ELC7QpnHSJeLWzm
 CHCWUJkoab4uDuIaksrLXCfh0a8go9P/mAQUUTXr2jIUTlyB0knaLy0T++O9uXtEW+B0H4NB2+z
 TQOvlnR1jx/7SM5NWPSoVOhtWrQXdvgOJbsOpsvyb93+dhBiDyhdlVENAG69J/suli0wbzAsEM5
 c1E0SPoXvhMyqJ/S/MHenxFWPwqum1uObpmddjjAgNmk+dQDxaINp6TZ9GP8Qgezkm2ksSX38pO
 f3/XBJcYTsUqG5k5WYtHS6KSzT9w2DOhMkp/M05utb4uRPELBZxvHr6ccSI+jVRbhldFiikbT2I
 fsBvs
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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

As multiple connectors can be present on the DUT, add a configuration to
tell which connector is used by the Unigraf.

The configuration will look like:

[Unigraf]
Device=UCD-500 [2434C620]
Role=DisplayPort Source and Sink
Input=DP RX
Connector=DP-4
---
 lib/unigraf/unigraf.c | 18 ++++++++++++++++++
 lib/unigraf/unigraf.h | 11 +++++++++++
 2 files changed, 29 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 6df48da4672c1774bd85125076fcc63e9891b6cc..b59a3627af30642899fcf3e4c9e5b53fb4e54eeb 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -10,6 +10,7 @@
 #include "unigraf.h"
 #include "TSI_types.h"
 #include "TSI.h"
+#include "igt_kms.h"
 #include "igt_rc.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device,##__VA_ARGS__)
@@ -44,6 +45,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_INPUT_NAME "Input"
 
+/**
+ * UNIGRAF_CONFIG_CONNECTOR_NAME - Key of the connector name in the configuration file
+ */
+#define UNIGRAF_CONFIG_CONNECTOR_NAME "Connector"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -159,6 +165,11 @@ static int unigraf_find_input(char *request) {
 	return chosen_input;
 }
 
+drmModeConnectorPtr unigraf_get_connector(int drm_fd)
+{
+	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
+}
+
 bool unigraf_open_device(void)
 {
 	TSI_RESULT r;
@@ -215,6 +226,13 @@ bool unigraf_open_device(void)
 			unigraf_debug("No input name configured.\n");
 			cfg_input = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_connector_name = g_key_file_get_string(igt_key_file, cfg_group, UNIGRAF_CONFIG_CONNECTOR_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No connector name configured, will autodetect.\n");
+			unigraf_connector_name = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index e843aa8f2badddcfaeceb8773d5ad19e572e37d9..e014ead67b57e860907bd0cd3521fb5842240594 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -5,6 +5,7 @@
 
 #include <stdbool.h>
 #include <stdint.h>
+#include <xf86drmMode.h>
 
 /**
  * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
@@ -45,6 +46,16 @@ bool unigraf_open_device(void);
  */
 void unigraf_require_device(void);
 
+/**
+ * unigraf_get_connector() - Get a DRM connector for the Unigraf device
+ * @drm_fd: DRM file descriptor
+ *
+ * Returns: A pointer to the drmModeConnector connected to the unigraf device,
+ * or NULL if the operation failed. The caller is responsible for freeing this
+ * pointer with drmModeFreeConnector().
+ */
+drmModeConnectorPtr unigraf_get_connector(int drm_fd);
+
 /**
  * unigraf_read_edid() - Read the EDID from the specified input
  * @dev: The device handle

-- 
2.50.0

