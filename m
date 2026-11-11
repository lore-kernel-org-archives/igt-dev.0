Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF1606A326
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=elPtIJNa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE51110E9D1;
	Wed, 11 Nov 2026 10:21:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8226C10E29A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794392455; x=1825928455;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DuQzXzhVy9n82XX/I/BjjEy5Lmx/OmZSxY9BaFLSqTM=;
 b=elPtIJNawDfkIqPbNp+DPe/i3A8Sm6KR8W+LRU9Qp6NB9iIpQkVw53vd
 ET8HvQGAeqMiI4WZo0VQFKrJlSBhqGSbSNxrx0VOQD7r/SnKZrCnI3rJL
 AjoA16uhZ45SAniAH2+MYP2paw1n3BuedrRj42tm0HixczgXOZSzlNSKj
 UC8Ut10JN7KigG+jRApYkkWlP6UANsUgNNCp+pfAB76Mj9P+yFZmy9/KP
 KYJzzQxvSkT4iYhmyrFlE4R4OvpX2bJnnC1ZyMVDfvzhI6wQnyEf6bxpJ
 PA0OB/AnFPACkqNAXL/voswiIcR4PtE+rFW2gZw+9QGQUPoMu4sy+++ip w==;
X-CSE-ConnectionGUID: BdvvMNs8TeKtWRaFXQDwwg==
X-CSE-MsgGUID: u3+7qCN+TTutWSkv6mFNSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3062318"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3062318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:20:55 -0800
X-CSE-ConnectionGUID: fPHJICpmR9Wb4bMTRydxWQ==
X-CSE-MsgGUID: kKzrLgsJTqCXhX0kgP+C3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8726990"
Received: from nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:20:53 -0800
From: Hiresh Kumar Yadav <hiresh.kumar.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, sk.anirban@intel.com,
 Hiresh Kumar Yadav <hiresh.kumar.yadav@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/i915_pm_rpm: Print reason for skipping
 PC8 subtest
Date: Wed, 11 Nov 2026 15:37:42 +0530
Message-Id: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

gem-execbuf-stress-pc8 skips with only "Test requirement: has_pc8",
which doesn't tell the user why PC8+ support is unavailable.

Record the specific reason in setup_pc8() (unsupported platform,
PC8+ residency MSRs not readable, or package C-states limited by
BIOS) and print it when skipping.

v2:
- Drop unreachable skip reason (Anirban)
- Use neutral reason when PC8+ C-states aren't enabled (Anirban)
- Drop cause when residency MSRs are unreadable (Anirban)
- Removed printing platform/codename (Anirban)

Signed-off-by: Hiresh Kumar Yadav <hiresh.kumar.yadav@intel.com>
---
 tests/intel/i915_pm_rpm.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index b4da27b21..ee5e51c57 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -131,6 +131,7 @@ enum plane_type {
 int drm_fd, msr_fd, pc8_status_fd;
 int debugfs;
 bool has_runtime_pm, has_pc8;
+static const char *pc8_skip_reason;
 struct mode_set_data ms_data;
 
 /* Stuff used when creating FBs and mode setting. */
@@ -222,15 +223,24 @@ static bool supports_pc8_plus_residencies(void)
 
 	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC8_RES);
 	if (rc != sizeof(val))
-		return false;
+		goto no_msr;
 	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC9_RES);
 	if (rc != sizeof(val))
-		return false;
+		goto no_msr;
 	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC10_RES);
 	if (rc != sizeof(val))
+		goto no_msr;
+
+	if (!igt_pm_pc8_plus_residencies_enabled(msr_fd)) {
+		pc8_skip_reason = "PC8+ package C-states not enabled";
 		return false;
+	}
 
-	return igt_pm_pc8_plus_residencies_enabled(msr_fd);
+	return true;
+
+no_msr:
+	pc8_skip_reason = "PC8/PC9/PC10 residency MSRs not readable";
+	return false;
 }
 
 static uint64_t get_residency(uint32_t type)
@@ -550,8 +560,10 @@ static void setup_pc8(void)
 	has_pc8 = false;
 
 	/* Only Haswell supports the PC8 feature. */
-	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid))
+	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid)) {
+		pc8_skip_reason = "PC8+ residency is only supported on Haswell/Broadwell";
 		return;
+	}
 
 	/* Make sure our Kernel supports MSR and the module is loaded. */
 	igt_require(modprobe("msr") == 0);
@@ -1147,7 +1159,7 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
 	igt_require_gem(drm_fd);
 
 	if (wait_flags & WAIT_PC8_RES)
-		igt_require(has_pc8);
+		igt_require_f(has_pc8, "%s\n", pc8_skip_reason);
 
 	i = 0;
 	batch_buf[i++] = MI_NOOP;
-- 
2.54.0

