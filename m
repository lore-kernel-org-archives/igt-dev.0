Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315C010E659
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 09:13:17 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:47:25 +0530
Message-Id: <20230713091726.272816-3-kunal1.joshi@intel.com>
In-Reply-To: <20230713091726.272816-1-kunal1.joshi@intel.com>
References: <20230713091726.272816-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/igt_chamelium: Added is_mapped to
 track mapped ports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added boolean is_mapped, which is true for mapped ports
and only plug mapped ports

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_chamelium.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 95983ff25..a737330a6 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -99,6 +99,7 @@ struct chamelium_port {
 	char *name;
 	bool adapter_allowed;
 	char *connector_path;
+	bool is_mapped;
 };
 
 struct chamelium_frame_dump {
@@ -2721,6 +2722,7 @@ static bool chamelium_autodiscover(struct chamelium *chamelium)
 			igt_info("Failed to auto-discover port %d\n", port_id);
 			goto unplug_port;
 		}
+		port->is_mapped = true;
 		is_any_port_mapped = true;
 
 		/* If we found a connector for our port, increment the number of valid Chamelium ports. */
@@ -2746,9 +2748,10 @@ unplug_port:
 	}
 
 	/* After we're all set, turn on all supported ports */
-	for (i = 0; i < chamelium->port_count; i++) {
+	for (i = 0; i < CHAMELIUM_MAX_PORTS; i++) {
 		struct chamelium_port *port = &chamelium->ports[i];
-		chamelium_plug(chamelium, port);
+		if (port->is_mapped)
+			chamelium_plug(chamelium, port);
 	}
 	sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
 
-- 
2.25.1
