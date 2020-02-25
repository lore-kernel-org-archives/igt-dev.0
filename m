Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336E96E22D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 16:57:43 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 25 Feb 2020 18:57:18 +0200
Message-ID: <20200225165718.214268-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
References: <20200225165246.213606-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 9/9] lib/kms: Try to plug all Chamelium
 ports, abort if it fails
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

Using chamelium as a display for non-chamelium-aware test is
challenging. The board can be left in multiple different states after
kms_chamelium tests even though we have atexit() handlers and other
measures which try to assure that all ports are plugged in. Sadly this
is not 100% reliable. We also had a few boards hard hanging (happens
very seldom) and requiring manual intervention.

This leads to changes in the testing configuration - we may end up with
any number of connectors plugged in which makes a lot of kms_ tests to
flip between skip and pass depending on a run.

In an attempt to make connectors state less random this patch makes
igt_display_require() chamelium-aware. If chamelium is configured for
given machine we try to reach it and make sure everything is plugged in.
If we fail to do so we abort the execution because the testing
configuration is an unknown.

For machines without a configured chamelium this boils down to a nop.

I have run a bunch of tests and measured how much time we spend in the
Chamelium section of igt_display_require() (n = 1000) with chamelium
configured:

    Min: 0.0030s     Max:    0.0113s
    Avg: 0.0089s     Median: 0.0089s

With ~1000 of KMS subtests in a run it's only a mere 9s.

This will however add a bit of extra execution time to test skips
because of doing kmstest_set_vt_graphics_mode() and
igt_display_require() before even checking whether Chamelium is
configured.

v2: do kmstest_set_vt_graphics_mode() before requiring display (Petri)

Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/20
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_chamelium.c         | 55 +++++++++++++++++++++++++++++++++++--
 lib/igt_chamelium.h         |  1 +
 lib/igt_kms.c               | 18 ++++++++++++
 tests/kms_chamelium.c       | 13 +++++----
 tests/kms_color_chamelium.c |  7 +++--
 5 files changed, 83 insertions(+), 11 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 874e161b..3c9faeeb 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -1992,7 +1992,13 @@ static size_t chamelium_get_video_ports(struct chamelium *chamelium,
 	int res_len, i, port_id;
 	size_t port_ids_len = 0;
 
-	res = chamelium_rpc(chamelium, NULL, "GetSupportedInputs", "()");
+	res = __chamelium_rpc(chamelium, NULL, "GetSupportedInputs", "()");
+	if (chamelium->env.fault_occurred) {
+		igt_debug("Chamelium RPC call failed: %s\n",
+		     chamelium->env.fault_string);
+
+		return -1;
+	}
 	res_len = xmlrpc_array_size(&chamelium->env, res);
 	for (i = 0; i < res_len; i++) {
 		xmlrpc_array_read_item(&chamelium->env, res, i, &res_port);
@@ -2195,6 +2201,8 @@ static bool chamelium_autodiscover(struct chamelium *chamelium, int drm_fd)
 	candidate_ports_len = chamelium_get_video_ports(chamelium,
 							candidate_ports);
 
+	igt_assert(candidate_ports_len > 0);
+
 	igt_debug("Starting Chamelium port auto-discovery on %zu ports\n",
 		  candidate_ports_len);
 	igt_gettime(&start);
@@ -2313,14 +2321,14 @@ static bool chamelium_read_config(struct chamelium *chamelium)
 	GError *error = NULL;
 
 	if (!igt_key_file) {
-		igt_warn("No configuration file available for chamelium\n");
+		igt_debug("No configuration file available for chamelium\n");
 		return false;
 	}
 
 	chamelium->url = g_key_file_get_string(igt_key_file, "Chamelium", "URL",
 					       &error);
 	if (!chamelium->url) {
-		igt_warn("Couldn't read chamelium URL from config file: %s\n",
+		igt_debug("Couldn't read chamelium URL from config file: %s\n",
 			 error->message);
 		return false;
 	}
@@ -2416,6 +2424,9 @@ error:
  * Chamelium configuration. This must be called first before trying to use the
  * chamelium.
  *
+ * Needs to happen *after* igt_display_require() as otherwise the board will
+ * get reset.
+ *
  * If we fail to establish a connection with the chamelium, fail to find a
  * configured connector, etc. we fail the current test.
  *
@@ -2495,6 +2506,44 @@ void chamelium_deinit(struct chamelium *chamelium)
 	free(chamelium);
 }
 
+bool chamelium_plug_all(struct chamelium *chamelium)
+{
+	size_t port_count;
+	int port_ids[CHAMELIUM_MAX_PORTS];
+	xmlrpc_value *v;
+	v = __chamelium_rpc(chamelium, NULL, "Reset", "()");
+
+	if (v != NULL)
+		xmlrpc_DECREF(v);
+
+	if (chamelium->env.fault_occurred) {
+		igt_debug("Chamelium RPC call failed: %s\n",
+		     chamelium->env.fault_string);
+
+		return false;
+	}
+
+	port_count = chamelium_get_video_ports(chamelium, port_ids);
+	if (port_count <= 0)
+		return false;
+
+	for (int i = 0; i < port_count; ++i) {
+		v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_ids[i]);
+
+		if (v != NULL)
+			xmlrpc_DECREF(v);
+
+		if (chamelium->env.fault_occurred) {
+			igt_debug("Chamelium RPC call failed: %s\n",
+			     chamelium->env.fault_string);
+
+			return false;
+		}
+	}
+
+	return true;
+}
+
 igt_constructor {
 	/* Frame dumps can be large, so we need to be able to handle very large
 	 * responses
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 3b9a1242..fb273b1a 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -217,5 +217,6 @@ void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump, int width,
 void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
 void chamelium_destroy_audio_file(struct chamelium_audio_file *audio_file);
 void chamelium_infoframe_destroy(struct chamelium_infoframe *infoframe);
+bool chamelium_plug_all(struct chamelium *chamelium);
 
 #endif /* IGT_CHAMELIUM_H */
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 54de45e5..7f9fafb3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -58,6 +58,9 @@
 #include "igt_device.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
+#ifdef HAVE_CHAMELIUM
+#include "igt_chamelium.h"
+#endif
 
 /**
  * SECTION:igt_kms
@@ -1886,6 +1889,21 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (!resources)
 		goto out;
 
+#ifdef HAVE_CHAMELIUM
+	{
+		struct chamelium *chamelium;
+
+		chamelium = chamelium_init_rpc_only();
+		if (chamelium) {
+			igt_abort_on_f(!chamelium_wait_reachable(chamelium, 20),
+				       "cannot reach the configured chamelium!\n");
+			igt_abort_on_f(!chamelium_plug_all(chamelium),
+				       "failed to plug all the chamelium ports!\n");
+			chamelium_deinit_rpc_only(chamelium);
+		}
+	}
+#endif
+
 	/*
 	 * We cache the number of pipes, that number is a physical limit of the
 	 * hardware and cannot change of time (for now, at least).
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 8243d2ef..f127de8c 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -2622,7 +2622,14 @@ igt_main
 	size_t i;
 
 	igt_fixture {
+		/* So fbcon doesn't try to reprobe things itself */
+		kmstest_set_vt_graphics_mode();
+
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+
+		/* we need to initalize chamelium after igt_display_require */
 		data.chamelium = chamelium_init(data.drm_fd);
 		igt_require(data.chamelium);
 
@@ -2633,12 +2640,6 @@ igt_main
 			data.edids[i] = chamelium_new_edid(data.chamelium,
 							   get_edid(i));
 		}
-
-		/* So fbcon doesn't try to reprobe things itself */
-		kmstest_set_vt_graphics_mode();
-
-		igt_display_require(&data.display, data.drm_fd);
-		igt_require(data.display.is_atomic);
 	}
 
 	igt_describe("DisplayPort tests");
diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 34a1888c..7f5a911c 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -724,6 +724,11 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		if (is_i915_device(data.drm_fd))
 			data.devid = intel_get_drm_devid(data.drm_fd);
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+
+		/* we need to initalize chamelium after igt_display_require */
 		data.chamelium = chamelium_init(data.drm_fd);
 		igt_require(data.chamelium);
 
@@ -734,8 +739,6 @@ igt_main
 			igt_skip("No ports connected\n");
 
 		kmstest_set_vt_graphics_mode();
-		igt_display_require(&data.display, data.drm_fd);
-		igt_require(data.display.is_atomic);
 	}
 
 	for_each_pipe_static(pipe)
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
