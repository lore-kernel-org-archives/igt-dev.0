Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B5910E4FB
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 07:13:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:33:43 +0530
Message-Id: <20231115070344.1488683-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20231115070344.1488683-1-bhanuprakash.modem@intel.com>
References: <20231115070344.1488683-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 4/5] tests/intel/kms_dirtyfb: Use blitter if
 rendercopy isn't present
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

As Rendercopy support in IGT is not present for few latest
platforms. So, fallback to use Blitter if Rendercopy isn't
present.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index c072c221d..a0f61b7a3 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -237,8 +237,6 @@ static void run_test(data_t *data)
 	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
 	int r;
 
-	igt_skip_on(!rendercopy);
-
 	src = intel_buf_create_full(data->bops, data->fbs[1].gem_handle,
 				    data->fbs[1].width,
 				    data->fbs[1].height,
@@ -259,13 +257,19 @@ static void run_test(data_t *data)
 	spin = igt_spin_new(data->drm_fd, .ahnd = ibb->allocator_handle);
 	igt_spin_set_timeout(spin, NSEC_PER_SEC);
 
-	rendercopy(ibb, src, 0, 0, data->fbs[2].width, data->fbs[2].height, dst, 0, 0);
+	if (rendercopy) {
+		rendercopy(ibb, src, 0, 0, data->fbs[2].width, data->fbs[2].height, dst, 0, 0);
+	} else {
+		intel_bb_blt_copy(ibb, src, 0, 0, src->surface[0].stride,
+				  dst, 0, 0, dst->surface[0].stride,
+				  data->fbs[2].width, data->fbs[2].height, dst->bpp);
+	}
 
-	/* Perfom dirtyfb right after initiating rendercopy */
+	/* Perfom dirtyfb right after initiating rendercopy/blitter */
 	r = drmModeDirtyFB(data->drm_fd, data->fbs[2].fb_id, NULL, 0);
 	igt_assert(r == 0 || r == -ENOSYS);
 
-	/* Ensure rendercopy is complete */
+	/* Ensure rendercopy/blitter is complete */
 	intel_bb_sync(ibb);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-- 
2.40.0
