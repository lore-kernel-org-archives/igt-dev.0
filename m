Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F660C3DA4D
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1684A10E5D4;
	Tue,  9 Jul 2024 15:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="p46Cm3Nc";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39E910E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 582A420003;
 Tue,  9 Jul 2024 15:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=djtlA9yhEj3iXmRwEVQuy9AWEP8CQN5EfUE+rjw4CwY=;
 b=p46Cm3NcE/kf0UL5zfus5VX2b6u2ry9XtP82jQNm8yKHaxcazcFMoCbtTYmJhukYoZC0IH
 KVsm12OW2SNTvd1Vr9eiDXJJhUkdy5zik9wW3BFnk8piLH2dClvS8IHJaVTPLVgWiBStfv
 6fgWdvcssM9ezjd4hNtY6DtYTfE/CK7HuhXFRPQ4H8CAO7h+qsWoCgm7bMGg2eX8YfM9dz
 65GLzDRdYg9nx06CRgT86iLdkMwRx2BMZy2wOTfzmYU/vmdjvmjNRXsU4egPAjzoMZLthf
 wOgxEjFkl2DhCPiaeHvPNTXyQJ3a3TTlzxT5D7RsUlxY/H9BoXSCpGjVf4Is2A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:38 +0200
Subject: [PATCH i-g-t v2 22/39] lib/chamelium/v3: Implement Chamelium
 configuration parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-22-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4052;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=kfo7F7aJEYJDaJTNvRa3lArTHd7isanibxoKnB7dxYE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViYQ6W+pjIvo/vtbDk5pi7H342X+vto2Ds2X
 Y6FEIu0GZSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmAAKCRAgrS7GWxAs
 4iIQD/96Ln50SZD+4MibPG83Unmzuy8RX6x4ZyZ4Z2ZdVFUQZ1pNCIsLRr6CQ8/mUfRTdri0T2S
 pKsU3eKx033QpruqR/7A8Ikmcq+A6hcSJbGit68EnnUZjvqzozLNDB+NWINhLKQy4Krrz7Ot8BT
 KmJfT6XYk5/G1d/tCNnz7HVXVxAiaUTigzt/Im6rWdQPICOCgy3ZtvAzgm4ENtPibBOqDG+PIjd
 bmBiyAZZ43FJgZNlduAWDiF8shjLbYrgNtVUGlV6DFbHNNfqiv0m/Sr9ngwgj3gXlA2/NG+6UYb
 6B042PIszCDDBGu6ilpuoObOxJgzvF+3POMQerUghzD/LgqBowGOTDUEF7X8yUFWzX8Uo0WuEKp
 DlyzfBca8dGws9NCf7V4OkOUW0EzeyNizW+5VIhQ7lTykTx2cmBX81mD8HFhTQwl/F+4nEnohUN
 7f4hk+l9i1m/xTmA+FiHInzTmJslfdGbzlScm+G+2aDDYJFPUc9WsTQbzb+e+X5eQE++gY3iNUp
 xx/bmZUGI2lSxVWxw+JvI7EAHywinogexfR15kfP9HARFxUyOyeG9NuzKgApCTyX+AkQnzlEx6n
 UFc+SgRi1l3G9cpoTjZp8bfcMeSA6Rcz+Ni8zOt2WDL0d/6oD9De3ntk2Ibzaa1iry7z2PuV0Ik
 SA0xGK0W3fPJ7OQ==
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

The mapping between DRM connectors and Chamelium ports can differ among
setups. To avoid using a time-consuming algorithm for auto-detecting the
configuration, this commit introduces parsing of the port mapping from a
configuration file. The format used is the same as in Chamelium v2.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 72 ++++++++++++++++++++++++++++++++++++++++
 lib/chamelium/v3/igt_chamelium.h |  2 ++
 2 files changed, 74 insertions(+)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 767dfcfcb182..e5a6a438924d 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -10,6 +10,9 @@
 #define CHAMELIUM_CONFIG_SECTION "Chameliumv3"
 #define CHAMELIUM_CONFIG_URL "URL"
 
+#define CHAMELIUM_V2_CONFIG_PREFIX "Chamelium"
+#define CHAMELIUM_V2_CONFIG_PORT_ID "ChameliumPortID"
+
 struct igt_chamelium_v3 {
 	xmlrpc_env env;
 	xmlrpc_client *client;
@@ -126,6 +129,75 @@ struct igt_chamelium_v3 *chamelium_v3_init_from_config(void)
 	return chamelium;
 }
 
+/**
+ * chamelium_v3_fill_port_mapping_from_config_v2() - Read the configuration file using the chamelium
+ *	v2 format
+ *
+ * @chamelium: chamelium to store the port mapping into
+ *
+ * Read the configuration file to search a chamelium configuration, using the Cv2 format. It will
+ * ignore any malformed entry.
+ */
+static void chamelium_v3_fill_port_mapping_from_config_v2(struct igt_chamelium_v3 *chamelium)
+{
+	char **group_list;
+
+	igt_assert(igt_key_file);
+
+	group_list = g_key_file_get_groups(igt_key_file, NULL);
+	for (int group_idx = 0; group_list[group_idx]; group_idx++) {
+		if (strstr(group_list[group_idx], CHAMELIUM_V2_CONFIG_PREFIX ":")) {
+			struct chamelium_v3_port_mapping *port_mapping = NULL;
+			GError *error = NULL;
+			char *port_name_str =
+			    group_list[group_idx] + (sizeof(CHAMELIUM_V2_CONFIG_PREFIX ":") - 1);
+
+			errno = 0;
+
+			port_mapping = chamelium_v3_port_mapping_alloc();
+			port_mapping->connector_name = strdup(port_name_str);
+
+			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
+					       CHAMELIUM_V2_CONFIG_PORT_ID, NULL)) {
+				port_mapping->port_id = g_key_file_get_integer(igt_key_file,
+									       group_list[group_idx],
+									       CHAMELIUM_V2_CONFIG_PORT_ID,
+									       &error);
+				if (error) {
+					igt_info("Skipping malformed entry %s: %s\n",
+						 group_list[group_idx], error->message);
+					chamelium_v3_port_mapping_free(port_mapping);
+				} else {
+					igt_list_add(&port_mapping->link, &chamelium->port_mapping);
+				}
+			} else {
+				igt_warn("Skipping malformed entry %s: Missing "
+					 CHAMELIUM_V2_CONFIG_PORT_ID "\n",
+					 group_list[group_idx]);
+				chamelium_v3_port_mapping_free(port_mapping);
+			}
+
+			if (error)
+				free(error);
+		}
+
+		free(group_list[group_idx]);
+	}
+	free(group_list);
+}
+
+/**
+ * chamelium_v3_fill_port_mapping() - Read the configuration file and fill the port_mapping
+ *	structure.
+ *
+ * @chamelium: chamelium to store the port mapping into
+ */
+void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium)
+{
+	if (igt_key_file)
+		chamelium_v3_fill_port_mapping_from_config_v2(chamelium);
+}
+
 /**
  * chamelium_v3_uninit() - Free the resources used by a chamelium
  *
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index cab33e43aadd..3aaf51dd38db 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -44,6 +44,8 @@ struct chamelium_v3_port_mapping {
 struct igt_chamelium_v3 *chamelium_v3_init(char *url);
 struct igt_chamelium_v3 *chamelium_v3_init_from_config(void);
 
+void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium);
+
 void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium);
 
 void chamelium_v3_reset(struct igt_chamelium_v3 *chamelium);

-- 
2.44.2

