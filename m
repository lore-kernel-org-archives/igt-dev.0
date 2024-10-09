Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B40CEDD85
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC60510E284;
	Wed,  9 Oct 2024 11:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbcmoLgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B9410E284
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473465; x=1760009465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3qp+2Gw5IhWdiABGdh5imIrCVutAkD6g/1GW8DvyOAc=;
 b=nbcmoLgY78gJySVoBF0l/5P70IRaSwyUKyA2kl7OUhCOCdfGvYMX8gtC
 ETvkyQbnep3XJHxTHdI/Q0ZQqVfne6XZdAQOchASqjjqC/rJao1NZmfen
 G2fTSCBjM1Ig6kfbbsHvqzdMceqL4utGirF94IGEOv9cGFDtKCRHd/JZ1
 WaRpgS9DKMt3Q/NrAfmwviSWQrQ37VhzvRKBpMryu9WVJElHE6Sfqki77
 RfKuqo/kbyTRWsLqprheiefv8181R49bsEMQmxyvrt8m6jYwGw8yuH2xg
 WlqEQ9QAXeYnFBcSrvklWEZ530DbBc2j8gHc8Tgtgd6tartpIR5tmM096 w==;
X-CSE-ConnectionGUID: bD0Z0RFATG6iKMTCXyb3KQ==
X-CSE-MsgGUID: xdIrxrOMThq/LizSINQSRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27900139"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27900139"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:31:05 -0700
X-CSE-ConnectionGUID: HiupVTQcTfOjP5f/WFq2Lg==
X-CSE-MsgGUID: I+nvZJpaRGyj3LqgghWhww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="80789813"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.16.246])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:31:02 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/xe_sriov_flr: Implement
 clear-scratch-regs and clear-media-scratch-regs subchecks
Date: Wed,  9 Oct 2024 13:30:18 +0200
Message-Id: <20241009113018.741371-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
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
 tests/intel/xe_sriov_flr.c | 130 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 4c97c83a4..93e45c928 100644
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
@@ -706,6 +707,103 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
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
+		igt_assert_neq(asprintf(&data->stop_reason, "%s : No media GT",
+					SKIP_REASON), -1);
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
+	if (!is_intel_mmio_initialized(&rdata->mmio[vf_id - 1])) {
+		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
+
+		if (!pci_dev) {
+			igt_assert_neq(asprintf(&data->stop_reason,
+						"No PCI device found for VF%u\n",
+						vf_id), -1);
+			return;
+		}
+
+		if (intel_register_access_init(&rdata->mmio[vf_id - 1], pci_dev, false)) {
+			igt_assert_neq(asprintf(&data->stop_reason,
+						"Failed to get access to VF%u MMIO\n",
+						vf_id), -1);
+			return;
+		}
+	}
+
+	for (i = 0; i < rdata->reg_count; i++) {
+		reg = rdata->reg_addr + i * 4;
+
+		intel_register_write(&rdata->mmio[vf_id - 1], reg, vf_id);
+		if (intel_register_read(&rdata->mmio[vf_id - 1], reg) != vf_id) {
+			igt_assert_neq(asprintf(&data->stop_reason,
+						"Registers write/read check failed on VF%u\n",
+						vf_id),
+				       -1);
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
+		if (intel_register_read(&rdata->mmio[vf_id - 1], reg) != expected) {
+			igt_assert_neq(asprintf(&data->stop_reason,
+						"Registers check after VF%u FLR failed on VF%u\n",
+						flr_vf_id, vf_id), -1);
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
+		for (i = 0; i < data->num_vfs; ++i)
+			if (is_intel_mmio_initialized(&rdata->mmio[i]))
+				intel_register_access_fini(&rdata->mmio[i]);
+}
+
 static void clear_tests(int pf_fd, int num_vfs)
 {
 	struct xe_mmio xemmio = { };
@@ -714,10 +812,25 @@ static void clear_tests(int pf_fd, int num_vfs)
 	struct lmem_data ldata = {
 		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
 	};
-	const unsigned int num_checks = num_gts + 1;
+	struct intel_mmio_data mmio[num_vfs];
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
@@ -739,6 +852,21 @@ static void clear_tests(int pf_fd, int num_vfs)
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

