Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB994C3DA4E
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6654310E5C9;
	Tue,  9 Jul 2024 15:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZVaK5l2H";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFC910E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29D1B20011;
 Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fq2DNpgdCwBUOLsEaPuCQ0NWO2ZDnTQ6rsqTFg92/iA=;
 b=ZVaK5l2HLm3fprOuYmzf2B2c4jWvGXeP0clVRIqikMOtagoknma4BGk98lq64/qZHeWz7a
 4XsHcoQP8nmYLWgAQfo0yn9ghKXfoE3m0Cns3lzqNu5eONIe9/aJCPIm6zk+UHhC8AL9ck
 8hKv5fI18gk9dsbkKyDposUeSclKQz2fbZ2iXFEm/yVcDw/ltgjN98VSCAfMaKSjM7Fnp/
 /enR/hz21ac/MUJ/XcDRA5TeT2VI8PRnxU+pUDGhcXoRQm0X81e0bFKyR4noG3O/hpaMzx
 v1eCnCeFr8XJltaOKb/2i1KxWwGvvikfIiNZJmguuj+EnFHvjzqoSDNcRi1ZWg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:40 +0200
Subject: [PATCH i-g-t v2 24/39] lib/chamelium/v3: Introduce new
 configuration format for MST support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-24-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6353;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=w8N2YQfk0y+iRe3fk4z8aPnw3Yq5aRzLqsB1IehwaOs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViZUjhUIV/rguwDP7BFJaEJvDjlsg1oQ5dNZ
 9bxk547XQyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmQAKCRAgrS7GWxAs
 4r+PD/wM6/LGBPTdHcqV25BNovQdY/UEYEuYOR/p/lbScFNf33x/M9I/Jv4AoFjNBcK4liU7opJ
 5/008q4eSRbjBxhHiaWlBxS2RZj9GazVs3RIz0hCrZe/8OopISfgNjNQe/u6B8X0gYkhaTNEmzl
 QXaFFvqVQzaQu8bMMVsGAu9CuVObipDXLLWj8E1S0G4OqUHt+zjAVHbYvsj1nMZCBd5mx9OSj2K
 28AH9JRw5h9AYOvEQqzWVt4sVM3t//XwpybTxC/XasUKFi4BUTORe1YZ4vFUfzu/DOfRBrjbpkh
 hmtB2fjwTVbPIHuE5hv+RFGbP5wsEJOXcoEfiDHo+FSvsx+ALcA3NGPQUPndPZYuipmBD/nv2u6
 m4XMEMRj1sfONf84Lq/LCcwuM4cLm+YPfhTbf5AOOLdbTFDSmcvvNzcTqfu7E5Vs/HffUoxTLc+
 SkL1Q/zI0MUWhOQYyrEAVuiw4/cVx502Mf0VGkSgwzcnXBUoihJP3HrUnRtYWbUIjupdk8xrbTJ
 8Hz2eUSk2zcLHiJYQ0YJB6LPp9ahC9+S497hVJH5BERy/a+edOeUSbWDRrlVtxTG0ldGFe8dL4I
 rpnXr6S5HrcTw3vo71NKvurxWVielahq7Jqq4ympW6nJ8LsZ3SBrgVOnpVCfb9JkLLh+KFktzAV
 WClwNwq7sX3VgxQ==
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

The current Chamelium v2 configuration format does not accommodate MST
usage. To maintain compatibility with existing configuration files, this
commit introduces a new format with a distinct prefix for Chamelium v3
port mapping.

Support for the Chamelium v2 format is retained to facilitate the
transition between Chamelium v2 and v3. The v2 format will be used if the
v3 format is not present in the file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 126 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 3 deletions(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index d528b40ca0c7..26f6b83cd10a 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -13,6 +13,11 @@
 #define CHAMELIUM_V2_CONFIG_PREFIX "Chamelium"
 #define CHAMELIUM_V2_CONFIG_PORT_ID "ChameliumPortID"
 
+#define CHAMELIUM_V3_CONFIG_PORT_NAME "PortName"
+#define CHAMELIUM_V3_CONFIG_MST_PATH "MstPath"
+#define CHAMELIUM_V3_CONFIG_PARENT_ID "ChameliumParentID"
+#define CHAMELIUM_V3_CONFIG_AUTODETECT_SAVE "ChameliumAutodetectSave"
+
 struct igt_chamelium_v3 {
 	xmlrpc_env env;
 	xmlrpc_client *client;
@@ -172,7 +177,7 @@ static void chamelium_v3_fill_port_mapping_from_config_v2(struct igt_chamelium_v
 				}
 			} else {
 				igt_warn("Skipping malformed entry %s: Missing "
-					 CHAMELIUM_V2_CONFIG_PORT_ID "\n",
+					     CHAMELIUM_V2_CONFIG_PORT_ID "\n",
 					 group_list[group_idx]);
 				chamelium_v3_port_mapping_free(port_mapping);
 			}
@@ -186,6 +191,115 @@ static void chamelium_v3_fill_port_mapping_from_config_v2(struct igt_chamelium_v
 	free(group_list);
 }
 
+/**
+ * chamelium_v3_fill_port_mapping_from_config_v2() - Read the configuration file using the chamelium
+ *	v3 format
+ *
+ * @chamelium: chamelium to store the port mapping into
+ *
+ * Read the configuration file to search a chamelium configuration, using the Cv3 format. It will
+ * ignore any malformed entry.
+ */
+static void chamelium_v3_fill_port_mapping_from_config_v3(struct igt_chamelium_v3 *chamelium)
+{
+	char **group_list;
+
+	igt_assert(igt_key_file);
+
+	group_list = g_key_file_get_groups(igt_key_file, NULL);
+	for (int group_idx = 0; group_list[group_idx]; group_idx++) {
+		if (strstr(group_list[group_idx], CHAMELIUM_CONFIG_SECTION ":")) {
+			struct chamelium_v3_port_mapping *port_mapping = NULL;
+			uint32_t chamelium_port_id;
+			char *tmp_end;
+			GError *error = NULL;
+			char *chamelium_port_id_str =
+			    group_list[group_idx] + (sizeof(CHAMELIUM_CONFIG_SECTION ":") - 1);
+
+			errno = 0;
+			chamelium_port_id = strtoul(chamelium_port_id_str, &tmp_end, 0);
+
+			if (chamelium_port_id_str == tmp_end) {
+				igt_warn("Failed to read config file, expecting ["
+					     CHAMELIUM_CONFIG_SECTION ":<int>], found %s\n",
+					 group_list[group_idx]);
+				goto exit_loop;
+			} else if (errno == ERANGE) {
+				igt_warn("Range error during parsing of number, expecting \"%.*s\", strtolu returned %d",
+					 (int)(tmp_end - chamelium_port_id_str),
+					 chamelium_port_id_str, chamelium_port_id);
+				goto exit_loop;
+			}
+
+			port_mapping = chamelium_v3_port_mapping_alloc();
+			port_mapping->port_id = chamelium_port_id;
+
+			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
+					       CHAMELIUM_V3_CONFIG_PORT_NAME, NULL)) {
+				port_mapping->connector_name = g_key_file_get_string(igt_key_file,
+										     group_list[group_idx],
+										     CHAMELIUM_V3_CONFIG_PORT_NAME,
+										     &error);
+				if (error) {
+					igt_info("Skipping malformed entry %s: %s\n",
+						 group_list[group_idx], error->message);
+					goto exit_loop;
+				}
+			}
+
+			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
+					       CHAMELIUM_V3_CONFIG_MST_PATH, NULL)) {
+				port_mapping->mst_path = g_key_file_get_string(igt_key_file,
+									       group_list[group_idx],
+									       CHAMELIUM_V3_CONFIG_MST_PATH,
+									       &error);
+				if (error) {
+					igt_warn("Skipping malformed entry %s: %s\n",
+						 group_list[group_idx], error->message);
+					goto exit_loop;
+				}
+			}
+
+			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
+					       CHAMELIUM_V3_CONFIG_PARENT_ID, NULL)) {
+				port_mapping->parent_id = g_key_file_get_integer(igt_key_file,
+										 group_list[group_idx],
+										 CHAMELIUM_V3_CONFIG_PARENT_ID,
+										 &error);
+				port_mapping->is_children = true;
+				if (error) {
+					igt_warn("Skipping malformed entry %s: %s\n",
+						 group_list[group_idx],
+						 error->message);
+					goto exit_loop;
+				}
+			}
+
+			if (port_mapping->is_children && !port_mapping->mst_path) {
+				igt_warn("If the port have a " CHAMELIUM_V3_CONFIG_PARENT_ID
+					     ", it must also have an " CHAMELIUM_V3_CONFIG_MST_PATH
+					     ". Skipping malformed entry %s.\n",
+					 group_list[group_idx]);
+				goto exit_loop;
+			}
+
+			igt_list_add(&port_mapping->link, &chamelium->port_mapping);
+
+			if (error)
+				free(error);
+			continue;
+exit_loop:
+			if (error)
+				free(error);
+			if (port_mapping)
+				chamelium_v3_port_mapping_free(port_mapping);
+		}
+
+		free(group_list[group_idx]);
+	}
+	free(group_list);
+}
+
 /**
  * chamelium_v3_port_mapping_info_list() - Display the current configured port mapping for the
  *	chamelium
@@ -212,11 +326,17 @@ static void chamelium_v3_port_mapping_info_list(struct igt_list_head *head)
  *	structure.
  *
  * @chamelium: chamelium to store the port mapping into
+ *
+ * It will read the configuration file searching for a Cv3 configuration. If this configuration does
+ * not exist or is empty, it will try to read a Cv2 configuration.
  */
 void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium)
 {
-	if (igt_key_file)
-		chamelium_v3_fill_port_mapping_from_config_v2(chamelium);
+	if (igt_key_file) {
+		chamelium_v3_fill_port_mapping_from_config_v3(chamelium);
+		if (igt_list_length(&chamelium->port_mapping) == 0)
+			chamelium_v3_fill_port_mapping_from_config_v2(chamelium);
+	}
 
 	chamelium_v3_port_mapping_info_list(&chamelium->port_mapping);
 }

-- 
2.44.2

