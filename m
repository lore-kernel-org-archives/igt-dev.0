Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069E28985A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 05:16:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  5 Aug 2021 10:47:16 +0530
Message-Id: <20210805051716.278860-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t V2] tests/kms_setmode: Fix mode selection
 for Nx tests
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Imre Deak <imre.deak@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
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
* Addressed comments from Ankit

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 116 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 88 insertions(+), 28 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 05084c3a7..89220b83e 100644
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
@@ -540,44 +543,43 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
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
-
-	if (filter_test_id && filter_test_id != test_id)
-		return;
+	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
+}

-	igt_info("  Test id#%d CRTC count %d\n", test_id, crtc_count);
+static
+int __test_crtc_config(struct crtc_config *crtcs, int crtc_count,
+		       const struct test_config *tconf, bool *config_failed,
+		       int base)
+{
+	struct crtc_config *crtc = NULL;
+	int ret = 0;

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
@@ -589,12 +591,70 @@ static void test_crtc_config(const struct test_config *tconf,

 		free(ids);

+		/* crtcs[base].modes[i] don't fit, try next mode. */
+		if (ret < 0 && errno == ENOSPC)
+			continue;
+
 		if (ret < 0) {
 			igt_assert_eq(errno, EINVAL);
-			config_failed = true;
+			*config_failed = true;
+
+			return ret;
 		}
+
+		/* Try all crtcs recursively. */
+		if (base + 1 < crtc_count)
+			ret = __test_crtc_config(crtcs, crtc_count, tconf, config_failed, base + 1);
+
+		/*
+		 * With crtcs[base].modes[i], None of the crtc[base+1] modes fits
+		 * into the link BW.
+		 *
+		 * Lets try with crtcs[base].modes[i+1]
+		 */
+		if (ret < 0 && errno == ENOSPC)
+			continue;
+
+		/*
+		 * ret == 0, (or) ret < 0 && errno == EINVAL
+		 * No need to try other modes of crtcs[base].
+		 */
+		return ret;
+	}
+
+	/* When all crtcs[base].modes are tried & failed to fit into link BW. */
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
+	}
+
+	if (dry_run) {
+		for (i = 0; i < crtc_count; i++)
+			igt_info("    %s\n", crtc_strs[i]);
+		return;
 	}

+	ret = __test_crtc_config(crtcs, crtc_count, tconf, &config_failed, 0);
+	igt_skip_on_f((ret < 0 && errno == ENOSPC),
+			"No suitable mode(s) found to fit into the link BW\n");
 	igt_assert(config_failed == !!(tconf->flags & TEST_INVALID));

 	if (ret == 0 && tconf->flags & TEST_TIMINGS)
--
2.32.0
