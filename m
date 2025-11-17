Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF21CEBF61
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 08:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD7E10E19D;
	Mon, 17 Nov 2025 08:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJ+b9qGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6436D10E18C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 05:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763357142; x=1794893142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L3NMpVPra6rdCmToEwqd2oAy/oi8JB1M+Uhdl80fT3M=;
 b=FJ+b9qGnUkAcodidPdBKE+CSXS6IQxLUr24Gi9pgdz4p382ojY/Xvl3f
 vvXyMIeGgidF8le0bAEQRxbjEeFMk64hTpQW5j5z7AUQN1PMvJx1X6JPh
 gesa+DTvzbzNLjO1EJdlSvmxIcBeI0VdsdRuzyE7IB4JRlRJnAaD2c9CV
 OVLNSyQx/hfEgDa6rtZ15DpeXuGpUVO+eRFB+71rnflSHOGI0U4EdLFdt
 Z9OG8iY7iW56jhACWcPAjJXYBAtM4mOfu25Nl6GNCJVMeCBBp8qCaYj2a
 nYrEuZDCVgmMBm1Kq0Eqw78Wx+5A1OFqTskoBo3G57/3B+/0IV9FSnikS Q==;
X-CSE-ConnectionGUID: OcktTTJXSB2GSwExfYP0ug==
X-CSE-MsgGUID: 3Mqzwq6XTJ+pKAn2ETvsnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="67955872"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="67955872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:25:42 -0800
X-CSE-ConnectionGUID: i08sznFiRdSFQVEL7HOIiQ==
X-CSE-MsgGUID: ZBS5J+jASAy1yq0EkxBftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="190372749"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 16 Nov 2025 21:25:40 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [v14 i-g-t 1/2] tests/intel/i915_pm_rps: Add Multi-GT support for
 freq scaling tests
Date: Mon, 17 Nov 2025 10:55:08 +0530
Message-ID: <20251117052506.578422-5-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117052506.578422-4-mallesh.koujalagi@intel.com>
References: <20251117052506.578422-4-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Nov 2025 08:08:03 +0000
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Extends the RPS (Render P-States) test framework to support Multi-GT
configurations. This patch support the frequency scaling tests to
work with Multi-GT GPU architectures by:

- Refactoring global frequency arrays to per-GT data structures
- Adding GT enumeration and initialization logic
- Updating all frequency validation functions to operate per-GT
- Extending min-max configuration tests across multiple GT tiles
- Ensuring frequency scaling verification works for each GT independently

The changes ensure that basic frequency scaling tests work correctly
across Multi-GT configurations.

v2: Split the patches based on test cases. (Vinay/Anirban)

v3: Remove while loop in restore and boost_freq functions. (Anirban)

v4: Refactor GT initialization to use detection loop for proper
    multi-tile suppor. (Vinay)

v5: Consistently use gt_id instead of sysfs_gt. (Vinay)

v6: Refactor Multi-GT code.

v7: Use GT in load runner. (Vinay)

v8: Refactor first and second patch.

v9: Replace sysfs_gt to gt_id. (Vinay)
  - Add read sysfs file code to separate function. (Vinay)
  - Move GT initialization function to first patch. (Vinay)
  - Remove the comment. (Vinay)

v10: Change generic description of each patch. (Vinay)
   - Rename read_sysfs_to_origfreq to read_sysfs_freq
   - Move load_helper_run function to first patch

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 tests/intel/i915_pm_rps.c | 369 ++++++++++++++++++++++----------------
 1 file changed, 219 insertions(+), 150 deletions(-)

diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 80f3e76c1..9a1af20c9 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -77,7 +77,11 @@
  * SUBTEST: waitboost
  */
 
+#define NUMFREQ		8
+#define MAX_GTS		8
+
 IGT_TEST_DESCRIPTION("Render P-States tests - verify GPU frequency changes");
+static void dump(const int *freqs, int gt_id);
 
 static int drm_fd;
 
@@ -89,28 +93,63 @@ enum {
 	RP0,
 	RP1,
 	RPn,
-	BOOST,
-	NUMFREQ
+	BOOST
 };
 
-static int origfreqs[NUMFREQ];
+static int origfreqs[MAX_GTS][NUMFREQ];
 
 struct sysfs_file {
 	const char *name;
 	const char *mode;
 	FILE *filp;
-} sysfs_files[] = {
-	{ "act", "r", NULL },
-	{ "cur", "r", NULL },
-	{ "min", "rb+", NULL },
-	{ "max", "rb+", NULL },
-	{ "RP0", "r", NULL },
-	{ "RP1", "r", NULL },
-	{ "RPn", "r", NULL },
-	{ "boost", "rb+", NULL },
-	{ NULL, NULL, NULL }
+} sysfs_files[MAX_GTS][NUMFREQ];
+
+static const char *freq_names[NUMFREQ] = {
+	[ACT]   = "act",
+	[CUR]   = "cur",
+	[MIN]   = "min",
+	[MAX]   = "max",
+	[RP0]   = "RP0",
+	[RP1]   = "RP1",
+	[RPn]   = "RPn",
+	[BOOST] = "boost"
+};
+
+static const char *freq_modes[NUMFREQ] = {
+	[ACT]   = "r",
+	[CUR]   = "r",
+	[MIN]   = "rb+",
+	[MAX]   = "rb+",
+	[RP0]   = "r",
+	[RP1]   = "r",
+	[RPn]   = "r",
+	[BOOST] = "rb+"
 };
 
+static void init_sysfs_files(void)
+{
+	int tmp, gt;
+	int actual_gt_count = 0;
+
+	/* Count actual GTs and initialize sysfs_files dynamically */
+	i915_for_each_gt(drm_fd, tmp, gt) {
+		if (gt >= MAX_GTS) {
+			igt_warn("GT index %d exceeds MAX_GTS (%d), skipping\n", gt, MAX_GTS);
+			continue;
+		}
+
+		actual_gt_count = gt + 1;
+
+		for (int j = 0; j < NUMFREQ; j++) {
+			sysfs_files[gt][j].name = freq_names[j];
+			sysfs_files[gt][j].mode = freq_modes[j];
+			sysfs_files[gt][j].filp = NULL;
+		}
+	}
+
+	igt_debug("Detected %d GT(s)\n", actual_gt_count);
+}
+
 static int readval(FILE *filp)
 {
 	int val;
@@ -123,12 +162,12 @@ static int readval(FILE *filp)
 	return val;
 }
 
-static void read_freqs(int *freqs)
+static void read_freqs(int *freqs, int gt_id)
 {
 	int i;
 
 	for (i = 0; i < NUMFREQ; i++)
-		freqs[i] = readval(sysfs_files[i].filp);
+		freqs[i] = readval(sysfs_files[gt_id][i].filp);
 }
 
 static void nsleep(unsigned long ns)
@@ -147,14 +186,13 @@ static void nsleep(unsigned long ns)
 	} while (ret && errno == EINTR);
 }
 
-static void wait_freq_settle(void)
+static void wait_freq_settle(int gt_id)
 {
 	int timeout = 10;
 
 	while (1) {
 		int freqs[NUMFREQ];
-
-		read_freqs(freqs);
+		read_freqs(freqs, gt_id);
 		if (freqs[CUR] >= freqs[MIN] && freqs[CUR] <= freqs[MAX])
 			break;
 		nsleep(1000000);
@@ -163,7 +201,7 @@ static void wait_freq_settle(void)
 	}
 }
 
-static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check)
+static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int gt_id)
 {
 	int ret, orig;
 
@@ -177,24 +215,30 @@ static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check)
 		if (readback_check)
 			igt_assert_eq(readval(filp), orig);
 	} else {
+		if (ret < 0) {
+			int freqs[NUMFREQ];
+
+			read_freqs(freqs, gt_id);
+			dump(freqs, gt_id);
+		}
 		/* Expecting no error */
 		igt_assert_lt(0, ret);
-		wait_freq_settle();
+		wait_freq_settle(gt_id);
 		if (readback_check)
 			igt_assert_eq(readval(filp), val);
 	}
 
 	return ret;
 }
-#define writeval(filp, val) do_writeval(filp, val, 0, true)
-#define writeval_inval(filp, val) do_writeval(filp, val, EINVAL, true)
-#define writeval_nocheck(filp, val) do_writeval(filp, val, 0, false)
+
+#define writeval(filp, val, gt_id) do_writeval(filp, val, 0, true, gt_id)
+#define writeval_inval(filp, val, gt_id) do_writeval(filp, val, EINVAL, true, gt_id)
+#define writeval_nocheck(filp, val, gt_id) do_writeval(filp, val, 0, false, gt_id)
 
 static void check_freq_constraints(const int *freqs)
 {
 	igt_assert_lte(freqs[MIN], freqs[MAX]);
 	igt_assert_lte(freqs[CUR], freqs[MAX]);
-	igt_assert_lte(freqs[RPn], freqs[CUR]);
 	igt_assert_lte(freqs[RPn], freqs[MIN]);
 	igt_assert_lte(freqs[MAX], freqs[RP0]);
 	igt_assert_lte(freqs[RP1], freqs[RP0]);
@@ -203,14 +247,13 @@ static void check_freq_constraints(const int *freqs)
 	igt_assert_neq(freqs[RP1], 0);
 }
 
-static void dump(const int *freqs)
+static void dump(const int *freqs, int gt_id)
 {
 	int i;
 
-	igt_debug("gt freq (MHz):");
+	igt_debug("gt%d freq (MHz):", gt_id);
 	for (i = 0; i < NUMFREQ; i++)
-		igt_debug("  %s=%d", sysfs_files[i].name, freqs[i]);
-
+		igt_debug("  %s=%d", sysfs_files[gt_id][i].name, freqs[i]);
 	igt_debug("\n");
 }
 
@@ -224,6 +267,7 @@ static struct load_helper {
 	enum load load;
 	bool exit;
 	bool signal;
+	int target_gt;
 	struct igt_helper_process igt_proc;
 } lh;
 
@@ -260,7 +304,7 @@ static void load_helper_set_load(enum load load)
 	load_helper_sync();
 }
 
-static void load_helper_run(enum load load)
+static void load_helper_run(enum load load, int target_gt)
 {
 	int link[2];
 
@@ -278,6 +322,7 @@ static void load_helper_run(enum load load)
 	lh.exit = false;
 	lh.load = load;
 	lh.signal = true;
+	lh.target_gt = target_gt;
 
 	pipe(link);
 	lh.link = link[1];
@@ -287,19 +332,21 @@ static void load_helper_run(enum load load)
 		bool prev_load;
 		uint32_t handle;
 		uint64_t ahnd;
+		const intel_ctx_t *ctx;
 
 		intel_allocator_init();
-		ahnd = get_reloc_ahnd(drm_fd, 0);
+		ctx = intel_ctx_create_for_gt(drm_fd, lh.target_gt);
+		ahnd = get_reloc_ahnd(drm_fd, ctx->id);
 
 		signal(SIGTERM, load_helper_signal_handler);
 		signal(SIGUSR2, load_helper_signal_handler);
 
-		igt_debug("Applying %s load...\n", lh.load ? "high" : "low");
+		igt_debug("Applying %s load on GT%d...\n", lh.load ? "high" : "low", lh.target_gt);
 
 		prev_load = lh.load == HIGH;
-		spin[0] = __igt_spin_new(drm_fd, .ahnd = ahnd);
+		spin[0] = __igt_spin_new(drm_fd, .ahnd = ahnd, .ctx = ctx);
 		if (prev_load)
-			spin[1] = __igt_spin_new(drm_fd, .ahnd = ahnd);
+			spin[1] = __igt_spin_new(drm_fd, .ahnd = ahnd, .ctx = ctx);
 		prev_load = !prev_load; /* send the initial signal */
 		while (!lh.exit) {
 			bool high_load;
@@ -319,7 +366,7 @@ static void load_helper_run(enum load load)
 			} else {
 				spin[0] = spin[1];
 			}
-			spin[high_load] = __igt_spin_new(drm_fd, .ahnd = ahnd);
+			spin[high_load] = __igt_spin_new(drm_fd, .ahnd = ahnd, .ctx = ctx);
 
 			if (lh.signal && high_load != prev_load) {
 				igt_assert_eq(write(lh.link, &lh.signal, sizeof(lh.signal)),
@@ -352,6 +399,7 @@ static void load_helper_run(enum load load)
 		igt_spin_free(drm_fd, spin[1]);
 		igt_spin_free(drm_fd, spin[0]);
 		put_ahnd(ahnd);
+		intel_ctx_destroy(drm_fd, ctx);
 	}
 
 	close(lh.link);
@@ -367,22 +415,22 @@ static void load_helper_stop(void)
 	igt_assert(igt_wait_helper(&lh.igt_proc) == 0);
 }
 
-static void do_load_gpu(void)
+static void do_load_gpu(int target_gt)
 {
-	load_helper_run(LOW);
+	load_helper_run(LOW, target_gt);
 	nsleep(10000000);
 	load_helper_stop();
 }
 
 /* Return a frequency rounded by HW to the nearest supported value */
-static int get_hw_rounded_freq(int target)
+static int get_hw_rounded_freq(int target, int gt_id)
 {
 	int freqs[NUMFREQ];
 	int old_freq;
 	int idx;
 	int ret;
 
-	read_freqs(freqs);
+	read_freqs(freqs, gt_id);
 
 	if (freqs[MIN] > target)
 		idx = MIN;
@@ -390,10 +438,10 @@ static int get_hw_rounded_freq(int target)
 		idx = MAX;
 
 	old_freq = freqs[idx];
-	writeval_nocheck(sysfs_files[idx].filp, target);
-	read_freqs(freqs);
+	writeval_nocheck(sysfs_files[gt_id][idx].filp, target, gt_id);
+	read_freqs(freqs, gt_id);
 	ret = freqs[idx];
-	writeval_nocheck(sysfs_files[idx].filp, old_freq);
+	writeval_nocheck(sysfs_files[gt_id][idx].filp, old_freq, gt_id);
 
 	return ret;
 }
@@ -402,112 +450,112 @@ static int get_hw_rounded_freq(int target)
  * Modify softlimit MIN and MAX freqs to valid and invalid levels. Depending
  * on subtest run different check after each modification.
  */
-static void min_max_config(void (*check)(void), bool load_gpu)
+static void min_max_config(void (*check)(int), bool load_gpu, int gt_id)
 {
-	int fmid = (origfreqs[RPn] + origfreqs[RP0]) / 2;
+	int fmid = (origfreqs[gt_id][RPn] + origfreqs[gt_id][RP0]) / 2;
 
 	/*
 	 * hw (and so kernel) rounds to the nearest value supported by
 	 * the given platform.
 	 */
-	fmid = get_hw_rounded_freq(fmid);
+	fmid = get_hw_rounded_freq(fmid, gt_id);
 
 	igt_debug("\nCheck original min and max...\n");
 	if (load_gpu)
-		do_load_gpu();
-	check();
+		do_load_gpu(gt_id);
+	check(gt_id);
 
 	igt_debug("\nSet min=RPn and max=RP0...\n");
-	writeval(sysfs_files[MIN].filp, origfreqs[RPn]);
-	writeval(sysfs_files[MAX].filp, origfreqs[RP0]);
+	writeval(sysfs_files[gt_id][MIN].filp, origfreqs[gt_id][RPn], gt_id);
+	writeval(sysfs_files[gt_id][MAX].filp, origfreqs[gt_id][RP0], gt_id);
 	if (load_gpu)
-		do_load_gpu();
-	check();
+		do_load_gpu(gt_id);
+	check(gt_id);
 
 	igt_debug("\nIncrease min to midpoint...\n");
-	writeval(sysfs_files[MIN].filp, fmid);
+	writeval(sysfs_files[gt_id][MIN].filp, fmid, gt_id);
 	if (load_gpu)
-		do_load_gpu();
-	check();
+		do_load_gpu(gt_id);
+	check(gt_id);
 
 	igt_debug("\nIncrease min to RP0...\n");
-	writeval(sysfs_files[MIN].filp, origfreqs[RP0]);
+	writeval(sysfs_files[gt_id][MIN].filp, origfreqs[gt_id][RP0], gt_id);
 	if (load_gpu)
-		do_load_gpu();
-	check();
+		do_load_gpu(gt_id);
+	check(gt_id);
 
 	igt_debug("\nIncrease min above RP0 (invalid)...\n");
-	writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0] + 1000);
-	check();
+	writeval_inval(sysfs_files[gt_id][MIN].filp, origfreqs[gt_id][RP0] + 1000, gt_id);
+	check(gt_id);
 
-	if (origfreqs[RPn] < origfreqs[RP0]) {
+	if (origfreqs[gt_id][RPn] < origfreqs[gt_id][RP0]) {
 		igt_debug("\nDecrease max to RPn (invalid)...\n");
-		writeval_inval(sysfs_files[MAX].filp, origfreqs[RPn]);
-		check();
+		writeval_inval(sysfs_files[gt_id][MAX].filp, origfreqs[gt_id][RPn], gt_id);
+		check(gt_id);
 	}
 
 	igt_debug("\nDecrease min to midpoint...\n");
-	writeval(sysfs_files[MIN].filp, fmid);
+	writeval(sysfs_files[gt_id][MIN].filp, fmid, gt_id);
 	if (load_gpu)
-		do_load_gpu();
-	check();
+		do_load_gpu(gt_id);
+	check(gt_id);
 
 	igt_debug("\nDecrease min to RPn...\n");
-	writeval(sysfs_files[MIN].filp, origfreqs[RPn]);
+	writeval(sysfs_files[gt_id][MIN].filp, origfreqs[gt_id][RPn], gt_id);
 	if (load_gpu)
-		do_load_gpu();
-	check();
+		do_load_gpu(gt_id);
+	check(gt_id);
 
 	igt_debug("\nDecrease min below RPn (invalid)...\n");
-	writeval_inval(sysfs_files[MIN].filp, 0);
-	check();
+	writeval_inval(sysfs_files[gt_id][MIN].filp, 0, gt_id);
+	check(gt_id);
 
 	igt_debug("\nDecrease max to midpoint...\n");
-	writeval(sysfs_files[MAX].filp, fmid);
-	check();
+	writeval(sysfs_files[gt_id][MAX].filp, fmid, gt_id);
+	check(gt_id);
 
 	igt_debug("\nDecrease max to RPn...\n");
-	writeval(sysfs_files[MAX].filp, origfreqs[RPn]);
-	check();
+	writeval(sysfs_files[gt_id][MAX].filp, origfreqs[gt_id][RPn], gt_id);
+	check(gt_id);
 
 	igt_debug("\nDecrease max below RPn (invalid)...\n");
-	writeval_inval(sysfs_files[MAX].filp, 0);
-	check();
+	writeval_inval(sysfs_files[gt_id][MAX].filp, 0, gt_id);
+	check(gt_id);
 
-	if (origfreqs[RP0] > origfreqs[RPn]) {
+	if (origfreqs[gt_id][RP0] > origfreqs[gt_id][RPn]) {
 		igt_debug("\nIncrease min to RP0 (invalid)...\n");
-		writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0]);
-		check();
+		writeval_inval(sysfs_files[gt_id][MIN].filp, origfreqs[gt_id][RP0], gt_id);
+		check(gt_id);
 	}
 
 	igt_debug("\nIncrease max to midpoint...\n");
-	writeval(sysfs_files[MAX].filp, fmid);
-	check();
+	writeval(sysfs_files[gt_id][MAX].filp, fmid, gt_id);
+	check(gt_id);
 
 	igt_debug("\nIncrease max to RP0...\n");
-	writeval(sysfs_files[MAX].filp, origfreqs[RP0]);
-	check();
+	writeval(sysfs_files[gt_id][MAX].filp, origfreqs[gt_id][RP0], gt_id);
+	check(gt_id);
 
 	igt_debug("\nIncrease max above RP0 (invalid)...\n");
-	writeval_inval(sysfs_files[MAX].filp, origfreqs[RP0] + 1000);
-	check();
+	writeval_inval(sysfs_files[gt_id][MAX].filp, origfreqs[gt_id][RP0] + 1000, gt_id);
+	check(gt_id);
 
-	writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
-	writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
+	writeval(sysfs_files[gt_id][MIN].filp, origfreqs[gt_id][MIN], gt_id);
+	writeval(sysfs_files[gt_id][MAX].filp, origfreqs[gt_id][MAX], gt_id);
 }
 
-static void basic_check(void)
+static void basic_check(int gt_id)
 {
 	int freqs[NUMFREQ];
 
-	read_freqs(freqs);
-	dump(freqs);
+	read_freqs(freqs, gt_id);
+	dump(freqs, gt_id);
 	check_freq_constraints(freqs);
 }
 
 #define IDLE_WAIT_TIMESTEP_MSEC 250
 #define IDLE_WAIT_TIMEOUT_MSEC 2500
-static void idle_check(void)
+static void idle_check(int gt_id)
 {
 	int freqs[NUMFREQ];
 	int wait = 0;
@@ -515,8 +563,8 @@ static void idle_check(void)
 	/* Monitor frequencies until cur settles down to min, which should
 	 * happen within the allotted time */
 	do {
-		read_freqs(freqs);
-		dump(freqs);
+		read_freqs(freqs, gt_id);
+		dump(freqs, gt_id);
 		check_freq_constraints(freqs);
 		if (freqs[ACT] <= freqs[RPn])
 			break;
@@ -532,7 +580,7 @@ static void idle_check(void)
 
 #define LOADED_WAIT_TIMESTEP_MSEC 100
 #define LOADED_WAIT_TIMEOUT_MSEC 3000
-static void loaded_check(void)
+static void loaded_check(int gt_id)
 {
 	int freqs[NUMFREQ];
 	int wait = 0;
@@ -540,8 +588,8 @@ static void loaded_check(void)
 	/* Monitor frequencies until cur increases to max, which should
 	 * happen within the allotted time */
 	do {
-		read_freqs(freqs);
-		dump(freqs);
+		read_freqs(freqs, gt_id);
+		dump(freqs, gt_id);
 		check_freq_constraints(freqs);
 		if (freqs[CUR] >= freqs[MAX])
 			break;
@@ -556,19 +604,19 @@ static void loaded_check(void)
 
 #define STABILIZE_WAIT_TIMESTEP_MSEC 250
 #define STABILIZE_WAIT_TIMEOUT_MSEC 15000
-static void stabilize_check(int *out)
+static void stabilize_check(int *out, int gt_id)
 {
 	int freqs[NUMFREQ];
 	int wait = 0;
 
 	/* Monitor frequencies until HW will stabilize cur frequency.
 	 * It should happen within allotted time */
-	read_freqs(freqs);
-	dump(freqs);
+	read_freqs(freqs, gt_id);
+	dump(freqs, gt_id);
 	usleep(1000 * STABILIZE_WAIT_TIMESTEP_MSEC);
 	do {
-		read_freqs(out);
-		dump(out);
+		read_freqs(out, gt_id);
+		dump(out, gt_id);
 
 		if (memcmp(freqs, out, sizeof(freqs)) == 0)
 			break;
@@ -581,7 +629,7 @@ static void stabilize_check(int *out)
 	igt_debug("Waited %d msec to stabilize cur\n", wait);
 }
 
-static void boost_freq(int fd, int *boost_freqs)
+static void boost_freq(int fd, int *boost_freqs, int gt_id)
 {
 	int64_t timeout = 1;
 	igt_spin_t *load;
@@ -596,8 +644,8 @@ static void boost_freq(int fd, int *boost_freqs)
 	/* Waiting will grant us a boost to maximum */
 	gem_wait(fd, load->handle, &timeout);
 
-	read_freqs(boost_freqs);
-	dump(boost_freqs);
+	read_freqs(boost_freqs, gt_id);
+	dump(boost_freqs, gt_id);
 
 	/* Avoid downlocking till boost request is pending */
 	igt_spin_end(load);
@@ -606,21 +654,22 @@ static void boost_freq(int fd, int *boost_freqs)
 	put_ahnd(ahnd);
 }
 
-static void waitboost(int fd, bool reset)
+static void waitboost(int fd, bool reset, int gt_id)
 {
 	int pre_freqs[NUMFREQ];
 	int boost_freqs[NUMFREQ];
 	int post_freqs[NUMFREQ];
-	int fmid = (origfreqs[RPn] + origfreqs[RP0]) / 2;
-	fmid = get_hw_rounded_freq(fmid);
+	int fmid = (origfreqs[gt_id][RPn] + origfreqs[gt_id][RP0]) / 2;
 
-	igt_require(origfreqs[RP0] > origfreqs[RPn]);
+	fmid = get_hw_rounded_freq(fmid, gt_id);
 
-	load_helper_run(LOW);
+	igt_require(origfreqs[gt_id][RP0] > origfreqs[gt_id][RPn]);
+
+	load_helper_run(LOW, gt_id);
 
 	igt_debug("Apply low load...\n");
 	sleep(1);
-	stabilize_check(pre_freqs);
+	stabilize_check(pre_freqs, gt_id);
 
 	if (reset) {
 		igt_debug("Reset gpu...\n");
@@ -629,23 +678,23 @@ static void waitboost(int fd, bool reset)
 	}
 
 	/* Set max freq to less than boost freq */
-	writeval(sysfs_files[MAX].filp, fmid);
+	writeval(sysfs_files[gt_id][MAX].filp, fmid, gt_id);
 
 	/* When we wait upon the GPU, we want to temporarily boost it
 	 * to maximum.
 	 */
-	boost_freq(fd, boost_freqs);
+	boost_freq(fd, boost_freqs, gt_id);
 
 	/* Set max freq to original softmax */
-	writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
+	writeval(sysfs_files[gt_id][MAX].filp, origfreqs[gt_id][MAX], gt_id);
 
 	igt_debug("Apply low load again...\n");
 	sleep(1);
-	stabilize_check(post_freqs);
+	stabilize_check(post_freqs, gt_id);
 
 	igt_debug("Removing load...\n");
 	load_helper_stop();
-	idle_check();
+	idle_check(gt_id);
 
 	igt_assert_lt(pre_freqs[CUR], pre_freqs[MAX]);
 	igt_assert_eq(boost_freqs[CUR], boost_freqs[BOOST]);
@@ -899,13 +948,17 @@ static void engine_order(int i915)
 
 static void pm_rps_exit_handler(int sig)
 {
-	if (sysfs_files[MAX].filp) {
-		if (origfreqs[MIN] > readval(sysfs_files[MAX].filp)) {
-			writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
-			writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
-		} else {
-			writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
-			writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
+	int tmp, gt;
+
+	i915_for_each_gt(drm_fd, tmp, gt) {
+		if (sysfs_files[gt][MAX].filp) {
+			if (origfreqs[gt][MIN] > readval(sysfs_files[gt][MAX].filp)) {
+				writeval(sysfs_files[gt][MAX].filp, origfreqs[gt][MAX], gt);
+				writeval(sysfs_files[gt][MIN].filp, origfreqs[gt][MIN], gt);
+			} else {
+				writeval(sysfs_files[gt][MIN].filp, origfreqs[gt][MIN], gt);
+				writeval(sysfs_files[gt][MAX].filp, origfreqs[gt][MAX], gt);
+			}
 		}
 	}
 
@@ -1080,26 +1133,19 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
 	put_ahnd(ahnd);
 }
 
-igt_main
+static void read_sysfs_freq(char *sysfs_path)
 {
-	igt_fixture {
-		struct sysfs_file *sysfs_file = sysfs_files;
-		char sysfs_path[80];
-		int ret;
+	int tmp, gt;
 
-		/* Use drm_open_driver to verify device existence */
-		drm_fd = drm_open_driver(DRIVER_INTEL);
-		igt_require_gem(drm_fd);
-		igt_require(gem_can_store_dword(drm_fd, 0));
-		igt_assert(igt_sysfs_path(drm_fd, sysfs_path,
-					  sizeof(sysfs_path)));
-
-		do {
+	i915_for_each_gt(drm_fd, tmp, gt) {
+		for (int j = 0; j < NUMFREQ; j++) {
+			struct sysfs_file *sysfs_file = &sysfs_files[gt][j];
 			int val = -1;
 			char *path;
+			int ret;
 
-			ret = asprintf(&path, "%s/gt_%s_freq_mhz",
-				       sysfs_path, sysfs_file->name);
+			ret = asprintf(&path, "%s/gt/gt%d/rps_%s_freq_mhz",
+				       sysfs_path, gt, sysfs_file->name);
 			igt_assert(ret != -1);
 			sysfs_file->filp = fopen(path, sysfs_file->mode);
 			igt_require(sysfs_file->filp);
@@ -1107,39 +1153,64 @@ igt_main
 
 			val = readval(sysfs_file->filp);
 			igt_assert(val >= 0);
-			sysfs_file++;
-		} while (sysfs_file->name != NULL);
+			origfreqs[gt][j] = val;
+			free(path);
+		}
+	}
+}
 
-		read_freqs(origfreqs);
+igt_main
+{
+	int tmp, gt;
 
+	igt_fixture {
+		char sysfs_path[80];
+
+		/* Use drm_open_driver to verify device existence */
+		drm_fd = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(drm_fd);
+		igt_require(gem_can_store_dword(drm_fd, 0));
+		igt_assert(igt_sysfs_path(drm_fd, sysfs_path,
+					  sizeof(sysfs_path)));
+		/* Initialize sysfs_files str dynamically based on actual GTs */
+		init_sysfs_files();
+		read_sysfs_freq(sysfs_path);
 		igt_install_exit_handler(pm_rps_exit_handler);
 	}
 
 	igt_subtest("basic-api") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
-		min_max_config(basic_check, false);
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			min_max_config(basic_check, false, gt);
+		}
 	}
 
 	/* Verify the constraints, check if we can reach idle */
 	igt_subtest("min-max-config-idle") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
-		min_max_config(idle_check, true);
+			i915_for_each_gt(drm_fd, tmp, gt) {
+				min_max_config(idle_check, true, gt);
+			}
 	}
 
 	/* Verify the constraints with high load, check if we can reach max */
 	igt_subtest("min-max-config-loaded") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
-		load_helper_run(HIGH);
-		min_max_config(loaded_check, false);
-		load_helper_stop();
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			load_helper_run(HIGH, gt);
+			min_max_config(loaded_check, false, gt);
+			load_helper_stop();
+		}
 	}
 
 	/* Checks if we achieve boost using gem_wait */
 	igt_subtest("waitboost") {
-		waitboost(drm_fd, false);
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			waitboost(drm_fd, false, gt);
+		}
 	}
 
 	igt_describe("Check if the order of fences does not affect waitboosting");
@@ -1156,12 +1227,13 @@ igt_main
 	igt_subtest("reset") {
 		igt_hang_t hang;
 		hang = igt_allow_hang(drm_fd, 0, 0);
-		waitboost(drm_fd, true);
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			waitboost(drm_fd, true, gt);
+		}
 		igt_disallow_hang(drm_fd, hang);
 	}
 
 	igt_subtest_with_dynamic("thresholds-idle") {
-		int tmp, gt;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
@@ -1171,7 +1243,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("thresholds") {
-		int tmp, gt;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
@@ -1181,7 +1252,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("thresholds-park") {
-		int tmp, gt;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
@@ -1191,7 +1261,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("thresholds-idle-park") {
-		int tmp, gt;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 
-- 
2.45.2

