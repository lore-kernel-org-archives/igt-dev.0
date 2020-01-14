Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18AE6E3C4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 13:35:39 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Tue, 14 Jan 2020 19:05:03 +0530
Message-Id: <1579008904-22441-2-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1579008904-22441-1-git-send-email-kunal1.joshi@intel.com>
References: <1579008904-22441-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_chamelium: add function to
 compare two frame dumps.
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

Added chamelium_assert_frame_dump_eq() into lib. Function
is used to compare two frame dumps.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Suggested-by: Uma Shankar <uma.shankar@intel.com>
---
 lib/igt_chamelium.c | 22 ++++++++++++++++++++++
 lib/igt_chamelium.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 9971f51..0baf5bc 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -1519,6 +1519,28 @@ void chamelium_assert_frame_eq(const struct chamelium *chamelium,
 }
 
 /**
+ * chamelium_assert_frame_eq:
+ * @chamelium: The chamelium instance the frame dump belongs to
+ * @dump1: The chamelium frame dump to check
+ * @dump2: The chamelium frame dump to check
+ *
+ * Asserts that the image contained in the chamelium frame dump is
+ * identical to the other chamelium frame dump.
+ */
+bool chamelium_assert_frame_dump_eq(const struct chamelium *chamelium,
+				    const struct chamelium_frame_dump *dump1,
+				    const struct chamelium_frame_dump *dump2)
+{
+	bool eq;
+
+	/* Frame dump comparison */
+	eq = memcmp(dump1->bgr, dump2->bgr,
+		    dump1->size) == 0;
+
+	return eq;
+}
+
+/**
  * chamelium_assert_crc_eq_or_dump:
  * @chamelium: The chamelium instance the frame dump belongs to
  * @reference_crc: The CRC for the reference frame
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 08705a9..6ff2d76 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -195,6 +195,9 @@ int chamelium_get_frame_limit(struct chamelium *chamelium,
 void chamelium_assert_frame_eq(const struct chamelium *chamelium,
 			       const struct chamelium_frame_dump *dump,
 			       struct igt_fb *fb);
+bool chamelium_assert_frame_dump_eq(const struct chamelium *chamelium,
+				    const struct chamelium_frame_dump *dump1,
+				    const struct chamelium_frame_dump *dump2);
 void chamelium_assert_crc_eq_or_dump(struct chamelium *chamelium,
 				     igt_crc_t *reference_crc,
 				     igt_crc_t *capture_crc, struct igt_fb *fb,
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
