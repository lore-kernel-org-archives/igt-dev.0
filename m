Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AB1CFA775
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 14:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B475610EA19;
	Fri,  4 Oct 2024 14:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqZf7UgC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA4610EA19
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 14:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728051409; x=1759587409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=356EBks25Uu6ho9m4jxksoMu0eUehWGrWBRZvIz14Eg=;
 b=JqZf7UgClaJKix6/ITKXF+9f+jSS/51SFIf+xcUxZfEZh14dlRASGqQI
 3PkGZOvHE4W8Kl4/UrF85kzbmhu41V2hwG2eZ1axU51EkC9LUnbfHWGAn
 iLy7WIV4pF+uKrUz/i4dDNE9QOoLfdJZ99A0URk58epK0UBXoWcqwMQWg
 qySAqVO5QA7OPj/CUXijhc3aBymK5UVuZRh7vuxaBT6gLAXQzQ6NU8CS7
 pUxHrGePd5Cg+LBUML30O8+rNnmXmzzOmX21jv5v7LPQkzK7FOz8R7FyP
 mj6jc6H8GmX5OCvpjPRBiAclcaaZ9x4tH7XeBI/i6BocwHkca4meMBpNL w==;
X-CSE-ConnectionGUID: mMgciFpDS5+TLlHNJZ1RFw==
X-CSE-MsgGUID: 5K0DcN9iSESkllIN5Hm2yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37878377"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="37878377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 07:16:49 -0700
X-CSE-ConnectionGUID: oGfFWGJdQ7eonrFdeYfREQ==
X-CSE-MsgGUID: 463bnXkmTP2VDkjCR53vXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74708416"
Received: from unknown (HELO jcavitt.jf.intel.com) ([10.165.125.150])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 07:16:49 -0700
From: Jonathan-Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, riana.tauro@intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_pm_residency: Skip on igt_power_open
 failure
Date: Fri,  4 Oct 2024 06:58:20 -0700
Message-Id: <20241004135820.1800808-1-jonathan.cavitt@intel.com>
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

The xe_pm_residency@toggle-gt-c6 test fails when
gt_c6_power >= gt_c0_power.  These values are reported by
igt_power_get_mW, which will always report 0 in the case that
igt_power_open fails to open either the hwmon_fd or rapl.fd.  Since the
expected result will always be a failure in this case, skip the
assertion that gt_c6_power < gt_c0_power.

v2: Do not skip the full test, and instead only ignore the part that is
guaranteed to fail.

Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 772fe9b574..0f146bad1c 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -282,10 +282,14 @@ static void measure_power(struct igt_power *gpu, double *power)
 static void toggle_gt_c6(int fd, int n)
 {
 	double gt_c0_power, gt_c6_power;
-	int gt;
+	int gt, ret;
 	struct igt_power gpu;
 
-	igt_power_open(fd, &gpu, "gpu");
+	/*
+	 * igt_power_get_mW will always return 0 if igt_power_open fails,
+	 * so skip the power check in this case.
+	 */
+	ret = igt_power_open(fd, &gpu, "gpu");
 
 	do {
 		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
@@ -312,7 +316,7 @@ static void toggle_gt_c6(int fd, int n)
 	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
 
 	/* FIXME: Remove dgfx check after hwmon is added */
-	if (!xe_has_vram(fd))
+	if (!xe_has_vram(fd) && !ret)
 		igt_assert_f(gt_c6_power < gt_c0_power,
 			     "Power consumed in GT C6 should be lower than GT C0\n");
 }
-- 
2.25.1

