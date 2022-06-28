Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A66113583
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 06:10:53 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jun 2022 11:37:30 +0530
Message-Id: <20220628060730.15700-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7] tests/kms_flip: Skip test only for
 invalid combination
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

currently the entire test is skipping. adding this fix to skip test
only for invalid cases and run on other valid display combination.

v2: add RUN_PAIR check to avoid crash on single display.
v3: add flag to check for valid display combination.(Karthik)
v4: if no valid mode is found then flow should go to 'out'.(Karthik)
v5: rebase.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_flip.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 2a57da02..0567edea 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -932,7 +932,7 @@ static bool mode_compatible(const drmModeModeInfo *a, const drmModeModeInfo *b)
 	return true;
 }
 
-static void get_compatible_modes(drmModeModeInfo *a, drmModeModeInfo *b,
+static bool get_compatible_modes(drmModeModeInfo *a, drmModeModeInfo *b,
 				 drmModeConnector *c1, drmModeConnector *c2)
 {
 	int n, m;
@@ -946,14 +946,14 @@ static void get_compatible_modes(drmModeModeInfo *a, drmModeModeInfo *b,
 			for (m = 0; m < c2->count_modes; m++) {
 				*b = c2->modes[m];
 				if (mode_compatible(a, b))
-					return;
+					return true;
 			}
 		}
 
-		igt_skip("Compatible mode not found.\n");
+		return false;
 	}
 
-	return;
+	return true;
 }
 
 static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
@@ -972,13 +972,12 @@ static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
 		return;
 	}
 
-	get_compatible_modes(&mode[0], &mode[1],
-			     config[0].connector, config[1].connector);
+	o->mode_valid = get_compatible_modes(&mode[0], &mode[1],
+					     config[0].connector, config[1].connector);
 
 	o->pipe = config[0].pipe;
 	o->fb_width = mode[0].hdisplay;
 	o->fb_height = mode[0].vdisplay;
-	o->mode_valid = 1;
 
 	o->kconnector[0] = config[0].connector;
 	o->kencoder[0] = config[0].encoder;
@@ -1320,8 +1319,8 @@ static void get_suitable_modes(struct test_output *o)
 		igt_sort_connector_modes(o->kconnector[i],
 					 sort_drm_modes_by_clk_asc);
 
-	get_compatible_modes(&mode[0], &mode[1],
-			     o->kconnector[0], o->kconnector[1]);
+	o->mode_valid = get_compatible_modes(&mode[0], &mode[1],
+					     o->kconnector[0], o->kconnector[1]);
 
 	o->fb_width = mode[0].hdisplay;
 	o->fb_height = mode[0].vdisplay;
@@ -1406,12 +1405,16 @@ retry:
 
 		get_suitable_modes(o);
 
-		igt_remove_fb(drm_fd, &o->fb_info[2]);
-		igt_remove_fb(drm_fd, &o->fb_info[1]);
-		igt_remove_fb(drm_fd, &o->fb_info[0]);
+		if (o->mode_valid) {
+			igt_remove_fb(drm_fd, &o->fb_info[2]);
+			igt_remove_fb(drm_fd, &o->fb_info[1]);
+			igt_remove_fb(drm_fd, &o->fb_info[0]);
+
+			restart = true;
+			goto restart;
+		}
 
-		restart = true;
-		goto restart;
+		goto out;
 	}
 
 	igt_assert(!ret);
-- 
2.36.0
