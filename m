Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B47110E5F4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 12:08:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 17:35:47 +0530
Message-Id: <20220421120547.2708659-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_flip: Fix mode selection for Nx tests
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

This patch will find the connector/mode combination that fits
into the bandwidth when more than one monitor is connected.

Example:
   When two monitors connected through MST, the second monitor
   also tries to use the same mode. So two such modes may not
   fit into the link bandwidth. So, iterate through connected
   outputs & modes and find a combination of modes those fit
   into the link BW.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index ce452dc8..731047cc 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1302,6 +1302,48 @@ static void discard_any_stale_events(void) {
 	}
 }
 
+static int sort_drm_modes(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode2->clock < mode1->clock) - (mode1->clock < mode2->clock);
+}
+
+static void get_suitable_modes(struct test_output *o, int crtc_count)
+{
+	int m, n;
+	drmModeModeInfo mode[2];
+
+	for (m = 0; m < crtc_count; m++) {
+		qsort(o->kconnector[m]->modes,
+		      o->kconnector[m]->count_modes,
+		      sizeof(drmModeModeInfo),
+		      sort_drm_modes);
+	}
+
+	mode[0] = o->kconnector[0]->modes[0];
+	mode[1] = o->kconnector[1]->modes[0];
+
+	if (!mode_compatible(&mode[0], &mode[1])) {
+		for (n = 0; n < o->kconnector[0]->count_modes; n++) {
+			mode[0] = o->kconnector[0]->modes[n];
+			for (m = 0; m < o->kconnector[1]->count_modes; m++) {
+				mode[1] = o->kconnector[1]->modes[m];
+				if (mode_compatible(&mode[0], &mode[1]))
+					goto found;
+			}
+		}
+
+		/* hope for the best! */
+		mode[0] = mode[1] = o->kconnector[0]->modes[0];
+	}
+
+found:
+	o->fb_width = mode[0].hdisplay;
+	o->fb_height = mode[0].vdisplay;
+	o->kmode[0] = mode[0];
+	o->kmode[1] = mode[1];
+}
 
 static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 				   int crtc_count, int duration_ms)
@@ -1313,8 +1355,9 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	bool state_ok;
 	unsigned elapsed;
 	uint64_t modifier;
-	int i;
+	int i, ret;
 
+restart:
 	last_connector = o->kconnector[0];
 
 	if (o->flags & TEST_PAN)
@@ -1366,7 +1409,19 @@ retry:
 
 	igt_flush_uevents(mon);
 
-	igt_assert(!set_mode(o, o->fb_ids[0], 0, 0));
+	ret = set_mode(o, o->fb_ids[0], 0, 0);
+	/* In case of DP-MST find suitable mode(s) to fit into the link BW. */
+	if (ret < 0 && errno == ENOSPC) {
+		get_suitable_modes(o, crtc_count);
+
+		igt_remove_fb(drm_fd, &o->fb_info[2]);
+		igt_remove_fb(drm_fd, &o->fb_info[1]);
+		igt_remove_fb(drm_fd, &o->fb_info[0]);
+
+		goto restart;
+	}
+
+	igt_assert(!ret);
 	igt_assert(fb_is_bound(o, o->fb_ids[0]));
 
 	vblank = kms_has_vblank(drm_fd);
-- 
2.35.1
