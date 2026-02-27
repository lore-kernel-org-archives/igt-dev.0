Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE65FFEFB5D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 15:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFAC10EBBF;
	Fri, 27 Feb 2026 15:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYqVmwfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D4310EBC2
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772206067; x=1803742067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1W773C1We8jhbvW7RznX7pxwuoK6wM2orLlMMmgoxJA=;
 b=SYqVmwfVoeHWTt0hZ6xVaPKC56FKMDmqywi2Zh2zFjAHyC6s626Evcfw
 oqWOurz9fPlX569kxdZFUrzfYwSF4Ucqt3bYX7DaB0zDgMRTTPAf4XLHI
 h/60xcani14R9zXeRrqCcvOmVwn5AStQ1P+JgAd30SHuXqcITboq4MdJv
 emRo9EjNwHOGRx6sI0G1tAk5+8MdqIEySnaaUaMUuPby86+VKYugSsmzr
 /QsqjWfEXX9plkWtogHZU456twnkl0C33R4FGDQB0PHVIVUwDs9qg/xAw
 pvtUQg7cBbh9KTSLD/az3/qCaMD17pTMOn85OqpnaV5XmNr58umL/nCTf w==;
X-CSE-ConnectionGUID: 7VGqQ0LgTqiOS9tB/Np8qw==
X-CSE-MsgGUID: QK87LcthRdurji2s4vjcWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="95909468"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="95909468"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 07:27:46 -0800
X-CSE-ConnectionGUID: ydHQ7t7WTvevls2bEFY7ng==
X-CSE-MsgGUID: 2othhu21TiiPJer7CIJ6BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="214766117"
Received: from pdudkiew-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.25.85])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 07:27:43 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lukasz.laguna@intel.com, piotr.piorkowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/2] tests/intel/xe_sriov_flr: Add basic FLR subtest
Date: Fri, 27 Feb 2026 16:27:33 +0100
Message-ID: <20260227152734.256604-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227152734.256604-1-marcin.bernatowicz@linux.intel.com>
References: <20260227152734.256604-1-marcin.bernatowicz@linux.intel.com>
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

Add flr-basic subtest intended as a minimal smoke test for the VF reset
sysfs write path while still using the xe-vfio-pci based synchronization:
the test skips if xe-vfio-pci binding is disabled, if the xe_vfio_pci
module is not loaded, or if any VF under test is not bound to
xe-vfio-pci.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
v2: Rename flr-reset-only to flr-basic, and adjust commit message. (Piotr)
---
 tests/intel/xe_sriov_flr.c | 65 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index b73727787..2080f4e85 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -29,6 +29,12 @@
  * Functionality: FLR
  * Description: Examine behavior of SR-IOV VF FLR
  *
+ * SUBTEST: flr-basic
+ * Run type: BAT
+ * Description:
+ *   Initiates FLR without any additional state checks.
+ *   Useful as a basic smoke test of the reset sysfs write path.
+ *
  * SUBTEST: flr-vf1-clear
  * Run type: BAT
  * Description:
@@ -1016,6 +1022,60 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
 {
 }
 
+static void reset_only_subcheck_init(struct subcheck_data *data)
+{
+	if (!g_use_xe_vfio_pci) {
+		set_skip_reason(data, "xe-vfio-pci binding is disabled\n");
+		return;
+	}
+
+	if (!igt_kmod_is_loaded("xe_vfio_pci"))
+		set_skip_reason(data, "xe_vfio_pci is not loaded\n");
+}
+
+static void reset_only_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+{
+	char *slot = igt_sriov_get_vf_pci_slot_alloc(data->pf_fd, vf_id);
+	char bound[64];
+	int bound_ret;
+
+	igt_assert(slot);
+
+	bound_ret = igt_pci_get_bound_driver_name(slot, bound, sizeof(bound));
+	if (bound_ret <= 0 || strcmp(bound, "xe-vfio-pci") != 0)
+		set_skip_reason(data, "VF%u not bound to xe-vfio-pci\n", vf_id);
+
+	free(slot);
+}
+
+static void noop_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+{
+}
+
+static void noop_subcheck_cleanup(struct subcheck_data *data)
+{
+}
+
+static void reset_only_test(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
+{
+	struct subcheck_data base = {
+		.pf_fd = pf_fd,
+		.num_vfs = num_vfs,
+		.tile = 0,
+		.stop_reason = NULL,
+	};
+	struct subcheck check = {
+		.data = &base,
+		.name = "reset-only",
+		.init = reset_only_subcheck_init,
+		.prepare_vf = reset_only_subcheck_prepare_vf,
+		.verify_vf = noop_subcheck_verify_vf,
+		.cleanup = noop_subcheck_cleanup,
+	};
+
+	verify_flr(pf_fd, num_vfs, &check, 1, exec_strategy);
+}
+
 static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 {
 	const uint8_t num_tiles = xe_tiles_count(pf_fd);
@@ -1141,6 +1201,11 @@ int igt_main_args("vw:", long_options, help_str, opt_handler, NULL)
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 	}
 
+	igt_describe("Initiate FLR without any additional state checks.");
+	igt_subtest("flr-basic") {
+		reset_only_test(pf_fd, 1, execute_sequential_flr);
+	}
+
 	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
 	igt_subtest("flr-vf1-clear") {
 		clear_tests(pf_fd, 1, execute_sequential_flr);
-- 
2.43.0

