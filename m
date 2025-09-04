Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA70CA1015
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 08:13:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31D310E9AB;
	Thu,  4 Sep 2025 08:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDUDnAsR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50C710E9A8
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756973631; x=1788509631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XS/AnWACGNoDMgUMq1zz1Sgw4j2fL7XHVTL6EwQPiRg=;
 b=RDUDnAsRRzKEJxhj+CfDYZyccZkUxAieImb3jMWvYj3VtkZtC4uak4AH
 ITbQ5TlEzEq4Mfj6q8p7VoM8CtEB/ikCmsajm1xpLWV54UiHcGJu0cAE5
 OeolEoED2Lpj2IiAUTE8K1V0TxyWBBQVIh7Cv03ehmnRTXoiBS53L0D8p
 wTicE8wg+evDycXuOxeasAdKs1zGbemi5qbpM5IT3TV5DZTZH36JZheuk
 dvm7cWmGq4464/B7vP7zeMf1RVYqwSY56t+d0llvGsI1gUvxZ1UT3YM/J
 O4YIvgbYraSXLJVCOgY8RJvthpMi5foWLJ6S6aSsxAAkMtwHpigQs1LVZ Q==;
X-CSE-ConnectionGUID: lV1bUPh8R7SIcN2Jyu5cgA==
X-CSE-MsgGUID: thVyqqkzTXCGXcWzU/jiDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76907643"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76907643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:13:51 -0700
X-CSE-ConnectionGUID: XdFeQN+wQ9qukcHk//0zcQ==
X-CSE-MsgGUID: t+yff5FHQhWzFqhnVGfcow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="172278900"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2146PTLH.iind.intel.com) ([10.190.234.52])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:13:50 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH i-g-t 7/7] benchmarks/latency: Integrate xe latency tests with
 build system
Date: Thu,  4 Sep 2025 08:13:25 +0000
Message-ID: <20250904081319.1320131-16-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904081319.1320131-9-gajendra.uttamchand@intel.com>
References: <20250904081319.1320131-9-gajendra.uttamchand@intel.com>
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

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/latency/meson.build | 19 +++++++++++++++++++
 benchmarks/meson.build         |  5 ++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 benchmarks/latency/meson.build

diff --git a/benchmarks/latency/meson.build b/benchmarks/latency/meson.build
new file mode 100644
index 000000000..53e42102b
--- /dev/null
+++ b/benchmarks/latency/meson.build
@@ -0,0 +1,19 @@
+xe_latency_progs = [
+        'xe_blt',
+	'xe_create',
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
index 080eeab11..6a45002fc 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -23,7 +23,7 @@ benchmark_progs = [
 	'vgem_mmap',
         'xe_blt',
 	'xe_create',
-	'xe_exec_ctx',
+        'xe_exec_ctx',  
 ]
 
 benchmarksdir = join_paths(libexecdir, 'benchmarks')
@@ -42,3 +42,6 @@ lib_gem_exec_tracer = shared_module(
   include_directories : inc,
   install_dir : benchmarksdir,
   install: true)
+
+# Include latency for build
+  subdir('latency')
-- 
2.43.0

