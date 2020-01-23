Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7A56FD5C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 14:59:27 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 23 Jan 2020 13:30:39 +0530
Message-Id: <1579766442-20285-2-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
References: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 1/4] lib/igt_chamelium Added
 chamelium_frame_match_or_dumpn which returns bool that the captured frame
 matches with reference framebuffer
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

(v4)
        Removed duplicate function code chamelium_assert_frame_dump_match

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Suggested-by: Uma Shankar <uma.shankar@intel.com>
---
 lib/igt_chamelium.c | 25 +++++++++++++++++++++++--
 lib/igt_chamelium.h |  5 +++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 9971f51..95166e2 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -1583,6 +1583,27 @@ void chamelium_assert_frame_match_or_dump(struct chamelium *chamelium,
 					  struct igt_fb *fb,
 					  enum chamelium_check check)
 {
+	igt_assert(chamelium_frame_match_or_dump(chamelium, port,
+						 frame, fb, check));
+}
+
+/**
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
 	cairo_surface_t *reference;
 	cairo_surface_t *capture;
 	igt_crc_t *reference_crc;
@@ -1625,10 +1646,10 @@ void chamelium_assert_frame_match_or_dump(struct chamelium *chamelium,
 		free(capture_crc);
 	}
 
-	igt_assert(match);
-
 	cairo_surface_destroy(reference);
 	cairo_surface_destroy(capture);
+
+	return match;
 }
 
 /**
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
