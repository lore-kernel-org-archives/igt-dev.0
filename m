Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26183CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 10:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16C010E9A1;
	Thu, 16 Oct 2025 10:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLjNSZWR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562F510E9A1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760610788; x=1792146788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8CQEIf818FhY6SrehEoyK/JNf25MI+J5SN3B5k1Tj8=;
 b=MLjNSZWR8K6U28PUDZvi0N1I0dR28zF7/JKIGC5pkEYyFb5Y+aRinEyz
 iCD5s9h9cH2tXG4dTidssqZR3CNTBvhc+OtwKv8r9W4BB0d9cw+LRL7IG
 kuJiF0dexRSqyaLhUpf0gEZ1ebza9TbuqocIx6cymmKxwvShOG7esUnm/
 Ep/z/5iaNKv4RcZEjw3yqblFR/j/QO4t1AyXZTxzZAi62x7p3rPa7J1hw
 KzNlAO18cqKBnmkRNqKSC0AG8AVy8lL8AV/bAES7PaDznP4ogy9dqrJiQ
 LDz9ggVkDl94ru+o9xG+odcPkih76+LpinQAcQK68zboGAZKyc3vEhJ4U w==;
X-CSE-ConnectionGUID: Zlw7WeqDR/SWU7tZ8ht0VA==
X-CSE-MsgGUID: s94ktM2TTAqWeWXS2aMSvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62843425"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62843425"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:33:07 -0700
X-CSE-ConnectionGUID: mJLltuRmQaKj7DCeNbHYDw==
X-CSE-MsgGUID: rDwSyy9aSq+Bs8vZOwIdww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="219584521"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:33:05 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_pmu: Fix frequency assertion when RPe
 raises min frequency
Date: Thu, 16 Oct 2025 15:59:37 +0530
Message-ID: <20251016102935.1935374-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016102935.1935374-4-sk.anirban@intel.com>
References: <20251016102935.1935374-4-sk.anirban@intel.com>
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

When running workloads, RPe may dynamically raise the minimum frequency
above the original value. To handle this, set the maximum frequency to
current minimum instead of the original minimum.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pmu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 0e5a7360f..e69d528ea 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -736,7 +736,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t gt = eci->gt_id;
 	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
 	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
-	uint32_t current_min;
+	uint32_t current_min, current_max;
 	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
@@ -755,8 +755,11 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	/*
 	 * Set GPU to min frequency and read PMU counters.
 	 */
-	igt_assert(xe_gt_set_freq(fd, gt, "max", orig_min) > 0);
-	igt_assert(xe_gt_get_freq(fd, gt, "max") == orig_min);
+	current_min = xe_gt_get_freq(fd, gt, "min");
+	igt_assert(xe_gt_set_freq(fd, gt, "max", current_min) > 0);
+	current_max = xe_gt_get_freq(fd, gt, "max");
+	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
+	igt_assert(current_max == current_min || current_max == orig_rpe);
 
 	pmu_read_multi(pmu_fd[0], 2, start);
 	usleep(SLEEP_DURATION * USEC_PER_SEC);
-- 
2.43.0

