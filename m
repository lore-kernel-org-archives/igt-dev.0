Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F27189FC5
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 05:49:25 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Mon, 22 Mar 2021 10:56:53 +0530
Message-Id: <1616390813-26157-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: only check chamelium's
 presence in chamelium tests
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Avoid checking if chamelium is present or not in non chamelium
tests as its just an overhead.

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 08d429a8..397635d8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1958,21 +1958,26 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 #ifdef HAVE_CHAMELIUM
 	{
-		struct chamelium *chamelium;
-
-		chamelium = chamelium_init_rpc_only();
-		if (chamelium) {
-			igt_abort_on_f(!chamelium_wait_reachable(chamelium, 20),
-				       "cannot reach the configured chamelium!\n");
-			igt_abort_on_f(!chamelium_plug_all(chamelium),
-				       "failed to plug all the chamelium ports!\n");
-			igt_abort_on_f(!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd),
-				       "not all configured chamelium ports are connected!\n");
-			chamelium_deinit_rpc_only(chamelium);
-		}
-	}
+		if (strstr(igt_test_name(), "feature_discovery") != NULL ||
+		    strstr(igt_test_name(), "cham") != NULL) {
+
+			struct chamelium *chamelium;
+
+			chamelium = chamelium_init_rpc_only();
+			if (chamelium) {
+				igt_abort_on_f(!chamelium_wait_reachable(chamelium, 20),
+					       "cannot reach the configured chamelium!\n");
+				igt_abort_on_f(!chamelium_plug_all(chamelium),
+					       "failed to plug all the chamelium ports!\n");
+				igt_abort_on_f(!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd),
+					       "not all configured chamelium ports are connected!\n");
+				chamelium_deinit_rpc_only(chamelium);
+			}
+		}
+	}
 #endif
 
+
 	/*
 	 * With non-contiguous pipes display, crtc mapping is not always same
 	 * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
