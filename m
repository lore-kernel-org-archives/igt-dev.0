Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475D6112A80
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 08:56:27 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 13:54:25 +0530
Message-Id: <20220516082426.9852-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/2] tests/kms_async_flips: Convert tests
 to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v2: -Get the mode after igt_display_reset() (Bhanu)

v3: -Move patch to start of series to avoid code duplication (Bhanu)
    -Use for_each_pipe() instead of for_each_pipe_static() (Bhanu)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 122 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 108 insertions(+), 14 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5e11cd43..e307f0d9 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -51,6 +51,7 @@ typedef struct {
 	struct igt_fb bufs[4];
 	igt_display_t display;
 	drmModeConnectorPtr connector;
+	igt_output_t *output;
 	unsigned long flip_timestamp_us;
 	double flip_interval;
 	igt_pipe_crc_t *pipe_crc;
@@ -58,6 +59,8 @@ typedef struct {
 	int flip_count;
 	int frame_count;
 	bool flip_pending;
+	bool extended;
+	enum pipe pipe;
 } data_t;
 
 static drmModeConnectorPtr find_connector_for_modeset(data_t *data)
@@ -531,10 +534,29 @@ static void test_crc(data_t *data)
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	data_t *data = _data;
+
+	switch (opt) {
+	case 'e':
+		data->extended = true;
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char help_str[] =
+"  --e \t\tRun the extended tests\n";
+
+static data_t data;
+
+igt_main_args("e", NULL, help_str, opt_handler, &data)
 {
-	static data_t data;
 	int i;
+	igt_output_t *output;
+	enum pipe pipe;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -552,28 +574,100 @@ igt_main
 			test_init(&data);
 
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
-		igt_subtest("async-flip-with-page-flip-events")
-			test_async_flip(&data, false);
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+						data.output = output;
+						data.pipe = pipe;
+						test_async_flip(&data, false);
+					}
+
+					if (!data.extended)
+						break;
+				}
+			}
+		}
 
 		igt_describe("Alternate between sync and async flips");
-		igt_subtest("alternate-sync-async-flip")
-			test_async_flip(&data, true);
+		igt_subtest_with_dynamic("alternate-sync-async-flip") {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+						data.output = output;
+						data.pipe = pipe;
+						test_async_flip(&data, true);
+					}
+
+					if (!data.extended)
+						break;
+				}
+			}
+		}
 
 		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
-		igt_subtest("test-time-stamp")
-			test_timestamp(&data);
+		igt_subtest_with_dynamic("test-time-stamp") {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+						data.output = output;
+						data.pipe = pipe;
+						test_timestamp(&data);
+					}
+
+					if (!data.extended)
+						break;
+				}
+			}
+		}
 
 		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
-		igt_subtest("test-cursor")
-			test_cursor(&data);
+		igt_subtest_with_dynamic("test-cursor") {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+						data.output = output;
+						data.pipe = pipe;
+						test_cursor(&data);
+					}
+
+					if (!data.extended)
+						break;
+				}
+			}
+		}
 
 		igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
-		igt_subtest("invalid-async-flip")
-			test_invalid(&data);
+		igt_subtest_with_dynamic("invalid-async-flip") {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+						data.output = output;
+						data.pipe = pipe;
+						test_invalid(&data);
+					}
+
+					if (!data.extended)
+						break;
+				}
+			}
+		}
 
 		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
-		igt_subtest("crc")
-			test_crc(&data);
+		igt_subtest_with_dynamic("crc") {
+			for_each_pipe(&data.display, pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+						data.output = output;
+						data.pipe = pipe;
+						test_crc(&data);
+					}
+
+					if (!data.extended)
+						break;
+				}
+			}
+		}
 
 		igt_fixture {
 			for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
-- 
2.22.0
