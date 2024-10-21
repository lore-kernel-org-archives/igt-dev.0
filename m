Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF64D1712B
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 20:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D347010E3CD;
	Mon, 21 Oct 2024 20:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZCOtewv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA10110E3CD
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729541320; x=1761077320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XINcgGC67aZ4hTtdMUiAg5+2VEO+/Xc0i/QeWxQHgcc=;
 b=eZCOtewvWgB6xE3C6O3EpyGH3+vZ7Vg+Uf23/25NVJHWTAIxKideC8Yi
 421j2USctxLkAH6QFCcjwqJCbmsHD8VA8brgDuLYOx7cSc8AEu+XhLOMm
 mw0Bo0uqqu2l0EasZCrBkoD8mJ0A/09iQRfQ0na0WcC5di4XQ9lJMU1UE
 Hs8lkkD0RWnk7KCEMjEIlBrLBRJTHy6+S41CEZmcbAiPXDYh7YszlWEc3
 SwewGRFn/XNpsjgauHdXzMt/savrNXXUEoElGMQWkYgs9D5r11ixPiZT2
 iXJ1R9+DqYivLe/VUZyClyQJbkEUZTT4zKbNg3XeJ8SMY65ltunZ2QIdE A==;
X-CSE-ConnectionGUID: L94BnpYxQo+o5IsfURMWhA==
X-CSE-MsgGUID: tN6Iv60kQ2eoId/j2/d49A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39586389"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39586389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:08:34 -0700
X-CSE-ConnectionGUID: tH48FyvZSPKNlZgAxWbAEg==
X-CSE-MsgGUID: NoN4derJQfO4SFqA1Q3uZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79554743"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.47])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 13:08:30 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 6/6] tests/intel/xe_sriov_flr: Implement
 clear-scratch-regs and clear-media-scratch-regs subchecks
Date: Mon, 21 Oct 2024 22:07:37 +0200
Message-Id: <20241021200737.941384-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
References: <20241021200737.941384-1-marcin.bernatowicz@linux.intel.com>
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

Add tests to verify clearing of scratch and media scratch registers in
Virtual Functions (VFs) after a Functional Level Reset (FLR).

This code is based on prior work of Lukasz Laguna.

v2: Adjust mmio to align VF index with array index (Lukasz)
    Use helpers for setting skip/fail reasons to improve readability

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 122 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 1ee724fac..5fc1baf96 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -7,6 +7,7 @@
 #include <sys/stat.h>
 #include "drmtest.h"
 #include "igt_core.h"
+#include "igt_device.h"
 #include "igt_sriov_device.h"
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
@@ -739,6 +740,95 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
 	free(ldata->vf_lmem_size);
 }
 
+#define SCRATCH_REG		0x190240
+#define SCRATCH_REG_COUNT	4
+#define MED_SCRATCH_REG		0x190310
+#define MED_SCRATCH_REG_COUNT	4
+
+struct regs_data {
+	struct subcheck_data base;
+	struct intel_mmio_data *mmio;
+	uint32_t reg_addr;
+	int reg_count;
+};
+
+static void regs_subcheck_init(struct subcheck_data *data)
+{
+	struct regs_data *rdata = (struct regs_data *)data;
+
+	if (!xe_has_media_gt(data->pf_fd) &&
+	    rdata->reg_addr == MED_SCRATCH_REG) {
+		set_skip_reason(data, "No media GT\n");
+	}
+}
+
+static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+{
+	struct regs_data *rdata = (struct regs_data *)data;
+	uint32_t reg;
+	int i;
+
+	if (data->stop_reason)
+		return;
+
+	if (!is_intel_mmio_initialized(&rdata->mmio[vf_id])) {
+		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
+
+		if (!pci_dev) {
+			set_fail_reason(data, "No PCI device found for VF%u\n", vf_id);
+			return;
+		}
+
+		if (intel_register_access_init(&rdata->mmio[vf_id], pci_dev, false)) {
+			set_fail_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
+			return;
+		}
+	}
+
+	for (i = 0; i < rdata->reg_count; i++) {
+		reg = rdata->reg_addr + i * 4;
+
+		intel_register_write(&rdata->mmio[vf_id], reg, vf_id);
+		if (intel_register_read(&rdata->mmio[vf_id], reg) != vf_id) {
+			set_fail_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
+			return;
+		}
+	}
+}
+
+static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+{
+	struct regs_data *rdata = (struct regs_data *)data;
+	uint32_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
+	uint32_t reg;
+	int i;
+
+	if (data->stop_reason)
+		return;
+
+	for (i = 0; i < rdata->reg_count; i++) {
+		reg = rdata->reg_addr + i * 4;
+
+		if (intel_register_read(&rdata->mmio[vf_id], reg) != expected) {
+			set_fail_reason(data,
+					"Registers check after VF%u FLR failed on VF%u\n",
+					flr_vf_id, vf_id);
+			return;
+		}
+	}
+}
+
+static void regs_subcheck_cleanup(struct subcheck_data *data)
+{
+	struct regs_data *rdata = (struct regs_data *)data;
+	int i;
+
+	if (rdata->mmio)
+		for (i = 1; i <= data->num_vfs; ++i)
+			if (is_intel_mmio_initialized(&rdata->mmio[i]))
+				intel_register_access_fini(&rdata->mmio[i]);
+}
+
 static void clear_tests(int pf_fd, int num_vfs)
 {
 	struct xe_mmio xemmio = { };
@@ -747,10 +837,25 @@ static void clear_tests(int pf_fd, int num_vfs)
 	struct lmem_data ldata = {
 		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
 	};
-	const unsigned int num_checks = num_gts + 1;
+	struct intel_mmio_data mmio[num_vfs + 1];
+	struct regs_data scratch_data = {
+		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
+		.mmio = mmio,
+		.reg_addr = SCRATCH_REG,
+		.reg_count = SCRATCH_REG_COUNT
+	};
+	struct regs_data media_scratch_data = {
+		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
+		.mmio = mmio,
+		.reg_addr = MED_SCRATCH_REG,
+		.reg_count = MED_SCRATCH_REG_COUNT
+	};
+	const unsigned int num_checks = num_gts + 3;
 	struct subcheck checks[num_checks];
 	int i;
 
+	memset(mmio, 0, sizeof(mmio));
+
 	for (i = 0; i < num_gts; ++i) {
 		gdata[i] = (struct ggtt_data){
 			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = i },
@@ -772,6 +877,21 @@ static void clear_tests(int pf_fd, int num_vfs)
 		.prepare_vf = lmem_subcheck_prepare_vf,
 		.verify_vf = lmem_subcheck_verify_vf,
 		.cleanup = lmem_subcheck_cleanup };
+	checks[i++] = (struct subcheck) {
+		.data = (struct subcheck_data *)&scratch_data,
+		.name = "clear-scratch-regs",
+		.init = regs_subcheck_init,
+		.prepare_vf = regs_subcheck_prepare_vf,
+		.verify_vf = regs_subcheck_verify_vf,
+		.cleanup = regs_subcheck_cleanup };
+	checks[i++] = (struct subcheck) {
+		.data = (struct subcheck_data *)&media_scratch_data,
+		.name = "clear-media-scratch-regs",
+		.init = regs_subcheck_init,
+		.prepare_vf = regs_subcheck_prepare_vf,
+		.verify_vf = regs_subcheck_verify_vf,
+		.cleanup = regs_subcheck_cleanup
+	};
 	igt_assert_eq(i, num_checks);
 
 	verify_flr(pf_fd, num_vfs, checks, num_checks);
-- 
2.31.1

