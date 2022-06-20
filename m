Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179BA10EA41
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jun 2022 20:02:10 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 01:28:41 +0530
Message-Id: <20220620195841.18245-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Skip test only for invalid
 combination
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index c5b5741a..b443a7be 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -949,8 +949,8 @@ static void get_compatible_modes(drmModeModeInfo *a, drmModeModeInfo *b,
 					return;
 			}
 		}
-
-		igt_skip("Compatible mode not found.\n");
+		*a = c1->modes[0];
+		*b = c2->modes[0];
 	}
 
 	return;
@@ -1318,6 +1318,25 @@ static int sort_drm_modes(const void *a, const void *b)
 	return (mode2->clock < mode1->clock) - (mode1->clock < mode2->clock);
 }
 
+static void compatible_mode_check(struct test_output *o)
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
+	if (mode[0].hdisplay != mode[1].hdisplay && mode[0].vdisplay != mode[1].vdisplay)
+		igt_skip("Compatible mode not found.\n");
+}
+
 static void get_suitable_modes(struct test_output *o)
 {
 	drmModeModeInfo mode[2];
@@ -1351,6 +1370,7 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	uint64_t modifier;
 	int i, ret;
 
+	compatible_mode_check(o);
 restart:
 	last_connector = o->kconnector[0];
 
-- 
2.36.0
