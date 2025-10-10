Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BC9CCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 18:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7267610EC73;
	Fri, 10 Oct 2025 18:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dnrrmm4/";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CCB10EC77
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 18:37:00 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-28e7cd6dbc0so27057335ad.0
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760121420; x=1760726220; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyYR11sBWWxsEI58gzexxTzN4BMMNuKV2xn6+xTTHYY=;
 b=dnrrmm4/K08k8VA0CXFTALxTcvfoHN9+Vr15BqHdAnTSs0FmaNZF3S/53MAMEWcVeC
 CukCzj+fm/D3Ke+ytF/oUTC66ltpS2LuLuDtUvtTPY9rGZFv07GBMjvy6SDNEpt5aHu3
 TbuqI+4OMzGppES2QG3j0uz59DlVIX1p66PmN6H+AB/te+I1IjSOagYac7yTYLHj4hsV
 IhqX3rebHtRBXyGI8CoGHOCXbIBolgHgAxt/M/ByTbicqc6FpN2NdBKLhGmNPc2e2D7q
 cldtOOK3hfsGYruMkfHnjlSLtS1iZ3l+PiYAPMU+1eDbINUnanXQkVFcK//xCtZOrZMb
 Cf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760121420; x=1760726220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YyYR11sBWWxsEI58gzexxTzN4BMMNuKV2xn6+xTTHYY=;
 b=t17a6WZSS0cG2QuyLC6lpHIADHAGhwB5vRslXbY38Fqj4rsUNOb1Pk//mwu9BCFRKO
 Dc/hAD6b+ib1pm+pHx1TRjsY3ucIg/kC3lGmZoYsAdYU4T9gdGoApmqR2xUb/lmOx2wI
 DGR8yDmv7hC/tbs/0TRRKZSMDapee82nlk9KRPD6DG4ZEC2qoGGnWIjzNcnGE1hS9LHl
 B/CUwRuv6ePLYcGK2FNKI0yXGiBtFyEXwR3fUJhK+xGIDkojygqUv3KQTt+Ra2cq/ep8
 DbjHhpuwYwMFy1WnbQnQPmj0wmablRES7FV/+hcPYnybtnA2TUnPH6JO+HfhvLUEVCf6
 iVGQ==
X-Gm-Message-State: AOJu0Yw0arYklsiXgFDWKuRBlKbf/EeO9To/gX2tHiXKfsVUYQRwJEM5
 m848ioUubhEvC/hd6kRocj2oWlKc18srR8DW+ydBEMwKQOXpDN5gZD9MIQYi3na7
X-Gm-Gg: ASbGncuFHYwj9ZDTZGxgm1XRd0WFT1q/sfbvTZjzGpJOVybkH9BfNCZVIP8hOIiD4KD
 WeyJgnHxHqpqanZ6N6oAgzD/HDftTdnsdSkSrDqpfAodH75Gp60P3V0EP3LMx/da50hhiy8y56w
 +d8Gp8SLHiVXPOM5taVqI7ZgW5nzFlOhNcJP0Z3OMRL5WY8FqISFeKvs4CifLyWnauTr5K7aqbt
 9OtFiIw20DsBZEJB+X1eI9gpwktPSOEQM5MorpSKfUmHvEYLw1FdBORMPKPkzcKlyVy93qE3QsM
 UQttK8jC3KAvipdCOQpfrhbTDwlMXzSsRL00oCuXVeYIT9+KAiWkmGEMNKEGEDs7zee8f0PXI2N
 q8dmgy8O0toh1GgAMkzfeLELa+qEeiizDfIORnIX3Okjj1A==
X-Google-Smtp-Source: AGHT+IHsItslXNXQtogS0e62Hyb+NFJMdjkCkAJFEoYhWSgMj7Oymx+8bS/EUbgtiReJAbJje2Vwsw==
X-Received: by 2002:a17:902:d607:b0:269:8f2e:e38 with SMTP id
 d9443c01a7336-29027356528mr163238635ad.6.1760121419388; 
 Fri, 10 Oct 2025 11:36:59 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f05c2dsm63453695ad.73.2025.10.10.11.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 11:36:59 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Jani Nikula" <jani.nikula@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/i915_module_load: Add kernel default
 faul injection tests
Date: Fri, 10 Oct 2025 21:36:41 +0300
Message-ID: <20251010183643.1634589-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010183643.1634589-1-juhapekka.heikkila@gmail.com>
References: <20251010183643.1634589-1-juhapekka.heikkila@gmail.com>
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
 tests/intel/i915_module_load.c | 282 +++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 2047d1886..986e4e64f 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -33,6 +33,9 @@
  * Feature: core
  * Test category: GEM_Legacy
  *
+ * SUBTEST: fault-injection
+ * Description: Verify that i915 driver can be successfully bound and unbound with fault injection.
+ *
  * SUBTEST: load
  * Description: Check if i915 and friends are not yet loaded, then load them.
  *
@@ -68,6 +71,7 @@
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 #include "igt_core.h"
+#include "igt_device.h"
 
 #define BAR_SIZE_SHIFT 20
 #define MIN_BAR_SIZE 256
@@ -361,6 +365,280 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
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
+static void injection_list_remove(const char function_name[])
+{
+	int dir;
+
+	dir = fail_function_open();
+
+	igt_assert_lte(0, dir);
+	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
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
+inject_fault_probe(int fd, const char pci_slot[], const char function_name[], int inject_error)
+{
+	int err = 0;
+
+	injection_list_add(function_name);
+	set_retval(function_name, inject_error);
+
+	igt_kmod_bind("i915", pci_slot);
+
+	err = -errno;
+	injection_list_remove(function_name);
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
+	int driverfd = 0;
+	int devicefd = 0;
+	int fd;
+
+	struct {
+		const char *test_name;
+		const char *function;
+		int   faultcode;
+	} fail_tests[] = {
+		{"__uc_init", "__uc_init", -ENOMEM },
+		{"i915_driver_mmio_probe", "i915_driver_mmio_probe", -ENODEV },
+		{"i915_driver_hw_probe", "i915_driver_hw_probe", -ENODEV },
+		{"i915_pci_probe", "i915_pci_probe", -ENODEV },
+		{"__fw_domain_init", "__fw_domain_init", -ENOMEM },
+		{"intel_connector_register", "intel_connector_register", -EFAULT },
+		{"i915_driver_early_probe", "i915_driver_early_probe", -ENODEV },
+	};
+
+	fd = __drm_open_driver(DRIVER_INTEL);
+	igt_require(fd);
+
+	igt_install_exit_handler(cleanup_injection_fault);
+
+	sysfs = igt_sysfs_open(fd);
+	driverfd = openat(sysfs, "device/driver", O_DIRECTORY);
+	devicefd = openat(sysfs, "device", O_DIRECTORY);
+	bus_addr(fd, addr);
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	for (int c = 0; c < ARRAY_SIZE(fail_tests); c++) {
+		igt_dynamic(fail_tests[c].test_name) {
+			igt_require(fail_function_injection_enabled());
+
+			igt_set_timeout(60, "Driver unbind timeout!");
+			igt_kmod_unbind("i915", pci_slot);
+
+			igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
+			igt_reset_timeout();
+
+			setup_injection_fault(&default_fault_params);
+
+			igt_set_timeout(60, "Driver re-bind timeout!");
+			ret = inject_fault_probe(fd, pci_slot,
+						 fail_tests[c].function,
+						 fail_tests[c].faultcode);
+			igt_reset_timeout();
+
+			if (ret == fail_tests[c].faultcode) {
+				igt_info("Load failed with expected error %s (%d)\n",
+					strerror(-ret), ret);
+			} else if (ret == 0) {
+				igt_info("Load succeeded - %s() was *not* executed!\n",
+					fail_tests[c].function);
+
+				injection_list_clear();
+				igt_kmod_bind("i915", pci_slot);
+				igt_assert_f(0, "%s() was *not* executed!\n",
+					fail_tests[c].function);
+
+			} else {
+				igt_info("Load failed with unexpected error %d (%s)\n",
+					ret, strerror(-ret));
+
+				injection_list_clear();
+				igt_kmod_bind("i915", pci_slot);
+
+				igt_assert_f(0, "unexpected error %d (%s)\n",
+					ret, strerror(-ret));
+			}
+		}
+	}
+	igt_kmod_unbind("i915", pci_slot);
+
+	injection_list_clear();
+	igt_assert(igt_sysfs_set(devicefd, "reset", "1"));
+
+	close(devicefd);
+	close(driverfd);
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
@@ -434,6 +712,10 @@ igt_main
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

