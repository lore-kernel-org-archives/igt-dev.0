Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313BBD2CE00
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54E010E6CD;
	Tue, 22 Oct 2024 16:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QGwBGx7u";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E945010E6C6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:31:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27204E0007;
 Tue, 22 Oct 2024 16:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729614718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ntdpDec+5epWJziAjEqZw4dihrIXtLCm3cT1Fsi4iI=;
 b=QGwBGx7uSxR9jQPEWwyTL/8rNBh0G1u8gjuiFscAF/JSIuv95H88EEdwZC+yVFmiXrN6pN
 JB7xMqW6WPi6mhAT0BtVJRsWXXdQDlSP3r16Q8E8G2z/WNkyxSmKIOCWCQ6DUVB6UVdxVz
 5fQWRX7+OArq5UYARLcvdruk2hku3mh9Pa0uP6gFy9efGD0ujKyKezyjAU5SkpsMlHQAHi
 HO/g/sRNQKgqYCLYN5UhQyYSt1rh6+3/grrf4Ml/Dv4TUK+rA6fQ3k3VkBplU37Y0+OrA1
 PwqLbnRDY6qZRrJSoU8sugD2icmiUIywPKR+H75gtk3eDqVqlwQFe32j5tIFZQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 18:31:51 +0200
Subject: [PATCH i-g-t v3 2/5] lib/chamelium/v3: Introduce initialization
 and cleanup of Chamelium-related structures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-dev-remove-static-ports-v3-2-bfbc7b2a83b9@bootlin.com>
References: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
In-Reply-To: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com, 
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com, 
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com, 
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6839;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=v8RXaOL5ldF/2gtp1JedSar13F3f2Li5TsxMOppkrJc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF9N7XTij5arBK9+YxBri7otUhqGtRZaFEMXSY
 PYG9eQZG6qJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxfTewAKCRAgrS7GWxAs
 4s3qEAC/2eUuV44+Ojd6YajIA6d/L2t1pPzgfE0Qh+OxbfAmpuYCs6AQ/vvbCIixWxk2UfH6HiD
 BnYWW2tG/1qIhW6rs1yX7IZFtGeDF8vPpyEGv68AvrXPw855y/XEZqRc1czosMJzkbRd6tXI8SZ
 Aj1HzvNc582X+AzuskKeSZUK6Yq8S/vTXdVZPXykIAhSZk5vr0ewYqnArCw5w13PyemBX/7UgsY
 zoZkfbr57pV/SaJx2K5cCNpYYNKrkdWZ4AdpHwccb1pYFe1CC7EcGqfublPHcGzFMwBZT09Kk7I
 BxChg+aWP+i3nOsqupbTZTIMDqSKxm+BaOoYXzlFJMUZwequ44KLM1SHfZznPEGurkHOkrK02mH
 dxpmOjJNfujfNHEtbM+sLjMt3xVVtn4wPZnBfDnczvKgGCXTEkU1zuYDdkqe4HP2eE2Y8DUz13k
 5T14xaBix8lG67ccqAmGcKAsP7rFymg84W1I/m7cnkJ+RFEtrGePLM0eL4sUHlj/fkeQTjfH4de
 D9ObC+IQY06Af3G5dwaQGQ9lAoYjoBPyNNuNzgrap/p65eVueQrgbaWjbInqxm6W0r5PBWlFuro
 iOrCw36G8qz4814Os20qnhE9FVgtej2pzkGKcN3tXz7FrrnHpWXz/Kxk9iyvR1LjNDCNWkHcNhj
 TpMvNCowI/yjOPA==
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
index 152242998013..663f51aaa7b0 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -1,9 +1,151 @@
 // SPDX-License-Identifier: MIT
 
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
index 3195be2bc384..929d7d4b07b1 100644
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
2.46.2

