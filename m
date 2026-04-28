Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7211BFF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909910E2C4;
	Tue, 28 Apr 2026 04:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdcMY6ix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243CD10E2C4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351648; x=1808887648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HWTGXxC0NLLASUH01bMeyEeDoZ5GnTPle4C5DQ1mXt4=;
 b=YdcMY6ixKCDUvqRLAgpyIUi0DpsQxJnPaLv6nHHVo7MReQiGfW11UV8i
 vaR+R0Al3MDeND4gkCYNAid7z3gXczVXDr0qdEWUHx3wZcyRothieVlSU
 kEwy4z63pkg+T/egtUl0ia7/Q/k8HBGmZpoh6uNzVuJAVsVlMzpDF+cgL
 x9XrZVSgIDtOyH8cXSu95h3Xccy8t2OL8DHXz5CR8GseMZSBpodgz2IEQ
 1llMRwp0RP3qW655mEH74A81OqqEcTLHXrydbvx3S7nYSv/0fTAkbqHzZ
 yZ8HG3i1kRB/HbMaFbK1x0szx2QAIuvp5Z7J0cnBcKtBJcdlvnwfDLuiH A==;
X-CSE-ConnectionGUID: H/UhdXx2StSeXDcY64hopQ==
X-CSE-MsgGUID: rs/36FWxQt215mFDsvXNUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167841"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167841"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:27 -0700
X-CSE-ConnectionGUID: KQz3gHL2TviFUQnMNMW/sw==
X-CSE-MsgGUID: S8iArzrSQKOhi4q3FMoGhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706718"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:26 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v1 16/25] lib/chamelium/v3: Introduce initialization and
 cleanup of Chamelium-related structures
Date: Tue, 28 Apr 2026 10:16:25 +0530
Message-ID: <20260428044644.257001-17-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

In preparation for utilizing the Chamelium in tests, this commit
introduces a few helper functions to read the Chamelium configuration from
a file and initialize RPC-related structures.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 148 ++++++++++++++++++++++++++++++-
 lib/chamelium/v3/igt_chamelium.h |  39 +++++++-
 2 files changed, 183 insertions(+), 4 deletions(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 152242998..663f51aaa 100644
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
index 3195be2bc..929d7d4b0 100644
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
2.48.1

