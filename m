Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD092CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 10:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6D310E313;
	Wed,  1 Oct 2025 10:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duoE0vrt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A5510E313
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759313952; x=1790849952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vm3BJ0PRKVRfwuClVpTEUU8aWaWw8AP6YpREd9+XFSs=;
 b=duoE0vrt4QOnueRPw4uObsAdxYqQBHCq0KDZODKWCl7AahRahy1vIdRl
 E2I8hPLZTzLyf3IBOqOHqXQRLTwnK/giT8kvVZ0xPWzlas6EvxRTFA5Pq
 GmF/TPbuJDHtJoz9TovedRMsaIXcXy1bhCBEK0y2LT1tOXqZVQg0dE2S3
 iiGht3YB6yQTeaB1QRIudIdQu+oWsCDtR7xlndHnBh9FkIyal7CekIFjY
 N0Qwc6AVd9MSwL0RBGMZGbtSZerkvI6h8YrqZKeY3vAjqnyEBkPZRiOxn
 VMS0QOdCsx+cdWW7LkGamA7S7wUROcgbjlttib+0e8xtCyJHJubjB0Xti A==;
X-CSE-ConnectionGUID: QIxhQr4STpKawlnD4/4lHg==
X-CSE-MsgGUID: hScM27afSWeb1LYH3ciERA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60798386"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60798386"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:19:12 -0700
X-CSE-ConnectionGUID: LTm3ljXdTo6NYGPWr6k7Yg==
X-CSE-MsgGUID: 5eHGpMTMT/SV6QBTutYlHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178036846"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:19:11 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v4 4/4] tests/intel/xe_sriov_vram: Add test checking VF
 access to VRAM
Date: Wed,  1 Oct 2025 12:18:50 +0200
Message-Id: <20251001101850.25299-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251001101850.25299-1-lukasz.laguna@intel.com>
References: <20251001101850.25299-1-lukasz.laguna@intel.com>
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

Add a test to validate VF access to VRAM via BAR. The following
scenarios are covered:
- VF can access all provisioned memory via the VRAM BAR,
- VF cannot access memory beyond what's provisioned via the VRAM BAR,
- VF can access memory via the VRAM BAR after reprovisioning.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v4:
- log the failing ranges (Marcin),
- print detailed debug data when using verbose flag,
- change subtest name from vf-access-basic to vf-access-provisioned.
---
 tests/intel/xe_sriov_vram.c | 388 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 389 insertions(+)
 create mode 100644 tests/intel/xe_sriov_vram.c

diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
new file mode 100644
index 0000000000..6813875ac1
--- /dev/null
+++ b/tests/intel/xe_sriov_vram.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2025 Intel Corporation. All rights reserved.
+ */
+
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_sriov_device.h"
+#include "intel_vram.h"
+#include "xe/xe_sriov_provisioning.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: xe_sriov_vram
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: VRAM
+ * Functionality: VRAM access
+ * Description: Validate VF access to VRAM
+ *
+ * SUBTEST: vf-access-provisioned
+ * Description: Verify that VF can access all the provisioned memory via VRAM BAR
+ *
+ * SUBTEST: vf-access-beyond
+ * Description: Verify that VF cannot access memory beyond what's provisioned via VRAM BAR
+ *
+ * SUBTEST: vf-access-after-resize-down
+ * Description: Verify that VF can access the reprovisioned memory (reduced size) via VRAM BAR
+ *
+ * SUBTEST: vf-access-after-resize-up
+ * Description: Verify that VF can access the reprovisioned memory (increased size) via VRAM BAR
+ */
+
+IGT_TEST_DESCRIPTION("Xe tests for VRAM in SR-IOV context");
+
+static bool extended_scope, verbose;
+const size_t STEP = SZ_1M;
+
+static uint64_t get_provisioned_vram(unsigned int pf_fd, unsigned int vf_id)
+{
+	uint64_t size = 0;
+
+	/* TODO: adjust for multitile platforms */
+	size = xe_sriov_pf_get_provisioned_quota(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_id, 0);
+
+	return size;
+}
+
+struct range {
+	uint64_t start;
+	uint64_t end;
+};
+
+static int update_failing_range(struct range **ranges, unsigned int *nr_ranges, uint64_t offset)
+{
+	struct range *new_ranges;
+
+	if (!(*ranges) || (offset - (*ranges)[*nr_ranges - 1].end > STEP)) {
+		new_ranges = realloc(*ranges, (*nr_ranges + 1) * sizeof(struct range));
+		if (!new_ranges) {
+			free(*ranges);
+			*ranges = NULL;
+			*nr_ranges = 0;
+			return -ENOMEM;
+		}
+
+		*ranges = new_ranges;
+		(*nr_ranges)++;
+		(*ranges)[*nr_ranges - 1].start = offset;
+	}
+
+	(*ranges)[*nr_ranges - 1].end = offset;
+
+	return 0;
+}
+
+static bool validate_access_basic(struct vram_mapping *vram, unsigned int vf_id, size_t size)
+{
+	struct range *fail_ranges = NULL, *restore_fail_ranges = NULL;
+	unsigned int nr_fail_ranges = 0, nr_restore_fail_ranges = 0;
+	uint8_t read, orig;
+	unsigned int i;
+
+	for (size_t offset = 0; offset < size; offset += STEP) {
+		orig = intel_vram_read8(vram, offset);
+
+		read = intel_vram_write_readback8(vram, offset, vf_id);
+		if (read != vf_id) {
+			if (verbose)
+				igt_debug("VRAM write/read check failed on VF%u "
+					  "(offset: %#lx, write: %u, read: %u)\n",
+					  vf_id, offset, vf_id, read);
+			igt_assert(!update_failing_range(&fail_ranges, &nr_fail_ranges, offset));
+		}
+
+		read = intel_vram_write_readback8(vram, offset, orig);
+		if (read != orig) {
+			if (verbose)
+				igt_debug("Failed to restore original value on VF%u "
+					  "(offset: %#lx, original: %u, read: %u)\n",
+					  vf_id, offset, orig, read);
+			igt_assert(!update_failing_range(&restore_fail_ranges,
+							 &nr_restore_fail_ranges, offset));
+		}
+	}
+
+	for (i = 0; i < nr_fail_ranges; i++)
+		igt_info("VRAM write/read check failed in range %lx-%lx on VF%u\n",
+			 fail_ranges[i].start, fail_ranges[i].end, vf_id);
+
+	for (i = 0; i < nr_restore_fail_ranges; i++)
+		igt_info("Failed to restore original value in range %lx-%lx on VF%u\n",
+			 restore_fail_ranges[i].start, restore_fail_ranges[i].end, vf_id);
+
+	if (nr_fail_ranges || nr_restore_fail_ranges) {
+		free(fail_ranges);
+		free(restore_fail_ranges);
+		return false;
+	}
+
+	return true;
+}
+
+static void access_provisioned(unsigned int pf_fd, unsigned int num_vfs)
+{
+	struct vram_mapping vram;
+	size_t provisioned_vram;
+	uint64_t vram_bar_size;
+	bool passed = true;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	for_each_sriov_enabled_vf(pf_fd, vf_id) {
+		provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
+		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
+			  vf_id, provisioned_vram);
+
+		igt_assert(!intel_vram_bar_size(pf_fd, vf_id, &vram_bar_size));
+		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
+
+		if (vram_bar_size < provisioned_vram) {
+			igt_sriov_disable_vfs(pf_fd);
+			igt_skip("VRAM BAR size is smaller than provisioned VRAM\n");
+		}
+
+		igt_assert(!intel_vram_mmap(pf_fd, vf_id, 0, provisioned_vram,
+					    PROT_READ | PROT_WRITE, &vram));
+
+		passed &= validate_access_basic(&vram, vf_id, provisioned_vram);
+
+		intel_vram_munmap(&vram);
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	igt_assert(passed);
+}
+
+static bool validate_access_beyond(struct vram_mapping *vram, unsigned int vf_id,
+				   size_t provisioned_vram, size_t vram_bar_size)
+{
+	struct range *fail_ranges = NULL, *restore_fail_ranges = NULL;
+	unsigned int nr_fail_ranges = 0, nr_restore_fail_ranges = 0;
+	uint8_t read, orig;
+	unsigned int i;
+
+	for (size_t offset = provisioned_vram; offset < vram_bar_size; offset += STEP) {
+		orig = intel_vram_read8(vram, offset);
+
+		read = intel_vram_write_readback8(vram, offset, vf_id);
+		if (read == vf_id) {
+			igt_assert(!update_failing_range(&fail_ranges, &nr_fail_ranges, offset));
+
+			read = intel_vram_write_readback8(vram, offset, orig);
+			if (read != orig) {
+				if (verbose)
+					igt_debug("Failed to restore original value on VF%u "
+						  "(offset: %#lx, original: %u, read: %u)\n",
+						  vf_id, offset, orig, read);
+				igt_assert(!update_failing_range(&restore_fail_ranges,
+								 &nr_restore_fail_ranges, offset));
+			}
+		}
+	}
+
+	for (i = 0; i < nr_fail_ranges; i++)
+		igt_info("Unexpected VRAM write beyond provisioned size in range %lx-%lx on VF%u\n",
+			 fail_ranges[i].start, fail_ranges[i].end, vf_id);
+
+	for (i = 0; i < nr_restore_fail_ranges; i++)
+		igt_info("Failed to restore original value in range %lx-%lx on VF%u\n",
+			 restore_fail_ranges[i].start, restore_fail_ranges[i].end, vf_id);
+
+	if (fail_ranges || restore_fail_ranges) {
+		free(fail_ranges);
+		free(restore_fail_ranges);
+		return false;
+	}
+
+	return true;
+}
+
+static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
+{
+	struct vram_mapping vram;
+	size_t provisioned_vram;
+	uint64_t vram_bar_size;
+	bool passed = true;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	for_each_sriov_enabled_vf(pf_fd, vf_id) {
+		provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
+		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
+			  vf_id, provisioned_vram);
+
+		igt_assert(!intel_vram_bar_size(pf_fd, vf_id, &vram_bar_size));
+		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
+
+		if (vram_bar_size <= provisioned_vram) {
+			igt_sriov_disable_vfs(pf_fd);
+			igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
+		}
+
+		igt_assert(!intel_vram_mmap(pf_fd, vf_id, 0, vram_bar_size,
+					    PROT_READ | PROT_WRITE, &vram));
+
+		passed &= validate_access_beyond(&vram, vf_id, provisioned_vram, vram_bar_size);
+
+		intel_vram_munmap(&vram);
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	igt_assert(passed);
+}
+
+static void resize_and_access(unsigned int pf_fd, bool resize_up)
+{
+	struct vram_mapping vram;
+	size_t provisioned_vram;
+	uint64_t vram_bar_size;
+	unsigned int total_vfs;
+	const unsigned int vf_id = 1;
+	bool passed;
+
+	total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, resize_up ? total_vfs : 1);
+
+	provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
+	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_vram);
+
+	igt_sriov_disable_vfs(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, resize_up ? 1 : total_vfs);
+
+	provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
+	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_vram);
+
+	igt_assert(!intel_vram_bar_size(pf_fd, vf_id, &vram_bar_size));
+	igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
+
+	if (resize_up && vram_bar_size < provisioned_vram) {
+		igt_sriov_disable_vfs(pf_fd);
+		igt_skip("VRAM BAR size is smaller than provisioned VRAM\n");
+	}
+
+	if (!resize_up && vram_bar_size <= provisioned_vram) {
+		igt_sriov_disable_vfs(pf_fd);
+		igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
+	}
+
+	igt_assert(!intel_vram_mmap(pf_fd, vf_id, 0, vram_bar_size, PROT_READ | PROT_WRITE,
+				    &vram));
+
+	passed = validate_access_basic(&vram, vf_id, provisioned_vram);
+	passed &= validate_access_beyond(&vram, vf_id, provisioned_vram, vram_bar_size);
+
+	intel_vram_munmap(&vram);
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	igt_assert(passed);
+}
+
+static int opts_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'e':
+		extended_scope = true;
+		break;
+	case 'v':
+		verbose = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{ .name = "extended", .has_arg = false, .val = 'e', },
+	{ .name = "verbose", .has_arg = false, .val = 'v', },
+	{}
+};
+
+static const char help_str[] =
+	"  --extended\tRun the extended test scope\n"
+	"  --verbose\tEnable verbose logging\n";
+
+igt_main_args("", long_opts, help_str, opts_handler, NULL)
+{
+	bool autoprobe;
+	int pf_fd;
+	static struct subtest_resize_variants {
+		const char *name;
+		bool resize_up;
+	} resize_variant[] = {
+		{ "up", true },
+		{ "down", false },
+		{ NULL },
+	};
+
+	igt_fixture {
+		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+	}
+
+	igt_describe("Verify that VF can access all the provisioned memory via VRAM BAR");
+	igt_subtest_with_dynamic_f("vf-access-provisioned") {
+		if (extended_scope) {
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f("numvfs-%d", num_vfs)
+					access_provisioned(pf_fd, num_vfs);
+		} else {
+			for_random_sriov_num_vfs(pf_fd, num_vfs) {
+				igt_dynamic_f("numvfs-random") {
+					igt_debug("numvfs=%u\n", num_vfs);
+					access_provisioned(pf_fd, num_vfs);
+				}
+			}
+		}
+	}
+
+	igt_describe("Verify that VF cannot access memory beyond what's provisioned via VRAM BAR");
+	igt_subtest_with_dynamic_f("vf-access-beyond") {
+		if (extended_scope) {
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f("numvfs-%d", num_vfs)
+					access_beyond(pf_fd, num_vfs);
+		} else {
+			for_random_sriov_num_vfs(pf_fd, num_vfs) {
+				igt_dynamic_f("numvfs-random") {
+					igt_debug("numvfs=%u\n", num_vfs);
+					access_beyond(pf_fd, num_vfs);
+				}
+			}
+		}
+	}
+
+	for (const struct subtest_resize_variants *s = resize_variant; s->name; s++) {
+		igt_describe("Verify that VF can access the reprovisioned memory via VRAM BAR");
+		igt_subtest_f("vf-access-after-resize-%s", s->name) {
+			unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+			igt_require(total_vfs > 1);
+
+			resize_and_access(pf_fd, s->resize_up);
+		}
+	}
+
+	igt_fixture {
+		igt_sriov_disable_vfs(pf_fd);
+		/* abort to avoid execution of next tests with enabled VFs */
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       "Failed to restore sriov_drivers_autoprobe value\n");
+		close(pf_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a7b9375ed0..73edd3e710 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -329,6 +329,7 @@ intel_xe_progs = [
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
 	'xe_sriov_scheduling',
+	'xe_sriov_vram',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
-- 
2.40.0

