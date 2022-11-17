Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F77A10E67F
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 19:46:46 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id w9so1784036qtv.13
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 11:46:46 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Nov 2022 14:46:39 -0500
Message-Id: <20221117194639.481656-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] Cv3 Workaround: Skip Plug all at init.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, vsuley@google.com, petri.latvala@intel.com,
 ihf@google.com, amstan@chromium.org, kalin@google.com, seanpaul@chromium.org,
 matthewtlam@google.com, khaled.almahallawy@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
Currently, Cv3 doesn't allow all ports to be plugged in at the same time
so chamelium_plug_all() always fails.

[How]
Check for the first Port ID as it's unique between V2 and V3, and skip
the plugging if it's V3.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 68864bb8..6c52ac3b 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -3015,10 +3015,19 @@ bool chamelium_plug_all(struct chamelium *chamelium)
 	int port_ids[CHAMELIUM_MAX_PORTS];
 	xmlrpc_value *v;
 
+	igt_debug("CHAMELIUM PLUG ALL\n");
+
 	port_count = chamelium_get_video_ports(chamelium, port_ids);
+	igt_debug("CHAMELIUM PLUG ALL: %zu ports\n", port_count);
 	if (port_count <= 0)
 		return false;
 
+	/* A temporary workaround for Chamelium V3: Currently, Cv3 doesn't allow
+	 * all ports to be plugged in at the same time. Cv3 first port has an ID
+	 * of 0 while Cv2 has first port ID as 1. */
+	if (port_ids[0] == 0)
+		return true;
+
 	for (int i = 0; i < port_count; ++i) {
 		v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_ids[i]);
 
@@ -3053,6 +3062,7 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 	for (int i = 0; group_list[i] != NULL; i++) {
 		char *map_name;
 		group = group_list[i];
+		igt_debug("Checking group %s", group);
 
 		if (!strstr(group, "Chamelium:"))
 			continue;
@@ -3060,6 +3070,7 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 		igt_assert(chamelium->port_count <= CHAMELIUM_MAX_PORTS);
 
 		map_name = group + (sizeof("Chamelium:") - 1);
+		igt_debug("Checking map %s", map_name);
 
 		for (int j = 0;
 		     j < res->count_connectors;
-- 
2.38.1.584.g0f3c55d4c2-goog
