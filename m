Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CC0C3ABBF
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 13:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3DD10E25B;
	Tue,  6 May 2025 13:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCKsJnFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4B910E25B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 13:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746539259; x=1778075259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kRy/UlTsUQ7Osnds4ALDM+j5nar/8bKhM/+c/hElLDo=;
 b=SCKsJnFD2LBKbj40xizn67Grx6TAoGwYk5rVaJRyIzWvqti3z4PJseMx
 bs9/SkvUAGus4GbDLyjsyeuGSaZHhU3RE0SxFSXSQ+PMX8tfusP2xZkMy
 CFzb33yHBcSkm2EcmgJjRll3Qkvcx55QFIRwyasPElnxkO4HL765Pvy+R
 XFa9OJoucpbgA4gBHZf6bsxFXrmXc2OrpcA7Mi5Ky4jw90uh/N6oYI8mg
 mu5swVk9t0ZkYTwWx0dCpCz/Vp8EMIHXMRl3cSPfDCvEPZi863IrmEWp2
 b1ohvyOZpaAvBUVmbCJ7FRzDlU7gxsaEVHJePFImQVOUCLo7+U5Hp5dJQ A==;
X-CSE-ConnectionGUID: yOJ1J4DwQC27E/VIQEsy+Q==
X-CSE-MsgGUID: YIoiiLwjS+qGYEJbEedFkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58865722"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58865722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:47:39 -0700
X-CSE-ConnectionGUID: 6+irmT9yRL2dn22WtJ7Jsg==
X-CSE-MsgGUID: aLbg5LT0TxuDSBq8Hsoerw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136568359"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 06 May 2025 06:47:37 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Date: Tue,  6 May 2025 19:33:50 +0530
Message-ID: <20250506140351.29612-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
References: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
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
avoid this issue, a new helper function is created and when fault is injected
into this xe_should_fail_ct_dead_capture() helper function, ct dead capture is
avoided which suppresses ct dumps in the log.

Inject fault into xe_should_fail_ct_dead_capture() function along with
xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_fault_injection.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 602e4cb39..82d730a7c 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -121,6 +121,22 @@ static void injection_list_add(const char function_name[])
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
+	ret = write(fd, function_name, strlen(function_name));
+
+	close(fd);
+	close(dir);
+
+	igt_assert_lte(0, ret);
+}
+
 static void injection_list_remove(const char function_name[])
 {
 	int dir;
@@ -234,6 +250,10 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 
 	ignore_faults_in_dmesg(function_name);
 	injection_list_add(function_name);
+	if (!strcmp(function_name, "xe_guc_ct_send_recv") ||
+	    !strcmp(function_name, "xe_guc_mmio_send_recv"))
+		injection_list_append("xe_should_fail_ct_dead_capture");
+
 	set_retval(function_name, INJECT_ERRNO);
 
 	igt_kmod_bind("xe", pci_slot);
@@ -271,6 +291,8 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
 	for (int i = iter_start; i < iter_end; i++) {
 		fault_params->space = i;
 		setup_injection_fault(fault_params);
+		/* Clear the injection list  */
+		injection_list_clear();
 		inject_fault_probe(fd, pci_slot, function_name);
 		igt_kmod_unbind("xe", pci_slot);
 	}
-- 
2.43.0

