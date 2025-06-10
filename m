Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D04C678DA
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 15:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3154610E5AD;
	Tue, 10 Jun 2025 15:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXPl7Bar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567210E5A1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749567936; x=1781103936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Su/44UYG8aHWkvoM4CilqEj/xu5E0vM/N/nBMn4InFs=;
 b=TXPl7Bareked6SyjBFx6GdRVVfMlXcXMBTzwJJSl+yAGd+Us+TD8bdkO
 wi6Q7ERaVLeKFn9uHHEqNkQ2Pag6PNVh1lh8qi4cnGjHQnTZ7Y2LwTHIT
 NI5NWRdfnxbunVMMc5vltKutVX+z9uRYGfipThS77p6vNpDOn0uffaGEx
 2iRfOe4i0Wddg8g18ovqrhq8ktiYUJEzvlN7JXtKAhl51B0V01kHw1Q8M
 KF0iWXTvnMwGFffRGML6gGlW7xpsZ4IrzkRvW+HbVjkwzcSKvovMWLWjw
 XT1P5qkxOru2mtVhrSu59K6ls3usmRTHQTSUKqaoNq7dNrqltpO3z+gy5 Q==;
X-CSE-ConnectionGUID: rzeWnPBnS0GpOtTXF0Dkdw==
X-CSE-MsgGUID: XUhJvRWYQkO3bOR+SBOpIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="69248215"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="69248215"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 08:05:36 -0700
X-CSE-ConnectionGUID: K5zUzK9PT56oJZmcbEV70A==
X-CSE-MsgGUID: GGvM2NfSRVWUAkPA0HqY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147232717"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2025 08:05:34 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc CT dumps
 during fault injection
Date: Tue, 10 Jun 2025 20:51:51 +0530
Message-ID: <20250610152151.4260-1-satyanarayana.k.v.p@intel.com>
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
avoid this issue, a new helper function is created and when fault is injected
into this xe_should_fail_ct_dead_capture() helper function, ct dead capture is
avoided which suppresses ct dumps in the log.

Inject fault into xe_should_fail_ct_dead_capture() function along with
xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
Same as https://patchwork.freedesktop.org/series/148416/ which was
reverted due to change from XE was still in review.

Test-with: 20250524144613.11970-1-satyanarayana.k.v.p@intel.com
---
 tests/intel/xe_fault_injection.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 9fe6bfe35..bbc8e71d6 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -123,6 +123,22 @@ static void injection_list_add(const char function_name[])
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
@@ -202,6 +218,15 @@ static void set_retval(const char function_name[], long long retval)
 	close(dir);
 }
 
+static void ignore_fail_dump_in_dmesg(const char function_name[])
+{
+	if (!strcmp(function_name, "xe_guc_ct_send_recv") ||
+	    !strcmp(function_name, "xe_guc_mmio_send_recv")) {
+		injection_list_append("xe_is_injection_active");
+		set_retval("xe_is_injection_active", INJECT_ERRNO);
+	}
+}
+
 /**
  * SUBTEST: inject-fault-probe-function-%s
  * Description: inject an error in the injectable function %arg[1] then
@@ -236,6 +261,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 
 	ignore_faults_in_dmesg(function_name);
 	injection_list_add(function_name);
+	ignore_fail_dump_in_dmesg(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 
 	igt_kmod_bind("xe", pci_slot);
@@ -273,6 +299,8 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
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

