Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07EA10E81C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 May 2022 08:16:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 May 2022 13:43:05 +0530
Message-Id: <20220523081305.3622374-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220421120547.2708659-1-bhanuprakash.modem@intel.com>
References: <20220421120547.2708659-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2] tests/kms_flip: Fix mode selection for Nx tests
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

V2:
* Exit if suitable modes not found in retry.
* New function to re-use the code.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip.c | 109 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 84 insertions(+), 25 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 773e6597..5985e012 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -932,12 +932,36 @@ static bool mode_compatible(const drmModeModeInfo *a, const drmModeModeInfo *b)
 	return true;
 }
 
+static void get_compatible_modes(drmModeModeInfo *a, drmModeModeInfo *b,
+				 drmModeConnector *c1, drmModeConnector *c2)
+{
+	int n, m;
+
+	*a = c1->modes[0];
+	*b = c2->modes[0];
+
+	if (!mode_compatible(a, b)) {
+		for (n = 0; n < c1->count_modes; n++) {
+			*a = c1->modes[n];
+			for (m = 0; m < c2->count_modes; m++) {
+				*b = c2->modes[m];
+				if (mode_compatible(a, b))
+					return;
+			}
+		}
+
+		/* hope for the best! */
+		*a = *b = c1->modes[0];
+	}
+
+	return;
+}
+
 static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
 					   struct test_output *o)
 {
 	struct kmstest_connector_config config[2];
-	drmModeModeInfo *mode[2];
-	int n, m;
+	drmModeModeInfo mode[2];
 
 	if (!kmstest_get_connector_config(drm_fd, o->_connector[0],
 					  1 << crtc_idx0, &config[0]))
@@ -949,39 +973,25 @@ static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
 		return;
 	}
 
-	mode[0] = &config[0].default_mode;
-	mode[1] = &config[1].default_mode;
-	if (!mode_compatible(mode[0], mode[1])) {
-		for (n = 0; n < config[0].connector->count_modes; n++) {
-			mode[0] = &config[0].connector->modes[n];
-			for (m = 0; m < config[1].connector->count_modes; m++) {
-				mode[1] = &config[1].connector->modes[m];
-				if (mode_compatible(mode[0], mode[1]))
-					goto found;
-			}
-		}
-
-		/* hope for the best! */
-		mode[1] = mode[0] = &config[0].default_mode;
-	}
+	get_compatible_modes(&mode[0], &mode[1],
+			     config[0].connector, config[1].connector);
 
-found:
 	o->pipe = config[0].pipe;
-	o->fb_width = mode[0]->hdisplay;
-	o->fb_height = mode[0]->vdisplay;
+	o->fb_width = mode[0].hdisplay;
+	o->fb_height = mode[0].vdisplay;
 	o->mode_valid = 1;
 
 	o->kconnector[0] = config[0].connector;
 	o->kencoder[0] = config[0].encoder;
 	o->_crtc[0] = config[0].crtc->crtc_id;
 	o->_pipe[0] = config[0].pipe;
-	o->kmode[0] = *mode[0];
+	o->kmode[0] = mode[0];
 
 	o->kconnector[1] = config[1].connector;
 	o->kencoder[1] = config[1].encoder;
 	o->_crtc[1] = config[1].crtc->crtc_id;
 	o->_pipe[1] = config[1].pipe;
-	o->kmode[1] = *mode[1];
+	o->kmode[1] = mode[1];
 
 	drmModeFreeCrtc(config[0].crtc);
 	drmModeFreeCrtc(config[1].crtc);
@@ -1302,6 +1312,33 @@ static void discard_any_stale_events(void) {
 	}
 }
 
+static int sort_drm_modes(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode2->clock < mode1->clock) - (mode1->clock < mode2->clock);
+}
+
+static void get_suitable_modes(struct test_output *o)
+{
+	drmModeModeInfo mode[2];
+	int i;
+
+	for (i = 0; i < RUN_PAIR; i++) {
+		qsort(o->kconnector[i]->modes,
+		      o->kconnector[i]->count_modes,
+		      sizeof(drmModeModeInfo),
+		      sort_drm_modes);
+	}
+
+	get_compatible_modes(&mode[0], &mode[1],
+			     o->kconnector[0], o->kconnector[1]);
+
+	o->fb_width = mode[0].hdisplay;
+	o->fb_height = mode[0].vdisplay;
+	o->kmode[0] = mode[0];
+	o->kmode[1] = mode[1];
+}
 
 static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 				   int crtc_count, int duration_ms)
@@ -1309,12 +1346,13 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	struct udev_monitor *mon = igt_watch_uevents();
 	unsigned bo_size = 0;
 	bool vblank = true;
-	bool retried = false;
+	bool retried = false, restart = false;
 	bool state_ok;
 	unsigned elapsed;
 	uint64_t modifier;
-	int i;
+	int i, ret;
 
+restart:
 	last_connector = o->kconnector[0];
 
 	if (o->flags & TEST_PAN)
@@ -1366,7 +1404,28 @@ retry:
 
 	igt_flush_uevents(mon);
 
-	igt_assert(!set_mode(o, o->fb_ids[0], 0, 0));
+	ret = set_mode(o, o->fb_ids[0], 0, 0);
+
+	/* In case of DP-MST find suitable mode(s) to fit into the link BW. */
+	if (ret < 0 && errno == ENOSPC &&
+	    crtc_count == RUN_PAIR) {
+
+		if (restart) {
+			igt_info("No suitable modes found to fit into the link BW.\n");
+			goto out;
+		}
+
+		get_suitable_modes(o);
+
+		igt_remove_fb(drm_fd, &o->fb_info[2]);
+		igt_remove_fb(drm_fd, &o->fb_info[1]);
+		igt_remove_fb(drm_fd, &o->fb_info[0]);
+
+		restart = true;
+		goto restart;
+	}
+
+	igt_assert(!ret);
 	igt_assert(fb_is_bound(o, o->fb_ids[0]));
 
 	vblank = kms_has_vblank(drm_fd);
-- 
2.35.1
