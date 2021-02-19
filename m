Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C5E6EAC1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 08:43:59 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Fri, 19 Feb 2021 14:12:56 +0530
Message-Id: <20210219084257.31867-2-kunal1.joshi@intel.com>
In-Reply-To: <20210219084257.31867-1-kunal1.joshi@intel.com>
References: <20210219084257.31867-1-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_chamelium: Added toggle for
 fsm_handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: mukunda.pramodh.kumar@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Added igt_chamelium_allow_fsm_handling.

v2: changes for resolving gcc warnings (Petri)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_chamelium.c | 6 ++++--
 lib/igt_chamelium.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 585fdfa8..99b6a8df 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -135,6 +135,8 @@ struct chamelium {
 	int port_count;
 };
 
+bool igt_chamelium_allow_fsm_handling = true;
+
 static struct chamelium *cleanup_instance;
 
 static void chamelium_do_calculate_fb_crc(cairo_surface_t *fb_surface,
@@ -327,7 +329,7 @@ static xmlrpc_value *__chamelium_rpc_va(struct chamelium *chamelium,
 	 * to handle the chamelium attempting FSM, we have to fork into another
 	 * thread and have that handle hotplugging displays
 	 */
-	if (fsm_port) {
+	if (fsm_port && igt_chamelium_allow_fsm_handling) {
 		monitor_args.chamelium = chamelium;
 		monitor_args.port = fsm_port;
 		monitor_args.mon = igt_watch_uevents();
@@ -355,7 +357,7 @@ static xmlrpc_value *__chamelium_rpc_va(struct chamelium *chamelium,
 		/* i2c error, let's try to retry */
 	}
 
-	if (fsm_port) {
+	if (fsm_port && igt_chamelium_allow_fsm_handling) {
 		pthread_cancel(fsm_thread_id);
 		pthread_join(fsm_thread_id, NULL);
 		igt_cleanup_uevents(monitor_args.mon);
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 359f4ab3..bfcb7bb4 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -100,6 +100,8 @@ struct chamelium_edid;
  */
 #define CHAMELIUM_MAX_AUDIO_CHANNELS 8
 
+extern bool igt_chamelium_allow_fsm_handling;
+
 void chamelium_deinit_rpc_only(struct chamelium *chamelium);
 struct chamelium *chamelium_init_rpc_only(void);
 struct chamelium *chamelium_init(int drm_fd);
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
