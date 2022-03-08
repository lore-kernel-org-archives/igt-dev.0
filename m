Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46B310E508
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 15:21:56 +0000 (UTC)
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 16:21:39 +0100
Message-Id: <20220308152141.2457841-7-maxime@cerno.tech>
In-Reply-To: <20220308152141.2457841-1-maxime@cerno.tech>
References: <20220308152141.2457841-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/8] tests/kms_writeback: Dump the frames if
 the don't match
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The writeback tests will make sure the reference and captured frames
match. If they don't however, we don't get anything but their hash which
isn't really helpful.

Add a function similar to chamelium_assert_crc_eq_or_dump() to dump the
PNG and raw buffers of those two frames if they don't match and frame
dumping has been enabled.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 tests/kms_writeback.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index faa790cc0f72..2366692865b7 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -256,6 +256,39 @@ static void get_and_wait_out_fence(igt_output_t *output)
 	output->writeback_out_fence_fd = -1;
 }
 
+static void writeback_assert_crtc_eq_or_dump(igt_crc_t *reference_crc,
+					     igt_fb_t *reference_fb,
+					     igt_crc_t *capture_crc,
+					     igt_fb_t *capture_fb)
+{
+	bool eq;
+
+	eq = igt_check_crc_equal(reference_crc, capture_crc);
+	if (!eq) {
+		cairo_surface_t *reference, *capture;
+		char *reference_suffix, *capture_suffix;
+
+		reference = igt_get_cairo_surface(reference_fb->fd, reference_fb);
+		igt_assert(reference);
+
+		capture = igt_get_cairo_surface(capture_fb->fd, capture_fb);
+		igt_assert(capture);
+
+		reference_suffix = igt_crc_to_string_extended(reference_crc, '-', 2);
+		capture_suffix = igt_crc_to_string_extended(capture_crc, '-', 2);
+
+		/* Write reference and capture frames to png. */
+		igt_write_compared_frames(reference, capture,
+					  reference_suffix,
+					  capture_suffix);
+
+		free(reference_suffix);
+		free(capture_suffix);
+	}
+
+	igt_assert(eq);
+}
+
 static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
 {
@@ -303,7 +336,8 @@ static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
 		if (out_fbs[i]) {
 			igt_crc_t out_after;
 			igt_fb_get_fnv1a_crc(out_fbs[i], &out_after);
-			igt_assert_crc_equal(&out_expected, &out_after);
+			writeback_assert_crtc_eq_or_dump(&out_expected, in_fb,
+							 &out_after, out_fbs[i]);
 
 			/* And clear it, for the next time */
 			fill_fb(out_fbs[i], clear_color);
-- 
2.35.1
