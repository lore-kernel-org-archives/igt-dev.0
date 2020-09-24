Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C916EAA8
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 06:25:42 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 24 Sep 2020 11:55:24 +0530
Message-Id: <20200924062525.13878-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200924062525.13878-1-mohammed.khajapasha@intel.com>
References: <20200907032622.6837-1-mohammed.khajapasha@intel.com>
 <20200924062525.13878-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/2] tests/kms_chamelium: Test HPD for connector
 with all valid pipes
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
List-ID: <igt-dev@lists.freedesktop.org>

Test hpd test for a connector with all valid pipes set in
it's valid crtc mask.

v1: Added hpd test for a connector with all it's pipes for DP & HDMI
v2: Added hdp test case for VGA <Joshi, Kunal1>

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_chamelium.c | 54 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index e1c81e01..a9101a82 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -427,6 +427,48 @@ static igt_output_t *get_output_for_port(data_t *data,
 	return output;
 }
 
+static const char test_hotplug_for_each_pipe_desc[] =
+	"Check that we get uevents and updated connector status on "
+	"hotplug and unplug for each pipe with valid output";
+static void
+test_hotplug_for_each_pipe(data_t *data, struct chamelium_port *port)
+{
+	igt_output_t *output;
+	enum pipe pipe;
+	struct udev_monitor *mon = igt_watch_uevents();
+
+	reset_state(data, NULL);
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+	/* Disconnect if any port got connected */
+	chamelium_unplug(data->chamelium, port);
+	wait_for_connector_after_hotplug(data, mon, port,
+			DRM_MODE_DISCONNECTED);
+
+	for_each_pipe(&data->display, pipe) {
+		igt_flush_uevents(mon);
+		/* Check if we get a sysfs hotplug event */
+		chamelium_plug(data->chamelium, port);
+		wait_for_connector_after_hotplug(data, mon, port,
+				DRM_MODE_CONNECTED);
+		igt_flush_uevents(mon);
+		output = get_output_for_port(data, port);
+
+		/* If pipe is valid for output then set it */
+		if (igt_pipe_connector_valid(pipe, output)) {
+			igt_output_set_pipe(output, pipe);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		}
+
+		chamelium_unplug(data->chamelium, port);
+		wait_for_connector_after_hotplug(data, mon, port,
+				DRM_MODE_DISCONNECTED);
+		igt_flush_uevents(mon);
+	}
+
+	igt_cleanup_uevents(mon);
+	igt_hpd_storm_reset(data->drm_fd);
+}
+
 static const char test_basic_hotplug_desc[] =
 	"Check that we get uevents and updated connector status on "
 	"hotplug and unplug";
@@ -2777,6 +2819,10 @@ igt_main
 		connector_subtest("dp-audio-edid", DisplayPort)
 			test_display_audio_edid(&data, port,
 						TEST_EDID_DP_AUDIO);
+
+		igt_describe(test_hotplug_for_each_pipe_desc);
+		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
+			test_hotplug_for_each_pipe(&data, port);
 	}
 
 	igt_describe("HDMI tests");
@@ -2952,6 +2998,10 @@ igt_main
 		igt_describe(test_display_aspect_ratio_desc);
 		connector_subtest("hdmi-aspect-ratio", HDMIA)
 			test_display_aspect_ratio(&data, port);
+
+		igt_describe(test_hotplug_for_each_pipe_desc);
+		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
+			test_hotplug_for_each_pipe(&data, port);
 	}
 
 	igt_describe("VGA tests");
@@ -3026,6 +3076,10 @@ igt_main
 						       SUSPEND_TEST_DEVICES);
 	}
 
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_subtest("vga-hpd-for-each-pipe", VGA)
+		test_hotplug_for_each_pipe(&data, port);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
