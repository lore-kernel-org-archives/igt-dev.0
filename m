Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA526EA01
 for <igt-dev@lists.freedesktop.org>; Tue, 25 May 2021 12:16:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 26 May 2021 01:35:08 +0530
Message-Id: <20210525200508.5451-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Fix mode selection for
 Nx tests
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
To: igt-dev@lists.freedesktop.org, imre.deak@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This patch will find the connector/mode combination that fits
into the bandwidth when more than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 95 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 27 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index eb9ac18964..93ccb829e3 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -46,6 +46,9 @@ static int filter_test_id;
 static bool dry_run;
 static bool all_pipes = false;
 
+static char str_buf[MAX_CRTCS][1024];
+static const char *crtc_strs[MAX_CRTCS];
+
 const drmModeModeInfo mode_640_480 = {
 	.name		= "640x480",
 	.vrefresh	= 60,
@@ -540,44 +543,46 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
 		     fabs(mean - expected) / line_time(kmode));
 }
 
-static void test_crtc_config(const struct test_config *tconf,
-			     struct crtc_config *crtcs, int crtc_count)
+static int sort_drm_modes(const void *a, const void *b)
 {
-	char str_buf[MAX_CRTCS][1024];
-	const char *crtc_strs[MAX_CRTCS];
-	struct crtc_config *crtc;
-	static int test_id;
-	bool config_failed = false;
-	int ret = 0;
-	int i;
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
 
-	test_id++;
+	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
+}
 
-	if (filter_test_id && filter_test_id != test_id)
-		return;
+static
+int __test_crtc_config(struct crtc_config *crtcs, int crtc_count,
+		       const struct test_config *tconf, bool *config_failed,
+		       int base)
+{
+	struct crtc_config *crtc = NULL;
+	int ret = 0;
 
-	igt_info("  Test id#%d CRTC count %d\n", test_id, crtc_count);
+	if (base >= crtc_count)
+		return ret;
 
-	for (i = 0; i < crtc_count; i++) {
-		get_crtc_config_str(&crtcs[i], str_buf[i], sizeof(str_buf[i]));
-		crtc_strs[i] = &str_buf[i][0];
-	}
+	crtc = &crtcs[base];
 
-	if (dry_run) {
-		for (i = 0; i < crtc_count; i++)
-			igt_info("    %s\n", crtc_strs[i]);
-		return;
-	}
+	/* Sort the modes in descending order by clock freq. */
+	qsort(crtc->cconfs->connector->modes,
+		crtc->cconfs->connector->count_modes,
+		sizeof(drmModeModeInfo),
+		sort_drm_modes);
 
-	for (i = 0; i < crtc_count; i++) {
+	for (int i = 0; i < crtc->cconfs->connector->count_modes; i++) {
 		uint32_t *ids;
 
-		crtc = &crtcs[i];
+		if (!crtc_supports_mode(crtc, &crtc->cconfs->connector->modes[i]))
+			continue;
+
+		crtc->mode = crtc->cconfs->connector->modes[i];
 
-		igt_info("    %s\n", crtc_strs[i]);
+		get_crtc_config_str(crtc, str_buf[base], sizeof(str_buf[base]));
+		crtc_strs[base] = &str_buf[base][0];
+		igt_info("    %s\n", crtc_strs[base]);
 
 		create_fb_for_crtc(crtc, &crtc->fb_info);
-		paint_fb(&crtc->fb_info, tconf->name, crtc_strs, crtc_count, i);
+		paint_fb(&crtc->fb_info, tconf->name, crtc_strs, crtc_count, base);
 
 		ids = get_connector_ids(crtc);
 		if (tconf->flags & TEST_STEALING)
@@ -589,12 +594,48 @@ static void test_crtc_config(const struct test_config *tconf,
 
 		free(ids);
 
+		if (ret < 0 && errno == ENOSPC)
+			continue;
+
 		if (ret < 0) {
 			igt_assert_eq(errno, EINVAL);
-			config_failed = true;
+			*config_failed = true;
 		}
+
+		return __test_crtc_config(crtcs, crtc_count, tconf, config_failed, base + 1);
+	}
+
+	return ret;
+}
+
+static void test_crtc_config(const struct test_config *tconf,
+			     struct crtc_config *crtcs, int crtc_count)
+{
+	static int test_id;
+	bool config_failed = false;
+	int ret = 0;
+	int i;
+
+	test_id++;
+
+	if (filter_test_id && filter_test_id != test_id)
+		return;
+
+	igt_info("  Test id#%d CRTC count %d\n", test_id, crtc_count);
+
+	for (i = 0; i < crtc_count; i++) {
+		get_crtc_config_str(&crtcs[i], str_buf[i], sizeof(str_buf[i]));
+		crtc_strs[i] = &str_buf[i][0];
 	}
 
+	if (dry_run) {
+		for (i = 0; i < crtc_count; i++)
+			igt_info("    %s\n", crtc_strs[i]);
+		return;
+	}
+
+	ret = __test_crtc_config(crtcs, crtc_count, tconf, &config_failed, 0);
+
 	igt_assert(config_failed == !!(tconf->flags & TEST_INVALID));
 
 	if (ret == 0 && tconf->flags & TEST_TIMINGS)
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
