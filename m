Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC016CCFA03
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8076110EC07;
	Fri, 31 Oct 2025 18:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H7gJUw60";
	dkim-atps=neutral
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86310EC07
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:12:50 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-780fc3b181aso1902595b3a.2
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 11:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761934370; x=1762539170; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYuoxDgzyZKT/gZQPtjpaXQ4uF48N8ttTAEh9wdzuEk=;
 b=H7gJUw60qwXjsJIsDR4em6LQVEtSK3NDNcG9p7Z5Dqgu50IJjfq1zgimpnNTHDrHrp
 T61xGGtFtkUlBpYYaIFfYufMJxjIP0kGgcJTWfyVd5at7Hg07YTg4tQyfhwmxaHhPNpG
 dTfSL2abwcLG3orh/TQY0OGU4e+nyD9t+UinHPt0opGAw0gp/JuUuF06xzxwKT/a8Y7d
 k7mKZmilfJze+TfjzpyqT1f8S4hpL5W9M+sk0gi1aQXtDLBwYhtHkN+uAdct8AKmHao5
 XDo8X5jA/rgAmnGaue6/JzXFQGLM8dc3ehD8YyxjWCUpLb2upqLoOWPE0bEusYll2Wv1
 ERog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934370; x=1762539170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OYuoxDgzyZKT/gZQPtjpaXQ4uF48N8ttTAEh9wdzuEk=;
 b=IOXEVhbYyyzhBDoVsWJ2oYcYB8vfVvB6vVqIVCjYpuD7+ab3ibDiZSnpu8+aSToW2j
 eAG38LCIPxmN7C3CRAB8hm9nUs11cz7AR+dMBvDqKHmJnDccJlQVlVrvStjgjOuWKAJR
 k7hxTTtbG2NxbQZu1X5jboFC9QrUt/I44D5OMI/2POGQNe+llKS3u1ZvC8QiY1DPoong
 Yd0mYNaJwW0QUBKtlAGyb4lei8TDPrqU8Vd67xbQQNN3NDhwoPKbe7rETI8HtmlhRZbo
 vlBxFTUegLFFpYl84kwAjvvPogrB0QM4l1xoweYIx3U+V1K3UdsXnPs4PvHspSXaaLVf
 k+lw==
X-Gm-Message-State: AOJu0YxJhlH54Ybo/IvMcIT8YbgaO+DgNQSPql5IdL523XQwPIrWjDZU
 eDxNGbVHgAXgdVezBwRJ/rQcS661z6YjsxFzB3BmJ0PXHGdHOqfFzyx6blBoEJG3
X-Gm-Gg: ASbGncvosXL4oZQcAfIpGlIZwHxxmCPjVb08RXcOSQdAIGf2HuOMKZ1Ju/cyw94cR/u
 V48bI6gLzyuR/PkmW7ZKCdf5OBPg2ST8zcY2EL6Ky3EQbEnJHUnzgmWOKkHaBHFgtw5XgOYno+n
 4X2nh+wPijhxpF0wENQh6chscn+yhfkaPG21OGjcVLN4TkTMTQRrlfaC5BtUmQqNrmWaXwJMUGH
 5a3a9yX72ZLi+f0Ra0DzOiTiKghR1u9G2zohvsoW+Qd6MjOJjp0MzIf38zMEOami5A3up/AImq0
 LyDZWvliG9Zp+hzxBqI4kxGd9pgQJYDiesb2/hdu/qP5mgYzbFf6LIzVr87J9SZ15Yqnwhm5zgU
 OtqYJigIOJZuUO61i5EPE/L/EtSBC/OzteCxLYyqqqeSE7fEGjpGrdcWKvTTh8VjVp9RvgZOz9F
 s0pG2+GUAJWyb7MRBP
X-Google-Smtp-Source: AGHT+IHbBJ9cfFYi1OP5MPTOS1SJG2KlXth2DyBdCv9RBUQnoy2AApTmd688Ldi1x1+s23mr96qISw==
X-Received: by 2002:a05:6a00:23d2:b0:782:2b62:8188 with SMTP id
 d2e1a72fcca58-7a7793c8651mr6370459b3a.15.1761934369980; 
 Fri, 31 Oct 2025 11:12:49 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7db09f362sm2834184b3a.38.2025.10.31.11.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 11:12:49 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/1] tests/intel/i915_module_load: Add kernel default
 faul injection tests
Date: Fri, 31 Oct 2025 20:12:12 +0200
Message-ID: <20251031181216.172174-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031181216.172174-1-juhapekka.heikkila@gmail.com>
References: <20251031181216.172174-1-juhapekka.heikkila@gmail.com>
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
index 2047d1886..1d012f627 100644
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
@@ -361,6 +366,279 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
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
+	int fd;
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
+		int   faultcode;
+	} fail_tests[] = {
+		{"__uc_init", "__uc_init", -ENOMEM},
+		{"i915_driver_mmio_probe", "i915_driver_mmio_probe", -ENODEV},
+		{"i915_driver_hw_probe", "i915_driver_hw_probe", -ENODEV},
+		{"i915_pci_probe", "i915_pci_probe", -ENODEV},
+		{"__fw_domain_init", "__fw_domain_init", -ENOMEM},
+		{"intel_connector_register", "intel_connector_register", -EFAULT},
+		{"i915_driver_early_probe", "i915_driver_early_probe", -ENODEV},
+		{"intel_gt_init-ENODEV", "intel_gt_init", -ENODEV},
+		{"intel_guc_ct_init", "intel_guc_ct_init", -ENXIO},
+		{"uc_fw_rsa_data_create", "uc_fw_rsa_data_create", -ENXIO},
+	};
+
+	igt_require(fail_function_injection_enabled());
+	igt_install_exit_handler(cleanup_injection_fault);
+
+	fd = drm_open_driver(DRIVER_INTEL);
+	igt_require(fd);
+
+	sysfs = igt_sysfs_open(fd);
+	devicefd = openat(sysfs, "device", O_DIRECTORY);
+	bus_addr(fd, addr);
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	for (int c = 0; c < ARRAY_SIZE(fail_tests); c++) {
+		igt_dynamic(fail_tests[c].test_name) {
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
+					strerror(-ret), ret);
+			} else if (ret == 0) {
+				igt_info("Load succeeded - %s() was *not* executed!\n",
+					fail_tests[c].function);
+
+				injection_list_clear();
+				igt_assert_f(0, "%s() was *not* executed!\n",
+					fail_tests[c].function);
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
+					ret, strerror(-ret));
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

