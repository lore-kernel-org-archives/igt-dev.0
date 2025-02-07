Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C91C02196
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 09:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B2010E0FA;
	Fri,  7 Feb 2025 09:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6+6b2Ny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC2B10EA8E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 09:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738921255; x=1770457255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zsJhZ6Ys6QBQCsVQ/XxttYZ90WflGXVYRrzyuQloqPk=;
 b=a6+6b2NyfnaIuVeUNs3oRXAikzChIHJzlzG/msq0SmaGyFLbdMR/Kpdk
 Aef4VJ0z9ieSZxkg3wlEM6P+/HERl0ydRTKAd8+nGhNlxHQWFcGl6H05c
 cl3cQ84hKTjmPcQ+0sjhHI2L/j/immZsrYoQWRGKbZWaisszgghb6TSVu
 LuVqkAO4C9zUJdRAY/3L1QNXgJ/ZBVzWMLGJo5TK/d34XRBgvVwcphI1w
 LvxWzAdhs3IqbgwrmuyVJtWaMRt1g65QzA9kUAqg5MosBRRyG/1EiS+wT
 k2FiAcr1+OSp41FbbnX5mdP50oADgoMImm5B98HZtpo5ZHtEqEKL/z/NY g==;
X-CSE-ConnectionGUID: 6irM1heAQy6h139EQdUuzw==
X-CSE-MsgGUID: bCWivOlERBucxzn2ZslliA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64913976"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="64913976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:40:54 -0800
X-CSE-ConnectionGUID: zYDrbkqpQr2jutLsvx2TUQ==
X-CSE-MsgGUID: Siloz1gQTZ6BSqTueSC+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111328573"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:40:53 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v2 4/4] tests/xe_sriov_auto_provisioning: Add subtest to
 verify VF's configuration
Date: Fri,  7 Feb 2025 10:40:31 +0100
Message-Id: <20250207094031.15942-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250207094031.15942-1-lukasz.laguna@intel.com>
References: <20250207094031.15942-1-lukasz.laguna@intel.com>
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

Added subtest checks if configuration data that VF got from GuC during
probe is the same as provisioned.

v2:
 - add missing flag in subtest function call (Marcin)
 - fix VFs range in subtest definition (Lukasz)

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_auto_provisioning.c | 123 ++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index e13eb3644..c95e8fc08 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -33,6 +33,18 @@
  * SUBTEST: exclusive-ranges
  * Description:
  *   Verify that ranges of auto-provisioned resources are exclusive
+ *
+ * SUBTEST: selfconfig-basic
+ * Description:
+ *   Check if VF configuration data is the same as provisioned
+ *
+ * SUBTEST: selfconfig-reprovision-increase-numvfs
+ * Description:
+ *   Check if VF configuration data is updated properly after increasing number of VFs
+ *
+ * SUBTEST: selfconfig-reprovision-reduce-numvfs
+ * Description:
+ *   Check if VF configuration data is updated properly after decreasing number of VFs
  */
 
 IGT_TEST_DESCRIPTION("Xe tests for SR-IOV auto-provisioning");
@@ -216,6 +228,70 @@ static void exclusive_ranges(int pf_fd, unsigned int num_vfs)
 	igt_fail_on_f(fails, "exclusive ranges check failed\n");
 }
 
+#define REPROVISION_INCREASE_NUMVFS	(0x1 << 0)
+#define REPROVISION_REDUCE_NUMVFS	(0x1 << 1)
+
+static void check_selfconfig(int pf_fd, unsigned int vf_num, unsigned int flags)
+{
+	unsigned int gt_num, total_vfs = igt_sriov_get_total_vfs(pf_fd);
+	uint64_t provisioned, queried;
+	enum xe_sriov_shared_res res;
+	int vf_fd, fails = 0;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, (flags & REPROVISION_REDUCE_NUMVFS) ? total_vfs : vf_num);
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+
+	igt_sriov_bind_vf_drm_driver(pf_fd, vf_num);
+	vf_fd = igt_sriov_open_vf_drm_device(pf_fd, vf_num);
+	igt_assert_fd(vf_fd);
+
+	xe_for_each_gt(pf_fd, gt_num) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt_num) {
+			provisioned = xe_sriov_pf_get_provisioned_quota(pf_fd, res, vf_num,
+									gt_num);
+			queried = xe_sriov_vf_debugfs_get_selfconfig(vf_fd, res, gt_num);
+
+			if (igt_debug_on_f(provisioned != queried,
+					   "%s selfconfig check failed on gt%u\n",
+					   xe_sriov_shared_res_to_string(res), gt_num))
+				fails++;
+		}
+	}
+
+	close(vf_fd);
+	igt_sriov_disable_vfs(pf_fd);
+
+	if (flags && !fails) {
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, (flags & REPROVISION_INCREASE_NUMVFS) ? total_vfs :
+										    vf_num);
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+
+		igt_sriov_bind_vf_drm_driver(pf_fd, vf_num);
+		vf_fd = igt_sriov_open_vf_drm_device(pf_fd, vf_num);
+		igt_assert_fd(vf_fd);
+
+		xe_for_each_gt(pf_fd, gt_num) {
+			xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt_num) {
+				provisioned = xe_sriov_pf_get_provisioned_quota(pf_fd, res, vf_num,
+										gt_num);
+				queried = xe_sriov_vf_debugfs_get_selfconfig(vf_fd, res, gt_num);
+
+				if (igt_debug_on_f(provisioned != queried,
+						"%s selfconfig check after reprovisioning failed on gt%u\n",
+						xe_sriov_shared_res_to_string(res), gt_num))
+					fails++;
+			}
+		}
+
+		close(vf_fd);
+		igt_sriov_disable_vfs(pf_fd);
+	}
+
+	igt_fail_on_f(fails, "selfconfig check failed\n");
+}
+
 static bool extended_scope;
 
 static int opts_handler(int opt, int opt_index, void *data)
@@ -242,9 +318,17 @@ static const char help_str[] =
 igt_main_args("", long_opts, help_str, opts_handler, NULL)
 {
 	enum xe_sriov_shared_res res;
-	unsigned int gt;
+	unsigned int gt, total_vfs;
 	bool autoprobe;
 	int pf_fd;
+	static struct subtest_variants {
+		const char *name;
+		unsigned int flags;
+	} reprovisioning_variant[] = {
+		{ "increase", REPROVISION_INCREASE_NUMVFS },
+		{ "reduce", REPROVISION_REDUCE_NUMVFS },
+		{ NULL },
+	};
 
 	igt_fixture {
 		struct xe_sriov_provisioned_range *ranges;
@@ -264,6 +348,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 			}
 		}
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		total_vfs = igt_sriov_get_total_vfs(pf_fd);
 	}
 
 	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
@@ -298,7 +383,6 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 
 	igt_describe("Verify that ranges of auto-provisioned resources are exclusive");
 	igt_subtest_with_dynamic_f("exclusive-ranges") {
-		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
 
 		igt_skip_on(total_vfs < 2);
 
@@ -315,6 +399,41 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		}
 	}
 
+	igt_describe("Check if VF configuration data is the same as provisioned");
+	igt_subtest_with_dynamic("selfconfig-basic") {
+		if (extended_scope)
+			for_each_sriov_vf(pf_fd, vf)
+				igt_dynamic_f("vf-%u", vf)
+					check_selfconfig(pf_fd, vf, 0);
+
+		for_random_sriov_vf(pf_fd, vf) {
+			igt_dynamic_f("vf-random") {
+				igt_debug("vf=%u\n", vf);
+				check_selfconfig(pf_fd, vf, 0);
+			}
+		}
+	}
+
+	for (const struct subtest_variants *s = reprovisioning_variant; s->name; s++) {
+		igt_describe("Check if VF configuration data is the same as reprovisioned");
+		igt_subtest_with_dynamic_f("selfconfig-reprovision-%s-numvfs", s->name) {
+
+			igt_require(total_vfs > 1);
+
+			if (extended_scope)
+				for_each_sriov_vf_in_range(pf_fd, 1, total_vfs - 1, vf)
+					igt_dynamic_f("vf-%u", vf)
+						check_selfconfig(pf_fd, vf, s->flags);
+
+			for_random_sriov_vf_in_range(pf_fd, 1, total_vfs - 1, vf) {
+				igt_dynamic_f("vf-random") {
+					igt_debug("vf=%u\n", vf);
+					check_selfconfig(pf_fd, vf, s->flags);
+				}
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
-- 
2.40.0

