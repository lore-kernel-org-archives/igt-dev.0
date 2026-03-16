Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A542AF46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537A710E25A;
	Mon, 16 Mar 2026 10:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M2bs+DMW";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE05610E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D80F54E426C1;
 Mon, 16 Mar 2026 10:24:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AEF9F5FC4A;
 Mon, 16 Mar 2026 10:24:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6B0410369977; Mon, 16 Mar 2026 11:24:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IXboLIJ1RAD6LL1Jo4LOfUo2m9HHoKMdyil5Jliikbc=;
 b=M2bs+DMWhCkDgv91ggoEhJLu+5Qsp50TrnSi8DT+dwXalqyK12lhJ9o6xH1nBYn20D0gi2
 jvSdmduz/LlYG+4emVoS1/3tNlKjcsMLAUzucEH/msf4/4DVacLpD5MwrV7c9RjXPqzJFf
 +qnyP45EKhyGNyZ6qStGgjd1uEQdJAhZxUJDib4z+1JT5dn8+upefHUIkGEPBzk3h8RC8K
 qbdZaNy0EStjEkwi74hJIUYKH7meKwCVDJGEM3icE2g0Bb7bjv0Ym25nq/Up6Gqu8KlsOz
 Q+L1itqdR50kqOAvW36an1Q4zEcB/sotz5tqkPTuaPVJF7dlqyJDvBQZ5GMMUQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:41 +0100
Subject: [PATCH i-g-t v8 33/49] lib/unigraf: Add configuration for CRC
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-33-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9ZDafwYO0pmjpDTyzwCl7ntPTZqhqG2CJDGX7ZLCk2k=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pTsW04jZTfp9f7137a1X7Yp2Q3Dc61KEia4
 RUau7pBJ0mJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI/Jw/+IyEKEHXj6rGZbboA5IHRqowlaicRs/F
 hWUzZ2iw2NG5lhIBuoI/sbh49Fs6neyr6AMUhw8gcll2vkb5H/e7CaSOOp1o8w31MsReVEfzDKm
 /dPGbJncKzp+O0TrWvQu/1COM0EZ1ioc0G6VlCWYpz3oAi5j0RFZndeausju/imaQppx/a04jXc
 YfGJrjvrKTyx/fRktWFYETZpHpxMNfgXoF/+F2GqauYmAv/QVR+ZQ0Yc1AiGczXi1Ez0ZwO2yVA
 xeDxPSc8ZTjNariYimOyT59jAdt17T6i7liPshDhHmP7gIsntlO0r7t55Go2nkyf1cJqKvWdd+c
 3eap+CV8DQIAALNR4bRCNJXWl49C56x5aCeBIGY+TazfL8T96DaRJlVKvZfxaj9CttozPQ78WBO
 3W9wAxvzE3jocbeMtP1qTLB6mndHB3VyANHFpoRcpH5FLyrt2yiM3jDwfBGxlD6O/WY3mW/bCCc
 WiggQgbbx6C/WkBtou++B8q3RBFXUp7IgFLZiS+vJF6ChcmShxlbSTJIi5dgRBcnzq4DyUmdsYW
 hb8K+pm8xQvZ0ysToWLu3aX3II/RvdFiBb6yJpHr2a6oHaO7676aHuICO4t7JvaLXjPJyDV+klv
 LM73yN6EqSPoBiSNSzANKA2EG+zl1fI4l2P1k987jb0qq/JrugwY=
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

As Unigraf devices are able to compute a CRC for the input image, add a
configuration file option to use them.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 25 +++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 0f56ad998c94..e14f1fd5b050 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -24,6 +24,7 @@
 static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
+static bool unigraf_crc;
 
 /**
  * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
@@ -60,6 +61,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_EDID_NAME "EDID"
 
+/**
+ * UNIGRAF_CONFIG_USE_CRC_NAME - Key of the CRC selection in the configuration file
+ */
+#define UNIGRAF_CONFIG_USE_CRC_NAME "UseCRC"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -363,6 +369,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No default EDID set, use IGT default.\n");
 			cfg_edid_name = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_crc = g_key_file_get_boolean(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						     UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
+			unigraf_crc = true;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -682,3 +696,14 @@ void unigraf_read_crc(int stream, igt_crc_t *out)
 	out->n_words = 3;
 	out->has_valid_frame = false;
 }
+
+/**
+ * unigraf_use_crc() - Check if Unigraf device should be used for CRC computation
+ *
+ * Returns: true if the Unigraf device should be used for CRC computation,
+ *          false otherwise.
+ */
+bool unigraf_use_crc(void)
+{
+	return unigraf_crc;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 8b38261dca09..f22f4c993622 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -74,4 +74,6 @@ void unigraf_select_stream(int stream);
 
 void unigraf_read_crc(int stream, igt_crc_t *out);
 
+bool unigraf_use_crc(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

