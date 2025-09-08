Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2330FCAC581
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 13:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67F510E528;
	Mon,  8 Sep 2025 13:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lceak7SG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B8110E528
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757339541; x=1788875541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9SDVpCVs33A3duSWsuXjuAoUJ0jdrCcSELye9a0mfaw=;
 b=Lceak7SGPJ8an6n7/QoYnRFK/ezkb7F4vGz76+3AjsHtZLvBip5YmAcC
 6fwjpuIVi4UEfBtEc7nmQuWmsYIqW0jGTrhOeHbUVf9s0JfoKnU7hTc/A
 7A8y+zMZkyXGfVI92FscoHq7PiRCL408ISrI1BX9i2wjt91oE1ozK9Fuf
 I4dXUbAPfpG40JTDIbCpxkI5Xo29mNJmHFx5xDQjsLYCcj4ebVZBZcaEL
 yojbr9VA8Zob0f54ps5g09gxAKolc1luaVsEqWqMjUWaUIUQwMtOMs5X/
 9Wg2Nrh4/EpH9xThSBHe+NEhZ7JWHBL+45M30At6TTdhfp482+nrBP7Q5 A==;
X-CSE-ConnectionGUID: AAm/dgatQQ64IqDlnD6TTw==
X-CSE-MsgGUID: 3470jxaVRlGU/P/B5qHR+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="85041124"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85041124"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:52:21 -0700
X-CSE-ConnectionGUID: qsyr9cRnQIOzYm5Z3uMKIg==
X-CSE-MsgGUID: dt6P6+OVS0GJqf15f3XZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="171968382"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2144PTLH.iind.intel.com) ([10.190.232.53])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:52:19 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dwarakanath.ramadeva@intel.com, pravalika.gurram@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v2 i-g-t 7/7] benchmarks/latency: Integrate xe latency tests
 with build system
Date: Mon,  8 Sep 2025 13:51:45 +0000
Message-ID: <20250908135142.38997-16-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908135142.38997-9-gajendra.uttamchand@intel.com>
References: <20250908135142.38997-9-gajendra.uttamchand@intel.com>
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

Add and configure the 'latency' subdirectory for xe driver latency
benchmarks. Create dedicated latency/meson.build to manage xe latency
test modules and update benchmarks/meson.build to include the latency
suite in the build process.

Enables building of latency test modules:
- xe_blt: Block transfer latency measurement
- xe_create: Device initialization overhead
- xe_vm: Virtual memory timing
- xe_execqueue: Execution queue management
- xe_bo_create_destroy: Buffer object lifecycle
- xe_vm_create_destroy: VM lifecycle

Provides comprehensive build integration for xe driver performance
measurement capabilities.

V2: Updated build files after files reorganization

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/latency/meson.build | 19 +++++++++++++++++++
 benchmarks/meson.build         |  7 ++++---
 2 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 benchmarks/latency/meson.build

diff --git a/benchmarks/latency/meson.build b/benchmarks/latency/meson.build
new file mode 100644
index 000000000..d23c3d990
--- /dev/null
+++ b/benchmarks/latency/meson.build
@@ -0,0 +1,19 @@
+xe_latency_progs = [
+        'xe_blt',
+        'xe_create',
+        'xe_bo_create_destroy',
+        'xe_execqueue',
+        'xe_vm',
+        'xe_vm_create_destroy',
+
+]
+
+latencydir = join_paths(libexecdir, 'benchmarks', 'latency')
+
+foreach prog : xe_latency_progs
+	executable(prog, prog + '.c',
+		   install : true,
+		   install_dir : latencydir,
+		   dependencies : igt_deps)
+endforeach
+
diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index 080eeab11..baf36000b 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -21,9 +21,7 @@ benchmark_progs = [
 	'kms_vblank',
 	'prime_lookup',
 	'vgem_mmap',
-        'xe_blt',
-	'xe_create',
-	'xe_exec_ctx',
+        'xe_exec_ctx',
 ]
 
 benchmarksdir = join_paths(libexecdir, 'benchmarks')
@@ -42,3 +40,6 @@ lib_gem_exec_tracer = shared_module(
   include_directories : inc,
   install_dir : benchmarksdir,
   install: true)
+
+# Include latency for build
+  subdir('latency')
-- 
2.43.0

