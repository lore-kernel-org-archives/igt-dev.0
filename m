Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8348ACA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 09:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6AD10E625;
	Tue, 26 Aug 2025 09:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjK/40QN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD18810E5CC
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 06:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756190895; x=1787726895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pKu+YeW8xRK1FHZguf9mYKKBOQTYvVhPj1zWNBuSaFA=;
 b=HjK/40QNJESdBkV9UK7EguaH9cD2I1kV6yVdI6GDetCfTO35kLN4ZlNt
 WDjOndosD2cM3YqWMOeNP3ScbVdU2+TSr5kFOlPxtkC4Q+eg+fDMq9bS9
 BdZ96WF7TNou+IjXOUVITb+g1QXfNf6ijPbMVUg+1hdbVXaFSowmscF1l
 L+OrQb2qofW/2ZbFIbJH64yO2mfhdteW9C6xbum3/J/G9y0RllWNk/vaj
 tO/M1C05ii2Uj8CyRiR1IPYGaPg+LuHeZaynjDt1fJs7ekB+kE7ppWBdr
 lSfoBK56A5Hfib4eNg2iy2iHIRFYsbfqGlUaxQQ2AVWaXS0AoI5dRZubq Q==;
X-CSE-ConnectionGUID: PJWkCESPTza6SLzXvrNSFA==
X-CSE-MsgGUID: 7aL+/XjJReqbAZN9E0CDZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58472371"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58472371"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:48:14 -0700
X-CSE-ConnectionGUID: I/8AXQN4Q8eTAttBMRVuYQ==
X-CSE-MsgGUID: wPHTg5gUTP6TM6s4ffu0Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169001878"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 25 Aug 2025 23:48:11 -0700
From: mallesh.koujalagi@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH i-g-t] tests/intel/i915_pm_rps: Added Multi-GT support
Date: Tue, 26 Aug 2025 12:18:00 +0530
Message-Id: <20250826064800.1769672-1-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Aug 2025 09:21:30 +0000
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

From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Multi-GT support for various functionalities
- Enhanced basic API to accommodate multi-GT configurations.
- Implemented min-max configuration handling for idle states.
- Updated min-max configuration handling for loaded states.
- Improved waitboost functionality for multi-GT scenarios.
- Refined reset test cases to ensure compatibility with multi-GT setups

Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 tests/intel/i915_pm_rps.c | 345 +++++++++++++++++++++-----------------
 1 file changed, 189 insertions(+), 156 deletions(-)

diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 80f3e76c1..38e641dec 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -77,6 +77,9 @@
  * SUBTEST: waitboost
  */
 
+#define NUMFREQ		8
+#define MAX_GTS		2
+
 IGT_TEST_DESCRIPTION("Render P-States tests - verify GPU frequency changes");
 
 static int drm_fd;
@@ -89,26 +92,36 @@ enum {
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
+} sysfs_files[MAX_GTS][NUMFREQ] = {
+	{
+		{ "act", "r", NULL },
+		{ "cur", "r", NULL },
+		{ "min", "rb+", NULL },
+		{ "max", "rb+", NULL },
+		{ "RP0", "r", NULL },
+		{ "RP1", "r", NULL },
+		{ "RPn", "r", NULL },
+		{ "boost", "rb+", NULL },
+	},
+	{
+		{ "act", "r", NULL },
+		{ "cur", "r", NULL },
+		{ "min", "rb+", NULL },
+		{ "max", "rb+", NULL },
+		{ "RP0", "r", NULL },
+		{ "RP1", "r", NULL },
+		{ "RPn", "r", NULL },
+		{ "boost", "rb+", NULL },
+	}
 };
 
 static int readval(FILE *filp)
@@ -123,12 +136,12 @@ static int readval(FILE *filp)
 	return val;
 }
 
-static void read_freqs(int *freqs)
+static void read_freqs(int *freqs, int sysfs_gt)
 {
 	int i;
 
 	for (i = 0; i < NUMFREQ; i++)
-		freqs[i] = readval(sysfs_files[i].filp);
+		freqs[i] = readval(sysfs_files[sysfs_gt][i].filp);
 }
 
 static void nsleep(unsigned long ns)
@@ -147,23 +160,23 @@ static void nsleep(unsigned long ns)
 	} while (ret && errno == EINTR);
 }
 
-static void wait_freq_settle(void)
+static void wait_freq_settle(int sysfs_gt)
 {
 	int timeout = 10;
 
 	while (1) {
 		int freqs[NUMFREQ];
-
-		read_freqs(freqs);
+		read_freqs(freqs, sysfs_gt);
 		if (freqs[CUR] >= freqs[MIN] && freqs[CUR] <= freqs[MAX])
 			break;
 		nsleep(1000000);
 		if (!timeout--)
 			break;
+
 	}
 }
 
-static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check)
+static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int sysfs_gt)
 {
 	int ret, orig;
 
@@ -179,16 +192,17 @@ static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check)
 	} else {
 		/* Expecting no error */
 		igt_assert_lt(0, ret);
-		wait_freq_settle();
+		wait_freq_settle(sysfs_gt);
 		if (readback_check)
 			igt_assert_eq(readval(filp), val);
 	}
 
 	return ret;
 }
-#define writeval(filp, val) do_writeval(filp, val, 0, true)
-#define writeval_inval(filp, val) do_writeval(filp, val, EINVAL, true)
-#define writeval_nocheck(filp, val) do_writeval(filp, val, 0, false)
+
+#define writeval(filp, val, sysfs_gt) do_writeval(filp, val, 0, true, sysfs_gt)
+#define writeval_inval(filp, val, sysfs_gt) do_writeval(filp, val, EINVAL, true, sysfs_gt)
+#define writeval_nocheck(filp, val, sysfs_gt) do_writeval(filp, val, 0, false, sysfs_gt)
 
 static void check_freq_constraints(const int *freqs)
 {
@@ -203,14 +217,13 @@ static void check_freq_constraints(const int *freqs)
 	igt_assert_neq(freqs[RP1], 0);
 }
 
-static void dump(const int *freqs)
+static void dump(const int *freqs, int sysfs_gt)
 {
 	int i;
 
 	igt_debug("gt freq (MHz):");
 	for (i = 0; i < NUMFREQ; i++)
-		igt_debug("  %s=%d", sysfs_files[i].name, freqs[i]);
-
+		igt_debug("  %s=%d", sysfs_files[sysfs_gt][i].name, freqs[i]);
 	igt_debug("\n");
 }
 
@@ -375,14 +388,14 @@ static void do_load_gpu(void)
 }
 
 /* Return a frequency rounded by HW to the nearest supported value */
-static int get_hw_rounded_freq(int target)
+static int get_hw_rounded_freq(int target, int sysfs_gt)
 {
 	int freqs[NUMFREQ];
 	int old_freq;
 	int idx;
 	int ret;
 
-	read_freqs(freqs);
+	read_freqs(freqs, sysfs_gt);
 
 	if (freqs[MIN] > target)
 		idx = MIN;
@@ -390,10 +403,10 @@ static int get_hw_rounded_freq(int target)
 		idx = MAX;
 
 	old_freq = freqs[idx];
-	writeval_nocheck(sysfs_files[idx].filp, target);
-	read_freqs(freqs);
+	writeval_nocheck(sysfs_files[sysfs_gt][idx].filp, target, sysfs_gt);
+	read_freqs(freqs, sysfs_gt);
 	ret = freqs[idx];
-	writeval_nocheck(sysfs_files[idx].filp, old_freq);
+	writeval_nocheck(sysfs_files[sysfs_gt][idx].filp, old_freq, sysfs_gt);
 
 	return ret;
 }
@@ -402,112 +415,112 @@ static int get_hw_rounded_freq(int target)
  * Modify softlimit MIN and MAX freqs to valid and invalid levels. Depending
  * on subtest run different check after each modification.
  */
-static void min_max_config(void (*check)(void), bool load_gpu)
+static void min_max_config(void (*check)(int), bool load_gpu, int sysfs_gt)
 {
-	int fmid = (origfreqs[RPn] + origfreqs[RP0]) / 2;
+	int fmid = (origfreqs[sysfs_gt][RPn] + origfreqs[sysfs_gt][RP0]) / 2;
 
 	/*
 	 * hw (and so kernel) rounds to the nearest value supported by
 	 * the given platform.
 	 */
-	fmid = get_hw_rounded_freq(fmid);
+	fmid = get_hw_rounded_freq(fmid, sysfs_gt);
 
 	igt_debug("\nCheck original min and max...\n");
 	if (load_gpu)
 		do_load_gpu();
-	check();
+	check(sysfs_gt);
 
 	igt_debug("\nSet min=RPn and max=RP0...\n");
-	writeval(sysfs_files[MIN].filp, origfreqs[RPn]);
-	writeval(sysfs_files[MAX].filp, origfreqs[RP0]);
+	writeval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RPn], sysfs_gt);
+	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RP0], sysfs_gt);
 	if (load_gpu)
 		do_load_gpu();
-	check();
+	check(sysfs_gt);
 
 	igt_debug("\nIncrease min to midpoint...\n");
-	writeval(sysfs_files[MIN].filp, fmid);
+	writeval(sysfs_files[sysfs_gt][MIN].filp, fmid, sysfs_gt);
 	if (load_gpu)
 		do_load_gpu();
-	check();
+	check(sysfs_gt);
 
 	igt_debug("\nIncrease min to RP0...\n");
-	writeval(sysfs_files[MIN].filp, origfreqs[RP0]);
+	writeval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RP0], sysfs_gt);
 	if (load_gpu)
 		do_load_gpu();
-	check();
+	check(sysfs_gt);
 
 	igt_debug("\nIncrease min above RP0 (invalid)...\n");
-	writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0] + 1000);
-	check();
+	writeval_inval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RP0] + 1000, sysfs_gt);
+	check(sysfs_gt);
 
-	if (origfreqs[RPn] < origfreqs[RP0]) {
+	if (origfreqs[sysfs_gt][RPn] < origfreqs[sysfs_gt][RP0]) {
 		igt_debug("\nDecrease max to RPn (invalid)...\n");
-		writeval_inval(sysfs_files[MAX].filp, origfreqs[RPn]);
-		check();
+		writeval_inval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RPn], sysfs_gt);
+		check(sysfs_gt);
 	}
 
 	igt_debug("\nDecrease min to midpoint...\n");
-	writeval(sysfs_files[MIN].filp, fmid);
+	writeval(sysfs_files[sysfs_gt][MIN].filp, fmid, sysfs_gt);
 	if (load_gpu)
 		do_load_gpu();
-	check();
+	check(sysfs_gt);
 
 	igt_debug("\nDecrease min to RPn...\n");
-	writeval(sysfs_files[MIN].filp, origfreqs[RPn]);
+	writeval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RPn], sysfs_gt);
 	if (load_gpu)
 		do_load_gpu();
-	check();
+	check(sysfs_gt);
 
 	igt_debug("\nDecrease min below RPn (invalid)...\n");
-	writeval_inval(sysfs_files[MIN].filp, 0);
-	check();
+	writeval_inval(sysfs_files[sysfs_gt][MIN].filp, 0, sysfs_gt);
+	check(sysfs_gt);
 
 	igt_debug("\nDecrease max to midpoint...\n");
-	writeval(sysfs_files[MAX].filp, fmid);
-	check();
+	writeval(sysfs_files[sysfs_gt][MAX].filp, fmid, sysfs_gt);
+	check(sysfs_gt);
 
 	igt_debug("\nDecrease max to RPn...\n");
-	writeval(sysfs_files[MAX].filp, origfreqs[RPn]);
-	check();
+	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RPn], sysfs_gt);
+	check(sysfs_gt);
 
 	igt_debug("\nDecrease max below RPn (invalid)...\n");
-	writeval_inval(sysfs_files[MAX].filp, 0);
-	check();
+	writeval_inval(sysfs_files[sysfs_gt][MAX].filp, 0, sysfs_gt);
+	check(sysfs_gt);
 
-	if (origfreqs[RP0] > origfreqs[RPn]) {
+	if (origfreqs[sysfs_gt][RP0] > origfreqs[sysfs_gt][RPn]) {
 		igt_debug("\nIncrease min to RP0 (invalid)...\n");
-		writeval_inval(sysfs_files[MIN].filp, origfreqs[RP0]);
-		check();
+		writeval_inval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][RP0], sysfs_gt);
+		check(sysfs_gt);
 	}
 
 	igt_debug("\nIncrease max to midpoint...\n");
-	writeval(sysfs_files[MAX].filp, fmid);
-	check();
+	writeval(sysfs_files[sysfs_gt][MAX].filp, fmid, sysfs_gt);
+	check(sysfs_gt);
 
 	igt_debug("\nIncrease max to RP0...\n");
-	writeval(sysfs_files[MAX].filp, origfreqs[RP0]);
-	check();
+	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RP0], sysfs_gt);
+	check(sysfs_gt);
 
 	igt_debug("\nIncrease max above RP0 (invalid)...\n");
-	writeval_inval(sysfs_files[MAX].filp, origfreqs[RP0] + 1000);
-	check();
+	writeval_inval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][RP0] + 1000, sysfs_gt);
+	check(sysfs_gt);
 
-	writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
-	writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
+	writeval(sysfs_files[sysfs_gt][MIN].filp, origfreqs[sysfs_gt][MIN], sysfs_gt);
+	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][MAX], sysfs_gt);
 }
 
-static void basic_check(void)
+static void basic_check(int sysfs_gt)
 {
 	int freqs[NUMFREQ];
 
-	read_freqs(freqs);
-	dump(freqs);
+	read_freqs(freqs, sysfs_gt);
+	dump(freqs, sysfs_gt);
 	check_freq_constraints(freqs);
 }
 
 #define IDLE_WAIT_TIMESTEP_MSEC 250
 #define IDLE_WAIT_TIMEOUT_MSEC 2500
-static void idle_check(void)
+static void idle_check(int sysfs_gt)
 {
 	int freqs[NUMFREQ];
 	int wait = 0;
@@ -515,8 +528,8 @@ static void idle_check(void)
 	/* Monitor frequencies until cur settles down to min, which should
 	 * happen within the allotted time */
 	do {
-		read_freqs(freqs);
-		dump(freqs);
+		read_freqs(freqs, sysfs_gt);
+		dump(freqs, sysfs_gt);
 		check_freq_constraints(freqs);
 		if (freqs[ACT] <= freqs[RPn])
 			break;
@@ -532,7 +545,7 @@ static void idle_check(void)
 
 #define LOADED_WAIT_TIMESTEP_MSEC 100
 #define LOADED_WAIT_TIMEOUT_MSEC 3000
-static void loaded_check(void)
+static void loaded_check(int sysfs_gt)
 {
 	int freqs[NUMFREQ];
 	int wait = 0;
@@ -540,8 +553,8 @@ static void loaded_check(void)
 	/* Monitor frequencies until cur increases to max, which should
 	 * happen within the allotted time */
 	do {
-		read_freqs(freqs);
-		dump(freqs);
+		read_freqs(freqs, sysfs_gt);
+		dump(freqs, sysfs_gt);
 		check_freq_constraints(freqs);
 		if (freqs[CUR] >= freqs[MAX])
 			break;
@@ -556,19 +569,19 @@ static void loaded_check(void)
 
 #define STABILIZE_WAIT_TIMESTEP_MSEC 250
 #define STABILIZE_WAIT_TIMEOUT_MSEC 15000
-static void stabilize_check(int *out)
+static void stabilize_check(int *out, int sysfs_gt)
 {
 	int freqs[NUMFREQ];
 	int wait = 0;
 
 	/* Monitor frequencies until HW will stabilize cur frequency.
 	 * It should happen within allotted time */
-	read_freqs(freqs);
-	dump(freqs);
+	read_freqs(freqs, sysfs_gt);
+	dump(freqs, sysfs_gt);
 	usleep(1000 * STABILIZE_WAIT_TIMESTEP_MSEC);
 	do {
-		read_freqs(out);
-		dump(out);
+		read_freqs(out, sysfs_gt);
+		dump(out, sysfs_gt);
 
 		if (memcmp(freqs, out, sizeof(freqs)) == 0)
 			break;
@@ -581,75 +594,82 @@ static void stabilize_check(int *out)
 	igt_debug("Waited %d msec to stabilize cur\n", wait);
 }
 
-static void boost_freq(int fd, int *boost_freqs)
+static void restore_sysfs_on_each_gt(void)
 {
-	int64_t timeout = 1;
-	igt_spin_t *load;
-	/* We need to keep dependency spin offset for load->handle */
-	uint64_t ahnd = get_simple_l2h_ahnd(fd, 0);
-
-	load = igt_spin_new(fd, .ahnd = ahnd);
-
-	/* Strip off extra fences from the object, and keep it from starting */
-	igt_spin_free(fd, igt_spin_new(fd, .ahnd = ahnd, .dependency = load->handle));
+	int tmp, gt;
 
-	/* Waiting will grant us a boost to maximum */
-	gem_wait(fd, load->handle, &timeout);
-
-	read_freqs(boost_freqs);
-	dump(boost_freqs);
+	i915_for_each_gt(drm_fd, tmp, gt) {
+		writeval(sysfs_files[gt][MIN].filp, origfreqs[gt][MIN], gt);
+		writeval(sysfs_files[gt][MAX].filp, origfreqs[gt][MAX], gt);
+		writeval(sysfs_files[gt][BOOST].filp, origfreqs[gt][BOOST], gt);
+	}
+}
 
-	/* Avoid downlocking till boost request is pending */
-	igt_spin_end(load);
-	gem_sync(fd, load->handle);
-	igt_spin_free(fd, load);
-	put_ahnd(ahnd);
+static void boost_freq(int fd, int *boost_freqs, int sysfs_gt)
+{
+	const intel_ctx_t *ctx;
+	uint64_t ahnd;
+	int64_t timeout = 1;
+	igt_spin_t *spin;
+
+	ctx = intel_ctx_create_for_gt(fd, sysfs_gt);
+	ahnd = get_reloc_ahnd(fd, ctx->id);
+	spin = igt_spin_new(fd,
+			    .ahnd = ahnd,
+			    .ctx = ctx);
+
+	igt_assert(gem_bo_busy(fd, spin->handle));
+	gem_wait(fd, spin->handle, &timeout);
+	read_freqs(boost_freqs, sysfs_gt);
+	dump(boost_freqs, sysfs_gt);
+	igt_spin_end(spin);
+	igt_spin_free(fd, spin);
 }
 
-static void waitboost(int fd, bool reset)
+static void waitboost(int fd, bool reset, int sysfs_gt)
 {
 	int pre_freqs[NUMFREQ];
 	int boost_freqs[NUMFREQ];
 	int post_freqs[NUMFREQ];
-	int fmid = (origfreqs[RPn] + origfreqs[RP0]) / 2;
-	fmid = get_hw_rounded_freq(fmid);
+	int fmid = (origfreqs[sysfs_gt][RPn] + origfreqs[sysfs_gt][RP0]) / 2;
 
-	igt_require(origfreqs[RP0] > origfreqs[RPn]);
+	fmid = get_hw_rounded_freq(fmid, sysfs_gt);
+
+	igt_require(origfreqs[sysfs_gt][RP0] > origfreqs[sysfs_gt][RPn]);
 
 	load_helper_run(LOW);
 
 	igt_debug("Apply low load...\n");
 	sleep(1);
-	stabilize_check(pre_freqs);
+	stabilize_check(pre_freqs, sysfs_gt);
 
 	if (reset) {
 		igt_debug("Reset gpu...\n");
 		igt_force_gpu_reset(fd);
 		sleep(1);
 	}
-
 	/* Set max freq to less than boost freq */
-	writeval(sysfs_files[MAX].filp, fmid);
+	writeval(sysfs_files[sysfs_gt][MAX].filp, fmid, sysfs_gt);
 
 	/* When we wait upon the GPU, we want to temporarily boost it
 	 * to maximum.
 	 */
-	boost_freq(fd, boost_freqs);
+	boost_freq(fd, boost_freqs,  sysfs_gt);
 
 	/* Set max freq to original softmax */
-	writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
+	writeval(sysfs_files[sysfs_gt][MAX].filp, origfreqs[sysfs_gt][MAX], sysfs_gt);
 
 	igt_debug("Apply low load again...\n");
 	sleep(1);
-	stabilize_check(post_freqs);
+	stabilize_check(post_freqs, sysfs_gt);
 
 	igt_debug("Removing load...\n");
 	load_helper_stop();
-	idle_check();
+	idle_check(sysfs_gt);
 
-	igt_assert_lt(pre_freqs[CUR], pre_freqs[MAX]);
+	igt_assert_lte(pre_freqs[CUR], pre_freqs[MAX]);
 	igt_assert_eq(boost_freqs[CUR], boost_freqs[BOOST]);
-	igt_assert_lt(post_freqs[CUR], post_freqs[MAX]);
+	igt_assert_lte(post_freqs[CUR], post_freqs[MAX]);
 }
 
 static uint32_t batch_create(int i915, uint64_t sz)
@@ -899,13 +919,17 @@ static void engine_order(int i915)
 
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
 
@@ -1082,8 +1106,8 @@ static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
 
 igt_main
 {
+	int tmp, gt;
 	igt_fixture {
-		struct sysfs_file *sysfs_file = sysfs_files;
 		char sysfs_path[80];
 		int ret;
 
@@ -1094,23 +1118,24 @@ igt_main
 		igt_assert(igt_sysfs_path(drm_fd, sysfs_path,
 					  sizeof(sysfs_path)));
 
-		do {
-			int val = -1;
-			char *path;
-
-			ret = asprintf(&path, "%s/gt_%s_freq_mhz",
-				       sysfs_path, sysfs_file->name);
-			igt_assert(ret != -1);
-			sysfs_file->filp = fopen(path, sysfs_file->mode);
-			igt_require(sysfs_file->filp);
-			setbuf(sysfs_file->filp, NULL);
-
-			val = readval(sysfs_file->filp);
-			igt_assert(val >= 0);
-			sysfs_file++;
-		} while (sysfs_file->name != NULL);
-
-		read_freqs(origfreqs);
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			for (int j = 0; j < NUMFREQ; j++) {
+				struct sysfs_file *sysfs_file = &sysfs_files[gt][j];
+				int val = -1;
+				char *path;
+
+				ret = asprintf(&path, "%s/gt/gt%d/rps_%s_freq_mhz",
+					       sysfs_path, gt, sysfs_file->name);
+				igt_assert(ret != -1);
+				sysfs_file->filp = fopen(path, sysfs_file->mode);
+				igt_require(sysfs_file->filp);
+				setbuf(sysfs_file->filp, NULL);
+
+				val = readval(sysfs_file->filp);
+				igt_assert(val >= 0);
+				origfreqs[gt][j] = val;
+			}
+		}
 
 		igt_install_exit_handler(pm_rps_exit_handler);
 	}
@@ -1118,28 +1143,35 @@ igt_main
 	igt_subtest("basic-api") {
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
-		min_max_config(basic_check, false);
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			min_max_config(basic_check, false, gt);
+		}
 	}
-
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
+			load_helper_run(HIGH);
+			min_max_config(loaded_check, false, gt);
+			load_helper_stop();
+		}
 	}
-
 	/* Checks if we achieve boost using gem_wait */
 	igt_subtest("waitboost") {
-		waitboost(drm_fd, false);
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			igt_info("gt%u\n", gt);
+			waitboost(drm_fd, false, gt);
+		}
 	}
 
 	igt_describe("Check if the order of fences does not affect waitboosting");
@@ -1155,13 +1187,18 @@ igt_main
 	/* Test boost frequency after GPU reset */
 	igt_subtest("reset") {
 		igt_hang_t hang;
+
+		restore_sysfs_on_each_gt();
+		sleep(1);
 		hang = igt_allow_hang(drm_fd, 0, 0);
-		waitboost(drm_fd, true);
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			igt_info("gt%u\n", gt);
+			waitboost(drm_fd, true, gt);
+		}
 		igt_disallow_hang(drm_fd, hang);
 	}
 
 	igt_subtest_with_dynamic("thresholds-idle") {
-		int tmp, gt;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
@@ -1171,7 +1208,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("thresholds") {
-		int tmp, gt;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
@@ -1181,7 +1217,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("thresholds-park") {
-		int tmp, gt;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
@@ -1191,7 +1226,6 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("thresholds-idle-park") {
-		int tmp, gt;
 		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
 			      "This subtest is not supported when SLPC is enabled\n");
 
@@ -1200,7 +1234,6 @@ igt_main
 				test_thresholds(drm_fd, gt, TEST_IDLE | TEST_PARK);
 		}
 	}
-
 	igt_fixture
 		drm_close_driver(drm_fd);
 }
-- 
2.34.1

