Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B08AC02192
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 17:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A2892AA;
	Wed,  5 Feb 2025 17:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gq8mQTnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCFF892AA
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 17:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738775924; x=1770311924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GOyK/H0DylqN1iCJiusidc3/5y8k6f1uuhHm5AUo+DM=;
 b=gq8mQTnueRZ4NxL/sTg8LThzFemXl3ccaQvXJErSlw/lTfB5Ik/6eFcA
 70xRvL8qoE17kxkbo1avcp3z4fyC5c7pKBPTQFhNgP33RxV/V5S8DMrrK
 Y9aCTfCqpfzzEW+SoMQ4FrGIQa1eT3tdmlaY89RyiAb40vCbPHdy9h5mB
 PNolnVJFjYVhPmZPT5VmyLDLbwECGd/urTazeiRFLkk0fx4KnbWl0Yuii
 hPClDdXOoHdqJ0no2LpXbZQ3M1Pw5NW4kOVLWLVatH/VEBclkVVaE3trx
 as0/3T6V0T+ZVeJ1RFikGngUq2J5RfyVS7dwczbwqx1cCb3cSBlQQmPGv A==;
X-CSE-ConnectionGUID: 6MECi3BTQlCmJKM12QjZSA==
X-CSE-MsgGUID: ZuYJ8EQMRxapTS0mO/01AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43106666"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="43106666"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:18:43 -0800
X-CSE-ConnectionGUID: PoaW9EsxT6+j/lm61aNm/w==
X-CSE-MsgGUID: IK9CDLjITgyGbmstBOCKjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="110755762"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.3.119])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 09:18:40 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v4 i-g-t 2/2] tests/intel/xe_sriov_flr: Add flr-twice subtest
Date: Wed,  5 Feb 2025 18:18:19 +0100
Message-Id: <20250205171819.2485976-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250205171819.2485976-1-marcin.bernatowicz@linux.intel.com>
References: <20250205171819.2485976-1-marcin.bernatowicz@linux.intel.com>
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

Introduce the `flr-twice` subtest, which initiates FLR twice in parallel
on the same VF. This subtest covers a use case where two FLRs can occur
within a short time frame, such as when starting a QEMU VM with
a passed VF.

Example log showing the behavior:
[  241.906514] vfio-pci 0000:00:02.1: resetting
[  241.907123] xe 0000:00:02.0: [drm] GT1: PF: VF1 FLR
[  241.907204] xe 0000:00:02.0: [drm] GT0: PF: VF1 FLR
[  242.013441] vfio-pci 0000:00:02.1: reset done
[  242.040918] vfio-pci 0000:00:02.1: resetting
[  242.041794] xe 0000:00:02.0: [drm] GT1: PF: VF1 FLR
[  242.041803] xe 0000:00:02.0: [drm:pf_enter_vf_flr_wip [xe]] GT1: PF:
VF1 FLR is already in progress
[  242.042207] xe 0000:00:02.0: [drm] GT0: PF: VF1 FLR
[  242.042214] xe 0000:00:02.0: [drm:pf_enter_vf_flr_wip [xe]] GT0: PF:
VF1 FLR is already in progress
[  242.149432] vfio-pci 0000:00:02.1: reset done

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 3b42aa637..a98d6ce70 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -41,6 +41,13 @@
  * Run type: FULL
  * Description:
  *   Executes FLR on all VFs simultaneously to validate correct behavior during parallel resets.
+ *
+ * SUBTEST: flr-twice
+ * Run type: FULL
+ * Description:
+ *   Initiates FLR twice in parallel on the same VF to validate behavior
+ *   when multiple resets occur within a short time frame, as seen in some
+ *   real-world scenarios (e.g., when starting a QEMU VM with a passed VF).
  */
 
 IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
@@ -449,6 +456,14 @@ static int execute_parallel_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 				     wait_flr_ms, 1);
 }
 
+static int execute_parallel_flr_twice(int pf_fd, int num_vfs,
+				      struct subcheck *checks, int num_checks,
+				      const int wait_flr_ms)
+{
+	return execute_parallel_flr_(pf_fd, num_vfs, checks, num_checks,
+				     wait_flr_ms, 2);
+}
+
 #define GEN12_VF_CAP_REG			0x1901f8
 #define GGTT_PTE_TEST_FIELD_MASK		GENMASK_ULL(19, 12)
 #define GGTT_PTE_ADDR_SHIFT			12
@@ -1073,6 +1088,11 @@ igt_main
 		clear_tests(pf_fd, total_vfs, execute_parallel_flr);
 	}
 
+	igt_describe("Initiate FLR twice in parallel on same VF.");
+	igt_subtest("flr-twice") {
+		clear_tests(pf_fd, 1, execute_parallel_flr_twice);
+	}
+
 	igt_fixture {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
-- 
2.31.1

