Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421986E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2020 15:50:55 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 29 Apr 2020 18:49:02 +0300
Message-ID: <20200429154902.201712-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20200429154902.201712-1-arkadiusz.hiler@intel.com>
References: <20200429154902.201712-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/drmtest: Introduce
 __drm_open_driver_another
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

__drm_open_driver_another(int idx, ...) is a counterpart to
__drm_open_driver(..) with the following changes:

If device filters are provided the idx-th filter is used and the first
matching device is selected.

Consecutive calls to it, with increasing idx (starting from zero) are
guaranteed to return fd of a different /dev/dri/ node than the previous
calls or -1.

Counterparts to other existing drm_open_*() should be introduced in
similar fashion as the need arises.

kms_prime test is converted to use this new call and dumb buffers
directly.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/drmtest.c     | 163 +++++++++++++++++++++++++++++++++++++++-------
 lib/drmtest.h     |   1 +
 tests/kms_prime.c | 107 ++++++++++++++++++------------
 3 files changed, 208 insertions(+), 63 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 7b2fd337..538fcf65 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -246,7 +246,51 @@ err:
 	return -1;
 }
 
-static int __search_and_open(const char *base, int offset, unsigned int chipset)
+static struct {
+	int fd;
+	struct stat stat;
+}_opened_fds[64];
+
+static int _opened_fds_count;
+
+static void _set_opened_fd(int idx, int fd)
+{
+	assert(idx < ARRAY_SIZE(_opened_fds));
+	assert(idx <= _opened_fds_count);
+
+	_opened_fds[idx].fd = fd;
+
+	assert(fstat(fd, &_opened_fds[idx].stat) == 0);
+
+	_opened_fds_count = idx+1;
+}
+
+static bool _is_already_opened(const char *path, int as_idx)
+{
+	struct stat new;
+
+	assert(as_idx < ARRAY_SIZE(_opened_fds));
+	assert(as_idx <= _opened_fds_count);
+
+	/*
+	 * we cannot even stat the device, so it's of no use - let's claim it's
+	 * already opened
+	 */
+	if (stat(path, &new) != 0)
+		return true;
+
+	for (int i = 0; i < as_idx; ++i) {
+		/* did we cross filesystem boundary? */
+		assert(_opened_fds[i].stat.st_dev == new.st_dev);
+
+		if (_opened_fds[i].stat.st_ino == new.st_ino)
+			return true;
+	}
+
+	return false;
+}
+
+static int __search_and_open(const char *base, int offset, unsigned int chipset, int as_idx)
 {
 	const char *forced;
 
@@ -259,6 +303,10 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset)
 		int fd;
 
 		sprintf(name, "%s%u", base, i + offset);
+
+		if (_is_already_opened(name, as_idx))
+			continue;
+
 		fd = open_device(name, chipset);
 		if (fd != -1)
 			return fd;
@@ -283,17 +331,17 @@ static void __try_modprobe(unsigned int chipset)
 	pthread_mutex_unlock(&mutex);
 }
 
-static int __open_driver(const char *base, int offset, unsigned int chipset)
+static int __open_driver(const char *base, int offset, unsigned int chipset, int as_idx)
 {
 	int fd;
 
-	fd = __search_and_open(base, offset, chipset);
+	fd = __search_and_open(base, offset, chipset, as_idx);
 	if (fd != -1)
 		return fd;
 
 	__try_modprobe(chipset);
 
-	return __search_and_open(base, offset, chipset);
+	return __search_and_open(base, offset, chipset, as_idx);
 }
 
 static int __open_driver_exact(const char *name, unsigned int chipset)
@@ -320,13 +368,13 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
  * True if card according to the added filter was found,
  * false othwerwise.
  */
-static bool __get_the_first_card(struct igt_device_card *card)
+static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
 {
 	const char *filter;
 
-	if (igt_device_filter_count() > 0) {
-		filter = igt_device_filter_get(0);
-		igt_info("Looking for devices to open using filter: %s\n", filter);
+	if (igt_device_filter_count() > idx) {
+		filter = igt_device_filter_get(idx);
+		igt_info("Looking for devices to open using filter %d: %s\n", idx, filter);
 
 		if (igt_device_card_match(filter, card)) {
 			igt_info("Filter matched %s | %s\n", card->card, card->render);
@@ -339,6 +387,87 @@ static bool __get_the_first_card(struct igt_device_card *card)
 	return false;
 }
 
+/**
+ * __drm_open_driver_another:
+ * @idx: index of the device you are opening
+ * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
+ *
+ * This function is intended to be used instead of drm_open_driver() for tests
+ * that are opening multiple /dev/dri/card* nodes, usually for the purpose of
+ * multi-GPU testing.
+ *
+ * This function opens device in the following order:
+ *
+ * 1. when --device arguments are present:
+ *   * device scanning is executed,
+ *   * idx-th filter (starting with 0, filters are semicolon separated) is used
+ *   * if there is no idx-th filter, goto 2
+ *   * first device maching the filter is selected
+ *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
+ *   * otherwise open the device and return the fd
+ *
+ * 2. compatibility mode - open the first DRM device we can find that is not
+ *    already opened for indexes 0..idx-1, searching up to 16 device nodes
+ *
+ * The test is reponsible to test the interaction between devices in both
+ * directions if applicable.
+ *
+ * Example:
+ *
+ * |[<!-- language="c" -->
+ * igt_subtest_with_dynamic("basic") {
+ * 	int first_fd = -1;
+ * 	int second_fd = -1;
+ *
+ * 	first_fd = __drm_open_driver_another(0, DRIVER_ANY);
+ * 	igt_require(first_fd >= 0);
+ *
+ * 	second_fd = __drm_open_driver_another(1, DRIVER_ANY);
+ * 	igt_require(second_fd >= 0);
+ *
+ * 	if (can_do_foo(first_fd, second_fd))
+ * 		igt_dynamic("first-to-second")
+ * 			test_basic_from_to(first_fd, second_fd);
+ *
+ * 	if (can_do_foo(second_fd, first_fd))
+ * 		igt_dynamic("second-to-first")
+ * 			test_basic_from_to(second_fd, first_fd);
+ *
+ * 	close(first_fd);
+ * 	close(second_fd);
+ * }
+ * ]|
+ *
+ * Returns:
+ * An open DRM fd or -1 on error
+ */
+int __drm_open_driver_another(int idx, int chipset)
+{
+	int fd = -1;
+	if (igt_device_filter_count() > idx) {
+		bool found;
+		struct igt_device_card card;
+
+		found = __get_card_for_nth_filter(idx, &card);
+
+		if (!found || !strlen(card.card))
+			igt_warn("No card matches the filter!\n");
+		else if (_is_already_opened(card.card, idx))
+			igt_warn("card maching filter %d is already opened\n", idx);
+		else
+			fd = __open_driver_exact(card.card, chipset);
+
+	} else {
+		/* no filter for device idx, let's open whatever is available */
+		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
+	}
+
+	if (fd >= 0)
+		_set_opened_fd(idx, fd);
+
+	return fd;
+}
+
 /**
  * __drm_open_driver:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
@@ -354,19 +483,7 @@ static bool __get_the_first_card(struct igt_device_card *card)
  */
 int __drm_open_driver(int chipset)
 {
-	if (igt_device_filter_count() > 0) {
-		bool found;
-		struct igt_device_card card;
-
-		found = __get_the_first_card(&card);
-
-		if (!found || !strlen(card.card))
-			return -1;
-
-		return __open_driver_exact(card.card, chipset);
-	}
-
-	return __open_driver("/dev/dri/card", 0, chipset);
+	return __drm_open_driver_another(0, chipset);
 }
 
 int __drm_open_driver_render(int chipset)
@@ -375,7 +492,7 @@ int __drm_open_driver_render(int chipset)
 		bool found;
 		struct igt_device_card card;
 
-		found = __get_the_first_card(&card);
+		found = __get_card_for_nth_filter(0, &card);
 
 		if (!found || !strlen(card.render))
 			return -1;
@@ -383,7 +500,7 @@ int __drm_open_driver_render(int chipset)
 		return __open_driver_exact(card.render, chipset);
 	}
 
-	return __open_driver("/dev/dri/renderD", 128, chipset);
+	return __open_driver("/dev/dri/renderD", 128, chipset, 0);
 }
 
 static int at_exit_drm_fd = -1;
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 632c616b..d5f0fc25 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -90,6 +90,7 @@ void __set_forced_driver(const char *name);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
+int __drm_open_driver_another(int idx, int chipset);
 int __drm_open_driver(int chipset);
 int __drm_open_driver_render(int chipset);
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 3241c514..8cb2ca2a 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -22,12 +22,19 @@
  */
 
 #include "igt.h"
-#include "igt_vgem.h"
+#include "igt_device.h"
 
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <time.h>
 
+struct dumb_bo {
+	uint32_t handle;
+	uint32_t width, height;
+	uint32_t bpp, pitch;
+	uint64_t size;
+};
+
 struct crc_info {
 	igt_crc_t crc;
 	char *str;
@@ -67,23 +74,24 @@ static bool has_prime_export(int fd)
 }
 
 static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
-				   enum pipe pipe)
+				   enum pipe *pipe)
 {
 	igt_output_t *output;
+	bool found = false;
 
-	igt_display_require(display, importer_fd);
-	igt_skip_on(pipe >= display->n_pipes);
-	output = igt_get_single_output_for_pipe(display, pipe);
+	for_each_pipe_with_valid_output(display, *pipe, output) {
+		found = true;
+		break;
+	}
 
-	igt_require_f(output, "No connector found for pipe %s\n",
-		      kmstest_pipe_name(pipe));
+	igt_require_f(found, "No valid connector/pipe found\n");
 
 	igt_display_reset(display);
-	igt_output_set_pipe(output, pipe);
+	igt_output_set_pipe(output, *pipe);
 	return output;
 }
 
-static void prepare_scratch(int exporter_fd, struct vgem_bo *scratch,
+static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 			    drmModeModeInfo *mode, uint32_t color)
 {
 	uint32_t *ptr;
@@ -91,16 +99,27 @@ static void prepare_scratch(int exporter_fd, struct vgem_bo *scratch,
 	scratch->width = mode->hdisplay;
 	scratch->height = mode->vdisplay;
 	scratch->bpp = 32;
-	vgem_create(exporter_fd, scratch);
 
-	ptr = vgem_mmap(exporter_fd, scratch, PROT_WRITE);
+	scratch->handle = kmstest_dumb_create(exporter_fd,
+			scratch->width,
+			scratch->height,
+			scratch->bpp,
+			&scratch->pitch,
+			&scratch->size);
+
+
+	ptr = kmstest_dumb_map_buffer(exporter_fd,
+				      scratch->handle,
+				      scratch->size,
+				      PROT_WRITE);
+
 	for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
 		ptr[idx] = color;
 
 	munmap(ptr, scratch->size);
 }
 
-static void prepare_fb(int importer_fd, struct vgem_bo *scratch, struct igt_fb *fb)
+static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *fb)
 {
 	enum igt_color_encoding color_encoding = IGT_COLOR_YCBCR_BT709;
 	enum igt_color_range color_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
@@ -126,6 +145,7 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 			    DRM_FORMAT_XRGB8888,
 			    handles, pitches, offsets,
 			    &fb->fb_id, 0);
+
 	igt_assert(ret == 0);
 }
 
@@ -162,19 +182,19 @@ static void test_crc(int exporter_fd, int importer_fd)
 	igt_display_t display;
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
-	enum pipe pipe = PIPE_A;
+	enum pipe pipe;
 	struct igt_fb fb;
 	int dmabuf_fd;
-	struct vgem_bo scratch = {}; /* despite the name, it suits for any
-				      * gem-compatible device
-				      * TODO: rename
-				      */
+	struct dumb_bo scratch = {};
+	bool crc_equal;
 	int i, j;
 	drmModeModeInfo *mode;
 
-	bool crc_equal = false;
+	igt_device_set_master(importer_fd);
+	igt_require_pipe_crc(importer_fd);
+	igt_display_require(&display, importer_fd);
 
-	output = setup_display(importer_fd, &display, pipe);
+	output = setup_display(importer_fd, &display, &pipe);
 
 	mode = igt_output_get_mode(output);
 	pipe_crc = igt_pipe_crc_new(importer_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
@@ -188,6 +208,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 		import_fb(importer_fd, &fb, dmabuf_fd, scratch.pitch);
 		close(dmabuf_fd);
 
+
 		colors[i].prime_crc.name = "prime";
 		collect_crc_for_fb(importer_fd, &fb, &display, output,
 				   pipe_crc, colors[i].color, &colors[i].prime_crc);
@@ -228,29 +249,35 @@ static void test_crc(int exporter_fd, int importer_fd)
 	igt_display_fini(&display);
 }
 
-static void run_test_crc(int export_chipset, int import_chipset)
-{
-	int importer_fd = -1;
-	int exporter_fd = -1;
-
-	exporter_fd = drm_open_driver(export_chipset);
-	importer_fd = drm_open_driver_master(import_chipset);
-
-	igt_require(has_prime_export(exporter_fd));
-	igt_require(has_prime_import(importer_fd));
-	igt_require_pipe_crc(importer_fd);
-
-	test_crc(exporter_fd, importer_fd);
-	close(importer_fd);
-	close(exporter_fd);
-}
-
 igt_main
 {
-	igt_fixture {
+	igt_fixture
 		kmstest_set_vt_graphics_mode();
+
+	igt_describe("Make a dumb color buffer, export to another device and"
+		     " compare the CRCs with a buffer native to that device");
+	igt_subtest_with_dynamic("basic-crc") {
+		int first_fd = -1;
+		int second_fd = -1;
+
+		/* ANY = anything that is not VGEM */
+		first_fd = __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
+		igt_require(first_fd >= 0);
+
+		second_fd = __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
+		igt_require(second_fd >= 0);
+
+		if (has_prime_export(first_fd) &&
+		    has_prime_import(second_fd))
+			igt_dynamic("first-to-second")
+				test_crc(first_fd, second_fd);
+
+		if (has_prime_import(first_fd) &&
+		    has_prime_export(second_fd))
+			igt_dynamic("second-to-first")
+				test_crc(second_fd, first_fd);
+
+		close(first_fd);
+		close(second_fd);
 	}
-	igt_describe("Make a dumb buffer inside vgem, fill it, export to another device and compare the CRC");
-	igt_subtest("basic-crc")
-		run_test_crc(DRIVER_VGEM, DRIVER_ANY);
 }
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
