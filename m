Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB316E22D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 16:57:15 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 25 Feb 2020 18:57:01 +0200
Message-ID: <20200225165701.214204-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
References: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 8/9] lib/chamelium: Add functions to
 initialize XMLRPC only
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Let's extract the bit that reads the config and initializes xmlrpc so we
can do some basic things with chamelium without the need to do port
auto-discovery and connector mapping.

Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_chamelium.c | 89 +++++++++++++++++++++++++++++++++------------
 lib/igt_chamelium.h |  2 +
 2 files changed, 68 insertions(+), 23 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 28706012..874e161b 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2308,7 +2308,7 @@ static bool chamelium_autodiscover(struct chamelium *chamelium, int drm_fd)
 	return true;
 }
 
-static bool chamelium_read_config(struct chamelium *chamelium, int drm_fd)
+static bool chamelium_read_config(struct chamelium *chamelium)
 {
 	GError *error = NULL;
 
@@ -2325,10 +2325,7 @@ static bool chamelium_read_config(struct chamelium *chamelium, int drm_fd)
 		return false;
 	}
 
-	if (!chamelium_read_port_mappings(chamelium, drm_fd)) {
-		return false;
-	}
-	return chamelium_autodiscover(chamelium, drm_fd);
+	return true;
 }
 
 /**
@@ -2352,6 +2349,64 @@ static void chamelium_exit_handler(int sig)
 		chamelium_deinit(cleanup_instance);
 }
 
+/**
+ * chamelium_deinit_rpc_only:
+ * @chamelium: The Chamelium instance to use
+ *
+ * Frees the resources used by a connection to the chamelium that was set up
+ * with #chamelium_init_rpc_only.
+ */
+void chamelium_deinit_rpc_only(struct chamelium *chamelium)
+{
+	xmlrpc_env_clean(&chamelium->env);
+	free(chamelium);
+}
+
+/**
+ * chamelium_init_rpc_only:
+ *
+ * Sets up a connection with a chamelium, using the URL specified in the
+ * Chamelium configuration. The function initializes only the RPC - no port
+ * autodiscovery happens, which means only the functions that do not require
+ * struct #chamelium_port can be called with an instance produced by this
+ * function.
+ *
+ * #chamelium_init is almost always a better choice.
+ *
+ * Returns: A newly initialized chamelium struct, or NULL on lack of
+ * configuration
+ */
+struct chamelium *chamelium_init_rpc_only(void)
+{
+	struct chamelium *chamelium = malloc(sizeof(struct chamelium));
+
+	if (!chamelium)
+		return NULL;
+
+	memset(chamelium, 0, sizeof(*chamelium));
+
+	chamelium->drm_fd = -1;
+
+	/* Setup the libxmlrpc context */
+	xmlrpc_env_init(&chamelium->env);
+	xmlrpc_client_setup_global_const(&chamelium->env);
+	xmlrpc_client_create(&chamelium->env, XMLRPC_CLIENT_NO_FLAGS, PACKAGE,
+			     PACKAGE_VERSION, NULL, 0, &chamelium->client);
+	if (chamelium->env.fault_occurred) {
+		igt_debug("Failed to init xmlrpc: %s\n",
+			  chamelium->env.fault_string);
+		goto error;
+	}
+
+	if (!chamelium_read_config(chamelium))
+		goto error;
+
+	return chamelium;
+error:
+	chamelium_deinit_rpc_only(chamelium);
+	return NULL;
+}
+
 /**
  * chamelium_init:
  * @chamelium: The Chamelium instance to use
@@ -2368,9 +2423,9 @@ static void chamelium_exit_handler(int sig)
  */
 struct chamelium *chamelium_init(int drm_fd)
 {
-	struct chamelium *chamelium = malloc(sizeof(struct chamelium));
+	struct chamelium *chamelium = chamelium_init_rpc_only();
 
-	if (!chamelium)
+	if (chamelium == NULL)
 		return NULL;
 
 	/* A chamelium instance was set up previously, so clean it up before
@@ -2379,34 +2434,22 @@ struct chamelium *chamelium_init(int drm_fd)
 	if (cleanup_instance)
 		chamelium_deinit(cleanup_instance);
 
-	memset(chamelium, 0, sizeof(*chamelium));
 	chamelium->drm_fd = drm_fd;
 	IGT_INIT_LIST_HEAD(&chamelium->edids);
 
-	/* Setup the libxmlrpc context */
-	xmlrpc_env_init(&chamelium->env);
-	xmlrpc_client_setup_global_const(&chamelium->env);
-	xmlrpc_client_create(&chamelium->env, XMLRPC_CLIENT_NO_FLAGS, PACKAGE,
-			     PACKAGE_VERSION, NULL, 0, &chamelium->client);
-	if (chamelium->env.fault_occurred) {
-		igt_debug("Failed to init xmlrpc: %s\n",
-			  chamelium->env.fault_string);
+	if (!chamelium_read_port_mappings(chamelium, drm_fd))
 		goto error;
-	}
 
-	if (!chamelium_read_config(chamelium, drm_fd))
+	if (!chamelium_autodiscover(chamelium, drm_fd))
 		goto error;
 
 	cleanup_instance = chamelium;
 	igt_install_exit_handler(chamelium_exit_handler);
 
 	return chamelium;
-
 error:
-	xmlrpc_env_clean(&chamelium->env);
-	free(chamelium);
-
-	return NULL;
+	chamelium_deinit_rpc_only(chamelium);
+	return chamelium;
 }
 
 /**
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index db6803b1..3b9a1242 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -100,6 +100,8 @@ struct chamelium_edid;
  */
 #define CHAMELIUM_MAX_AUDIO_CHANNELS 8
 
+void chamelium_deinit_rpc_only(struct chamelium *chamelium);
+struct chamelium *chamelium_init_rpc_only(void);
 struct chamelium *chamelium_init(int drm_fd);
 void chamelium_deinit(struct chamelium *chamelium);
 void chamelium_reset(struct chamelium *chamelium);
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
