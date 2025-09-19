Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A6FCAC5A5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 04:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBAF10E930;
	Fri, 19 Sep 2025 04:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+7CmZm+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBB110E930
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758257441; x=1789793441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VweNEvQBXdl1sBFvo3+1M0DgX/U9dMmZXpkrPNc2PiI=;
 b=H+7CmZm+7n1F0vdenZZSZJG3odNpSSnFyQs96QD2Jt5zcRY2MjuTzud+
 Xw+MC2R/Odib9ZmXw7CDYPjVPD1jo83zD8QZFjV8uEUCqHj282Pe+tDTM
 vs06zwtcWfZhrYdpRKkWOnOq+5/htwmV++/ZdWcyos6IpRFSxRv/9bEgw
 HGcMJ0wtRB5KyPX1Z67q7rRaZJBCbdm2q6V+KKGFIpHSEXCqBtQQT0EWr
 tQvKdvZ4k1GxKvITdBWUGTmE6EQDxCbSzLLobH9lmlImyI9OoWlHPbJaI
 GKJlIGYunhBOuhL4aPnHq7G4fAu1rC/LAsfsoyFwSN5K2eu5dh/Ss3dP2 g==;
X-CSE-ConnectionGUID: 5A/sfBSSS2Sx9wAnp+SIgg==
X-CSE-MsgGUID: wvsOwP70RDO5FYZR72AOig==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60531894"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="60531894"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 21:50:41 -0700
X-CSE-ConnectionGUID: 8H+9FXHbQsq08ygo2eOvVQ==
X-CSE-MsgGUID: S0xj6OptQGWyJwse0xSebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="179745524"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 21:50:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: Check
 ctx_restore_post_bb
Date: Thu, 18 Sep 2025 21:50:21 -0700
Message-ID: <20250918-configfs-ctx-restore-v2-2-5df035e27e42@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
References: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Add sanity checks for some bb written to ctx_restore_post_bb and
ctx_restore_mid_bb. For invalid values, it validates the xe configfs
implementation correctly rejects them. For valid values, it checks the
values are written correctly and that later when we driver binds that
the HW register contains the expected value.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 177 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 794c76132..7a7a7edf4 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -26,6 +26,31 @@
 static char bus_addr[NAME_MAX];
 static struct pci_device *pci_dev;
 
+static bool check_registers(const uint32_t reg[], const uint32_t val[],
+			    size_t max)
+{
+	struct intel_mmio_data mmio_data = { };
+	bool ret = false;
+
+	intel_register_access_init(&mmio_data, pci_dev, 0);
+
+	for (int i = 0; i < max && reg[i]; i++) {
+		uint32_t v = intel_register_read(&mmio_data, reg[i]);
+
+		if (v != val[i]) {
+			igt_debug("Expecting [%x]=%x but found %x\n",
+				  reg[i], val[i], v);
+			goto out;
+		}
+	}
+
+	ret = true;
+
+out:
+	intel_register_access_fini(&mmio_data);
+	return ret;
+}
+
 static void restore(int sig)
 {
 	int configfs_fd;
@@ -124,6 +149,142 @@ static void test_engines_allowed(int configfs_device_fd)
 	}
 }
 
+/**
+ * SUBTEST: ctx-restore-post-bb-invalid
+ * Description: Validate ctx_restore_post_bb attribute for invalid values
+ *
+ * SUBTEST: ctx-restore-mid-bb-invalid
+ * Description: Validate ctx_restore_mid_bb attribute for invalid values
+ */
+static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
+{
+	static const struct value {
+		const char *test;
+		const char *in;
+	} values[] = {
+		{ .test = "invalid-engine",
+		  .in = "foobar cmd 11000001 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-type",
+		  .in = "rcs 11000001 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-number",
+		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-number",
+		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-reg-addr-only",
+		  .in = "rcs reg 4F100",
+		},
+	};
+	char buf[4096] = { };
+	char file[64] = { };
+
+	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
+	igt_sysfs_set(configfs_device_fd, "ctx_restore_post_bb", "");
+
+	/*
+	 * These only test if command parsing is correct,
+	 * so just make sure there's no device bound
+	 */
+	igt_kmod_unbind("xe", bus_addr);
+
+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
+		const struct value *v = &values[i];
+
+		igt_info("Test %s\n", v->test);
+		igt_debug("bb '%s'\n", v->in);
+		igt_assert(!igt_sysfs_set(configfs_device_fd, file, v->in));
+		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
+					  sizeof(buf) - 1));
+		if (strcmp(buf, "")) {
+			igt_debug("Expecting empty bb, but found '%s'\n", buf);
+			igt_fail(IGT_EXIT_FAILURE);
+		}
+	}
+}
+
+/**
+ * SUBTEST: ctx-restore-post-bb
+ * Description: Validate ctx_restore_post_bb attribute
+ *
+ * SUBTEST: ctx-restore-mid-bb
+ * Description: Validate ctx_restore_mid_bb attribute
+ */
+static void test_ctx_restore(int configfs_device_fd, const char *type)
+{
+	static const struct value {
+		const char *test;
+		const char *in;
+		const char *out;
+		uint32_t reg[4];
+		uint32_t reg_val[4];
+	} values[] = {
+		/*
+		 * values for the registers just keep incrementing on different
+		 * tests to avoid having tests passing just because the
+		 * previous execution set a specific value in the HW
+		 */
+		{ .test = "cmd-single",
+		  .in = "rcs cmd 11000001 4F100 DEA0BEE0",
+		  .out = "rcs: 11000001 0004f100 dea0bee0\n",
+		  .reg = { 0x4f100 },
+		  .reg_val = { 0xdea0bee0 },
+		},
+		{ .test = "cmd-single-multi-values",
+		  .in = "rcs cmd 11000003 4F100 DEA1BEE1 4F104 DEA2BEE2",
+		  .out = "rcs: 11000003 0004f100 dea1bee1 0004f104 dea2bee2\n",
+		  .reg = { 0x4f100, 0x4f104 },
+		  .reg_val = { 0xdea1bee1, 0xdea2bee2 },
+		},
+		{ .test = "cmd-multi",
+		  .in = "rcs cmd 11000001 4F100 DEA3BEE3\n"
+			"rcs cmd 11000001 4F104 DEA4BEE4",
+		  .out = "rcs: 11000001 0004f100 dea3bee3 11000001 0004f104 dea4bee4\n",
+		  .reg = { 0x4f100, 0x4f104 },
+		  .reg_val = { 0xdea3bee3, 0xdea4bee4 },
+		},
+		{ .test = "reg-single",
+		  .in = "rcs reg 4F100 DEA5BEE5",
+		  .out = "rcs: 11000001 0004f100 dea5bee5\n",
+		  .reg = { 0x4f100 },
+		  .reg_val = { 0xdea5bee5 },
+		},
+		{ .test = "reg-multi",
+		  .in = "rcs reg 4F100 DEA6BEE6\n"
+			"rcs reg 4F104 DEA7BEE7",
+		  .out = "rcs: 11000001 0004f100 dea6bee6 11000001 0004f104 dea7bee7\n",
+		  .reg = { 0x4f100, 0x4f104 },
+		  .reg_val = { 0xdea6bee6, 0xdea7bee7 },
+		},
+	};
+	char buf[4096] = { };
+	char file[64] = { };
+
+	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
+
+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
+		const struct value *v = &values[i];
+
+		igt_kmod_unbind("xe", bus_addr);
+
+		igt_info("Test %s\n", v->test);
+		igt_debug("bb '%s'\n", v->in);
+		igt_assert(igt_sysfs_set(configfs_device_fd, file, v->in));
+
+		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
+					  sizeof(buf) - 1));
+		if (strcmp(v->out, buf)) {
+			igt_debug("Expecting '%s' but found '%s'\n", v->out, buf);
+			igt_fail(IGT_EXIT_FAILURE);
+		}
+
+		igt_kmod_bind("xe", bus_addr);
+		igt_assert(check_registers(v->reg, v->reg_val, sizeof(v->reg)));
+	}
+}
+
 static void set_bus_addr(int fd)
 {
 	pci_dev = igt_device_get_pci_device(fd);
@@ -176,6 +337,22 @@ igt_main
 	igt_subtest("engines-allowed")
 		test_engines_allowed(configfs_device_fd);
 
+	igt_describe("Validate ctx_restore_post_bb with invalid options");
+	igt_subtest("ctx-restore-post-bb-invalid")
+		test_ctx_restore_invalid(configfs_device_fd, "post");
+
+	igt_describe("Validate ctx_restore_post_bb");
+	igt_subtest("ctx-restore-post-bb")
+		test_ctx_restore(configfs_device_fd, "post");
+
+	igt_describe("Validate ctx_restore_mid_bb with invalid options");
+	igt_subtest("ctx-restore-mid-bb-invalid")
+		test_ctx_restore_invalid(configfs_device_fd, "mid");
+
+	igt_describe("Validate ctx_restore_mid_bb");
+	igt_subtest("ctx-restore-mid-bb")
+		test_ctx_restore(configfs_device_fd, "mid");
+
 	igt_fixture {
 		close(configfs_device_fd);
 		close(configfs_fd);

-- 
2.50.1

