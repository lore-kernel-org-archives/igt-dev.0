Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC016E118
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2020 03:27:20 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon,  7 Sep 2020 08:56:22 +0530
Message-Id: <20200907032622.6837-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_chamelium: Test HPD for a connector
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
To: anshuman.gupta@intel.com, kishore.kunche@intel.com, kunal1.joshi@intel.com, petri.latvala@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Test hpd test for a connector with all valid pipes set in
it's valid crtc mask.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_chamelium.c | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index e1c81e01..52baf1ae 100644
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
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
