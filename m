Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F806E23B
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2019 13:34:06 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue, 31 Dec 2019 18:51:57 +0530
Message-Id: <20191231132158.3911-7-swati2.sharma@intel.com>
In-Reply-To: <20191231132158.3911-1-swati2.sharma@intel.com>
References: <20191231132158.3911-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/7] tests/kms_hdr: Add subtest to validate
 HDR mode using luminance sensor
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

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Add subtest to validate HDR mode by setting the static metadata and
this involves display level verification for infoframes using a
luminance sensor. Therefore, luminance sensor is required for this
subtest, if sensor is not available test will skip.

On intel driver, haven't validated this subtest but included this
for amd driver.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 271 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 271 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index dfd377b5..a63021b1 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -44,6 +44,7 @@ enum {
 	TEST_NONE = 0,
 	TEST_DPMS = 1 << 0,
 	TEST_SUSPEND = 1 << 1,
+	TEST_OUTPUT = 1 << 2,
 };
 
 /* BPC connector state. */
@@ -61,6 +62,7 @@ typedef struct data {
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
+	int sensor_fd;
 	int fd;
 	int w;
 	int h;
@@ -165,6 +167,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
+	data->sensor_fd = -1;
 }
 
 static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
@@ -393,6 +396,269 @@ static void test_static_toggle(data_t *data, igt_output_t *output,
 	}
 }
 
+/*
+ * Loads the sensor if unloaded. The sensor is a serial to USB interface that
+ * prints the current measured luminance (nits) as a float, separated by a
+ * newline. Uses baudrate 9600.
+ */
+static void open_sensor(data_t *data)
+{
+	struct termios toptions;
+	int res;
+
+	/* Return if already loaded. */
+	if (data->sensor_fd >= 0)
+		return;
+
+	data->sensor_fd = open("/dev/ttyUSB0", O_RDWR | O_NOCTTY);
+	if (data->sensor_fd < 0) {
+		igt_info("Luminance sensor not found.\n");
+		return;
+	}
+
+	res = tcgetattr(data->sensor_fd, &toptions);
+	igt_assert_lte(0, res);
+
+	cfsetispeed(&toptions, B9600);
+	cfsetospeed(&toptions, B9600);
+
+	toptions.c_cflag &= ~(PARENB | CSTOPB | CSIZE);
+	toptions.c_cflag |= (CS8 | CREAD | CLOCAL);
+	toptions.c_lflag |= ICANON;
+
+	cfmakeraw(&toptions);
+
+	res = tcsetattr(data->sensor_fd, TCSANOW, &toptions);
+	igt_assert_lte(0, res);
+
+	res = tcsetattr(data->sensor_fd, TCSAFLUSH, &toptions);
+	igt_assert_lte(0, res);
+}
+
+/* Reads a string from the sensor. */
+static void get_sensor_str(data_t *data, char *dst, int dst_bytes)
+{
+	char c = 0;
+	int i = 0;
+
+	igt_require(data->sensor_fd >= 0);
+	igt_set_timeout(3, "Waiting for sensor read\n");
+
+	dst_bytes -= 1;
+
+	while (c != '\n' && i < dst_bytes) {
+		int n = read(data->sensor_fd, &c, 1);
+		igt_assert_lte(0, n);
+
+		dst[i++] = c;
+	}
+
+	igt_reset_timeout();
+
+	if (dst_bytes > 0) {
+		dst[i] = 0;
+	}
+}
+
+/* Asserts that two given values in nits are equal within a given threshold. */
+static void assert_nits_equal(double n0, double n1, double threshold)
+{
+	double diff = fabs(n0 - n1);
+
+	igt_assert_f(diff <= threshold,
+		     "Nits not in threshold: | %.3f - %.3f | > %.3f\n",
+		     n0, n1, threshold);
+}
+
+/* Returns the current luminance reading from the sensor in cd/m^2. */
+static float get_sensor_nits(data_t *data)
+{
+	float nits = -1.0f;
+	char buf[32];
+
+	/* Sensor opening is deferred until we actually need it - here. */
+	open_sensor(data);
+
+	/* Flush old data from the buffer in case it's been a while. */
+	igt_require(data->sensor_fd >= 0);
+	tcflush(data->sensor_fd, TCIOFLUSH);
+
+	/* Read twice so we get a clean line. */
+	get_sensor_str(data, buf, ARRAY_SIZE(buf));
+	get_sensor_str(data, buf, ARRAY_SIZE(buf));
+
+	sscanf(buf, "%f", &nits);
+
+	return nits;
+}
+
+/* Logs the cursor sensor nits. */
+static void log_sensor_nits(double nits)
+{
+	igt_info("Sensor: %.3f nits\n", nits);
+}
+
+/*
+ * Waits for the monitor to light-up to a given threshold, useful for
+ * post-modeset measurement.
+ */
+static void wait_for_threshold(data_t *data, double threshold)
+{
+	/*
+	 * If we read too quick the sensor might still be lit up.
+	 * Easy hack: just wait a second.
+	 */
+	sleep(1);
+
+	/* Poll sensor until lightup. */
+	igt_set_timeout(5, "Waiting for sensor read\n");
+
+	for (;;) {
+		double nits = get_sensor_nits(data);
+
+		if (nits >= threshold)
+			break;
+	}
+
+	igt_reset_timeout();
+}
+
+/* PQ Inverse, L normalized luminance to signal value V. */
+static double calc_pq_inverse(double l)
+{
+	double c1 = 0.8359375;
+	double c2 = 18.8515625;
+	double c3 = 18.6875;
+	double m1 = 0.1593017578125;
+	double m2 = 78.84375;
+	double lm = pow(l, m1);
+
+	return pow((c1 + c2 * lm) / (1.0 + c3 * lm), m2);
+}
+
+/* Fills the FB with a solid color given mapping to a light value in nits. */
+static void draw_light(igt_fb_t *fb, double nits)
+{
+	cairo_t *cr;
+	double l, v;
+	int x, y, w, h;
+
+	cr = igt_get_cairo_ctx(fb->fd, fb);
+
+	l = nits / 10000.0;
+	v = calc_pq_inverse(l);
+
+	/*
+	 * Draw a white rect in the bottom center of the screen for the sensor.
+	 * It's only 10% of the width and height of the screen since not every
+	 * monitor is capable of full HDR brightness for the whole screen.
+	 */
+	w = fb->width * 0.10;
+	h = fb->height * 0.10;
+	x = (fb->width - w) / 2;
+	y = (fb->height - h);
+
+	igt_paint_color(cr, 0, 0, fb->width, fb->height, 0.0, 0.0, 0.0);
+	igt_paint_color(cr, x, y, w, h, v, v, v);
+
+	igt_put_cairo_ctx(fb->fd, fb, cr);
+}
+
+/*
+ * Note: This test is display specific in the sense that it requries
+ * a display that is capable of going above SDR brightness levels.
+ * Most HDR400 or higher certified displays should be capable of this.
+ *
+ * Some displays may require first limiting the output brightness
+ * in the OSD for this to work.
+ *
+ * Requires the luminance sensor to be attached to the test machine,
+ * if sensor isn't attached to the test machine, test will skip.
+ */
+static void test_static_output(data_t *data, igt_output_t *output)
+{
+	igt_display_t *display = &data->display;
+	struct hdr_output_metadata hdr;
+	enum pipe pipe;
+	igt_fb_t afb;
+	int afb_id;
+	double lightup = 100.0;
+	double threshold = 15.0;
+	double nits_sdr0, nits_sdr1, nits_sdr2, nits_hdr;
+
+	for_each_pipe(display, pipe) {
+		if (!igt_pipe_connector_valid(pipe, output))
+			continue;
+
+		if (!igt_pipe_is_free(display, pipe))
+			continue;
+
+		prepare_test(data, output, pipe);
+
+		afb_id = igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB2101010, 0, &afb);
+		igt_assert(afb_id);
+
+		draw_light(&afb, 10000.0);
+
+		igt_info("Test SDR, 8bpc\n");
+		igt_plane_set_fb(data->primary, &afb);
+		igt_plane_set_size(data->primary, data->w, data->h);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		wait_for_threshold(data, lightup);
+		nits_sdr0 = get_sensor_nits(data);
+		log_sensor_nits(nits_sdr0);
+
+		igt_info("Test SDR, 10bpc\n");
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 10);
+
+		wait_for_threshold(data, lightup);
+		nits_sdr1 = get_sensor_nits(data);
+		log_sensor_nits(nits_sdr1);
+
+		igt_info("Test HDR, 10bpc\n");
+		fill_hdr_output_metadata_st2048(&hdr);
+		set_hdr_output_metadata(data, &hdr);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		wait_for_threshold(data, lightup);
+		nits_hdr = get_sensor_nits(data);
+		log_sensor_nits(nits_hdr);
+
+		igt_info("Exit HDR into SDR, 8bpc\n");
+		set_hdr_output_metadata(data, NULL);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		wait_for_threshold(data, lightup);
+		nits_sdr2 = get_sensor_nits(data);
+		log_sensor_nits(nits_sdr2);
+
+		/* Verify that all nit values were as expected. */
+		assert_nits_equal(nits_sdr0, nits_sdr1, threshold);
+		assert_nits_equal(nits_sdr0, nits_sdr2, threshold);
+
+		igt_assert_f(nits_hdr - nits_sdr0 > threshold * 2.0,
+		     "No measurable difference between SDR and HDR luminance: "
+		     "threshold=%.1f actual=%.1f\n",
+		     threshold * 2.0, nits_hdr - nits_sdr0);
+
+		test_fini(data);
+		igt_remove_fb(data->fd, &afb);
+
+		break;
+	}
+}
+
 /* Returns true if an output supports hdr metadata property */
 static bool has_hdr(igt_output_t *output)
 {
@@ -418,6 +684,8 @@ static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
 		igt_info("HDR %s test execution on %s\n", test_name, output->name);
 		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
 			test_static_toggle(data, output, flags);
+		if (flags & TEST_OUTPUT)
+			test_static_output(data, output);
 		valid_tests++;
 	}
 
@@ -453,6 +721,9 @@ igt_main
 	igt_describe("Tests static toggle with suspend");
 	igt_subtest("static-toggle-suspend") test_hdr(&data, "static-toggle-suspend", TEST_SUSPEND);
 
+	igt_describe("Tests HDR mode by setting the static metadata");
+	igt_subtest("static-output") test_hdr(&data, "static-output", TEST_OUTPUT);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
