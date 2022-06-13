Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C6610E269
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jun 2022 06:56:34 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Jun 2022 11:54:47 +0530
Message-Id: <20220613062447.21577-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: Move
 intel_ibb_destroy out of test_cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

All the clean up functions were moved to fixture in patch "2aff4179".
But this causes an assert in intel_bb_destory() after the test passes,
on configurations having eDP connected.

So moving the intel_bb_destroy() call back to the original function.

Fixes: 2aff41793e5f ("tests/i915/kms_big_fb: Move cleanup code to fixture")

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_fb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index abf974bb..d50fde45 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -457,6 +457,8 @@ static bool test_pipe(data_t *data)
 	if (data->format == DRM_FORMAT_C8)
 		unset_lut(data);
 
+	intel_bb_destroy(data->ibb);
+
 	return ret;
 }
 
@@ -549,6 +551,8 @@ max_hw_stride_async_flip_test(data_t *data)
 	}
 	igt_reset_timeout();
 
+	intel_bb_destroy(data->ibb);
+
 	return true;
 }
 
@@ -763,7 +767,6 @@ static void test_cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->big_fb_flip[1]);
 	igt_remove_fb(data->drm_fd, &data->small_fb);
 
-	intel_bb_destroy(data->ibb);
 	data->output = NULL;
 }
 
-- 
2.22.0
