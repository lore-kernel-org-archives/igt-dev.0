Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807BCC3ABBC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 15:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362A510E089;
	Tue,  6 May 2025 15:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpZlWx6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174AC10E089
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746544339; x=1778080339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PGfHN9D0M8n9kXDa1z9sE8Xa6O+ufxKzP0HbpjK9ILI=;
 b=kpZlWx6dQlO4FO6iPtD/BrNgGxcqwt7ZHCsA5HGu9W3zllRrXPNHIRuc
 IsN2N79as2s+2pnyIlrVaTZBfYUBeQI7idAzsazISrYszFzVggjvK2LN3
 4RB2V3TTjdlJ6O8TryGuD9jaRLqkz1VHokrc1KJzzWVhXJRAaaxXQqI6v
 54BkIVPOkC4q/V80Bec1X6nh3RbsMj+3CO+Qflz0RIAMYKm4yHvqilzxC
 Q021wylcBohHcLeJclg2P49tU2o/EJbOMJNo28UygRTDuoKiAm+kyLm7J
 kyNe6B/7//2lWS1/mohlOnsjtOQGzZ5eZkoGVJvDBBQ+Imfr9SKAjwdrc g==;
X-CSE-ConnectionGUID: LUgArxOCSw6TQpjQAt5lXA==
X-CSE-MsgGUID: 2zCcsXnoT7CdJf0mdgZ9hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59614197"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59614197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:12:19 -0700
X-CSE-ConnectionGUID: hO5AOxEKTB2chUdDNVRi4Q==
X-CSE-MsgGUID: BTiryJcjS/uI2ljZDy/W2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="135648930"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:12:16 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, ravi.kishore.koppuravuri@intel.com,
 vinay.belgaumkar@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/xe_pmu: Adjust assertion to account for potential RPe
 adjustments by GuC
Date: Tue,  6 May 2025 20:36:17 +0530
Message-Id: <20250506150617.1961348-1-sk.anirban@intel.com>
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

In scenarios where the GuC adjusts the RPe, the minimum frequency may align
with the adjusted RPe frequency. The assertion has been updated to account
for this scenario.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 094dc0c6c..2e29a4056 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t gt = eci->gt_id;
 	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
 	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
+	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
 
@@ -438,7 +439,9 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 * Restore min/max.
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
-	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);
+	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
+	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min ||
+		   xe_gt_get_freq(fd, gt, "min") == orig_rpe);
 
 	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
 		 min[0], min[1]);
-- 
2.34.1

