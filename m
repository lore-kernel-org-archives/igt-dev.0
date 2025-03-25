Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2053C36005
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 13:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809C610E28E;
	Tue, 25 Mar 2025 13:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mr5sSMcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1903010E28E
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742910687; x=1774446687;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=setySN+5sVD7mxU9RCej+k+SITyIFEhQ93EYqMFErsU=;
 b=Mr5sSMcXI8jGB6GJfj+FD6RxGjcBNN6uRtrhBJyKfbLrFqBYnrH+W9WY
 SY+CJz7jrqpNfpHbT7FkHaTsIAOEaS3BOMnbQyLUXRa4KpRL1e/id8MkU
 fnjjH32X8xHw+B9Kersf9MyVgweY9V702zYxV+t/gsowa5ANqqkKclvmj
 4lEut4ZnkaNFrlVPRgKDedlQ0CJLxm74WkgV3dKMrfc30FiO/W425KvzP
 uGqp7g0lCnue0wM5BTSMhjUFTmUNsLIdjl9gJbjdR2GOPcb7LqaFWmm/i
 A65X4ieUWNI39ow+UpdurpfowwgMGgcQplQkWTCmJy+ZyeFWaPTRRekhq g==;
X-CSE-ConnectionGUID: WMbSWr7TRduAx9OncjhfrA==
X-CSE-MsgGUID: V91ijD3uQmO6tJt0cA0CCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="66612991"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="66612991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:51:25 -0700
X-CSE-ConnectionGUID: GSu9rqgbRg2JjkAPMsm3Bw==
X-CSE-MsgGUID: q7HbKL6OR8mh2hxyt4k+hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129427401"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:51:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Use separate functions
Date: Tue, 25 Mar 2025 06:51:14 -0700
Message-ID: <20250325135114.747316-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.49.0
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

Do not mux everything in a _do() function, but rather use
_add()/_remove()/_clear() functions for clarity and brevity.

The add()/remove() boilerplate is small enough to just be repeated. For
clear(), just implement it using add().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_fault_injection.c | 55 +++++++++++++++++---------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 1bd0f51a3..dcbe0e406 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -26,11 +26,6 @@
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
@@ -96,27 +91,36 @@ static bool fail_function_injection_enabled(void)
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
@@ -139,8 +143,7 @@ static void setup_injection_fault(void)
 
 static void cleanup_injection_fault(int sig)
 {
-	/* If nothing specified (‘’) injection list is cleared */
-	injection_list_do(INJECTION_LIST_ADD, "");
+	injection_list_clear();
 }
 
 static void set_retval(const char function_name[], long long retval)
@@ -185,11 +188,11 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
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
@@ -214,10 +217,10 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
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
@@ -249,10 +252,10 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
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
@@ -312,10 +315,10 @@ vm_bind_fail(int fd, const char function_name[])
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
-- 
2.49.0

