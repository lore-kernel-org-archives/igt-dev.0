Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D670CAC599
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 13:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DAF10E836;
	Wed, 17 Sep 2025 13:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWBc3QYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C83510E836
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758114626; x=1789650626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8wqZaewws/JmARSS1AQoAZ53THLs16M3a9xJ4RbGFqQ=;
 b=ZWBc3QYvjCOQW2/vJtGBayW9oUJ4Vhl+FrO2/BhRHLfMUthAtuaFgEGq
 s5sna76Mu4+ygy5YHNov4wjLUdm7G4To2wmKEGqt/j5hv+TFwT07F6jly
 or+0d1mmQtRVuJKfAMlSxoQam7soRFx3KuHDMJCW0vc/MIizbYPAjHNqF
 hZg48k2adnPvcESffTdnVTQkchbN2ZieZsUZTSLvqA9wUccuLQvFXQUx5
 BrmYC3p/UiDzg2TyqEn33T6CMpoT0WOWsyMdXVmt7CCZ+v/EMtNLqx9R/
 EBowIz9vS8+LiKJE5G9BJ+ELBWAPiPhA4ZuIY5hJdzZJ81FlABDJnjU4J w==;
X-CSE-ConnectionGUID: t+oyGz3kSy2ISPQvct1fBQ==
X-CSE-MsgGUID: uUL/xZ7cQPGKLTnwHnNKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60477384"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60477384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:10:26 -0700
X-CSE-ConnectionGUID: JVIrS36yRSOJfM6AQqmjsg==
X-CSE-MsgGUID: N0ctuuINRRmC1auBhjKBZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="174526369"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:10:25 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 6/6] benchmarks/intel_latency: Integrate xe latency
 tests with build system
Date: Wed, 17 Sep 2025 13:10:08 +0000
Message-ID: <20250917131003.71762-14-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917131003.71762-8-gajendra.uttamchand@intel.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917131003.71762-8-gajendra.uttamchand@intel.com>
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

Add and configure the 'intel_latency' subdirectory for xe driver
latency benchmarks. Create dedicated latency/meson.build to manage
xe latency test modules and update benchmarks/meson.build to include
the latency suite in the build process.

Enables building of latency test modules:
- xe_blt: Block transfer latency measurement
- xe_create: Device initialization overhead
- xe_vm: Virtual memory timing
- xe_execqueue: Execution queue management
- xe_bo_create_destroy: Buffer object lifecycle
- xe_vm_create_destroy: VM lifecycle

Provides comprehensive build integration for xe driver performance
measurement capabilities.

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/intel_latency/meson.build | 18 ++++++++++++++++++
 benchmarks/meson.build               |  6 +++---
 2 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 benchmarks/intel_latency/meson.build

diff --git a/benchmarks/intel_latency/meson.build b/benchmarks/intel_latency/meson.build
new file mode 100644
index 000000000..f3bcb2506
--- /dev/null
+++ b/benchmarks/intel_latency/meson.build
@@ -0,0 +1,18 @@
+xe_latency_progs = [
+	'xe_blt',
+	'xe_create',
+	'xe_exec_ctx',
+	'xe_execqueue',
+	'xe_vm',
+	'xe_vm_create_destroy',
+	'xe_bo_create_destroy',
+]
+
+latencydir = join_paths(libexecdir, 'benchmarks', 'intel_latency')
+
+foreach prog : xe_latency_progs
+	executable(prog, prog + '.c',
+		   install : true,
+		   install_dir : latencydir,
+		   dependencies : igt_deps)
+endforeach
diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index 080eeab11..21296d296 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -21,9 +21,6 @@ benchmark_progs = [
 	'kms_vblank',
 	'prime_lookup',
 	'vgem_mmap',
-        'xe_blt',
-	'xe_create',
-	'xe_exec_ctx',
 ]
 
 benchmarksdir = join_paths(libexecdir, 'benchmarks')
@@ -42,3 +39,6 @@ lib_gem_exec_tracer = shared_module(
   include_directories : inc,
   install_dir : benchmarksdir,
   install: true)
+
+# Include latency for build
+  subdir('intel_latency')
-- 
2.43.0

