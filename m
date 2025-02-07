Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28359C0219D
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 07:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9A910EA37;
	Fri,  7 Feb 2025 07:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUu0W48p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292FE10E261
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 07:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738912428; x=1770448428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QuIeS5ymcKyaWSpFocMHvXY4aScmLNSMPU8zV5n8ae8=;
 b=kUu0W48pdjR3E7sBWQ/f0TVCcy76NaAfGPevn47TbW9bx09tHYaO0CRH
 jYcMaT32cLd4OlyXY5GnffQ/GDK8JMCSVYXVn7yvc3T4kuPcQkklVPbty
 ra2WRbIERhh1j7NJzOtMUDsj/Tz7Knk52J5p9/Hi1jSHtfPxoWtRF7Nw3
 +kaJ7pssxcjKf/CEGs5SP4JaarrphtyVY7dumqiJAr4SgREeOEea41OvQ
 EHZTW6Ia/C0xzNelwR/ZAYtVmyaZAZjlKAtywJFh5UDJ/6IRUdrxcr9Mm
 P2NDW+6Robbxct9JYEoygIJBBLsMu/p9zbGplwDbQtHyhG5cQC1DlA9bT A==;
X-CSE-ConnectionGUID: z7ySgbaJRZa0ZQTRCrPMpg==
X-CSE-MsgGUID: J6NJhnRGQmmT7t5sXUt+RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50530066"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="50530066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 23:13:48 -0800
X-CSE-ConnectionGUID: gvZuh1M8Q42qLdXsd59XKw==
X-CSE-MsgGUID: QlJsFwZvQgONjlxBAZ3wYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111373979"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2025 23:13:45 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_fault_injection: Add helper
 functions to inject fault with specific budget parameter.
Date: Fri,  7 Feb 2025 12:59:01 +0530
Message-Id: <20250207072902.12582-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
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

As per the current implementation, the fault is injected on the first call
of the error injection function. Introduce an environment variable
IGT_FAULT_INJECT_ITERATION using which, an error can be injected at
specific function call. If the environment is not exported, an error will
be injected in every possible function call starting from first up to the
max number of iteration defined by INJECT_ITERATIONS, currently hardcoded
as 100.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index a4252d028..9432828c2 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -25,6 +25,7 @@
 #define INJECT_ERRNO	-ENOMEM
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
+#define INJECT_ITERATIONS	100
 
 enum injection_list_action {
 	INJECTION_LIST_ADD,
@@ -42,6 +43,21 @@ struct fault_injection_params {
 	unsigned int space;
 };
 
+static int get_fault_inject_iter(void)
+{
+	/**
+	 *  Introduce a new env variable IGT_FAULT_INJECT_ITERATION.
+	 *  When unset test will run for INJECT_ITERATIONS iterations.
+	 *  When set to <=0 or malformed - same as unset.
+	 *  When set to >0 it will run single n-th iteration only.
+	 */
+
+	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
+
+	/* Return 0 if not exported / -ve value */
+	return env ? (atoi(env) > 0 ? atoi(env) : 0) : 0;
+}
+
 static int fail_function_open(void)
 {
 	int debugfs_fail_function_dir_fd;
@@ -211,8 +227,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);
 }
 
 static int
-- 
2.35.3

