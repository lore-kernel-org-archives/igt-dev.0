Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A65A6FABF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 12:53:01 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Tue, 21 Jan 2020 11:24:13 +0530
Message-Id: <1579586055-27583-2-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579586055-27583-1-git-send-email-kunal1.joshi@intel.com>
References: <1579586055-27583-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 1/3] lib/igt_chamelium Added
 chamelium_frame_match_or_dump which returns bool that the captured frame
 matches
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>, ville.syrjala@intel.com, petri.latvala@intel.com, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Added chamelium_frame_match_or_dump which returns bool that the captured
frame matches with reference framebuffer.

(v2)
        Removed previously added function chamelium_assert_frame_dump_eq.

(v3)
	No change.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Suggested-by: Uma Shankar <uma.shankar@intel.com>
---
 lib/igt_chamelium.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_chamelium.h |  5 +++++
 2 files changed, 70 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 9971f51..db1f2b6 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -1632,6 +1632,71 @@ void chamelium_assert_frame_match_or_dump(struct chamelium *chamelium,
 }
 
 /**
+ * chamelium_assert_frame_match_or_dump:
+ * @chamelium: The chamelium instance the frame dump belongs to
+ * @frame: The chamelium frame dump to match
+ * @fb: pointer to an #igt_fb structure
+ * @check: the type of frame matching check to use
+ *
+ * Returns bool that the provided captured frame matches the reference
+ * frame from the framebuffer. If they do not, this saves the reference
+ * and captured frames to a png file.
+ */
+bool chamelium_frame_match_or_dump(struct chamelium *chamelium,
+				   struct chamelium_port *port,
+				   const struct chamelium_frame_dump *frame,
+				   struct igt_fb *fb,
+				   enum chamelium_check check)
+{
+	cairo_surface_t *reference;
+	cairo_surface_t *capture;
+	igt_crc_t *reference_crc;
+	igt_crc_t *capture_crc;
+	bool match;
+
+	/* Grab the reference frame from framebuffer */
+	reference = igt_get_cairo_surface(chamelium->drm_fd, fb);
+
+	/* Grab the captured frame from chamelium */
+	capture = convert_frame_dump_argb32(frame);
+
+	switch (check) {
+	case CHAMELIUM_CHECK_ANALOG:
+		match = igt_check_analog_frame_match(reference, capture);
+		break;
+	case CHAMELIUM_CHECK_CHECKERBOARD:
+		match = igt_check_checkerboard_frame_match(reference, capture);
+		break;
+	default:
+		igt_assert(false);
+	}
+
+	if (!match && igt_frame_dump_is_enabled()) {
+		reference_crc = malloc(sizeof(igt_crc_t));
+		igt_assert(reference_crc);
+
+		/* Calculate the reference frame CRC. */
+		chamelium_do_calculate_fb_crc(reference, reference_crc);
+
+		/* Get the captured frame CRC from the Chamelium. */
+		capture_crc = chamelium_get_crc_for_area(chamelium, port, 0, 0,
+							 0, 0);
+		igt_assert(capture_crc);
+
+		compared_frames_dump(reference, capture, reference_crc,
+				     capture_crc);
+
+		free(reference_crc);
+		free(capture_crc);
+	}
+
+	cairo_surface_destroy(reference);
+	cairo_surface_destroy(capture);
+
+	return match;
+}
+
+/**
  * chamelium_analog_frame_crop:
  * @chamelium: The Chamelium instance to use
  * @dump: The chamelium frame dump to crop
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 08705a9..d03c924 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -204,6 +204,11 @@ void chamelium_assert_frame_match_or_dump(struct chamelium *chamelium,
 					  const struct chamelium_frame_dump *frame,
 					  struct igt_fb *fb,
 					  enum chamelium_check check);
+bool chamelium_frame_match_or_dump(struct chamelium *chamelium,
+				   struct chamelium_port *port,
+				   const struct chamelium_frame_dump *frame,
+				   struct igt_fb *fb,
+				   enum chamelium_check check);
 void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump, int width,
 				 int height);
 void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
