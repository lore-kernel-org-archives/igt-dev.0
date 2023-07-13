Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8333510E65B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 09:13:18 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:47:26 +0530
Message-Id: <20230713091726.272816-4-kunal1.joshi@intel.com>
In-Reply-To: <20230713091726.272816-1-kunal1.joshi@intel.com>
References: <20230713091726.272816-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/igt_chamelium: Added function to
 sort chamelium ports based on is_mapped
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

port_count was used to iterate on chamelium ports but its not
neccessary that mapped ports are always on the top chamelium_ports
array after autodiscovery

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_chamelium.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index a737330a6..8358ca109 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2638,6 +2638,44 @@ static bool get_connector_id_for_port(struct chamelium *chamelium,
 	return false;
 }
 
+static void selective_sort_ports(struct chamelium_port *ports) {
+    int mapped_count = 0;
+    int unmapped_count = 0;
+    int mapped_index = 0;
+    int unmapped_index = mapped_count;
+
+    /*
+     * Count the number of mapped and unmapped ports
+     */
+    for (int i = 0; i < CHAMELIUM_MAX_PORTS; i++) {
+        if (ports[i].is_mapped) {
+            mapped_count++;
+        } else {
+            unmapped_count++;
+        }
+    }
+
+    /*
+     * Rearrange the ports such that mapped ports are at the start
+     */
+    unmapped_index = mapped_count;
+
+    struct chamelium_port sorted_ports[CHAMELIUM_MAX_PORTS];
+
+    for (int i = 0; i < CHAMELIUM_MAX_PORTS; i++) {
+        if (ports[i].is_mapped) {
+            sorted_ports[mapped_index++] = ports[i];
+        } else {
+            sorted_ports[unmapped_index++] = ports[i];
+        }
+    }
+
+    /*
+     * Copy the sorted ports back to the original array
+     */
+    memcpy(ports, sorted_ports, CHAMELIUM_MAX_PORTS * sizeof(struct chamelium_port));
+}
+
 /**
  * chamelium_autodiscover: automagically discover the Chamelium port mapping
  *
@@ -2755,6 +2793,10 @@ unplug_port:
 	}
 	sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
 
+	/*
+	 * Sort the ports based on the is_mapped flag
+	 */
+	selective_sort_ports(chamelium->ports);
 	elapsed_ns = igt_nsec_elapsed(&start);
 	igt_debug("Auto-discovery took %fms and found %i connector(s)\n",
 		  (float)elapsed_ns / (1000 * 1000), chamelium->port_count);
-- 
2.25.1
