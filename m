Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4805DC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 15:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7AA10E94F;
	Fri,  9 Aug 2024 15:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVDa1efn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF5910E94F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 15:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723217250; x=1754753250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jWEJQKUy7KU9XRxNGxRXPnarDe5sNPtkVyG/XX2SSZg=;
 b=WVDa1efn2aB9lc7pYkAgh1yg5qtbPbnbPhYEnTGEqt7QOHDyYIFyUskq
 vsvQpL9ftv/3fFPvsfqt5NW7eyiCLmg9tF8uu/wm12jYfnKnVOX8Ai1a2
 fjmkRAr5zXU+yWdMELXhj6yGii5cVlK1a+ZMxz0k9/kXlliQ3k3ToC9IH
 1ed+wtG2kn5Xi1KHZfzj3DwrVmPzObClFJReWwIBJWTqVGZItRzZ1Memd
 rz+8asyWUL4VU4AP5G8AiVDP0WPOuiJCUW8XaACPrA6RL8zEpAtiyzt/L
 dv9Iw7HV3MAAqPfhXg8O9/07OQ2x3G2NPKP6bLsTIXrBPHu4LWAUqkfpS A==;
X-CSE-ConnectionGUID: 56suEVsqS8KUUvYIrvMlIA==
X-CSE-MsgGUID: rsH5YRWWTtiAfUVaGSS+Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21523875"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21523875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:27:29 -0700
X-CSE-ConnectionGUID: 87qp+MzQTg+vqOFIAnihZg==
X-CSE-MsgGUID: TPLc8PPmRZyD4FF2vJ/vVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57551441"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:27:27 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_gt_freq: Add a wait after gt reset
Date: Fri,  9 Aug 2024 21:10:08 +0530
Message-Id: <20240809154008.2438925-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

After reset min and max takes sometime to get set.
So add a wait of 100ms after gt reset before reading
min and max frequencies.

v2:
 - Rename ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US and use it
   instead of new macro. (Riana)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_gt_freq.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 171f9cb44..427e12c55 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -34,7 +34,7 @@
  * Too many intermediate components and steps before freq is adjusted
  * Specially if workload is under execution, so let's wait 100 ms.
  */
-#define ACT_FREQ_LATENCY_US 100000
+#define SLPC_FREQ_LATENCY_US 100000
 
 static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 {
@@ -194,7 +194,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	 */
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
 
 	if (gt_idle) {
@@ -208,7 +208,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	cur_freq = get_freq(fd, gt_id, "cur");
 	/* If rpmid is around RPe, we could see SLPC follow it */
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
@@ -224,7 +224,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rp0));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rp0));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	/*
 	 * It is unlikely that PCODE will *always* respect any request above RPe
 	 * So for this level let's only check if GuC PC is doing its job
@@ -259,7 +259,7 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	cur = get_freq(fd, gt_id, "cur");
 	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
 
@@ -292,7 +292,7 @@ static void test_freq_low_max(int fd, int gt_id)
 	 */
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 
 	/* Cur freq will follow RPe, which could be higher than min freq */
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ),
@@ -310,7 +310,7 @@ static void test_suspend(int fd, int gt_id)
 
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
 
 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
@@ -337,11 +337,12 @@ static void test_reset(int fd, int gt_id, int cycles)
 			     "Failed after %d good cycles\n", i);
 		igt_assert_f(set_freq(fd, gt_id, "max", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
-		usleep(ACT_FREQ_LATENCY_US);
+		usleep(SLPC_FREQ_LATENCY_US);
 		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
 			     "Failed after %d good cycles\n", i);
 
 		xe_force_gt_reset_async(fd, gt_id);
+		usleep(SLPC_FREQ_LATENCY_US);
 
 		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
 			     "Failed after %d good cycles\n", i);
-- 
2.25.1

