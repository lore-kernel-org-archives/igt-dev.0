Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39CBD5B16E
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 13:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D48810E498;
	Mon, 15 Dec 2025 13:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KOUqqNSi";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4412E10E4DF
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 13:45:31 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34c277ea011so2305608a91.1
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 05:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765806330; x=1766411130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dKpL36eRT5n9AndfPzZsq0M2cpl1qWwKxuY5vLc9ik=;
 b=KOUqqNSilTztqmCSqZ0Ky6PKFD2M5M+Tb0j1EkCHV3FE4qymyqXvFKJ9MYZTMctGza
 FzZDdA3VxEuBV5pXcSNlTOozPhsiuc++7KloKj94uH3w+MLTdcrHWZFyQMo5QOWqtAmh
 PLgBt1h6LqEsDy4SjDUc2IdpH6RLOFEtdZ54QQbzELq8IVLrjWAKvctfsYjszuL2mdea
 +rYZgi3CRyGnFFqA+xA6erhaZTObluquVI2tt15kK0Svr4rzP1+LOrhsjIT+GYoRKQtr
 ClyLupBD8xgWRBSp5elu8kui/bSE+rk6qO+UH/EH9HU1FoXDZBHu397+M3OM9xMoGaiI
 R1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765806330; x=1766411130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3dKpL36eRT5n9AndfPzZsq0M2cpl1qWwKxuY5vLc9ik=;
 b=WScNjzc7uA6QuOYZNZ09NmONiW18DywpQ5ScDr1hqY/t/7bRNQSwFma/hYHsHy5RpL
 ALrLD23eUBEqFBEujcmmzr+Vu+2Ot3s/y1Ie8dAG9sRu91wY4gXd3cxPJ89QTh+HXyQb
 rUpyUEjWRISSBDcx3HCVelK/BM1YP6so6YRmUBbAQFuLyi6QkFnKBtyoFD/UIrwrpe6k
 I2HcGPMd8YOQ9Qu4NPNg0Jy4yHQKoIyB2ZkH2sYKArVk01LcmtnChTijkP0z19sA1k6O
 Zw2fCSlObRuf83W9F5jCV+J9CqgRK/eU7zi/oOi4TIWbVLwe2M5oPl7ufzt7JmLk/uos
 J6Ww==
X-Gm-Message-State: AOJu0YxUnYLAENg0TDZ41LZ0MzgEnsT5QSaT4dECg+HNUvXokZ0cHHVg
 unoHQmexNJORNTugw79+bKw1W/NpsRmkiXta2z2NmUq29c1TVd7C6kz/EMV4xAiD
X-Gm-Gg: AY/fxX549mfwUAB11VwglykRmmJX3e9uVkeQIYFNSsHtoj5yP3L38/gvScA8O/dVO1p
 LLbIkr2W3ZGg1PvjsoxbYH9XguK3+11WaZXuiJ/PuZK1pMj8xmm01OmZI/nxjhVEsDdBPu4lewp
 vD+M1MKTjVNk2AvNjUgbtdsB71yiiRMRaULv2irImBtlIVI/YjyGGmRujw4AY1Zy54WVg9f/WY5
 tPdAtnRGxLMulADZGto/DJP/kv+6PMuKtDJouaNZyosZc02AAu5dlcwxmBvmtkarHDy+jh2cdr0
 Y9WKFzMZ6hGOGqPNAIT7gvm1LRsezUUliHwUQCbNuOekszVn/QjRv+qA3gsFFIwamzfKK6raMFE
 i6pkuSzlr7tSEKPrNC72bY7jl4I1zIBwsXeDn9zr3NUlIIu0M8Ai3mIcf/zzV5PsYo34iROeGRG
 J/FXn85MWtVRRg//worshfcZzK9a1jnshSq+O8hD9gCQiEaRU=
X-Google-Smtp-Source: AGHT+IE95I+bypVUn+FXoxpohPU/p/VfGlUqcZQgcNChRdyFU5euDpfABZBkF36rH1bS9fjmYFEKuw==
X-Received: by 2002:a05:7022:1587:b0:11b:9386:a37d with SMTP id
 a92af1059eb24-11f34c49ee1mr6067676c88.44.1765806330280; 
 Mon, 15 Dec 2025 05:45:30 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11f2e1bb45csm45544223c88.1.2025.12.15.05.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 05:45:29 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/2] tests/intel/i915_module_load: Add kernel default
 faul injection tests
Date: Mon, 15 Dec 2025 15:44:34 +0200
Message-ID: <20251215134510.183735-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215134510.183735-1-juhapekka.heikkila@gmail.com>
References: <20251215134510.183735-1-juhapekka.heikkila@gmail.com>
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
 tests/intel/i915_module_load.c | 288 +++++++++++++++++++++++++++++++++
 1 file changed, 288 insertions(+)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 0c83d6701..8da9a1ca4 100644
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
@@ -361,6 +366,285 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
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
+		  fault_params->probability, fault_params->interval,
+		  fault_params->times, fault_params->space);
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
+	if (!contents)
+		return false;
+
+	free(contents);
+	close(dir);
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
+	char sysfs[PATH_MAX];
+	char *rp, *addr_pos;
+
+	if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
+		return NULL;
+
+	if (PATH_MAX <= (strlen(sysfs) + strlen("/device")))
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
+		".*Failed to register driver for userspace access!"
+		"|.*Device initialization failed.*"
+		"|.*probe with driver i915 failed with error.*"
+		"|.*GT1: GSC proxy handler failed to init.*"
+		"|.*GT0: GUC: failed with -ENXIO.*"
+		"|.*GuC fw rsa data creation failed -ENXIO.*"
+		"|.*GUC: failed with -ENXIO.*"
+		"|.*Failed to register driver for userspace access.*"
+		"|.*GT0: GuC fw rsa data creation failed -ENXIO.*"
+		;
+
+	struct {
+		const char *test_name;
+		const char *function;
+		int faultcode;
+		int flags; // 0x1 = guc related tests
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
+					 ret, strerror(-ret));
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
+	unload_or_die("i915");
+	igt_i915_driver_load(NULL);
+}
+
 int igt_main()
 {
 	igt_describe("Check if i915 and friends are not yet loaded, then load them.");
@@ -434,6 +718,10 @@ int igt_main()
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

