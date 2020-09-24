Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7876E6EAD8
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 12:36:37 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 24 Sep 2020 15:36:25 +0300
Message-Id: <20200924123625.31755-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t RFC] lib/igt_chamelium: Use curl timeout for
 xmlrpc calls
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Use of timeouts everywhere is meaningless if xmlrpc calls are allowed
to be blocking forever.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_chamelium.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index d9fab902..eac893a6 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2427,11 +2427,21 @@ void chamelium_deinit_rpc_only(struct chamelium *chamelium)
 struct chamelium *chamelium_init_rpc_only(void)
 {
 	struct chamelium *chamelium = malloc(sizeof(struct chamelium));
+	struct xmlrpc_clientparms clientparms;
+	struct xmlrpc_curl_xportparms curlparms;
 
 	if (!chamelium)
 		return NULL;
 
 	memset(chamelium, 0, sizeof(*chamelium));
+	memset(&clientparms, 0, sizeof(clientparms));
+	memset(&curlparms, 0, sizeof(curlparms));
+
+	curlparms.timeout = _RECEIVER_RESPONSIVE_AFTER_RESET_SECONDS;
+
+	clientparms.transport = "curl";
+	clientparms.transportparmsP = &curlparms;
+	clientparms.transportparm_size = XMLRPC_CXPSIZE(timeout);
 
 	chamelium->drm_fd = -1;
 
@@ -2439,7 +2449,7 @@ struct chamelium *chamelium_init_rpc_only(void)
 	xmlrpc_env_init(&chamelium->env);
 	xmlrpc_client_setup_global_const(&chamelium->env);
 	xmlrpc_client_create(&chamelium->env, XMLRPC_CLIENT_NO_FLAGS, PACKAGE,
-			     PACKAGE_VERSION, NULL, 0, &chamelium->client);
+			     PACKAGE_VERSION, &clientparms, 0, &chamelium->client);
 	if (chamelium->env.fault_occurred) {
 		igt_debug("Failed to init xmlrpc: %s\n",
 			  chamelium->env.fault_string);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
