Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C586E049
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 15:58:36 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 6 May 2020 18:58:02 +0300
Message-ID: <20200506155803.358220-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_chamelium: Sleep when doing
 autodiscovery
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Autodiscovery was wrongly assuming that whenever we do chamelium_plug()
the connector state change is immediate.

It was working most of the time for native connectors, but may explain
some of the flip-flopping skips.

The problem got only more serious with the advent of LSPcons as USB-C,
where we have much things happening on the signal path, introducing
delays.

So for the sake of reliability this change introduces sleep(10) between
plug and reprobe. The number is about 2 * the_most_pathological_case_observed.

Also the discovery step is performed only if there is no static port
mapping set up. After the discovery is done, IGT prints the mapping
ready to be pasted into .igtrc.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_chamelium.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index c704b84f..28be5248 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -82,6 +82,14 @@
  *
  */
 
+/*
+ * We cannot expect chamelium_plug() to take effect imediately.
+ *
+ * Especially with modern, more complex hardware where we may have LSPcons and
+ * USB controllers in the way.
+ */
+#define CHAMELIUM_HOTPLUG_DETECTION_DELAY 10
+
 struct chamelium_edid {
 	struct chamelium *chamelium;
 	struct edid *base;
@@ -2231,6 +2239,10 @@ static bool chamelium_autodiscover(struct chamelium *chamelium, int drm_fd)
 		chamelium_plug(chamelium, port);
 	}
 
+	igt_info("Sleeping %d seconds for the hotplug to take effect.\n",
+		 CHAMELIUM_HOTPLUG_DETECTION_DELAY);
+	sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
+
 	/* Reprobe connectors and build the mapping */
 	res = drmModeGetResources(drm_fd);
 	if (!res)
@@ -2448,8 +2460,20 @@ struct chamelium *chamelium_init(int drm_fd)
 	if (!chamelium_read_port_mappings(chamelium, drm_fd))
 		goto error;
 
-	if (!chamelium_autodiscover(chamelium, drm_fd))
-		goto error;
+	if (chamelium->port_count == 0) {
+		igt_info("Chamelium configured without port mapping, "
+			 "performing autodiscovery\n");
+
+		if (!chamelium_autodiscover(chamelium, drm_fd))
+			goto error;
+
+		if (chamelium->port_count != 0)
+			igt_info("\nConsider adding the following to your .igtrc:\n");
+		for (int i = 0; i < chamelium->port_count; ++i) {
+			igt_info("[Chamelium:%s]\n", chamelium->ports[i].name);
+			igt_info("ChameliumPortID=%d\n\n", chamelium->ports[i].id);
+		}
+	}
 
 	cleanup_instance = chamelium;
 	igt_install_exit_handler(chamelium_exit_handler);
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
