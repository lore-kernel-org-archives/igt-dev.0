Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CB7CD6E5D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 07:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C191611A4DE;
	Fri,  5 Jun 2026 07:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNVaHW3x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCAC11A4DC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780643569; x=1812179569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j10jDSrsva6Ohk1RfyxWWvfr5zhktOP0iBdFh/QvJMo=;
 b=LNVaHW3xYmfNGhFm08K91KSan/zmYWnjosmUuzpJTYc0qIY4Z54aDV6d
 CPljfyuB4E2mRoJDdMgp1XT/q1bkIteffRdAOzoClQM1o4zwXcOob5vFN
 7GyQLjED/nwwrEtChB9vEAn1VslexXV8knbwyivlnK10YWWejWGLlX9ni
 BcScKeWY1eL1YXIT1X6Qptw/QYA+0UyOAY/z+YlFTaFaH4aH+bedEmJdz
 5STCago5yOrziXlo3U2wYKtiAiAeVv2Y5ljcI0BF4fe1v+vnuV8MQcdQP
 MH4P82K7PwJqnFqcaacuBVtK5/oQN3CH3kFa0LGF1+M0NpvV81b/SQgsF A==;
X-CSE-ConnectionGUID: kIaDDhorRcu+Zd8OBbvqrg==
X-CSE-MsgGUID: S7XOoqZ7RoeLNNQ8b1w61A==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85328299"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="85328299"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 00:12:49 -0700
X-CSE-ConnectionGUID: J/PkDhW/QxaD48gqxcy5qw==
X-CSE-MsgGUID: E3wlpqkNRWmW7oecLbWATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="240318997"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2026 00:12:48 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 1/2] tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume
 validation test
Date: Fri,  5 Jun 2026 12:32:33 +0530
Message-ID: <20260605070235.42439-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605070235.42439-1-mohammed.thasleem@intel.com>
References: <20260605070235.42439-1-mohammed.thasleem@intel.com>
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

Validate DC5 state entry before and after suspend/resume cycle using DPMS.
Ensures DC5 functionality is preserved across system suspend/resume
operations.

v2: Remove repeated word. (Pranay)
    Remove extra line.
v3: Update test description. (Jeevan)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 423a5c4a4..249d9e11a 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -77,6 +77,9 @@
  *
  * SUBTEST: dc5-retention-flops
  * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
+ *
+ * SUBTEST: dc5-dpms-suspend-resume
+ * Description: This test validates DC5 state entry before and after a suspend/resume cycle using DPMS
  */
 
 #define PWR_DOMAIN_INFO "i915_power_domain_info"
@@ -622,6 +625,13 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
 }
 
+static void test_dc5_dpms_suspend_resume(data_t *data, int dc_flag)
+{
+	test_dc_state_dpms(data, dc_flag);
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	test_dc_state_dpms(data, dc_flag);
+}
+
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -743,6 +753,11 @@ int igt_main()
 		test_dc9_dpms(&data);
 	}
 
+	igt_describe("This test validates DC5 state entry before and after a "
+		      "suspend/resume cycle using DPMS");
+	igt_subtest("dc5-dpms-suspend-resume")
+		test_dc5_dpms_suspend_resume(&data, IGT_INTEL_CHECK_DC5);
+
 	igt_fixture() {
 		free(data.debugfs_dump);
 		close(data.debugfs_fd);
-- 
2.43.0

