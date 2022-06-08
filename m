Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Jun 2022 16:07:31 +0530
Message-Id: <20220608103731.3850323-1-arun.r.murthy@intel.com>
In-Reply-To: <20220608060737.3839351-1-arun.r.murthy@intel.com>
References: <20220608060737.3839351-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: first async flip
 discarded on i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The i915 KMD will use the first async flip to update the watermarks as
per the watermark optimization in DISPLAY13. Hence the actual async flip
will happen from the subsequent flips.
For alternate sync async test, a dummy async flip has to be done to
allow the KMD to perform the watermark related updates before writing to
the surface base address.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/kms_async_flips.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1701883b..67150e50 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -189,19 +189,18 @@ static void test_async_flip(data_t *data, bool alternate_sync_async)
 			 * In older platforms (<= Gen10), async address update bit is double buffered.
 			 * So flip timestamp can be verified only from the second flip.
 			 * The first async flip just enables the async address update.
+			 * In platforms greater than DISPLAY13 thr first async flip will be discarded
+			 * in order to change the watermark levels as per the optimization. Hence the
+			 * subsequent async flips will actually do the asynchronous flips.
 			 */
 			if (is_i915_device(data->drm_fd)) {
-				uint32_t devid = intel_get_drm_devid(data->drm_fd);
+				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+						      data->bufs[frame % 4].fb_id,
+						      flags, data);
 
-				if (IS_GEN9(devid) || IS_GEN10(devid)) {
-					ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-							      data->bufs[frame % 4].fb_id,
-							      flags, data);
+				igt_assert(ret == 0);
 
-					igt_assert(ret == 0);
-
-					wait_flip_event(data);
-				}
+				wait_flip_event(data);
 			}
 		}
 
-- 
2.25.1
