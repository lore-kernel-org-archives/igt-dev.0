Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DFFCCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 19:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F18D10E63F;
	Tue, 11 Nov 2025 19:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cjsJh0vx";
	dkim-atps=neutral
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A06210E63F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 19:49:53 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-34182b1c64bso67049a91.3
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 11:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762890592; x=1763495392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hMomCxIPSSKuD6FEXbMWEWGlB+h4qlEpEmk9TEVMisI=;
 b=cjsJh0vxB3DkheI3boET7/DNCWpdRvCRJEtFKLs4irmz9o9a+gCP5otEybx8hdmtYF
 S9UeBDdf02F+SzOkqj0Q5qWEFbhyi2OQGF3q8NJrgZ5+weagw9zMa2A7MpXoAEiTPjH7
 fAzLm6DTim2rSQC1ln1vkXSvHkWuWJUC1X4znBuPWfvX6TZpu25ZEli/jl1D1TpzXC8a
 Tzve6gVLErFbGPzrng+pAFLluZRDN4iGP8w3nmZvy9im91vEKDrjUeLNtXfiwq0Iiw+9
 H4kUcT0Did4nAg3J2eoFIs1jY1t+rtrSQ/musVK+Ua+D3EC7qM0TDXusZFwazIaBKcw3
 qAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762890592; x=1763495392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hMomCxIPSSKuD6FEXbMWEWGlB+h4qlEpEmk9TEVMisI=;
 b=dw9WtGRDrRC3FmxktVI5aYMRv7HCY6usdYLfn3Ky0WGo7dKmOTCUfijhpOqr/Ly69D
 udfDU4JLWIcE1DLZbWXyg5nGNb8rVFNcLplPmPBgpPgSD7HHmtYpq8x7y/vn/80e0ICs
 yuGo1Lu7hRSZoi/ESEYxlyQtWu3TKRqJrLP9JnUeJ13EcmpPKUEvMCRnh4yD5FLDD1iQ
 9KpwKacU2RbF//KuT4D52xLhhuVUKMWH7+Ys644YDp/w5jT46LiFRUVnH0d9pahLWp9d
 H2PT1NBiZXkqvuWb6VhsOCO/rIGrTdfD6oJFPJXQt8P4QAA9/6g6yi/JD+hNsfp3W0Xr
 dZkQ==
X-Gm-Message-State: AOJu0YwLa6PiFyCMVLsDKpc3fIzGCps7jIdD2aXo7bLNj+yeB2IodmF/
 CuOlzsro9WsIRswpZu16kccEgIAHTMhojeiA2lBwIjna7GGC26nYZPtkZ0AJhSM4
X-Gm-Gg: ASbGnctD54qG2VZWfXNuQhhIWF9jkQgMca1/U+Z/8LE8ubtRvTsO1JRDeUs9NKjBVPk
 ks6wF7npH5+dp9X4ssRgsdfo7KCW771MT33y1ShmV7+8s1N4w79l6/gi6m2/tptQr/jNEm+L2ny
 kQnSfOozNmcFIE6pkKg8gsITgst+JaxxkmCiz4FoIpRiQ+uLUgyEMv/xZVR6Dk8ZnnoLoeezsj2
 c3rbtkBmkz7pYNQjME4BJUVxRi9YRTJ/6/qgi8rmluW2BnBjWsiatX6cVg+5vZVcJeN76oQ1g8r
 NZTGRpwnul88y/A4upN4maLsPKnmn3/H8Md/rv58xYcp6ZOmerXu3fIwnGoFIHhZMSRMGEZxQrh
 zbVyq8Cz6RFNmwNrHAR7nBVduTbk+9owBYUXblF8LAsjY+T0vTqvobvDVqasq2g/2aT8ulF2DAR
 wIzBwau8OM/trVqROAWjyApG3Riw==
X-Google-Smtp-Source: AGHT+IF4NnN/ImuwuzLISlTpa5p+0n5qQ5LAGrBYcPMIWBSZ/s3irt4ZSDVqh5jivAGGvYwh5fQEGw==
X-Received: by 2002:a17:90b:554d:b0:32e:528c:60ee with SMTP id
 98e67ed59e1d1-343ddeaf22dmr556372a91.24.1762890592336; 
 Tue, 11 Nov 2025 11:49:52 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343cd8d18ebsm2444729a91.9.2025.11.11.11.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 11:49:52 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/1] tests/intel/i915_module_load: Add kernel default
 faul injection tests
Date: Tue, 11 Nov 2025 21:49:08 +0200
Message-ID: <20251111194936.444955-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111194936.444955-1-juhapekka.heikkila@gmail.com>
References: <20251111194936.444955-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Here added fault-injection subtest which use kernel default fault
injection with bind/unbind.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/i915_module_load.c | 287 +++++++++++++++++++++++++++++++++
 1 file changed, 287 insertions(+)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 2047d1886..f7dfcd01a 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -33,6 +33,10 @@
  * Feature: core
  * Test category: GEM_Legacy
  *
+ * SUBTEST: fault-injection
+ * Description: Verify that i915 driver can be successfully bound and unbound with fault injection.
+ * Functionality: fault
+ *
  * SUBTEST: load
  * Description: Check if i915 and friends are not yet loaded, then load them.
  *
@@ -68,6 +72,7 @@
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 #include "igt_core.h"
+#include "igt_device.h"
 
 #define BAR_SIZE_SHIFT 20
 #define MIN_BAR_SIZE 256
@@ -361,6 +366,284 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
 	return lmem_bar_size;
 }
 
+struct fault_injection_params {
+	/* @probability: Likelihood of failure injection, in percent. */
+	uint32_t probability;
+	/* @interval: Specifies the interval between failures */
+	uint32_t interval;
+	/* @times: Specifies how many times failures may happen at most */
+	int32_t times;
+	/*
+	 * @space: Specifies how many times fault injection is suppressed before
+	 * first injection
+	 */
+	uint32_t space;
+};
+
+static int fail_function_open(void)
+{
+	int debugfs_fail_function_dir_fd;
+	const char *debugfs_root;
+	char path[96];
+
+	debugfs_root = igt_debugfs_mount();
+	igt_assert(debugfs_root);
+
+	sprintf(path, "%s/fail_function", debugfs_root);
+
+	if (access(path, F_OK))
+		return -1;
+
+	debugfs_fail_function_dir_fd = open(path, O_RDONLY);
+	igt_debug_on_f(debugfs_fail_function_dir_fd < 0, "path: %s\n", path);
+
+	return debugfs_fail_function_dir_fd;
+}
+
+static void injection_list_add(const char function_name[])
+{
+	int dir;
+
+	dir = fail_function_open();
+
+	igt_assert_lte(0, dir);
+	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
+
+	close(dir);
+}
+
+/*
+ * Default fault injection parameters which injects fault on first call to the
+ * configured fail_function.
+ */
+static const struct fault_injection_params default_fault_params = {
+	.probability = 100,
+	.interval = 0,
+	.times = -1,
+	.space = 0
+};
+
+/*
+ * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
+ */
+static void setup_injection_fault(const struct fault_injection_params *fault_params)
+{
+	int dir;
+
+	if (!fault_params)
+		fault_params = &default_fault_params;
+
+	igt_assert(fault_params->probability >= 0);
+	igt_assert(fault_params->probability <= 100);
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	igt_debug("probability = %d, interval = %d, times = %d, space = %u\n",
+			fault_params->probability, fault_params->interval,
+			fault_params->times, fault_params->space);
+
+	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
+	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
+	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
+	igt_sysfs_set_s32(dir, "times", fault_params->times);
+	igt_sysfs_set_u32(dir, "space", fault_params->space);
+	igt_sysfs_set_u32(dir, "verbose", 1);
+
+	close(dir);
+}
+
+static void injection_list_clear(void)
+{
+	/* If nothing specified (‘’) injection list is cleared */
+	return injection_list_add("");
+}
+
+/*
+ * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
+ */
+static bool fail_function_injection_enabled(void)
+{
+	char *contents;
+	int dir;
+
+	dir = fail_function_open();
+	if (dir < 0)
+		return false;
+
+	contents = igt_sysfs_get(dir, "injectable");
+	if (contents == NULL)
+		return false;
+
+	free(contents);
+
+	return true;
+}
+
+static void cleanup_injection_fault(int sig)
+{
+	injection_list_clear();
+}
+
+static void set_retval(const char function_name[], long long retval)
+{
+	char path[96];
+	int dir;
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	sprintf(path, "%s/retval", function_name);
+	igt_assert_lte(0, igt_sysfs_printf(dir, path, "%#016llx", retval));
+
+	close(dir);
+}
+
+static int
+inject_fault_probe(int fd, const char pci_slot[], const char function_name[],
+		   int inject_error, int devicefd)
+{
+	int err = 0;
+
+	injection_list_add(function_name);
+	set_retval(function_name, inject_error);
+
+	igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
+	igt_kmod_bind("i915", pci_slot);
+
+	err = -errno;
+	injection_list_clear();
+	return err;
+}
+
+static char *bus_addr(int fd, char *path)
+{
+	char sysfs[128];
+	char *rp, *addr_pos;
+
+	if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
+		return NULL;
+
+	if (128 <= (strlen(sysfs) + strlen("/device")))
+		return NULL;
+
+	strcat(sysfs, "/device");
+
+	rp = realpath(sysfs, path);
+
+	igt_require(strstr(rp, "/sys/devices/pci") == rp);
+	addr_pos = strrchr(rp, '/');
+
+	snprintf(path, PATH_MAX, "%s", addr_pos + 1);
+	return path;
+}
+
+static void test_fault_injection(void)
+{
+	char pci_slot[NAME_MAX], addr[PATH_MAX];
+	int ret = 0;
+	int sysfs = 0;
+	int devicefd = 0;
+	int fd, guc;
+
+	char error_ignore[] =
+		".*Device initialization failed.*"
+		"|.*probe with driver i915 failed with error.*"
+		"|.*\\*ERROR\\* GT1: GSC proxy handler failed to init.*"
+		"|.*\\*ERROR\\* GT0: GUC: failed with -ENXIO.*"
+		"|.*GuC fw rsa data creation failed -ENXIO.*"
+		"|.*GUC: failed with -ENXIO.*"
+		"|.*(\\*ERROR\\*) Failed to register driver for userspace access.*"
+		"|.*\\*ERROR\\* Failed to register driver for userspace access.*"
+		"|.*GT0: GuC fw rsa data creation failed -ENXIO.*"
+		;
+
+	struct {
+		const char *test_name;
+		const char *function;
+		int faultcode;
+		int flags; // 0x1 = guc
+	} fail_tests[] = {
+		{"__uc_init", "__uc_init", -ENOMEM, 1},
+		{"i915_driver_mmio_probe", "i915_driver_mmio_probe", -ENODEV, 0},
+		{"i915_driver_hw_probe", "i915_driver_hw_probe", -ENODEV, 0},
+		{"i915_pci_probe", "i915_pci_probe", -ENODEV, 0},
+		{"__fw_domain_init", "__fw_domain_init", -ENOMEM, 1},
+		{"intel_connector_register", "intel_connector_register", -EFAULT, 0},
+		{"i915_driver_early_probe", "i915_driver_early_probe", -ENODEV, 0},
+		{"intel_gt_init-ENODEV", "intel_gt_init", -ENODEV, 1},
+		{"intel_guc_ct_init", "intel_guc_ct_init", -ENXIO, 1},
+		{"uc_fw_rsa_data_create", "uc_fw_rsa_data_create", -ENXIO, 1},
+	};
+
+	igt_require(fail_function_injection_enabled());
+
+	fd = drm_open_driver(DRIVER_INTEL);
+	igt_require(fd);
+
+	guc = gem_submission_method(fd);
+
+	sysfs = igt_sysfs_open(fd);
+	devicefd = openat(sysfs, "device", O_DIRECTORY);
+	bus_addr(fd, addr);
+	igt_install_exit_handler(cleanup_injection_fault);
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	for (int c = 0; c < ARRAY_SIZE(fail_tests); c++) {
+		igt_dynamic(fail_tests[c].test_name) {
+			if (fail_tests[c].flags & 0x1)
+				igt_require(guc == GEM_SUBMISSION_GUC);
+
+			igt_emit_ignore_dmesg_regex(error_ignore);
+
+			igt_set_timeout(60, "Driver unbind re-bind timeout!");
+			igt_kmod_unbind("i915", pci_slot);
+			setup_injection_fault(&default_fault_params);
+
+			ret = inject_fault_probe(fd, pci_slot,
+						 fail_tests[c].function,
+						 fail_tests[c].faultcode,
+						 devicefd);
+
+			igt_reset_timeout();
+
+			if (ret == fail_tests[c].faultcode) {
+				igt_info("Load failed with expected error %s (%d)\n",
+					 strerror(-ret), ret);
+			} else if (ret == 0) {
+				igt_info("Load succeeded - %s() was *not* executed!\n",
+					 fail_tests[c].function);
+
+				injection_list_clear();
+				igt_assert_f(0, "%s() was *not* executed!\n",
+					     fail_tests[c].function);
+
+			} else {
+				igt_info("Load failed with unexpected error %d (%s)\n",
+					ret, strerror(-ret));
+
+				close(devicefd);
+				close(sysfs);
+				drm_close_driver(fd);
+
+				igt_i915_driver_unload();
+				igt_i915_driver_load(NULL);
+
+				igt_assert_f(0, "unexpected error %d (%s)\n",
+					     ret, strerror(-ret));
+			}
+		}
+	}
+
+	close(devicefd);
+	close(sysfs);
+	drm_close_driver(fd);
+
+	igt_i915_driver_unload();
+	igt_i915_driver_load(NULL);
+}
+
 igt_main
 {
 	igt_describe("Check if i915 and friends are not yet loaded, then load them.");
@@ -434,6 +717,10 @@ igt_main
 		unload_or_die("i915");
 	}
 
+	igt_describe("Test i915 fault injection");
+	igt_subtest_with_dynamic_f("fault-injection")
+		test_fault_injection();
+
 	igt_describe("Check whether lmem bar size can be resized to only supported sizes.");
 	igt_subtest("resize-bar") {
 		uint32_t result_bar_size;
-- 
2.43.0

