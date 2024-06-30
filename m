Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9D3C30659
	for <igt-dev@archiver.kernel.org>; Sun, 30 Jun 2024 22:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B448110E250;
	Sun, 30 Jun 2024 22:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMV1c0Nw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405C810E14C
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Jun 2024 22:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719788200; x=1751324200;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=WOoSpHe68JWiWhrlg1gtx0lQw4wcfkON+7Lm5qtCSjY=;
 b=GMV1c0Nw21gHZLpgjY5JDlCxlOoEQBT+77/Fbuv43/8ACsVGbjsDyqwc
 1uOzldFrm9yuOlLtZOUiANtUQ9Iy6lSYkpKGzxoSfYcKELZ3ntf3KN3Kj
 u5SjdAlcFVhoIrQAUWzOQxtvGCHZuA9dtnu+JDN/aMfUQoRtjk2fznS0e
 LnZBylTwe6sI6ZFpvPFIZvsHIUgQ/ngn8At4iDESf70CsNAZ6Cf/MBxMF
 gw87+I5bLMOrOPsjx/TG9WxgcWK6KJFMhJ2GNGRnXx+Yu+amCC9oU672B
 iNcm23O9t6YOCEegzHkZZIExgyy5Ad9um1BXyoOC8NjQvJtUSY4gmqi6g Q==;
X-CSE-ConnectionGUID: Ug4Lm1wFS9y4oW+BE/FUzg==
X-CSE-MsgGUID: wslb/rLXQty7f6+wmQXzcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="20763789"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="20763789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 15:56:39 -0700
X-CSE-ConnectionGUID: RIHnw3vxSiWptBvtSynbOQ==
X-CSE-MsgGUID: nhFINycCTFeYVfQQVrM+Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="45216138"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 15:56:39 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/13] tests/intel/xe_oa: add remove OA config tests
Date: Sun, 30 Jun 2024 15:56:30 -0700
Message-ID: <20240630225634.2404840-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240630225634.2404840-1-ashutosh.dixit@intel.com>
References: <20240630225634.2404840-1-ashutosh.dixit@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 333 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 333 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 64805d884f..cc0a09da1e 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -534,6 +534,12 @@ write_u64_file(const char *path, uint64_t val)
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
@@ -3484,6 +3490,321 @@ test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
 	load_helper_fini();
 }
 
+static int __xe_oa_add_config(int fd, struct drm_xe_oa_config *config)
+{
+	int ret = intel_xe_perf_ioctl(fd, DRM_XE_PERF_OP_ADD_CONFIG, config);
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
+	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config_id), 0);
+}
+
+static bool has_xe_oa_userspace_config(int fd)
+{
+	uint64_t config = 0;
+	int ret = intel_xe_perf_ioctl(fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config);
+	igt_assert_eq(ret, -1);
+
+	igt_debug("errno=%i\n", errno);
+
+	return errno != EINVAL;
+}
+
+#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
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
+		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &config_id, EACCES);
+	}
+	igt_waitchildren();
+
+	/* Removing invalid config ID should fail. */
+	intel_xe_perf_ioctl_err(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &wrong_config_id, ENOENT);
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
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET
+	};
+	struct intel_xe_oa_open_prop param = {
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
+	/* Prior to Xe2 */
+	if (intel_graphics_ver(devid) < IP_VER(20, 0)) {
+		regs[config.n_regs * 2] = 0xD04;
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+		regs[config.n_regs * 2] = 0xD2C;
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+	}
+	/* Prior to MTLx */
+	if (intel_graphics_ver(devid) < IP_VER(12, 70)) {
+		/* WAIT_FOR_RC6_EXIT */
+		regs[config.n_regs * 2] = 0x20CC;
+		regs[config.n_regs * 2 + 1] = 0;
+		config.n_regs++;
+	}
+
+	config.regs_ptr = (uintptr_t) regs;
+
+	/* Create a new config */
+	ret = intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_ADD_CONFIG, &config);
+	igt_assert(ret > 0); /* Config 0 should be used by the kernel */
+	config_id = ret;
+
+	xe_oa_remove_config(drm_fd, config_id);
+}
+
 /**
  * SUBTEST: xe-ref-count
  * Description: Check that an open oa stream holds a reference on the xe module
@@ -3891,6 +4212,18 @@ igt_main
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

