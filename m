Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B459FCAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 14:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6835F10E733;
	Wed, 24 Sep 2025 14:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnI47UrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0E410E730
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 14:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758725873; x=1790261873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7EXgocHqV7vXcwU43PRMK56iiKZDu/GSl1e6NrvRqM8=;
 b=KnI47UrRI24y1NE3f0/ZpsrAFa4fHDCBrHJZR6LOdd9qYYUyRbi30FUQ
 9h6+jInElQTyDE5otXrJCsLtU7xHqD7/7tShMd36Hn9K3fYwN0WyiTLNE
 VPxhr4hLMGvVySntDv5uCTD2HYfl4J/riF503VQyfMJPk22XocUYjqH8G
 6D1HVWdDbOFPJqCb+uLPjwujVCI32dkxcT3bKcX/CwcykcGWdnQoWRcuT
 4zN/RnnBBsNCdzTH6TQI6d/nAWtlDq21FqjFPZXGAmTn11Sj7eBQC6kD2
 RkACcDlWV/ccP8jbBVwQfZRcOZmowjTJVWEkfnwNR3b57Lm/TIhvtwUUu w==;
X-CSE-ConnectionGUID: WISr0H2hQTSsMH8deNvbjw==
X-CSE-MsgGUID: 3RHH0/5eR1CgkbcdWPAbmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="86468266"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86468266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:57:53 -0700
X-CSE-ConnectionGUID: 9L0BMM14SZeM6OFqEj84Lw==
X-CSE-MsgGUID: 68crYnNfQQ200xpPj9mkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176350105"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:57:52 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v3 4/4] tests/intel/xe_sriov_vram: Add test checking VF
 access to VRAM
Date: Wed, 24 Sep 2025 16:57:26 +0200
Message-Id: <20250924145726.23557-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250924145726.23557-1-lukasz.laguna@intel.com>
References: <20250924145726.23557-1-lukasz.laguna@intel.com>
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
v3:
- fix the incorrect skip of the vf-access-after-resize-up (Marcin)
---
 tests/intel/xe_sriov_vram.c | 317 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 318 insertions(+)
 create mode 100644 tests/intel/xe_sriov_vram.c

diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
new file mode 100644
index 0000000000..d3495cef11
--- /dev/null
+++ b/tests/intel/xe_sriov_vram.c
@@ -0,0 +1,317 @@
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
+ * SUBTEST: vf-access-basic
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
+static bool validate_access_basic(struct vram_mapping *vram, unsigned int vf_id,
+				  size_t provisioned_vram)
+{
+	uint8_t read, orig;
+	bool passed = true;
+
+	for (size_t offset = 0; offset < provisioned_vram; offset += STEP) {
+		orig = intel_vram_read8(vram, offset);
+
+		read = intel_vram_write_readback8(vram, offset, vf_id);
+		if (read != vf_id) {
+			igt_debug("VRAM write/read check failed on VF%u (offset: %#lx, write: %u, read: %u)\n",
+				  vf_id, offset, vf_id, read);
+			passed = false;
+		}
+
+		read = intel_vram_write_readback8(vram, offset, orig);
+		if (read != orig) {
+			igt_debug("Failed to restore original value on VF%u (offset: %#lx, original: %u, read: %u)\n",
+				  vf_id, offset, orig, read);
+			passed = false;
+		}
+	}
+
+	return passed;
+}
+
+static void access_basic(unsigned int pf_fd, unsigned int num_vfs)
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
+	uint8_t read, orig;
+	bool passed = true;
+
+	for (size_t offset = provisioned_vram; offset < vram_bar_size; offset += STEP) {
+		orig = intel_vram_read8(vram, offset);
+
+		read = intel_vram_write_readback8(vram, offset, vf_id);
+		if (read == vf_id) {
+			igt_debug("Unexpected VRAM write beyond provisioned size on VF%u (offset: %#lx)\n",
+				  vf_id, offset);
+			passed = false;
+
+			read = intel_vram_write_readback8(vram, offset, orig);
+			if (read != orig)
+				igt_debug("Failed to restore original value on VF%u (offset: %#lx, original: %u, read: %u)\n",
+					  vf_id, offset, orig, read);
+		}
+	}
+
+	return passed;
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
+static bool extended_scope;
+
+static int opts_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'e':
+		extended_scope = true;
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
+	{}
+};
+
+static const char help_str[] =
+	"  --extended\tRun the extended test scope\n";
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
+	igt_subtest_with_dynamic_f("vf-access-basic") {
+		if (extended_scope) {
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f("numvfs-%d", num_vfs)
+					access_basic(pf_fd, num_vfs);
+		} else {
+			for_random_sriov_num_vfs(pf_fd, num_vfs) {
+				igt_dynamic_f("numvfs-random") {
+					igt_debug("numvfs=%u\n", num_vfs);
+					access_basic(pf_fd, num_vfs);
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

