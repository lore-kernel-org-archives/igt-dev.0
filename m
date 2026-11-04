Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51654606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iVcxt5Hv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527C10E83C;
	Wed,  4 Nov 2026 07:31:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947A910E83C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793777343; x=1825313343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KNTIWN44vdj5Z4mZtJiBJGjjjIcn8zERO+nnML2xte4=;
 b=iVcxt5Hv2EJguWURuzQZKOGdzeVnhYp2GQqL58sVNDwcMaFBxcyQ5r0o
 ky4Ay8axClhALIwNFZ5G1Lgt5RZZEtBDvLc/xHeadUnBhXeAO6VZp0RVu
 nRmqycYoPyzIljNl3M6tQ61WJA9zkFf0KBnB8BSHxgEmx/xj8Zn/LhEwu
 uBcksY6Q6ThkwX49t6SDS8oc2udXS+kqCY9RC2m3hhdbJ5XQesEyj5Mdq
 hX2/ac74awvWgbKfBGcaXt03hmpJgPmi9EAWuXg9uyBYMzReYXRZuyXos
 AcISAE9Ru1EKqhty7X9jTyEt7MbbsYGLoX1ogKrdOzsVL2/VhOTs8Wqgy Q==;
X-CSE-ConnectionGUID: f7ux/dzjT/a97SpsmcPOSQ==
X-CSE-MsgGUID: jJhibQlTTZSctYeVJM2SBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2400918"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2400918"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:29:03 -0800
X-CSE-ConnectionGUID: vEYMX37bS0uCOPn3WASiWg==
X-CSE-MsgGUID: HToCxU6dSrmB05kbfvIEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8422305"
Received: from dut1105bmgfrd.igk.intel.com ([10.211.177.74])
 by fmviesa011.fm.intel.com with ESMTP; 03 Nov 2026 23:29:01 -0800
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: karthik.poosa@intel.com, ramadevi.gandi@intel.com,
	badal.nilawar@intel.com, peter.senna@intel.com,
	"Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>,
	Patil@freedesktop.org
Subject: [PATCH v1 1/2] tests/core_sysfs: add coverage for xe_device_sysfs
 entries
Date: Wed,  4 Nov 2026 07:28:49 +0000
Message-ID: <20261104072850.18413-2-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104072850.18413-1-shivtej.eknath.patil@intel.com>
References: <20261104072850.18413-1-shivtej.eknath.patil@intel.com>
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>

Add sysfs coverage subtests to validate the following
xe_device_sysfs entries:
- auto-link-downgrade-capable
- auto-link-downgrade-status
- lb-fan-control-version
- lb-voltage-regulator-version
- vram-d3cold-threshold-show
- vram-d3cold-threshold-store

Signed-off-by: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>
---
 tests/core_sysfs.c | 115 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
index 3173ffa7b..a10e462c8 100644
--- a/tests/core_sysfs.c
+++ b/tests/core_sysfs.c
@@ -20,8 +20,30 @@
  * SUBTEST: read-all-entries
  * Description: Read all entries from sysfs path
  *
+ * SUBTEST: auto-link-downgrade-capable-show
+ * Description: Read auto_link_downgrade_capable sysfs entry
+ *
+ * SUBTEST: auto-link-downgrade-status-show
+ * Description: Read auto_link_downgrade_status sysfs entry
+ *
+ * SUBTEST: lb-fan-control-version-show
+ * Description: Read lb_fan_control_version sysfs entry
+ *
+ * SUBTEST: lb-voltage-regulator-version-show
+ * Description: Read lb_voltage_regulator_version sysfs entry
+ *
+ * SUBTEST: vram-d3cold-threshold-show
+ * Description: Read vram_d3cold_threshold sysfs entry
+ *
+ * SUBTEST: vram-d3cold-threshold-store
+ * Description: Write and read back vram_d3cold_threshold sysfs entry
  */
 
+static bool sysfs_exists(int sysfs_fd, const char *path)
+{
+	return !faccessat(sysfs_fd, path, R_OK, 0);
+}
+
 IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
 
 int igt_main()
@@ -41,6 +63,99 @@ int igt_main()
 	igt_subtest("read-all-entries")
 		igt_dir_process_files_simple(sysfs);
 
+	igt_subtest("auto-link-downgrade-capable-show") {
+		int val;
+		int ret;
+
+		igt_require(sysfs_exists(sysfs,
+					 "device/auto_link_downgrade_capable"));
+
+		ret = igt_sysfs_scanf(sysfs,
+				      "device/auto_link_downgrade_capable",
+				      "%d", &val);
+
+		igt_assert(ret > 0);
+		igt_info("auto-link-downgrade-capable=%d\n", val);
+		igt_assert(val == 0 || val == 1);
+	}
+
+	igt_subtest("auto-link-downgrade-status-show") {
+		int val;
+		int ret;
+
+		igt_require(sysfs_exists(sysfs,
+					 "device/auto_link_downgrade_status"));
+
+		ret = igt_sysfs_scanf(sysfs,
+				      "device/auto_link_downgrade_status",
+				      "%d", &val);
+
+		igt_assert(ret > 0);
+		igt_info("auto-link-downgrade-status=%d\n", val);
+		igt_assert(val == 0 || val == 1);
+	}
+
+	igt_subtest("lb-fan-control-version-show") {
+		char version[64];
+		int ret;
+
+		igt_require(sysfs_exists(sysfs,
+					 "device/lb_fan_control_version"));
+
+		ret = igt_sysfs_scanf(sysfs,
+				      "device/lb_fan_control_version",
+				      "%63s", version);
+
+		igt_debug("ret=%d errno=%d\n", ret, errno);
+
+		igt_assert(ret > 0);
+
+		igt_info("lb-fan-control-version=%s\n", version);
+	}
+
+	igt_subtest("lb-voltage-regulator-version-show") {
+		char version[64] = {};
+		int ret;
+
+		igt_require(sysfs_exists(sysfs,
+					 "device/lb_voltage_regulator_version"));
+
+		ret = igt_sysfs_scanf(sysfs,
+				      "device/lb_voltage_regulator_version",
+				      "%63s", version);
+		igt_debug("ret=%d errno=%d\n", ret, errno);
+
+		igt_assert(ret > 0);
+		igt_info("lb-voltage-regulator-version=%s\n", version);
+	}
+
+	igt_subtest("vram-d3cold-threshold-show") {
+		uint64_t threshold;
+
+		igt_require(sysfs_exists(sysfs,
+					 "device/vram_d3cold_threshold"));
+
+		threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs);
+
+		igt_info("threshold=%" PRIu64 "\n", threshold);
+	}
+
+	igt_subtest("vram-d3cold-threshold-store") {
+		uint64_t old_val;
+		uint64_t new_val;
+
+		igt_require(sysfs_exists(sysfs,
+					 "device/vram_d3cold_threshold"));
+		old_val = igt_sysfs_get_vram_d3cold_threshold(sysfs);
+		igt_sysfs_set_vram_d3cold_threshold(sysfs, old_val + 1);
+		new_val = igt_sysfs_get_vram_d3cold_threshold(sysfs);
+		igt_assert_eq(new_val, old_val + 1);
+		/* restore */
+		igt_sysfs_set_vram_d3cold_threshold(sysfs, old_val);
+		igt_info("old=%" PRIu64 " new=%" PRIu64 "\n",
+			 old_val, new_val);
+	}
+
 	igt_fixture() {
 		close(sysfs);
 		drm_close_driver(fd);
-- 
2.34.1

