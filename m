Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3757C71141
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 07:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7606310E78A;
	Thu, 12 Jun 2025 07:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0xLtMmX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A6910E787
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749715142; x=1781251142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4uIfQpphpIhXQYpvQbDEoid9pLCG0LFoByWmTeQ3p+0=;
 b=n0xLtMmXQWrZplK5NjOxj2Yn2lyfAQUDiQA/qg2HoAojXHuLY90NApr3
 wq/hTDiWnD3eBaMRjadiBNF6Gv82SA97howFxBf6W8waWZEKDrRlDKO2K
 GGbzcBKaplKvOGlcEbYoiUuhBaHe6DEe8lEgaxqyJmR3LDPugyMHtLczo
 cUoMmIcr3h9TUM+jaTBLKee+/OCM3keqo1UguGJNqb1k/oNo4fdxslV/k
 hR1RUrX/ZAQ23xTR/u2YfE9KJC59mS/PzZBTTpbcTmb/8+hghn7XMVpx8
 J2qUWFqdpDJEENIXUiLUSeo3RuMwFF/sBv3RjHUZjtbVmEfV6atQsEQrY w==;
X-CSE-ConnectionGUID: TlwaN5nATTmSmPSfVIyltw==
X-CSE-MsgGUID: 6lCaP7mFSmGnuJ/SbmAp0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69449551"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69449551"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 00:59:02 -0700
X-CSE-ConnectionGUID: 4FIkOk/4QsyxX2qznyoWFA==
X-CSE-MsgGUID: cu+FxnBbSJigz/KeGifN5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148340610"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa009.fm.intel.com with ESMTP; 12 Jun 2025 00:59:01 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Date: Thu, 12 Jun 2025 13:45:24 +0530
Message-ID: <20250612081524.26153-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
functions, the CI test systems are going out of space and crashing. To
avoid this issue, a new helper function is created and when fault is
injected into this xe_should_fail_ct_dead_capture() helper function,
ct dead capture is avoided which suppresses ct dumps in the log.

Inject fault into xe_should_fail_ct_dead_capture() function along with
xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
Same as https://patchwork.freedesktop.org/series/148416/ which was
reverted due to change from XE was still in review.

V4 -> V5:
- Fixed review comments (Jonathan).

Test-with: 20250612080402.22011-1-satyanarayana.k.v.p@intel.com
---
 tests/intel/xe_fault_injection.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index aa3a3a7c2..8245c558c 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -113,6 +113,22 @@ static void injection_list_add(const char function_name[])
 	close(dir);
 }
 
+static void injection_list_append(const char function_name[])
+{
+	int dir, fd, ret;
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	fd = openat(dir, "inject", O_WRONLY | O_APPEND);
+	igt_assert_lte(0, fd);
+	ret = write(fd, function_name, strlen(function_name));
+	igt_assert_lte(0, ret);
+
+	close(fd);
+	close(dir);
+}
+
 static void injection_list_remove(const char function_name[])
 {
 	int dir;
@@ -192,6 +208,18 @@ static void set_retval(const char function_name[], long long retval)
 	close(dir);
 }
 
+static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
+{
+	if (strstr(function_name, "send_recv")) {
+		if (enable) {
+			injection_list_append("xe_is_injection_active");
+			set_retval("xe_is_injection_active", INJECT_ERRNO);
+		} else {
+			injection_list_remove("xe_is_injection_active");
+		}
+	}
+}
+
 /**
  * SUBTEST: inject-fault-probe-function-%s
  * Description: inject an error in the injectable function %arg[1] then
@@ -227,11 +255,13 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
 	ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
+	ignore_fail_dump_in_dmesg(function_name, true);
 
 	igt_kmod_bind("xe", pci_slot);
 
 	err = -errno;
 	injection_list_remove(function_name);
+	ignore_fail_dump_in_dmesg(function_name, false);
 
 	return err;
 }
-- 
2.43.0

