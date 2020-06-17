Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A996EA01
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2020 17:54:02 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Wed, 17 Jun 2020 23:22:50 +0530
Message-Id: <20200617175254.17659-3-mohammed.khajapasha@intel.com>
In-Reply-To: <20200617175254.17659-1-mohammed.khajapasha@intel.com>
References: <20200610193724.16436-2-mohammed.khajapasha@intel.com>
 <20200617175254.17659-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/kms_cursor_legacy: Read crtc id
 for enable pipes
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
To: suresh.kumar.kurmi@intel.com, kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@intel.com, arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Read the crtc ids for enable pipes only in display.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_cursor_legacy.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 344442e8..151bd31d 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -58,7 +58,7 @@ static void stress(igt_display_t *display,
 	uint64_t *results;
 	bool torture;
 	int n;
-	unsigned crtc_id[IGT_MAX_PIPES], num_crtcs;
+	unsigned crtc_id[IGT_MAX_PIPES] = {0}, num_crtcs;
 
 	torture = false;
 	if (num_children < 0) {
@@ -84,8 +84,10 @@ static void stress(igt_display_t *display,
 		}
 	} else {
 		num_crtcs = 1;
-		arg.crtc_id = crtc_id[0] = display->pipes[pipe].crtc_id;
-		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
+		if(display->pipes[pipe].enabled) {
+			arg.crtc_id = crtc_id[0] = display->pipes[pipe].crtc_id;
+			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
+		}
 	}
 
 	arg.flags = mode;
@@ -103,7 +105,8 @@ static void stress(igt_display_t *display,
 		hars_petruska_f54_1_random_perturb(child);
 		igt_until_timeout(timeout) {
 			arg.crtc_id = crtc_id[hars_petruska_f54_1_random_unsafe() % num_crtcs];
-			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
+			if (arg.crtc_id)
+				do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
 			count++;
 		}
 
@@ -1390,7 +1393,8 @@ igt_main
 			errno = 0;
 
 			igt_fixture {
-				igt_skip_on(n >= display.n_pipes);
+				igt_require_f(display.pipes[n].enabled,
+						"Pipe-%s not enabled\n", kmstest_pipe_name(n));
 			}
 
 			igt_subtest_f("pipe-%s-single-bo", kmstest_pipe_name(n))
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
