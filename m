Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C667010E065
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 18:37:09 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 20:36:12 +0200
Message-Id: <20230605183612.41463-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Cancel all outstanding requests at the
 start of a test
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

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index aa2e6b08f..b9f83bb29 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -603,6 +603,17 @@ static const char *chipset_to_str(int chipset)
 	}
 }
 
+static int __drm_reopen_driver(int fd)
+{
+	char path[256];
+
+	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
+	fd = open(path, O_RDWR | O_CLOEXEC);
+	igt_assert_fd(fd);
+
+	return fd;
+}
+
 /**
  * drm_open_driver:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
@@ -627,9 +638,8 @@ int drm_open_driver(int chipset)
 	 */
 	if (is_i915_device(fd)) {
 		if (__sync_fetch_and_add(&open_count, 1) == 0) {
-			gem_quiescent_gpu(fd);
-
-			at_exit_drm_fd = __drm_open_driver(chipset);
+			__cancel_work_at_exit(fd);
+			at_exit_drm_fd = __drm_reopen_driver(fd);
 			igt_install_exit_handler(cancel_work_at_exit);
 		}
 	}
@@ -676,9 +686,9 @@ int drm_open_driver_render(int chipset)
 	if (__sync_fetch_and_add(&open_count, 1))
 		return fd;
 
-	at_exit_drm_render_fd = __drm_open_driver(chipset);
-	if(chipset & DRIVER_INTEL){
-		gem_quiescent_gpu(fd);
+	at_exit_drm_render_fd = __drm_reopen_driver(fd);
+	if (chipset & DRIVER_INTEL) {
+		__cancel_work_at_exit(fd);
 		igt_install_exit_handler(cancel_work_at_exit_render);
 	}
 
-- 
2.39.2
