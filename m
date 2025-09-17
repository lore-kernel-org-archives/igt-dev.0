Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC8DCAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 12:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F09010E836;
	Wed, 17 Sep 2025 12:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYFNoiR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F399410E82E
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758112416; x=1789648416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8wqZaewws/JmARSS1AQoAZ53THLs16M3a9xJ4RbGFqQ=;
 b=NYFNoiR/+D7/Nj+LAPERqwFa1fo9VXZAgTXuMqTJRuYzVB44fIrlca/T
 PCBEIR4ajTC/d7KUIhtItaJ/8We+RrykCru+5HMRFqUvD0HHZ0sY/WjM5
 JlEouhS47QlQwxlMrVrtVEyis3V6n+AV9/fF+wfCS1b7N+DDWbgnB2FB1
 3jHyKYE9c7NTpCMmMnoXCHSOfwBVv8c8As+glItsanAzUZbinKS7eoCXF
 8DUouEcSULk8WYKT7MlSq1iDcaAYRsTkH/ZxAaLFED6DrEGFfCX/w5tbq
 NhhbLbqkDZRyx38vSSNqUgLq6GjBVmcXnA7V321+GOG3Xt/V/bczSahch w==;
X-CSE-ConnectionGUID: 1FEuy8ujTQynaFdyi9BzQA==
X-CSE-MsgGUID: QO/4yLuzQg+6ae4Hr+WVBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71781652"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71781652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:33:36 -0700
X-CSE-ConnectionGUID: DregSOfASlqHIc3B7bztLQ==
X-CSE-MsgGUID: 3m5y0yrgQ3uKk5A1NKhlXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="212379572"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:33:35 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 6/6] benchmarks/intel_latency: Integrate xe latency
 tests with build system
Date: Wed, 17 Sep 2025 12:33:17 +0000
Message-ID: <20250917123312.68977-14-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917123312.68977-8-gajendra.uttamchand@intel.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
 <20250917123312.68977-8-gajendra.uttamchand@intel.com>
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

