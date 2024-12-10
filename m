Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD08BE77181
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 09:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6478810E843;
	Tue, 10 Dec 2024 09:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grv5CIVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753C810E843
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733822493; x=1765358493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJlgVunx5RJ5bMWgJ03EPQTC73f3zhXeUb5IaUq/o+I=;
 b=grv5CIVapAF7+fEFD0dit469d67JjmVVDimgKwS0D4ApmFFEcakvVIiB
 xrmiG7867WIRf5ORBLuhgd2t3bMa38yAyIYR3sZTeNu+7aqTtp8F2gORo
 W8BxAD/gFRgzqLcTCwIvesPcxa3jcSYGtege58cNt35CK5bl65PvYKIXH
 q0O0IRzcDjAL/WjjXvWFqres7/AdW6jx8ezdHeBbqDuCjLxO5zaY/FGsj
 +VGU8SP5BjW0nxPJB5K4iJthfRIuq2v5SIk4/uF0U+CFIOra8lC3/HMen
 bdEDFirKYG/EpYCwRyZ9TplbN2jMcn3Bqmw2fs/mxFOsFhXCH+MyFNUfZ A==;
X-CSE-ConnectionGUID: tBss5EJ2RjOLF6D6/Y1ZHw==
X-CSE-MsgGUID: Dv2I/8JcQNGbL6AvO+qWIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34294762"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34294762"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:21:33 -0800
X-CSE-ConnectionGUID: Rje9X/gJSOuOjIVQnW7cqA==
X-CSE-MsgGUID: KueN+dFsRFiqD/EblUARtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="118599216"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.231])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 01:21:32 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_sysfs: Promote helpers to get and set GT
 frequency
Date: Tue, 10 Dec 2024 10:19:31 +0100
Message-ID: <20241210092119.1556652-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210092119.1556652-1-francois.dugast@intel.com>
References: <20241210092119.1556652-1-francois.dugast@intel.com>
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

Those helpers are generic, they can be used outside of the
xe_gt_freq test to set a fixed GT frequency, for example for
reproducible performance testing.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/igt_sysfs.c          |  59 ++++++++++++++
 lib/igt_sysfs.h          |   3 +
 tests/intel/xe_gt_freq.c | 166 ++++++++++++++++-----------------------
 3 files changed, 128 insertions(+), 100 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index eaf8fd882..f33478cea 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1631,3 +1631,62 @@ bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, c
 
 	return true;
 }
+
+/**
+ * xe_sysfs_set_gt_freq:
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @freq_name: name of the frequency to set
+ * @freq: frequency value
+ *
+ * Set the value of a GT frequency.
+ *
+ * Returns:
+ * Number of characters written, negative value on error.
+ */
+int xe_sysfs_set_gt_freq(int xe_device, int gt, const char *freq_name, uint32_t freq)
+{
+	int ret = -EAGAIN;
+	char freq_attr[22];
+	int gt_fd;
+
+	snprintf(freq_attr, sizeof(freq_attr), "freq0/%s_freq", freq_name);
+	gt_fd = xe_sysfs_gt_open(xe_device, gt);
+	igt_assert_lte(0, gt_fd);
+
+	while (ret == -EAGAIN)
+		ret = igt_sysfs_printf(gt_fd, freq_attr, "%u", freq);
+
+	close(gt_fd);
+	return ret;
+}
+
+/**
+ * xe_sysfs_get_gt_freq:
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @freq_name: name of the frequency to set
+ *
+ * Get the value of a GT frequency.
+ *
+ * Returns: the GT frequency
+ */
+uint32_t xe_sysfs_get_gt_freq(int xe_device, int gt, const char *freq_name)
+{
+	uint32_t freq;
+	int err = -EAGAIN;
+	char freq_attr[22];
+	int gt_fd;
+
+	snprintf(freq_attr, sizeof(freq_attr), "freq0/%s_freq", freq_name);
+	gt_fd = xe_sysfs_gt_open(xe_device, gt);
+	igt_assert_lte(0, gt_fd);
+
+	while (err == -EAGAIN)
+		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
+
+	igt_debug("gt%d: %s freq %u\n", gt, freq_name, freq);
+
+	close(gt_fd);
+	return freq;
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 86345f3d1..6a141a5de 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -197,4 +197,7 @@ bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, c
 bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
 					uint32_t new_value, uint32_t *old_value);
 
+int xe_sysfs_set_gt_freq(int fd, int gt_id, const char *freq_name, uint32_t freq);
+uint32_t xe_sysfs_get_gt_freq(int fd, int gt_id, const char *freq_name);
+
 #endif /* __IGT_SYSFS_H__ */
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index de4d111ea..32624e3a7 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -36,43 +36,6 @@
  */
 #define SLPC_FREQ_LATENCY_US 100000
 
-static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
-{
-	int ret = -EAGAIN;
-	char freq_attr[22];
-	int gt_fd;
-
-	snprintf(freq_attr, sizeof(freq_attr), "freq0/%s_freq", freq_name);
-	gt_fd = xe_sysfs_gt_open(fd, gt_id);
-	igt_assert_lte(0, gt_fd);
-
-	while (ret == -EAGAIN)
-		ret = igt_sysfs_printf(gt_fd, freq_attr, "%u", freq);
-
-	close(gt_fd);
-	return ret;
-}
-
-static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
-{
-	uint32_t freq;
-	int err = -EAGAIN;
-	char freq_attr[22];
-	int gt_fd;
-
-	snprintf(freq_attr, sizeof(freq_attr), "freq0/%s_freq", freq_name);
-	gt_fd = xe_sysfs_gt_open(fd, gt_id);
-	igt_assert_lte(0, gt_fd);
-
-	while (err == -EAGAIN)
-		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
-
-	igt_debug("gt%d: %s freq %u\n", gt_id, freq_name, freq);
-
-	close(gt_fd);
-	return freq;
-}
-
 static bool within_expected_range(uint32_t freq, uint32_t val)
 {
 	/*
@@ -134,8 +97,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
 
 static void test_freq_basic_api(int fd, int gt_id)
 {
-	uint32_t rpn = get_freq(fd, gt_id, "rpn");
-	uint32_t rp0 = get_freq(fd, gt_id, "rp0");
+	uint32_t rpn = xe_sysfs_get_gt_freq(fd, gt_id, "rpn");
+	uint32_t rp0 = xe_sysfs_get_gt_freq(fd, gt_id, "rp0");
 	uint32_t rpmid = (rp0 + rpn) / 2;
 	uint32_t min_freq, max_freq;
 
@@ -144,29 +107,29 @@ static void test_freq_basic_api(int fd, int gt_id)
 	 * RPn is the floor
 	 * RP0 is the ceiling
 	 */
-	igt_assert_lt(set_freq(fd, gt_id, "min", rpn - 1), 0);
-	igt_assert_lt(set_freq(fd, gt_id, "min", rp0 + 1), 0);
-	igt_assert_lt(set_freq(fd, gt_id, "max", rpn - 1), 0);
-	igt_assert_lt(set_freq(fd, gt_id, "max", rp0 + 1), 0);
+	igt_assert_lt(xe_sysfs_set_gt_freq(fd, gt_id, "min", rpn - 1), 0);
+	igt_assert_lt(xe_sysfs_set_gt_freq(fd, gt_id, "min", rp0 + 1), 0);
+	igt_assert_lt(xe_sysfs_set_gt_freq(fd, gt_id, "max", rpn - 1), 0);
+	igt_assert_lt(xe_sysfs_set_gt_freq(fd, gt_id, "max", rp0 + 1), 0);
 
 	/* Assert min requests are respected from rp0 to rpn */
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rp0));
-	igt_assert_eq_u32(get_freq(fd, gt_id, "min"), rp0);
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
-	min_freq = get_freq(fd, gt_id, "min");
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rp0));
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "min"), rp0);
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rpmid));
+	min_freq = xe_sysfs_get_gt_freq(fd, gt_id, "min");
 	/* SLPC can set min higher than rpmid - as it follows RPe */
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), min_freq);
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
-	igt_assert_eq_u32(get_freq(fd, gt_id, "min"), rpn);
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rpn));
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "min"), rpn);
 
 	/* Assert max requests are respected from rpn to rp0 */
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
-	igt_assert_eq_u32(get_freq(fd, gt_id, "max"), rpn);
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
-	max_freq = get_freq(fd, gt_id, "max");
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rpn));
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "max"), rpn);
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rpmid));
+	max_freq = xe_sysfs_get_gt_freq(fd, gt_id, "max");
 	igt_assert(within_expected_range(max_freq, rpmid));
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rp0));
-	igt_assert_eq_u32(get_freq(fd, gt_id, "max"), rp0);
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rp0));
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "max"), rp0);
 }
 
 /**
@@ -179,8 +142,8 @@ static void test_freq_basic_api(int fd, int gt_id)
 
 static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 {
-	uint32_t rpn = get_freq(fd, gt_id, "rpn");
-	uint32_t rp0 = get_freq(fd, gt_id, "rp0");
+	uint32_t rpn = xe_sysfs_get_gt_freq(fd, gt_id, "rpn");
+	uint32_t rp0 = xe_sysfs_get_gt_freq(fd, gt_id, "rp0");
 	uint32_t rpmid = (rp0 + rpn) / 2;
 	uint32_t cur_freq, act_freq;
 
@@ -192,50 +155,53 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	 * And let's do this for all the 2 known Render Performance (RP) values
 	 * RP0 and RPn and something in between.
 	 */
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rpn));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rpn));
 	usleep(SLPC_FREQ_LATENCY_US);
-	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "cur"), rpn);
 
 	if (gt_idle) {
-		/* Wait for GT to go in C6 as previous get_freq wakes up GT*/
+		/*
+		 * Wait for GT to go in C6 as previous xe_sysfs_get_gt_freq
+		 * wakes up GT
+		 */
 		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
-		igt_assert(get_freq(fd, gt_id, "act") == 0);
+		igt_assert(xe_sysfs_get_gt_freq(fd, gt_id, "act") == 0);
 	} else {
-		igt_assert_eq_u32(get_freq(fd, gt_id, "act"), rpn);
+		igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "act"), rpn);
 	}
 
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rpmid));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rpmid));
 	usleep(SLPC_FREQ_LATENCY_US);
-	cur_freq = get_freq(fd, gt_id, "cur");
+	cur_freq = xe_sysfs_get_gt_freq(fd, gt_id, "cur");
 	/* If rpmid is around RPe, we could see SLPC follow it */
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
 
 	if (gt_idle) {
 		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
-		igt_assert(get_freq(fd, gt_id, "act") == 0);
+		igt_assert(xe_sysfs_get_gt_freq(fd, gt_id, "act") == 0);
 	} else {
-		act_freq = get_freq(fd, gt_id, "act");
+		act_freq = xe_sysfs_get_gt_freq(fd, gt_id, "act");
 		igt_assert_lte_u32(act_freq, cur_freq + FREQ_UNIT_MHZ);
 	}
 
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rp0));
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rp0));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rp0));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rp0));
 	usleep(SLPC_FREQ_LATENCY_US);
 	/*
 	 * It is unlikely that PCODE will *always* respect any request above RPe
 	 * So for this level let's only check if GuC PC is doing its job
 	 * and respecting our request, by propagating it to the hardware.
 	 */
-	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rp0);
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "cur"), rp0);
 
 	if (gt_idle) {
 		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
-		igt_assert(get_freq(fd, gt_id, "act") == 0);
+		igt_assert(xe_sysfs_get_gt_freq(fd, gt_id, "act") == 0);
 	}
 
 	igt_debug("Finished testing fixed request\n");
@@ -250,25 +216,25 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
  */
 static void test_freq_range(int fd, int gt_id, bool gt_idle)
 {
-	uint32_t rpn = get_freq(fd, gt_id, "rpn");
-	uint32_t rp0 = get_freq(fd, gt_id, "rp0");
+	uint32_t rpn = xe_sysfs_get_gt_freq(fd, gt_id, "rpn");
+	uint32_t rp0 = xe_sysfs_get_gt_freq(fd, gt_id, "rp0");
 	uint32_t rpmid = (rp0 + rpn) / 2;
 	uint32_t cur, act;
 
 	igt_debug("Starting testing range request\n");
 
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rpn));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rpmid));
 	usleep(SLPC_FREQ_LATENCY_US);
-	cur = get_freq(fd, gt_id, "cur");
+	cur = xe_sysfs_get_gt_freq(fd, gt_id, "cur");
 	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
 
 	if (gt_idle) {
 		igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10),
 			     "GT %d should be in C6\n", gt_id);
-		igt_assert(get_freq(fd, gt_id, "act") == 0);
+		igt_assert(xe_sysfs_get_gt_freq(fd, gt_id, "act") == 0);
 	} else {
-		act = get_freq(fd, gt_id, "act");
+		act = xe_sysfs_get_gt_freq(fd, gt_id, "act");
 		igt_assert((rpn <= act) && (act <= cur + FREQ_UNIT_MHZ));
 	}
 
@@ -282,21 +248,21 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 
 static void test_freq_low_max(int fd, int gt_id)
 {
-	uint32_t rpn = get_freq(fd, gt_id, "rpn");
-	uint32_t rp0 = get_freq(fd, gt_id, "rp0");
+	uint32_t rpn = xe_sysfs_get_gt_freq(fd, gt_id, "rpn");
+	uint32_t rp0 = xe_sysfs_get_gt_freq(fd, gt_id, "rp0");
 	uint32_t rpmid = (rp0 + rpn) / 2;
 
 	/*
 	 *  When max request < min request, max is ignored and min works like
 	 * a fixed one. Let's assert this assumption
 	 */
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rpmid));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rpn));
 	usleep(SLPC_FREQ_LATENCY_US);
 
 	/* Cur freq will follow RPe, which could be higher than min freq */
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ),
-			   get_freq(fd, gt_id, "cur"));
+			   xe_sysfs_get_gt_freq(fd, gt_id, "cur"));
 }
 
 /**
@@ -306,18 +272,18 @@ static void test_freq_low_max(int fd, int gt_id)
 
 static void test_suspend(int fd, int gt_id)
 {
-	uint32_t rpn = get_freq(fd, gt_id, "rpn");
+	uint32_t rpn = xe_sysfs_get_gt_freq(fd, gt_id, "rpn");
 
-	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
-	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "min", rpn));
+	igt_assert_lt(0, xe_sysfs_set_gt_freq(fd, gt_id, "max", rpn));
 	usleep(SLPC_FREQ_LATENCY_US);
-	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "cur"), rpn);
 
 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
 				      SUSPEND_TEST_NONE);
 
-	igt_assert_eq_u32(get_freq(fd, gt_id, "min"), rpn);
-	igt_assert_eq_u32(get_freq(fd, gt_id, "max"), rpn);
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "min"), rpn);
+	igt_assert_eq_u32(xe_sysfs_get_gt_freq(fd, gt_id, "max"), rpn);
 }
 
 /**
@@ -330,24 +296,24 @@ static void test_suspend(int fd, int gt_id)
 
 static void test_reset(int fd, int gt_id, int cycles)
 {
-	uint32_t rpn = get_freq(fd, gt_id, "rpn");
+	uint32_t rpn = xe_sysfs_get_gt_freq(fd, gt_id, "rpn");
 
 	for (int i = 0; i < cycles; i++) {
-		igt_assert_f(set_freq(fd, gt_id, "min", rpn) > 0,
+		igt_assert_f(xe_sysfs_set_gt_freq(fd, gt_id, "min", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
-		igt_assert_f(set_freq(fd, gt_id, "max", rpn) > 0,
+		igt_assert_f(xe_sysfs_set_gt_freq(fd, gt_id, "max", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
 		usleep(SLPC_FREQ_LATENCY_US);
-		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
+		igt_assert_f(xe_sysfs_get_gt_freq(fd, gt_id, "cur") == rpn,
 			     "Failed after %d good cycles\n", i);
 
 		xe_force_gt_reset_sync(fd, gt_id);
 
 		usleep(SLPC_FREQ_LATENCY_US);
 
-		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
+		igt_assert_f(xe_sysfs_get_gt_freq(fd, gt_id, "min") == rpn,
 			     "Failed after %d good cycles\n", i);
-		igt_assert_f(get_freq(fd, gt_id, "max") == rpn,
+		igt_assert_f(xe_sysfs_get_gt_freq(fd, gt_id, "max") == rpn,
 			     "Failed after %d good cycles\n", i);
 	}
 }
@@ -448,8 +414,8 @@ igt_main
 		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
 
 		xe_for_each_gt(fd, gt) {
-			stash_min[gt] = get_freq(fd, gt, "min");
-			stash_max[gt] = get_freq(fd, gt, "max");
+			stash_min[gt] = xe_sysfs_get_gt_freq(fd, gt, "min");
+			stash_max[gt] = xe_sysfs_get_gt_freq(fd, gt, "max");
 		}
 	}
 
@@ -525,8 +491,8 @@ igt_main
 
 	igt_fixture {
 		xe_for_each_gt(fd, gt) {
-			set_freq(fd, gt, "max", stash_max[gt]);
-			set_freq(fd, gt, "min", stash_min[gt]);
+			xe_sysfs_set_gt_freq(fd, gt, "max", stash_max[gt]);
+			xe_sysfs_set_gt_freq(fd, gt, "min", stash_min[gt]);
 		}
 		free(stash_min);
 		free(stash_max);
-- 
2.43.0

