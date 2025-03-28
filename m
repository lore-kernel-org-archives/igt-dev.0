Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35086C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 15:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B811D10EA49;
	Fri, 28 Mar 2025 15:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUS4pa8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7660E10EA49
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743174953; x=1774710953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hzLeWYzBcZBs0uRB0sqBmJON8/ovLQGjJOwbmATtRoY=;
 b=LUS4pa8HS6smhXXu6uQxcn4ozD2ADKawS2YRm5SUE8pndu9uolg8N3mN
 96ERvmfDD15eRuVDc+j2ZhGuW/usJMsDoDa6TtQft5Otz1Z5Ikc+vOHm0
 PO5hB/t+or42K54vlbuHoeVFjIyX9KjAmzxpgKWmD51WgFNR2ib5LNrS4
 Fh6Jp+7k908gkF+Wyd5wn7W2/zo+Ygi66ZnL03iZ/e18H1cA4NcISUd8K
 C8ti08QPZiA/MWz70OmaNBLJm/pglPn32fRem3qJ79jynWSQuSYTaYk6k
 pYRcfiHetBnYxoZkXgCUl9yy9suxM69dnHbKXoeoIai9EgeFoTijyM7WT Q==;
X-CSE-ConnectionGUID: qlAeVfAVRLaV4Ie+gzw84Q==
X-CSE-MsgGUID: PY0/WdtjT9G+3ouCTARQ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55915239"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55915239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 08:15:47 -0700
X-CSE-ConnectionGUID: 2HTa7E1/QoKJNqpHOTv6qw==
X-CSE-MsgGUID: 6Q3J3ROXR3+DWbJmzAtj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="156403518"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 08:15:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_fault_injection: Use separate
 functions
Date: Fri, 28 Mar 2025 08:15:30 -0700
Message-ID: <20250328-xe-fault-nomux-v2-1-ade02885ff16@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250328-xe-fault-nomux-d5be63de17cd
X-Mailer: b4 0.15-dev-7c0e3
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

Do not mux everything in a _do() function, but rather use
_add()/_remove()/_clear() functions for clarity and brevity.

The add()/remove() boilerplate is small enough to just be repeated. For
clear(), just implement it using add().

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Rebase to add the same changes in oa_add_config_fail()
---
 tests/intel/xe_fault_injection.c | 59 +++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 24c114ba7..8efeea174 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -27,11 +27,6 @@
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
 
-enum injection_list_action {
-	INJECTION_LIST_ADD,
-	INJECTION_LIST_REMOVE,
-};
-
 static int fail_function_open(void)
 {
 	int debugfs_fail_function_dir_fd;
@@ -97,27 +92,36 @@ static bool fail_function_injection_enabled(void)
 	return true;
 }
 
-static void injection_list_do(enum injection_list_action action, const char function_name[])
+static void injection_list_add(const char function_name[])
 {
 	int dir;
 
 	dir = fail_function_open();
+
 	igt_assert_lte(0, dir);
+	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
 
-	switch(action) {
-	case INJECTION_LIST_ADD:
-		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
-		break;
-	case INJECTION_LIST_REMOVE:
-		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
-		break;
-	default:
-		igt_assert(!"missing");
-	}
+	close(dir);
+}
+
+static void injection_list_remove(const char function_name[])
+{
+	int dir;
+
+	dir = fail_function_open();
+
+	igt_assert_lte(0, dir);
+	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
 
 	close(dir);
 }
 
+static void injection_list_clear(void)
+{
+	/* If nothing specified (‘’) injection list is cleared */
+	return injection_list_add("");
+}
+
 /*
  * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
  */
@@ -140,8 +144,7 @@ static void setup_injection_fault(void)
 
 static void cleanup_injection_fault(int sig)
 {
-	/* If nothing specified (‘’) injection list is cleared */
-	injection_list_do(INJECTION_LIST_ADD, "");
+	injection_list_clear();
 }
 
 static void set_retval(const char function_name[], long long retval)
@@ -189,11 +192,11 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
 	ignore_faults_in_dmesg(function_name);
-	injection_list_do(INJECTION_LIST_ADD, function_name);
+	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
 	igt_assert_eq(-errno, INJECT_ERRNO);
-	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	injection_list_remove(function_name);
 }
 
 /**
@@ -218,10 +221,10 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
 	xe_exec_queue_destroy(fd, exec_queue_id);
 
 	ignore_faults_in_dmesg(function_name);
-	injection_list_do(INJECTION_LIST_ADD, function_name);
+	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
-	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	injection_list_remove(function_name);
 
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
 	xe_exec_queue_destroy(fd, exec_queue_id);
@@ -253,10 +256,10 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 
 	ignore_faults_in_dmesg(function_name);
-	injection_list_do(INJECTION_LIST_ADD, function_name);
+	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_create(fd, flags) != 0);
-	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	injection_list_remove(function_name);
 
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 }
@@ -316,10 +319,10 @@ vm_bind_fail(int fd, const char function_name[])
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 
 	ignore_faults_in_dmesg(function_name);
-	injection_list_do(INJECTION_LIST_ADD, function_name);
+	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_bind(fd, vm) != 0);
-	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	injection_list_remove(function_name);
 
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 }
@@ -360,10 +363,10 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 
 	ignore_faults_in_dmesg(function_name);
-	injection_list_do(INJECTION_LIST_ADD, function_name);
+	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
-	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+	injection_list_remove(function_name);
 
 	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
 	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);



