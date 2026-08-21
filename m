Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F690C5DF7D
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 20:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E2410F418;
	Fri, 21 Aug 2026 19:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M08FwwJ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB86610F410
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787340252; x=1818876252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zdRApDDXqX40yE2zO6DbcCKVvSaHiJ5nAbOXmnyxO+o=;
 b=M08FwwJ2izlhMLa6DiQqO2S2jyCUNhJWCJFW/jRwWg5xylVO6TlykJs6
 vxcXEuYx4lseeBBgsH7z55Ve/uuiXrHM9nzAEa/HTZYy1qoFAJNxbEzZl
 7G1HALXxxCjzM6Sov6nj22cyVyVIUmZ/w9TNVtlqpIqpCHMBgKJOuBSt6
 9nzz/kvo4EozbSCO5s/VGbHeR8EPE+bQyGXy5fNw1WIGJdDpMmBk9H7mk
 z1NCAV0IAhd8oMU5n+saxCMzp3+3T3rxL8O393hwsCAnoApQBYP5YUUza
 0hUx0cu1zWDfLUXyB+c8+z1T95nyQ0IfyCNll1oLfr1dboRT6cQMrLvZO w==;
X-CSE-ConnectionGUID: Y4ozZnlIRm6IKmIrX5zSjQ==
X-CSE-MsgGUID: n0NaUV80RXKFwiio/G3ELw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="110682218"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="110682218"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 12:23:35 -0700
X-CSE-ConnectionGUID: I6M3IPkiTXqieyNDmcfXmA==
X-CSE-MsgGUID: 2MGVU7sESgGAHKjv1CQ0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="289963504"
Received: from dut4475arls.fm.intel.com ([10.105.10.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 12:23:35 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_configfs: Add coverage for GuC log
 configfs entries
Date: Fri, 21 Aug 2026 19:23:33 +0000
Message-ID: <20260821192332.19060-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821192332.19060-4-stuart.summers@intel.com>
References: <20260821192332.19060-4-stuart.summers@intel.com>
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

Cover the new guc_log_level and guc_log_target debug configfs
attributes: default values, the full range of accepted values, values
that must be rejected, and rejection with -EBUSY while the device is
bound.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-5
---
 tests/intel/xe_configfs.c | 181 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index c537e5d69..c036a805e 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -365,6 +365,142 @@ static void test_ctx_restore(int configfs_debug_fd, const char *type,
 	}
 }
 
+/* Values accepted by the guc_log_level attribute: -1 (unset) and 0..5 */
+#define XE_GUC_LOG_LEVEL_UNSET	-1
+#define GUC_LOG_LEVEL_MAX	5
+
+/* Values accepted by the guc_log_target attribute: memory, NPK and both */
+#define GUC_LOG_TARGET_MEM	0
+#define GUC_LOG_TARGET_MAX	2
+
+static void assert_attr_eq(int configfs_debug_fd, const char *attr, int expected)
+{
+	int value;
+
+	igt_assert_f(igt_sysfs_scanf(configfs_debug_fd, attr, "%d", &value) == 1,
+		     "Failed to read %s\n", attr);
+	igt_assert_f(value == expected, "Expecting %s=%d but found %d\n",
+		     attr, expected, value);
+}
+
+static void set_attr_and_verify(int configfs_debug_fd, const char *attr, int value)
+{
+	char buf[16];
+
+	snprintf(buf, sizeof(buf), "%d", value);
+
+	igt_debug("Writing '%s' to %s\n", buf, attr);
+	igt_assert_f(igt_sysfs_set(configfs_debug_fd, attr, buf),
+		     "Writing '%s' to %s failed\n", buf, attr);
+	assert_attr_eq(configfs_debug_fd, attr, value);
+}
+
+static void test_attr_invalid(int configfs_debug_fd, const char *attr,
+			      const char * const *values, size_t nvalues,
+			      int unchanged)
+{
+	for (size_t i = 0; i < nvalues; i++) {
+		const char *v = values[i];
+
+		igt_debug("Writing '%s' to %s\n", v, attr);
+		igt_assert_f(!igt_sysfs_set(configfs_debug_fd, attr, v),
+			     "Writing '%s' to %s should have failed\n", v, attr);
+		assert_attr_eq(configfs_debug_fd, attr, unchanged);
+	}
+}
+
+/**
+ * SUBTEST: guc-log-level
+ * Description: Validate guc_log_level attribute
+ */
+static void test_guc_log_level(int configfs_debug_fd)
+{
+	/*
+	 * The attribute can only be changed while the device is unbound, so
+	 * make sure there's no device bound.
+	 */
+	igt_audio_driver_unload(NULL);
+	igt_kmod_unbind("xe", bus_addr);
+
+	/* Default is 'unset': the guc_log_level modparam is used instead */
+	assert_attr_eq(configfs_debug_fd, "guc_log_level", XE_GUC_LOG_LEVEL_UNSET);
+
+	for (int level = XE_GUC_LOG_LEVEL_UNSET; level <= GUC_LOG_LEVEL_MAX; level++)
+		set_attr_and_verify(configfs_debug_fd, "guc_log_level", level);
+
+	/* Restore the default and make sure the driver still probes */
+	set_attr_and_verify(configfs_debug_fd, "guc_log_level", XE_GUC_LOG_LEVEL_UNSET);
+	igt_assert_eq(igt_kmod_bind("xe", bus_addr), 0);
+}
+
+/**
+ * SUBTEST: guc-log-level-invalid
+ * Description: Validate guc_log_level attribute for invalid values
+ */
+static void test_guc_log_level_invalid(int configfs_debug_fd)
+{
+	static const char * const values[] = {
+		"-2", "6", "100", "abc", "1a", "",
+	};
+
+	igt_audio_driver_unload(NULL);
+	igt_kmod_unbind("xe", bus_addr);
+
+	test_attr_invalid(configfs_debug_fd, "guc_log_level", values,
+			  ARRAY_SIZE(values), XE_GUC_LOG_LEVEL_UNSET);
+}
+
+/**
+ * SUBTEST: guc-log-target
+ * Description: Validate guc_log_target attribute
+ */
+static void test_guc_log_target(int configfs_debug_fd)
+{
+	igt_audio_driver_unload(NULL);
+	igt_kmod_unbind("xe", bus_addr);
+
+	/* Default is to log to memory only */
+	assert_attr_eq(configfs_debug_fd, "guc_log_target", GUC_LOG_TARGET_MEM);
+
+	for (int target = GUC_LOG_TARGET_MEM; target <= GUC_LOG_TARGET_MAX; target++)
+		set_attr_and_verify(configfs_debug_fd, "guc_log_target", target);
+
+	/* Restore the default and make sure the driver still probes */
+	set_attr_and_verify(configfs_debug_fd, "guc_log_target", GUC_LOG_TARGET_MEM);
+	igt_assert_eq(igt_kmod_bind("xe", bus_addr), 0);
+}
+
+/**
+ * SUBTEST: guc-log-target-invalid
+ * Description: Validate guc_log_target attribute for invalid values
+ */
+static void test_guc_log_target_invalid(int configfs_debug_fd)
+{
+	static const char * const values[] = {
+		"-1", "3", "256", "abc", "1a", "",
+	};
+
+	igt_audio_driver_unload(NULL);
+	igt_kmod_unbind("xe", bus_addr);
+
+	test_attr_invalid(configfs_debug_fd, "guc_log_target", values,
+			  ARRAY_SIZE(values), GUC_LOG_TARGET_MEM);
+}
+
+/**
+ * SUBTEST: guc-log-bound
+ * Description: Validate GuC log attributes are rejected while bound
+ */
+static void test_guc_log_bound(int configfs_debug_fd)
+{
+	igt_kmod_bind("xe", bus_addr);
+
+	igt_assert_f(!igt_sysfs_set(configfs_debug_fd, "guc_log_level", "1"),
+		     "Writing guc_log_level while bound should have failed\n");
+	igt_assert_f(!igt_sysfs_set(configfs_debug_fd, "guc_log_target", "1"),
+		     "Writing guc_log_target while bound should have failed\n");
+}
+
 static void set_bus_addr(int fd)
 {
 	pci_dev = igt_device_get_pci_device(fd);
@@ -475,6 +611,51 @@ int igt_main()
 					   configfs_debug_fd);
 	}
 
+	igt_describe("Validate guc_log_level");
+	igt_subtest("guc-log-level") {
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_guc_log_level(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
+	}
+
+	igt_describe("Validate guc_log_level with invalid options");
+	igt_subtest("guc-log-level-invalid") {
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_guc_log_level_invalid(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
+	}
+
+	igt_describe("Validate guc_log_target");
+	igt_subtest("guc-log-target") {
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_guc_log_target(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
+	}
+
+	igt_describe("Validate guc_log_target with invalid options");
+	igt_subtest("guc-log-target-invalid") {
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_guc_log_target_invalid(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
+	}
+
+	igt_describe("Validate GuC log attributes are rejected while bound");
+	igt_subtest("guc-log-bound") {
+		create_debug_configfs_group(configfs_fd, &configfs_device_fd,
+					    &configfs_debug_fd);
+		test_guc_log_bound(configfs_debug_fd);
+		close_debug_configfs_group(configfs_fd, configfs_device_fd,
+					   configfs_debug_fd);
+	}
+
 	igt_describe("Validate ctx_restore_post_bb with invalid options");
 	igt_subtest("ctx-restore-post-bb-invalid") {
 		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
-- 
2.43.0

