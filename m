Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48E110E311
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 08:35:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Date: Mon, 20 Nov 2023 13:54:58 +0530
Message-Id: <20231120082459.1859375-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231120082459.1859375-1-bhanuprakash.modem@intel.com>
References: <20231120082459.1859375-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] tests/kms_vrr: Add support to read Vblank
 event
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

Add a helper support to read DRM_EVENT_VBLANK event from Kernel.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index f26adbccf..741a13be6 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -128,13 +128,31 @@ static uint64_t timespec_to_ns(struct timespec *ts)
 static uint64_t get_kernel_event_ns(data_t *data, uint32_t event)
 {
 	struct drm_event_vblank ev;
+	union drm_wait_vblank vbl;
+	uint32_t tv_sec, tv_usec;
 
 	igt_set_timeout(1, "Waiting for an event\n");
-	igt_assert_eq(read(data->drm_fd, &ev, sizeof(ev)), sizeof(ev));
-	igt_assert_eq(ev.base.type, event);
+
+	if (event == DRM_EVENT_VBLANK) {
+		memset(&vbl, 0, sizeof(vbl));
+		vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_NEXTONMISS;
+		igt_assert_eq(drmIoctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &vbl), 0);
+
+		tv_sec = vbl.reply.tval_sec;
+		tv_usec = vbl.reply.tval_usec;
+	} else if (event == DRM_EVENT_FLIP_COMPLETE) {
+		igt_assert_eq(read(data->drm_fd, &ev, sizeof(ev)), sizeof(ev));
+		igt_assert_eq(ev.base.type, event);
+
+		tv_sec = ev.tv_sec;
+		tv_usec = ev.tv_usec;
+	} else {
+		igt_assert_f(0, "Un recognized event.\n");
+	}
+
 	igt_reset_timeout();
 
-	return ev.tv_sec * NSECS_PER_SEC + ev.tv_usec * 1000ull;
+	return tv_sec * NSECS_PER_SEC + tv_usec * 1000ull;
 }
 
 /*
-- 
2.40.0
