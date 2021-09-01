Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5BB6E131
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 07:20:39 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed,  1 Sep 2021 12:43:08 +0530
Message-Id: <20210901071308.1244881-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_setmode: Sort modes only if they dont
 fit in link BW
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This patch revers sorting logic and uses it only when modes
tried dont fit into link BW. This avoids failure due to
setting unsupported modes on connector.

Test affected (fail -> pass after change) :
igt@kms_setmode@invalid-clone-single-[crtc|crtc-stealing]

invalid-clone-single-crtc-stealing tests are also passing
with the change.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/kms_setmode.c | 133 ++++++++++++++++++--------------------------
 1 file changed, 53 insertions(+), 80 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 80665204..071af901 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -46,9 +46,6 @@ static int filter_test_id;
 static bool dry_run;
 static bool all_pipes = false;
 
-static char str_buf[MAX_CRTCS][1024];
-static const char *crtc_strs[MAX_CRTCS];
-
 const drmModeModeInfo mode_640_480 = {
 	.name		= "640x480",
 	.vrefresh	= 60,
@@ -547,87 +544,18 @@ static int sort_drm_modes(const void *a, const void *b)
 {
 	const drmModeModeInfo *mode1 = a, *mode2 = b;
 
-	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
-}
-
-static
-int __test_crtc_config(struct crtc_config *crtcs, int crtc_count,
-		       const struct test_config *tconf, bool *config_failed,
-		       int base)
-{
-	struct crtc_config *crtc = NULL;
-	int ret = 0;
-
-	crtc = &crtcs[base];
-
-	/* Sort the modes in descending order by clock freq. */
-	qsort(crtc->cconfs->connector->modes,
-		crtc->cconfs->connector->count_modes,
-		sizeof(drmModeModeInfo),
-		sort_drm_modes);
-
-	for (int i = 0; i < crtc->cconfs->connector->count_modes; i++) {
-		uint32_t *ids;
-
-		crtc->mode = crtc->cconfs->connector->modes[i];
-
-		get_crtc_config_str(crtc, str_buf[base], sizeof(str_buf[base]));
-		crtc_strs[base] = &str_buf[base][0];
-		igt_info("    %s\n", crtc_strs[base]);
-
-		create_fb_for_crtc(crtc, &crtc->fb_info);
-		paint_fb(&crtc->fb_info, tconf->name, crtc_strs, crtc_count, base);
-
-		ids = get_connector_ids(crtc);
-		if (tconf->flags & TEST_STEALING)
-			ret = test_stealing(drm_fd, crtc, ids);
-		else
-			ret = drmModeSetCrtc(drm_fd, crtc->crtc_id,
-					     crtc->fb_info.fb_id, 0, 0, ids,
-					     crtc->connector_count, &crtc->mode);
-
-		free(ids);
-
-		/* crtcs[base].modes[i] don't fit, try next mode. */
-		if (ret < 0 && errno == ENOSPC)
-			continue;
-
-		if (ret < 0) {
-			igt_assert_eq(errno, EINVAL);
-			*config_failed = true;
-
-			return ret;
-		}
-
-		/* Try all crtcs recursively. */
-		if (base + 1 < crtc_count)
-			ret = __test_crtc_config(crtcs, crtc_count, tconf, config_failed, base + 1);
-
-		/*
-		 * With crtcs[base].modes[i], None of the crtc[base+1] modes fits
-		 * into the link BW.
-		 *
-		 * Lets try with crtcs[base].modes[i+1]
-		 */
-		if (ret < 0 && errno == ENOSPC)
-			continue;
-
-		/*
-		 * ret == 0, (or) ret < 0 && errno == EINVAL
-		 * No need to try other modes of crtcs[base].
-		 */
-		return ret;
-	}
-
-	/* When all crtcs[base].modes are tried & failed to fit into link BW. */
-	return ret;
+	return (mode2->clock < mode1->clock) - (mode1->clock < mode2->clock);
 }
 
 static void test_crtc_config(const struct test_config *tconf,
 			     struct crtc_config *crtcs, int crtc_count)
 {
+	char str_buf[MAX_CRTCS][1024];
+	const char *crtc_strs[MAX_CRTCS];
+	struct crtc_config *crtc;
 	static int test_id;
 	bool config_failed = false;
+	bool retry = false;
 	int ret = 0;
 	int i;
 
@@ -638,6 +566,21 @@ static void test_crtc_config(const struct test_config *tconf,
 
 	igt_info("  Test id#%d CRTC count %d\n", test_id, crtc_count);
 
+retry:
+	if (retry) {
+		kmstest_unset_all_crtcs(drm_fd, tconf->resources);
+
+		for (i = 0; i < crtc_count; i++) {
+			/* Sort the modes in asending order by clock freq. */
+			qsort(crtcs[i].cconfs->connector->modes,
+			      crtcs[i].cconfs->connector->count_modes,
+			      sizeof(drmModeModeInfo),
+			      sort_drm_modes);
+
+			crtcs[i].mode = crtcs[i].cconfs->connector->modes[0];
+		}
+	}
+
 	for (i = 0; i < crtc_count; i++) {
 		get_crtc_config_str(&crtcs[i], str_buf[i], sizeof(str_buf[i]));
 		crtc_strs[i] = &str_buf[i][0];
@@ -649,9 +592,39 @@ static void test_crtc_config(const struct test_config *tconf,
 		return;
 	}
 
-	ret = __test_crtc_config(crtcs, crtc_count, tconf, &config_failed, 0);
-	igt_skip_on_f((ret < 0 && errno == ENOSPC),
-			"No suitable mode(s) found to fit into the link BW\n");
+	for (i = 0; i < crtc_count; i++) {
+		uint32_t *ids;
+
+		crtc = &crtcs[i];
+
+		igt_info("    %s\n", crtc_strs[i]);
+
+		create_fb_for_crtc(crtc, &crtc->fb_info);
+		paint_fb(&crtc->fb_info, tconf->name, crtc_strs, crtc_count, i);
+
+		ids = get_connector_ids(crtc);
+		if (tconf->flags & TEST_STEALING)
+			ret = test_stealing(drm_fd, crtc, ids);
+		else
+			ret = drmModeSetCrtc(drm_fd, crtc->crtc_id,
+					     crtc->fb_info.fb_id, 0, 0, ids,
+					     crtc->connector_count, &crtc->mode);
+
+		free(ids);
+
+		if (ret < 0) {
+			if (errno == ENOSPC) {
+				igt_skip_on_f(retry, "No suitable mode(s) found to fit into the link BW.\n");
+
+				retry = true;
+				goto retry;
+			}
+
+			igt_assert_eq(errno, EINVAL);
+			config_failed = true;
+		}
+	}
+
 	igt_assert(config_failed == !!(tconf->flags & TEST_INVALID));
 
 	if (ret == 0 && tconf->flags & TEST_TIMINGS)
-- 
2.31.1
