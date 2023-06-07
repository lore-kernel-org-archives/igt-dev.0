Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2800A10E0A1
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jun 2023 16:10:48 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Jun 2023 18:08:34 +0200
Message-Id: <20230607160834.35214-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] lib: Cancel all outstanding requests at
 the start of a test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Currently, we try to cancel all outstanding requests at the end of a
test, as commit ("40de31df52ffed5e392d607a83e3aea4efb150e6")
  Author: Chris Wilson <chris@chris-wilson.co.uk>
  Date:   Fri Sep 7 09:27:20 2018 +0100

  lib: Cancel all outstanding requests at the end of a test

  Quite often on catastrophic failure the test leaves a long queue of
  unterminated batches pending execution. Each runs until hangcheck fires
  and skips onto the next, leaving us waiting for a very long time at test
  exit.

However, given that the runner may send a SIGKILL the atexist handler may
not be run, leaking the requests into the start of the next test where
we only wait for the requests to idle. Forcibly cancel those requests as
well.

v1: corrected description, fixed checkpatch error [Kamil]
v2: use drm_reopen_driver [Zbigniew]

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/drmtest.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index aa2e6b08f..220cfb64d 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -627,9 +627,8 @@ int drm_open_driver(int chipset)
 	 */
 	if (is_i915_device(fd)) {
 		if (__sync_fetch_and_add(&open_count, 1) == 0) {
-			gem_quiescent_gpu(fd);
-
-			at_exit_drm_fd = __drm_open_driver(chipset);
+			__cancel_work_at_exit(fd);
+			at_exit_drm_fd = drm_reopen_driver(fd);
 			igt_install_exit_handler(cancel_work_at_exit);
 		}
 	}
@@ -676,9 +675,9 @@ int drm_open_driver_render(int chipset)
 	if (__sync_fetch_and_add(&open_count, 1))
 		return fd;
 
-	at_exit_drm_render_fd = __drm_open_driver(chipset);
-	if(chipset & DRIVER_INTEL){
-		gem_quiescent_gpu(fd);
+	at_exit_drm_render_fd = drm_reopen_driver(fd);
+	if (chipset & DRIVER_INTEL) {
+		__cancel_work_at_exit(fd);
 		igt_install_exit_handler(cancel_work_at_exit_render);
 	}
 
-- 
2.39.2
