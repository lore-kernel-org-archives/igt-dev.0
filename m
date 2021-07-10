Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27916EAAD
 for <igt-dev@lists.freedesktop.org>; Sat, 10 Jul 2021 00:48:38 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Fri,  9 Jul 2021 17:47:08 -0700
Message-Id: <20210710004708.2871237-10-lucas.demarchi@intel.com>
In-Reply-To: <20210710004708.2871237-1-lucas.demarchi@intel.com>
References: <20210710004708.2871237-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 9/9] tests/kms_sequence: nuke local drm
 definitions
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

Use the ones from kernel headers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/kms_sequence.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index bd810a5c..17cc5ab3 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -56,26 +56,6 @@ typedef struct {
 #define FORKED 4
 } data_t;
 
-struct local_drm_crtc_get_sequence {
-	__u32 crtc_id;
-	__u32 active;
-	__u64 sequence;
-	__u64 sequence_ns;
-};
-
-struct local_drm_crtc_queue_sequence {
-	__u32 crtc_id;
-	__u32 flags;
-	__u64 sequence;
-	__u64 user_data;
-};
-
-#define LOCAL_DRM_IOCTL_CRTC_GET_SEQUENCE     DRM_IOWR(0x3b, struct local_drm_crtc_get_sequence)
-#define LOCAL_DRM_IOCTL_CRTC_QUEUE_SEQUENCE   DRM_IOWR(0x3c, struct local_drm_crtc_queue_sequence)
-
-#define LOCAL_DRM_CRTC_SEQUENCE_RELATIVE              0x00000001      /* sequence is relative to current */
-#define LOCAL_DRM_CRTC_SEQUENCE_NEXT_ON_MISS          0x00000002      /* Use next sequence if we've missed */
-
 struct local_drm_event_crtc_sequence {
         struct drm_event        base;
         __u64                   user_data;
@@ -133,23 +113,23 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
 	igt_display_commit(display);
 }
 
-static int crtc_get_sequence(int fd, struct local_drm_crtc_get_sequence *cgs)
+static int crtc_get_sequence(int fd, struct drm_crtc_get_sequence *cgs)
 {
 	int err;
 
 	err = 0;
-	if (igt_ioctl(fd, LOCAL_DRM_IOCTL_CRTC_GET_SEQUENCE, cgs))
+	if (igt_ioctl(fd, DRM_IOCTL_CRTC_GET_SEQUENCE, cgs))
 		err = -errno;
 
 	return err;
 }
 
-static int crtc_queue_sequence(int fd, struct local_drm_crtc_queue_sequence *cqs)
+static int crtc_queue_sequence(int fd, struct drm_crtc_queue_sequence *cqs)
 {
 	int err;
 
 	err = 0;
-	if (igt_ioctl(fd, LOCAL_DRM_IOCTL_CRTC_QUEUE_SEQUENCE, cqs))
+	if (igt_ioctl(fd, DRM_IOCTL_CRTC_QUEUE_SEQUENCE, cqs))
 		err = -errno;
 	return err;
 }
@@ -174,11 +154,11 @@ static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 			 nchildren);
 
 		if (data->flags & BUSY) {
-			struct local_drm_crtc_queue_sequence cqs;
+			struct drm_crtc_queue_sequence cqs;
 
 			memset(&cqs, 0, sizeof(cqs));
 			cqs.crtc_id = data->crtc_id;
-			cqs.flags = LOCAL_DRM_CRTC_SEQUENCE_RELATIVE;
+			cqs.flags = DRM_CRTC_SEQUENCE_RELATIVE;
 			cqs.sequence = 120 + 12;
 			igt_assert_eq(crtc_queue_sequence(fd, &cqs), 0);
 		}
@@ -210,7 +190,7 @@ static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 
 static void sequence_get(data_t *data, int fd, int nchildren)
 {
-	struct local_drm_crtc_get_sequence cgs;
+	struct drm_crtc_get_sequence cgs;
 	struct timespec start, end;
 	unsigned long sq, count = 0;
 
@@ -233,8 +213,8 @@ static void sequence_get(data_t *data, int fd, int nchildren)
 
 static void sequence_queue(data_t *data, int fd, int nchildren)
 {
-	struct local_drm_crtc_get_sequence cgs_start, cgs_end;
-	struct local_drm_crtc_queue_sequence cqs;
+	struct drm_crtc_get_sequence cgs_start, cgs_end;
+	struct drm_crtc_queue_sequence cqs;
 	unsigned long target;
 	int total = 120 / nchildren;
 	int n;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
