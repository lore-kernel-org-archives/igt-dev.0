Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC57113C0B
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 07:50:46 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Jun 2022 13:17:18 +0530
Message-Id: <20220622074718.31349-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_flip: Skip test only for
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
 tests/kms_flip.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index c5b5741a..12641a93 100755
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
+	return false;
 }
 
 static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
-- 
2.36.0
