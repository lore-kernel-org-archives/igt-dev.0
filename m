Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD01A113451
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 08:06:47 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Jun 2022 13:33:12 +0530
Message-Id: <20220622080312.31625-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_flip: Skip test only for
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index c5b5741a..90b3e352 100755
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
@@ -946,14 +946,13 @@ static void get_compatible_modes(drmModeModeInfo *a, drmModeModeInfo *b,
 			for (m = 0; m < c2->count_modes; m++) {
 				*b = c2->modes[m];
 				if (mode_compatible(a, b))
-					return;
+					return true;
 			}
 		}
-
-		igt_skip("Compatible mode not found.\n");
+		return false;
 	}
 
-	return;
+	return true;
 }
 
 static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
@@ -972,13 +971,12 @@ static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
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
-- 
2.36.0
