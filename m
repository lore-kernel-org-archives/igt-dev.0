Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E662C3DA50
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D6610E5BC;
	Tue,  9 Jul 2024 15:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XHdmKOmG";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EC810E5B0
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F74520015;
 Tue,  9 Jul 2024 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkSK/8ZzDmh37VbWDGiEkOLu9Lta/uyicL84hsDxH/E=;
 b=XHdmKOmG2COLBBskvHRguhjlMoYZPsfuDK4+Eu1rfD/U+z3vlY2UvoBNt1Ugtti6dU6bZU
 tI094lHu6CK4fBof48/ur9TfW46JgZa1PxbvcONqOgWTkhdQ1RqQARdY46V5Eo1tc+xFJz
 1n7PBXuTbut5/OYju2lzBL6SjLBvDBpoX5ShlEdEWn+lc69e5XySXJW8/zrZqFr137dVaJ
 gvzSsyxNPb5SZYQPr943apmT3hSrbtqhllTia2Pg9f/sJFd61kmdnjuOSZP4qrzQSc7CRG
 Fx5RhMoqahOhEAoKRRoQmFp2wv8rUprg8xHSakjmQPBhBkDcEFmgXhZUbPihqA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:31 +0200
Subject: [PATCH i-g-t v2 15/39] lib/chamelium/v3: Introduce initialization
 and cleanup of Chamelium-related structures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-15-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6843;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tDGMjFVg7VS7CEqe1ore7SK0Fj7ywm+vp8rYuEsp7F8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViYDdSjQQ+yeOKQX9mWGjmBpsbOJpf5ncnl+
 8hgNHwjWQGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmAAKCRAgrS7GWxAs
 4l90EADKsC2ImFP8gRunxpVeFk/c0Tmvae9gzTLtyNovRXQSROgukJRA14y8FuBpWepPMRenPeH
 Z+9scDA9UtlMfqQil2CUn+/7C7zE36gibKQ7rPh4yQJYrr6cDECvqX3jncVlCyY6Y+t8Evj5TnR
 zQWHDr8kHznqSzYgI7vmJLFm4K/eGS38Y5S2kM9n7pBU6oAcShdDySQ7UkDJ4pJBTeq/pAURoV3
 KLAQHGo4LZeqBWn7qPU1LGgXbTi08Pfd0YhNMBYM0kVBk0Lk+qvBLJUTb4ftpjI8t+oSE1Kt0Gd
 vJCc9jLqYlcODUfgurqOp8gt3Klu16CF/fBOCVWskvOkaz0cjHkAPoP7vD2VyYb6EonlIriGNjN
 +et0c+TyWDhpRP9utDIiKEf9mtx3MiCeYpAlSFs/FOoR3Q+fwG3iLtND6a8Tvldi8QzW/DnsqLJ
 Y1L4hXjVhl24FaKIfOPauj5DpKPy70/K0f1SA9cyKQW6jEGvJdwHnNgkFjjYkYdDH/8bXe3CwpB
 FjRvzTLYyfzqb/AbELP2kD13pi0Hn8z0aKnPwBGisOKbeytbWVu42naWXGiz3Q2mr0J9TPJSCiJ
 nmzTrnZdHmzo8bEKbnoYvvORCBbheRmANY0XP6hkIzI3kj5AtLe20N5vKCndHZbdfzGnBOiwVWE
 zK1KXUP7Vzjcc4A==
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

In preparation for utilizing the Chamelium in tests, this commit
introduces a few helper functions to read the Chamelium configuration from
a file and initialize RPC-related structures.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 148 ++++++++++++++++++++++++++++++++++++++-
 lib/chamelium/v3/igt_chamelium.h |  39 ++++++++++-
 2 files changed, 183 insertions(+), 4 deletions(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 9579bd2cd9f8..7a5a1ff19e4b 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -1,9 +1,151 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <igt_core.h>
+#include <xmlrpc-c/base.h>
+#include <xmlrpc-c/client.h>
+
 #include "igt_chamelium.h"
+#include "igt_core.h"
+#include "igt_rc.h"
+
+#define CHAMELIUM_CONFIG_SECTION "Chameliumv3"
+#define CHAMELIUM_CONFIG_URL "URL"
+
+struct igt_chamelium_v3 {
+	xmlrpc_env env;
+	xmlrpc_client *client;
+	char *url;
+
+	struct igt_list_head port_mapping;
+};
+
+/**
+ * chamelium_v3_port_mapping_alloc - Allocate a port mapping with some default values
+ *
+ * @port_mapping: port mapping to free. The caller must remove the element from the list.
+ */
+static struct chamelium_v3_port_mapping *chamelium_v3_port_mapping_alloc(void)
+{
+	struct chamelium_v3_port_mapping *port_mapping = malloc(sizeof(*port_mapping));
+
+	igt_assert(port_mapping);
+	port_mapping->connector_name = NULL;
+	port_mapping->mst_path = NULL;
+	port_mapping->port_id = 0;
+	port_mapping->parent_id = 0;
+	port_mapping->is_children = false;
+	return port_mapping;
+}
 
-void chamelium_v3_init(void)
+/**
+ * chamelium_v3_port_mapping_free - Free memory assiciated with a port mapping
+ *
+ * @port_mapping: port mapping to free. The caller must remove the element from the list.
+ */
+static void chamelium_v3_port_mapping_free(struct chamelium_v3_port_mapping *port_mapping)
 {
-	igt_info("Using chamelium v3\n");
+	if (port_mapping->connector_name)
+		free(port_mapping->connector_name);
+	if (port_mapping->mst_path)
+		free(port_mapping->mst_path);
+	free(port_mapping);
 }
+
+/**
+ * chamelium_v3_init() - Initialize the RPC connexion with a chamelium
+ *
+ * @url: URL to connect to the chamelium
+ *
+ * Returns a igt_chamelium_v3 pointer, which must be freed by chamelium_v3_uninit.
+ */
+struct igt_chamelium_v3 *chamelium_v3_init(char *url)
+{
+	struct igt_chamelium_v3 *chamelium = malloc(sizeof(struct igt_chamelium_v3));
+	struct xmlrpc_clientparms clientparms;
+	struct xmlrpc_curl_xportparms curlparms;
+
+	if (!chamelium)
+		return NULL;
+
+	memset(chamelium, 0, sizeof(*chamelium));
+	memset(&clientparms, 0, sizeof(clientparms));
+	memset(&curlparms, 0, sizeof(curlparms));
+
+	/* curl's timeout is in milliseconds */
+	curlparms.timeout = 10 * 1000;
+
+	clientparms.transport = "curl";
+	clientparms.transportparmsP = &curlparms;
+	clientparms.transportparm_size = XMLRPC_CXPSIZE(timeout);
+
+	/* Setup the libxmlrpc context */
+	xmlrpc_env_init(&chamelium->env);
+	xmlrpc_client_setup_global_const(&chamelium->env);
+	xmlrpc_client_create(&chamelium->env, XMLRPC_CLIENT_NO_FLAGS, PACKAGE,
+			     PACKAGE_VERSION, &clientparms, 0, &chamelium->client);
+	if (chamelium->env.fault_occurred) {
+		igt_debug("Failed to init xmlrpc: %s\n",
+			  chamelium->env.fault_string);
+		goto error;
+	}
+
+	chamelium->url = strdup(url);
+	IGT_INIT_LIST_HEAD(&chamelium->port_mapping);
+
+	return chamelium;
+error:
+	chamelium_v3_uninit(chamelium);
+	return NULL;
+}
+
+/**
+ * chamelium_v3_init_from_config() - Initialize the RPC connexion with a chamelium from the config
+ * file
+ *
+ * Returns a igt_chamelium_v3 pointer, which must be freed by chamelium_v3_uninit.
+ */
+struct igt_chamelium_v3 *chamelium_v3_init_from_config(void)
+{
+	struct igt_chamelium_v3 *chamelium;
+	GError *error = NULL;
+	char *url;
+
+	if (!igt_key_file) {
+		igt_debug("No configuration file available for chamelium\n");
+		return NULL;
+	}
+
+	url = g_key_file_get_string(igt_key_file, CHAMELIUM_CONFIG_SECTION, CHAMELIUM_CONFIG_URL,
+				    &error);
+	if (!url) {
+		igt_debug("Couldn't read chamelium URL from config file: %s\n", error->message);
+		return false;
+	}
+
+	chamelium = chamelium_v3_init(url);
+	free(url);
+	return chamelium;
+}
+
+/**
+ * chamelium_v3_uninit() - Free the resources used by a chamelium
+ *
+ * @chamelium: The Chamelium instance to free
+ *
+ * Frees the resources used by a connection to the chamelium that was set up
+ * with chamelium_rpc_init().
+ */
+void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium)
+{
+	struct chamelium_v3_port_mapping *port_mapping, *tmp_port_mapping;
+
+	/* Destroy any mapping we created to make sure we don't leak them */
+	igt_list_for_each_entry_safe(port_mapping, tmp_port_mapping, &chamelium->port_mapping,
+				     link) {
+		chamelium_v3_port_mapping_free(port_mapping);
+	}
+	xmlrpc_client_destroy(chamelium->client);
+	xmlrpc_env_clean(&chamelium->env);
+	free(chamelium->url);
+	free(chamelium);
+}
+
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 1848f66b574f..759a1f4d59e2 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -3,6 +3,43 @@
 #ifndef V3_IGT_CHAMELIUM_H
 #define V3_IGT_CHAMELIUM_H
 
-void chamelium_v3_init(void);
+#include <stdint.h>
+
+#include "igt_list.h"
+
+struct igt_chamelium_v3;
+typedef uint32_t chamelium_v3_port_id;
+
+/** struct chamelium_v3_port_mapping - Represent a mapping between a DRM connector and a port on
+ * the chamelium
+ *
+ * @port_id: Chamelium port ID.
+ * @connector_name: DRM connector name, used to identify the connector in DRM, mutually exclusive
+ *		    with @mst_path
+ * @mst_path: MST path property, used to identify the connector in DRM, mutually exclusive with
+ *	      @mst_path
+ * @is_children: Used to indicate that this chamelium port is a children and can't be plugged alone
+ * @parent_id: Used when @is_children is true to point to the correct parent in chamelium
+ * @link: Linked list structure
+ */
+struct chamelium_v3_port_mapping {
+	chamelium_v3_port_id port_id;
+
+	/* For normal DRM connector */
+	char *connector_name;
+
+	/* For MST connector  */
+	char *mst_path;
+	bool is_children;
+	chamelium_v3_port_id parent_id;
+
+	/* Implementation details */
+	struct igt_list_head link;
+};
+
+struct igt_chamelium_v3 *chamelium_v3_init(char *url);
+struct igt_chamelium_v3 *chamelium_v3_init_from_config(void);
+
+void chamelium_v3_uninit(struct igt_chamelium_v3 *chamelium);
 
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.44.2

