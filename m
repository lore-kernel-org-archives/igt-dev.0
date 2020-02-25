Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 25 Feb 2020 11:44:54 +0000
Message-Id: <20200225114454.337180-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] perf: Avoid the regular drm_open_driver
 exithandler
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Due to the way i915_perf_open() works, it installs a wakeref on the fd.
This wakeref prevents the normal drm_open_driver() exithandler from
returning (as that waits for all wakerefs to ensure the GPU is idle). We
need to manually control the nesting of cleanup, and so need to use
__drm_open_driver() to avoid the default exithandler.

References: https://gitlab.freedesktop.org/drm/intel/issues/1085#note_419148
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/perf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/perf.c b/tests/perf.c
index 7b11f668c..869e5f1e9 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -4489,7 +4489,8 @@ igt_main
 		 */
 		igt_assert_eq(drm_fd, -1);
 
-		drm_fd = drm_open_driver(DRIVER_INTEL);
+		/* Avoid the normal exithandler, our perf-fd interferes */
+		drm_fd = __drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(drm_fd);
 
 		devid = intel_get_drm_devid(drm_fd);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
