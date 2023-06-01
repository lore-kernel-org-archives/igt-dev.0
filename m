Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A885410E554
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 13:19:01 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 16:08:48 +0300
Message-Id: <20230601130850.26359-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
References: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/7] tests/kms_tiled_display: Limit the
 difference in the timestamps to one scanline
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The 10 usec limit is rather abitrary. Let's choose another (perhaps a
bit less) arbitrary value of single scanline. The timestamp could be off
by some significant fraction of a scanline anyway since that's often the
precision the hardware gives us for tracking the scanout position.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_tiled_display.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 5a75caf77d27..7f579bacb3d5 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -60,6 +60,7 @@ typedef struct {
 	data_connector_t *conns;
 	enum igt_commit_style commit;
 	struct timeval first_ts;
+	int linetime_us;
 
 #ifdef HAVE_CHAMELIUM
 	struct chamelium *chamelium;
@@ -200,6 +201,12 @@ static void test_cleanup(data_t *data)
 	igt_display_commit2(&data->display, data->commit);
 	memset(conns, 0, sizeof(data_connector_t) * data->num_h_tiles);
 }
+
+static int mode_linetime_us(const drmModeModeInfo *mode)
+{
+	return 1000 * mode->htotal / mode->clock;
+}
+
 static void setup_mode(data_t *data)
 {
 	int count = 0, prev = 0, i = 0;
@@ -256,6 +263,7 @@ static void setup_mode(data_t *data)
 		}
 		igt_require(found);
 		igt_output_override_mode(output, mode);
+		data->linetime_us = mode_linetime_us(mode);
 	}
 	igt_require(i915_pipe_output_combo_valid(&data->display));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -323,6 +331,11 @@ static data_connector_t *conn_for_crtc(data_t *data, unsigned int crtc_id)
 	return NULL;
 }
 
+static float timeval_float(const struct timeval *tv)
+{
+	return tv->tv_sec + tv->tv_usec / 1000000.0f;
+}
+
 static void page_flip_handler(int fd, unsigned int seq,
 			      unsigned int tv_sec, unsigned int tv_usec,
 			      unsigned int crtc_id, void *_data)
@@ -345,8 +358,8 @@ static void page_flip_handler(int fd, unsigned int seq,
 	igt_assert_f(!conn->got_page_flip, "Got two page-flips for CRTC %u\n",
 		     crtc_id);
 
-	igt_debug("Page Flip Event received from CRTC:%d at %u:%u\n", crtc_id,
-		  tv_sec, tv_usec);
+	igt_debug("Page Flip Event received from CRTC:%d at %.6f\n",
+		  crtc_id, timeval_float(&current_ts));
 
 	conn->got_page_flip = true;
 
@@ -354,11 +367,12 @@ static void page_flip_handler(int fd, unsigned int seq,
 	usec = diff.tv_sec * 1000000 + diff.tv_usec;
 
 	/*
-	 * For seamless tear-free display, the page flip event timestamps
-	 * from all the tiles should not differ by more than 10us.
+	 * We arbitrarily choose to say that the difference
+	 * should be no more than a single scanline.
 	 */
-	igt_fail_on_f(labs(usec) >= 10, "Delayed page flip event from CRTC:%d at %u:%u\n",
-		      crtc_id, tv_sec, tv_usec);
+	igt_fail_on_f(labs(usec) > data->linetime_us,
+		      "Mistimed page flip event from CRTC:%d at %.6f (diff %ld usec, max %d usec)\n",
+		      crtc_id, timeval_float(&current_ts), usec, data->linetime_us);
 }
 
 static bool got_all_page_flips(data_t *data)
-- 
2.39.3
