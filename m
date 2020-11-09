Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777BB89A56
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 15:17:05 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  9 Nov 2020 15:16:58 +0000
Message-Id: <20201109151658.387207-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Handle chamelium failures gracefully
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Don't cause CI to abort a run if an _unrelated_ fixture checks for a
display and chamelium is dead.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_kms.c | 54 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e5d8e82c9..65b36c338 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1922,6 +1922,40 @@ __get_crtc_mask_for_pipe(drmModeRes *resources, igt_pipe_t *pipe)
 	return (1 << offset);
 }
 
+static bool chamelium_ok(int drm_fd)
+{
+	bool ok = true;
+#ifdef HAVE_CHAMELIUM
+	struct chamelium *chamelium;
+
+	chamelium = chamelium_init_rpc_only();
+	if (chamelium) {
+		ok = false;
+
+		if (!chamelium_wait_reachable(chamelium, 20)) {
+			igt_debug("cannot reach the configured chamelium!\n");
+			goto out;
+		}
+
+		if (!chamelium_plug_all(chamelium)) {
+			igt_debug("failed to plug all the chamelium ports!\n");
+			goto out;
+		}
+
+		if (!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd)) {
+			igt_debug("not all configured chamelium ports are connected!\n");
+			goto out;
+		}
+
+		ok = true;
+out:
+		chamelium_deinit_rpc_only(chamelium);
+	}
+#endif
+
+	return ok;
+}
+
 /**
  * igt_display_require:
  * @display: a pointer to an #igt_display_t structure
@@ -1944,6 +1978,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	LOG_INDENT(display, "init");
 
+	if (!chamelium_ok(drm_fd))
+		goto out;
+
 	display->drm_fd = drm_fd;
 	is_i915_dev = is_i915_device(drm_fd);
 
@@ -1953,23 +1990,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (!resources)
 		goto out;
 
-#ifdef HAVE_CHAMELIUM
-	{
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
-#endif
-
 	/*
 	 * With non-contiguous pipes display, crtc mapping is not always same
 	 * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
