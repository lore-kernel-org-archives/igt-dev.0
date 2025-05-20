Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCC1C54756
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 17:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85CD10E553;
	Tue, 20 May 2025 17:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bb48MFZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D98510E553
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747761883; x=1779297883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F2IraVJ7k/kGGxNku98QW0PoQg7POiQASuGlmNaQNZM=;
 b=Bb48MFZCaZpWN44ooC9YEw+6fOSAXiALsx5oxrOXxzIStEgJrD0ggcs0
 vbvnEB+1CM451WVgkPfDaSsjpADv1PBfPEaWalfzBYHI109Q2QldDnvIn
 BWN8iysyorfeaMHWSTzHVsx9eV0ZsEmRBI8g69PnzTTF54hidVCLUz3PC
 vKI3QSchXjwdkp5TXYOariZ7+tXqE7r3HOZG18o12O841POqa+BSn+1mR
 XCy+rmoh/O3n6vDc/6HJY8btuy5GGmVUuHrkQrMZR+KYC5uxEBm9lOgjz
 rQrACq3lxAaV9ZEinsJ2a7/+6rY1aoUjY7PD+HqqcZUOWutTl1VEY/pNe w==;
X-CSE-ConnectionGUID: yYxqx8S+Ry6N0a/CwjZySg==
X-CSE-MsgGUID: ve2ObhweTkua5jPdbumYWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49772024"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49772024"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 10:24:40 -0700
X-CSE-ConnectionGUID: fVrb0TwWQnSnCtx5zzXvyw==
X-CSE-MsgGUID: 29Fi4kpnQv2EH6Ggijip6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139478028"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 10:24:38 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, ravi.kishore.koppuravuri@intel.com,
 vinay.belgaumkar@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/xe_pmu: Ensure consistent GPU frequency comparison
Date: Tue, 20 May 2025 22:46:41 +0530
Message-Id: <20250520171641.2421623-1-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Sk Anirban <sk.anirban@intel.com>

Fetch the minimum frequency only once during GPU frequency restoration.
This avoids inconsistencies caused by potential changes in the minimum
frequency between multiple fetches.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index c49cceff5..f830c5de8 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t gt = eci->gt_id;
 	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
 	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
+	uint32_t current_min;
 	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
@@ -440,8 +441,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
 	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
-	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min ||
-		   xe_gt_get_freq(fd, gt, "min") == orig_rpe);
+	current_min = xe_gt_get_freq(fd, gt, "min");
+	igt_assert(current_min == orig_min || current_min == orig_rpe);
 
 	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
 		 min[0], min[1]);
-- 
2.34.1

