Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6F710FC5B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 06:42:33 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 12:09:05 +0530
Message-Id: <20220621063905.19989-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_flip: Skip test only for
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index c5b5741a..ccd37a7a 100755
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
@@ -1351,6 +1370,8 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	uint64_t modifier;
 	int i, ret;
 
+	if (crtc_count == RUN_PAIR)
+		compatible_mode_check(o);
 restart:
 	last_connector = o->kconnector[0];
 
-- 
2.36.0
