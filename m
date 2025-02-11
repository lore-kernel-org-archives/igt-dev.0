Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FA6C0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 16:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB73410E703;
	Tue, 11 Feb 2025 16:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+m4n+kc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844FA10E70B
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739291381; x=1770827381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wOsJccIRYdQO3gJVvYqV+Qcct4EsvhrmtBGmhbtIuv4=;
 b=j+m4n+kcaONPwmAkPB3HOVW63/T0Qfy7/IcWuFqr2A/SGWWaE5ZuPnbe
 tmnD+lti1R3ZUOhjUVj0o2xTuNDOPh8y+2G1IOEZaS+qdHqnBw/RRvsQ1
 wzA0jnO/v1oazXCq9ibcO6rlzj3JvbS0Nyuxkb8Ns/pQ3hp9GT4bi4xDj
 LDCe0fDTndTR8GyOj95zwqtMo2FIcDHwbczxO94GjnjnH60ikFUVn1OCl
 1JCLNFbKeRCZgXWgy7J7C22knyrDlf6PiZcNSzQ+t42dx4Kq9SswxpABH
 957gp718+gtXFZxXOillQVBPgSnWyidFB2kkVvuFUV9nB513A1SY3O6x3 A==;
X-CSE-ConnectionGUID: 36Tqvkj0T0qsHPC8w3dGvw==
X-CSE-MsgGUID: tJmzaH0uSzm7kQeBTORSvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39113946"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39113946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:41 -0800
X-CSE-ConnectionGUID: bu2sDV5PS/S6KGSsR8S2+Q==
X-CSE-MsgGUID: zvsDL92uSPSmUOG2KdeVmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116643066"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:38 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v3 4/4] tests/xe_sriov_auto_provisioning: Add subtest to
 verify VF's configuration
Date: Tue, 11 Feb 2025 17:29:19 +0100
Message-Id: <20250211162919.15076-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250211162919.15076-1-lukasz.laguna@intel.com>
References: <20250211162919.15076-1-lukasz.laguna@intel.com>
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
v3:
 - fix indentation (Marcin)

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_sriov_auto_provisioning.c | 123 ++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index e13eb3644..d71bcbfec 100644
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
+						   "%s selfconfig check after reprovisioning failed on gt%u\n",
+						   xe_sriov_shared_res_to_string(res), gt_num))
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

