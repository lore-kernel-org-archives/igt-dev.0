Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA9E9D40F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449F510E6BA;
	Wed,  4 Feb 2026 16:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRFKLHmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA8A10E6BA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770222763; x=1801758763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDhFf1s/a7uwbG0wfedlAR2Udux4/w8pkyAMKicFVic=;
 b=BRFKLHmT8mV+U3fT5cml3NgpNcAJj0inW/NqGvVaB53REFqQGTl+0SXj
 LUl/VxoSrUxgKcOKY2iOgLJQS1BZCeV+3s31nQgT/ObGA0ih7KOUuskCb
 Y2eKDvawWqT6SQeI5u0m5RFCbWViMD87FJrbysDtQhZBITdcvonH+A0m5
 O2HScBjS4DuwJzXFqkiym0fFVSXBZ7b+i0dYlNlUOEQbCWD+yuQoq+YVw
 CZZUtzwuS9AD2eSvjlT3MgkrVT4PWKai4IEeL6xaxAvicRIbSVMMsgtzA
 EHHbFw+dn+8rEaeoEZpp7ezPTqF5NKSeRmWcYNn+9q58OznzkkQWVo8Ah g==;
X-CSE-ConnectionGUID: qc+XmJJjSQS/SdUycR4LQA==
X-CSE-MsgGUID: AYv/8LJ0R2ukra0G90f9+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71472386"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71472386"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:42 -0800
X-CSE-ConnectionGUID: AxKJ19ktRZ6sKYi4wASZZw==
X-CSE-MsgGUID: tZIOnUdFTOe5aEiMYu6Q6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209315388"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:41 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v3 i-g-t 3/7] tests/intel/xe_sriov_flr: Attach VFs to
 xe-vfio-pci before initiating FLR
Date: Wed,  4 Feb 2026 17:32:06 +0100
Message-ID: <20260204163217.121305-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
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

Attach all VFs to the xe-vfio-pci driver before running the FLR scenario.
This allows the test to rely on xe-vfio-pci’s FLR wait handling, which is
triggered when writing to the VF reset sysfs attribute.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Suggested-by: Michał Winiarski <michal.winiarski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

---
v2:
- Unbind VFs only if they were successfully bound.

---
 tests/intel/xe_sriov_flr.c | 65 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 12989d0f5..2f6b24cf0 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -9,6 +9,8 @@
 #include "drmtest.h"
 #include "igt_core.h"
 #include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_pci.h"
 #include "igt_sriov_device.h"
 #include "intel_chipset.h"
 #include "intel_vram.h"
@@ -57,6 +59,8 @@ static const char STOP_REASON_ABORT[] = "ABORT";
 static const char STOP_REASON_FAIL[]  = "FAIL";
 static const char STOP_REASON_SKIP[]  = "SKIP";
 
+#define DRIVER_OVERRIDE_TIMEOUT_MS 200
+
 static struct g_mmio {
 	struct xe_mmio *mmio;
 	unsigned int num_vfs;
@@ -276,6 +280,47 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
 	igt_skip_on(skips == num_checks);
 }
 
+static bool vf_bind_driver_override(int pf_fd, unsigned int vf_id,
+				    const char *driver)
+{
+	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
+	int ret;
+	char bound[64] = "none";
+	int bound_ret;
+
+	igt_assert(slot);
+	igt_assert(driver);
+
+	ret = igt_pci_bind_driver_override(slot, driver, DRIVER_OVERRIDE_TIMEOUT_MS);
+	if (ret < 0) {
+		bound_ret = igt_pci_get_bound_driver_name(slot, bound, sizeof(bound));
+		if (bound_ret <= 0)
+			snprintf(bound, sizeof(bound), "%s", "none");
+
+		igt_warn_on_f(true,
+			      "bind %s (VF%u) to %s ret=%d (currently bound: %s)\n",
+			      slot, vf_id, driver, ret, bound);
+	}
+
+	free(slot);
+
+	return ret >= 0;
+}
+
+static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
+{
+	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
+	int ret;
+
+	igt_assert(slot);
+
+	ret = igt_pci_unbind_driver_override(slot, DRIVER_OVERRIDE_TIMEOUT_MS);
+	igt_warn_on_f(ret < 0, "unbind %s (VF%u) driver_override ret=%d\n",
+		      slot, vf_id, ret);
+
+	free(slot);
+}
+
 /**
  * flr_exec_strategy - Function pointer for FLR execution strategy
  * @pf_fd: File descriptor for the Physical Function (PF).
@@ -325,6 +370,8 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 {
 	const int wait_flr_ms = 200;
 	int i, vf_id, flr_vf_id = -1;
+	bool xe_vfio_loaded;
+	bool *vf_bound = NULL;
 
 	igt_sriov_disable_driver_autoprobe(pf_fd);
 	igt_sriov_enable_vfs(pf_fd, num_vfs);
@@ -335,6 +382,16 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 	if (igt_warn_on(igt_pci_system_reinit()))
 		goto disable_vfs;
 
+	xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
+	if (xe_vfio_loaded) {
+		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
+		igt_assert(vf_bound);
+
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
+			vf_bound[vf_id] = vf_bind_driver_override(pf_fd, vf_id, "xe-vfio-pci");
+	}
+
 	init_mmio(pf_fd, num_vfs);
 
 	for (i = 0; i < num_checks; ++i)
@@ -357,6 +414,14 @@ cleanup:
 
 	cleanup_mmio();
 
+	if (xe_vfio_loaded) {
+		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
+			if (vf_bound && vf_bound[vf_id])
+				vf_unbind_driver_override(pf_fd, vf_id);
+	}
+
+	free(vf_bound);
+
 disable_vfs:
 	igt_sriov_disable_vfs(pf_fd);
 
-- 
2.43.0

