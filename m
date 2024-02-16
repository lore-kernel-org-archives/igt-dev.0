Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB14DC54781
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 23:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C96410ED13;
	Fri, 16 Feb 2024 23:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iday4yTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C5610ECE9
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 23:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708125433; x=1739661433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gf5MLsMhPSBEkauQcWGoOw1FT8uv9g+iHUAkBTcfz+8=;
 b=Iday4yTfqnGfEvwc7o0E8R6qriGdjPfSXJ7e4oE2a8dcOM5v8iJObFt1
 1N18mEnenf/skaqmadHGNCieB4zPfgWsIw5HhPkOrMK4TUbDPBs2NvF58
 fU4niGk4cz/qCS097fC0xmZHGmrtDHVNlSqcq47DOtycAbAlVGnxle40I
 Bejeoh5+3yBdwFyFeZkrmk5KLKJkh9vA45datqVxC2LoOcQYrEWzLaYmp
 F60E5AJE7Md2EKqLRqUagmkAyIwp5Qu2d84LjR79TBNhq7PPjeWWcAflm
 9KJL+a7wggCHEnWX+UZgUL0GT+1uy+4uRfcnkJtnZOUeaZOy1g2cXPMg+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="27724291"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; d="scan'208";a="27724291"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8626901"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 15:17:09 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 16/18] tests/intel/xe_oa: add remove OA config tests
Date: Fri, 16 Feb 2024 15:17:01 -0800
Message-ID: <20240216231703.845644-17-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216231703.845644-1-ashutosh.dixit@intel.com>
References: <20240216231703.845644-1-ashutosh.dixit@intel.com>
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

Add the following tests:
	* "invalid-create-userspace-config"
	* "invalid-remove-userspace-config"
	* "create-destroy-userspace-config"
	* "whitelisted-registers-userspace-config"

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 331 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 331 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 0984d73bc0f9..2270a91b3b18 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -575,6 +575,12 @@ write_u64_file(const char *path, uint64_t val)
 	fclose(f);
 }
 
+static bool
+try_sysfs_read_u64(const char *path, uint64_t *val)
+{
+	return igt_sysfs_scanf(sysfs, path, "%"PRIu64, val) == 1;
+}
+
 static unsigned long rc6_residency_ms(void)
 {
 	unsigned long value;
@@ -3601,6 +3607,319 @@ test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
 	load_helper_fini();
 }
 
+static int __xe_oa_add_config(int fd, struct drm_xe_oa_config *config)
+{
+	int ret = xe_perf_ioctl(fd, DRM_XE_PERF_OP_ADD_CONFIG, config);
+	if (ret < 0)
+		ret = -errno;
+	return ret;
+}
+
+static int xe_oa_add_config(int fd, struct drm_xe_oa_config *config)
+{
+	int config_id = __xe_oa_add_config(fd, config);
+
+	igt_debug("config_id=%i\n", config_id);
+	igt_assert(config_id > 0);
+
+	return config_id;
+}
+
+static void xe_oa_remove_config(int fd, uint64_t config_id)
+{
+	igt_assert_eq(xe_perf_ioctl(fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config_id), 0);
+}
+
+static bool has_xe_oa_userspace_config(int fd)
+{
+	uint64_t config = 0;
+	int ret = xe_perf_ioctl(fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config);
+	igt_assert_eq(ret, -1);
+
+	igt_debug("errno=%i\n", errno);
+
+	return errno != EINVAL;
+}
+
+#define SAMPLE_MUX_REG (IS_LUNARLAKE(xe_dev_id(drm_fd)) ? \
+			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
+
+/**
+ * SUBTEST: invalid-create-userspace-config
+ * Description: Test invalid configs are rejected
+ */
+static void
+test_invalid_create_userspace_config(void)
+{
+	struct drm_xe_oa_config config;
+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
+	const char *invalid_uuid = "blablabla-wrong";
+	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
+	uint32_t invalid_mux_regs[] = { 0x12345678 /* invalid register */, 0x0 };
+
+	igt_require(has_xe_oa_userspace_config(drm_fd));
+
+	memset(&config, 0, sizeof(config));
+
+	/* invalid uuid */
+	strncpy(config.uuid, invalid_uuid, sizeof(config.uuid));
+	config.n_regs = 1;
+	config.regs_ptr = to_user_pointer(mux_regs);
+
+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EINVAL);
+
+	/* invalid mux_regs */
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+	config.n_regs = 1;
+	config.regs_ptr = to_user_pointer(invalid_mux_regs);
+
+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EINVAL);
+
+	/* empty config */
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+	config.n_regs = 0;
+	config.regs_ptr = to_user_pointer(mux_regs);
+
+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EINVAL);
+
+	/* empty config with null pointer */
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+	config.n_regs = 1;
+	config.regs_ptr = to_user_pointer(NULL);
+
+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EINVAL);
+
+	/* invalid pointer */
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+	config.n_regs = 42;
+	config.regs_ptr = to_user_pointer((void *) 0xDEADBEEF);
+
+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EFAULT);
+}
+
+/**
+ * SUBTEST: invalid-remove-userspace-config
+ * Description: Test invalid remove configs are rejected
+ */
+static void
+test_invalid_remove_userspace_config(void)
+{
+	struct drm_xe_oa_config config;
+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
+	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
+	uint64_t config_id, wrong_config_id = 999999999;
+	char path[512];
+
+	igt_require(has_xe_oa_userspace_config(drm_fd));
+
+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
+
+	/* Destroy previous configuration if present */
+	if (try_sysfs_read_u64(path, &config_id))
+		xe_oa_remove_config(drm_fd, config_id);
+
+	memset(&config, 0, sizeof(config));
+
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+
+	config.n_regs = 1;
+	config.regs_ptr = to_user_pointer(mux_regs);
+
+	config_id = xe_oa_add_config(drm_fd, &config);
+
+	/* Removing configs without permissions should fail. */
+	igt_fork(child, 1) {
+		igt_drop_root();
+
+		xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config_id, EACCES);
+	}
+	igt_waitchildren();
+
+	/* Removing invalid config ID should fail. */
+	xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &wrong_config_id, ENOENT);
+
+	xe_oa_remove_config(drm_fd, config_id);
+}
+
+/**
+ * SUBTEST: create-destroy-userspace-config
+ * Description: Test add/remove OA configs
+ */
+static void
+test_create_destroy_userspace_config(void)
+{
+	struct drm_xe_oa_config config;
+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
+	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
+	uint32_t regs[100];
+	int i;
+	uint64_t config_id;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0, /* Filled later */
+
+		/* OA unit configuration */
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET
+	};
+	struct drm_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	char path[512];
+
+	igt_require(has_xe_oa_userspace_config(drm_fd));
+
+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
+
+	/* Destroy previous configuration if present */
+	if (try_sysfs_read_u64(path, &config_id))
+		xe_oa_remove_config(drm_fd, config_id);
+
+	memset(&config, 0, sizeof(config));
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+
+	regs[0] = mux_regs[0];
+	regs[1] = mux_regs[1];
+	/* Flex EU counters */
+	for (i = 1; i < ARRAY_SIZE(regs) / 2; i++) {
+		regs[i * 2] = 0xe458; /* EU_PERF_CNTL0 */
+		regs[i * 2 + 1] = 0x0;
+	}
+	config.regs_ptr = to_user_pointer(regs);
+	config.n_regs = ARRAY_SIZE(regs) / 2;
+
+	/* Creating configs without permissions shouldn't work. */
+	igt_fork(child, 1) {
+		igt_drop_root();
+
+		igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EACCES);
+	}
+	igt_waitchildren();
+
+	/* Create a new config */
+	config_id = xe_oa_add_config(drm_fd, &config);
+
+	/* Verify that adding the another config with the same uuid fails. */
+	igt_assert_eq(__xe_oa_add_config(drm_fd, &config), -EADDRINUSE);
+
+	/* Try to use the new config */
+	properties[3] = config_id;
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	/* Verify that destroying the config doesn't yield any error. */
+	xe_oa_remove_config(drm_fd, config_id);
+
+	/* Read the config to verify shouldn't raise any issue. */
+	config_id = xe_oa_add_config(drm_fd, &config);
+
+	__perf_close(stream_fd);
+
+	xe_oa_remove_config(drm_fd, config_id);
+}
+
+/**
+ * SUBTEST: whitelisted-registers-userspace-config
+ * Description: Test that an OA config constructed using whitelisted register works
+ */
+/* Registers required by userspace. This list should be maintained by
+ * the OA configs developers and agreed upon with kernel developers as
+ * some of the registers have bits used by the kernel (for workarounds
+ * for instance) and other bits that need to be set by the OA configs.
+ */
+static void
+test_whitelisted_registers_userspace_config(void)
+{
+	struct drm_xe_oa_config config;
+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
+	uint32_t regs[600];
+	uint32_t i;
+	uint32_t oa_start_trig1, oa_start_trig8;
+	uint32_t oa_report_trig1, oa_report_trig8;
+	uint64_t config_id;
+	char path[512];
+	int ret;
+	const uint32_t flex[] = {
+		0xe458,
+		0xe558,
+		0xe658,
+		0xe758,
+		0xe45c,
+		0xe55c,
+		0xe65c
+	};
+
+	igt_require(has_xe_oa_userspace_config(drm_fd));
+
+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
+
+	if (try_sysfs_read_u64(path, &config_id))
+		xe_oa_remove_config(drm_fd, config_id);
+
+	memset(&config, 0, sizeof(config));
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+
+	oa_start_trig1 = 0xd900;
+	oa_start_trig8 = 0xd91c;
+	oa_report_trig1 = 0xd920;
+	oa_report_trig8 = 0xd93c;
+
+	/* b_counters_regs: OASTARTTRIG[1-8] */
+	for (i = oa_start_trig1; i <= oa_start_trig8; i += 4) {
+		regs[config.n_regs * 2] = i;
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+	}
+	/* b_counters_regs: OAREPORTTRIG[1-8] */
+	for (i = oa_report_trig1; i <= oa_report_trig8; i += 4) {
+		regs[config.n_regs * 2] = i;
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+	}
+
+	/* Flex EU registers, only from Gen8+. */
+	for (i = 0; i < ARRAY_SIZE(flex); i++) {
+		regs[config.n_regs * 2] = flex[i];
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+	}
+
+	/* Mux registers (too many of them, just checking bounds) */
+	/* NOA_WRITE */
+	regs[config.n_regs * 2] = SAMPLE_MUX_REG;
+	regs[config.n_regs * 2 + 1] = 0;
+	config.n_regs++;
+
+	/* NOA_CONFIG */
+	if (!IS_LUNARLAKE(devid)) {
+		regs[config.n_regs * 2] = 0xD04;
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+		regs[config.n_regs * 2] = 0xD2C;
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+	}
+	if (!IS_LUNARLAKE(devid) && !IS_METEORLAKE(devid)) {
+		/* WAIT_FOR_RC6_EXIT */
+		regs[config.n_regs * 2] = 0x20CC;
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+	}
+
+	config.regs_ptr = (uintptr_t) regs;
+
+	/* Create a new config */
+	ret = xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_ADD_CONFIG, &config);
+	igt_assert(ret > 0); /* Config 0 should be used by the kernel */
+	config_id = ret;
+
+	xe_oa_remove_config(drm_fd, config_id);
+}
+
 /**
  * SUBTEST: xe-ref-count
  * Description: Check that an open oa stream holds a reference on the xe module
@@ -4004,6 +4323,18 @@ igt_main
 			test_stress_open_close(hwe);
 	}
 
+	igt_subtest("invalid-create-userspace-config")
+		test_invalid_create_userspace_config();
+
+	igt_subtest("invalid-remove-userspace-config")
+		test_invalid_remove_userspace_config();
+
+	igt_subtest("create-destroy-userspace-config")
+		test_create_destroy_userspace_config();
+
+	igt_subtest("whitelisted-registers-userspace-config")
+		test_whitelisted_registers_userspace_config();
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
-- 
2.41.0

