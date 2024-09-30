Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5019CCEB2CD
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 23:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD24310E159;
	Mon, 30 Sep 2024 23:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8ZI3p+0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807ED10E159
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727739950; x=1759275950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+u6Ri4tCZoIf1pygzOGBXYk+Da89QsqZm/Fpk3uotqw=;
 b=a8ZI3p+08/mkK1gs4XwmTlvhUsfV8OKNIJwZ2HD6K0m7ggabULbt+wZ1
 i+IBiYGv1dr4DMNsv0tebEqaHb7Yg7T9iq02g9onrcEXxIAV06Wlm2EBi
 C4qdH0giI2UfEerSr38ExK4F36tddrQVDGiEXJg5foDi2ZU/3efZiKmpB
 PA3lBfJPpdAuGCc9f+ZOwpsT3bUq9b8JrJKoie2xJCb5ope19roRuS1aC
 5Auimy3BNLlhEr35tj2HEdSeVtty9nocKkX0LSBPUtaW9LdHFbtcdPpg+
 QIuQGqkVi0K6ztVI2B1GEJMJQKRsQLAeSYk3a0UE1mIWlK+KEFYJ4cXLV w==;
X-CSE-ConnectionGUID: N6oViNjMQUm4VswWXh0KwA==
X-CSE-MsgGUID: 2tuvCH9ETLm4MdaVmywATQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37527164"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="37527164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 16:45:49 -0700
X-CSE-ConnectionGUID: bw+S3hyqQM+P4y9lIGXUrg==
X-CSE-MsgGUID: iisz46+ISoSebBqOQwkhPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73727477"
Received: from jcavitt.jf.intel.com ([10.165.125.150])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 16:45:49 -0700
From: Jonathan-Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com,
	alex.zuo@intel.com,
	jonathan.cavitt@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: Skip on igt_power_open
 failure
Date: Mon, 30 Sep 2024 16:27:20 -0700
Message-Id: <20240930232720.1496539-1-jonathan.cavitt@intel.com>
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
expected result will always be a failure in this case, skip the test to
end execution early.

Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_pm_residency.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 0e687558b1..36ed46cfc5 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -276,7 +276,11 @@ static void toggle_gt_c6(int fd, int n)
 	int gt;
 	struct igt_power gpu;
 
-	igt_power_open(fd, &gpu, "gpu");
+	/*
+	 * igt_power_get_mW will always return 0 if igt_power_open fails,
+	 * so skip the test in this case.
+	 */
+	igt_skip_on(igt_power_open(fd, &gpu, "gpu"));
 
 	do {
 		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
-- 
2.25.1

