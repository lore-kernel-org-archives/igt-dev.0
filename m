Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5222789664
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 13:23:27 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 12 Feb 2020 15:23:13 +0200
Message-ID: <20200212132313.108855-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/9] lib/chamelium: Make it clear that
 function asserts
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

chamelium_wait_reachable() is asserting internally if the chamelium not
reachable. Let's make it return bool instead and create
void chamelium_assert_reachable() that fails the run.

Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_chamelium.c   | 10 +++++++---
 lib/igt_chamelium.h   |  3 ++-
 tests/kms_chamelium.c |  4 ++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index b347682d..5f9f777c 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -374,11 +374,15 @@ static bool __chamelium_is_reachable(struct chamelium *chamelium)
 	return true;
 }
 
-void chamelium_wait_reachable(struct chamelium *chamelium, int timeout)
+bool chamelium_wait_reachable(struct chamelium *chamelium, int timeout)
 {
-	bool chamelium_online = igt_wait(__chamelium_is_reachable(chamelium),
-					 timeout * 1000, 100);
+	return igt_wait(__chamelium_is_reachable(chamelium),
+			timeout * 1000, 100);
+}
 
+void chamelium_assert_reachable(struct chamelium *chamelium, int timeout)
+{
+	bool chamelium_online = chamelium_wait_reachable(chamelium, timeout);
 	igt_assert_f(chamelium_online,
 		     "Couldn't connect to Chamelium for %ds", timeout);
 }
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index d03c924a..db6803b1 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -112,7 +112,8 @@ drmModeConnector *chamelium_port_get_connector(struct chamelium *chamelium,
 					       bool reprobe);
 const char *chamelium_port_get_name(struct chamelium_port *port);
 
-void chamelium_wait_reachable(struct chamelium *chamelium, int timeout);
+bool chamelium_wait_reachable(struct chamelium *chamelium, int timeout);
+void chamelium_assert_reachable(struct chamelium *chamelium, int timeout);
 void chamelium_plug(struct chamelium *chamelium, struct chamelium_port *port);
 void chamelium_unplug(struct chamelium *chamelium, struct chamelium_port *port);
 bool chamelium_is_plugged(struct chamelium *chamelium,
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 5c4a1892..8243d2ef 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -376,7 +376,7 @@ try_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
 
 	igt_system_suspend_autoresume(state, test);
 	igt_assert(wait_for_hotplug(mon, &timeout));
-	chamelium_wait_reachable(data->chamelium, ONLINE_TIMEOUT);
+	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
 
 	if (port) {
 		igt_assert_eq(reprobe_connector(data, port), target_state);
@@ -493,7 +493,7 @@ test_suspend_resume_edid_change(data_t *data, struct chamelium_port *port,
 
 	igt_system_suspend_autoresume(state, test);
 	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
-	chamelium_wait_reachable(data->chamelium, ONLINE_TIMEOUT);
+	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
 
 	get_connectors_link_status_failed(data, link_status_failed[1]);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
