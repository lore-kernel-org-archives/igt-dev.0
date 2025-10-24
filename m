Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C38CCD1BF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 03:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323B610E9C5;
	Fri, 24 Oct 2025 03:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9wcdFVb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB5610E0FD
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 03:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761276712; x=1792812712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wKmVan+yEndThuxuc5O+XvJMBI1WJoQ+kmE5FGiNEvA=;
 b=W9wcdFVbZa6tyIRtC0spNQOn8wrEwGzceWjaL+hWeZflZweYxLKFVa8e
 WAb4M4TqN8DdvizB3Iy8h/kJvTPk54aldyDKANlaXfmIjwoRqttd4Zdk8
 O0zH8Vc2dqKf6Wdx5jXftjav6D5NLkRSQRmKYFBmUMBy5OD43HZZ8BsJ5
 x23gaX3S2EAAe10Y6VCsRVlzcoIh+x87w2c/enI44fHVYiSHR5vprJ6Rq
 uoEX370R4oRNfi2+fZ/yP3A4vhl3RlFR7DpzHj25lRJ6XK+jRiVRhLM9M
 biJqu+ie+UOaWGmw3P4MKOXT9sV94uUiAJZXvnaEMDB2xPiD8Iji1e2Wg g==;
X-CSE-ConnectionGUID: AKGfTMMITdy6QDxyGk+zpw==
X-CSE-MsgGUID: EAvBu+j3RQSrOYLJRIxOdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73746187"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="73746187"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:52 -0700
X-CSE-ConnectionGUID: KM1Jaoo/T6GL495SWURc2w==
X-CSE-MsgGUID: FGhkIiTTSNCcGqSKfam9Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184221614"
Received: from dut2143ptlh.iind.intel.com ([10.223.34.2])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:49 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, priyanka.dandamudi@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v5 i-g-t 1/5] benchmarks: Relocate xe latency tests and add
 meson build
Date: Fri, 24 Oct 2025 03:31:19 +0000
Message-ID: <20251024033118.15674-8-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024033118.15674-7-gajendra.uttamchand@intel.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20251024033118.15674-7-gajendra.uttamchand@intel.com>
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

- Move existing xe benchmark into folder intel_latency to
separate those from other benchmarks
- Remove references to moved latency tests from the parent
meson.build to avoid failures
- Update parent meson.build to include subdirectory to build
xe latency tests
- Add new meson.build inside benchmarks/intel_latency to build
the moved tests and include it in build process

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 benchmarks/intel_latency/meson.build         | 15 +++++++++++++++
 benchmarks/{ => intel_latency}/xe_blt.c      |  0
 benchmarks/{ => intel_latency}/xe_create.c   |  0
 benchmarks/{ => intel_latency}/xe_exec_ctx.c |  0
 benchmarks/meson.build                       |  7 ++++---
 5 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 benchmarks/intel_latency/meson.build
 rename benchmarks/{ => intel_latency}/xe_blt.c (100%)
 rename benchmarks/{ => intel_latency}/xe_create.c (100%)
 rename benchmarks/{ => intel_latency}/xe_exec_ctx.c (100%)

diff --git a/benchmarks/intel_latency/meson.build b/benchmarks/intel_latency/meson.build
new file mode 100644
index 000000000..c404501e8
--- /dev/null
+++ b/benchmarks/intel_latency/meson.build
@@ -0,0 +1,15 @@
+xe_latency_progs = [
+	'xe_blt',
+	'xe_create',
+	'xe_exec_ctx',
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
+
diff --git a/benchmarks/xe_blt.c b/benchmarks/intel_latency/xe_blt.c
similarity index 100%
rename from benchmarks/xe_blt.c
rename to benchmarks/intel_latency/xe_blt.c
diff --git a/benchmarks/xe_create.c b/benchmarks/intel_latency/xe_create.c
similarity index 100%
rename from benchmarks/xe_create.c
rename to benchmarks/intel_latency/xe_create.c
diff --git a/benchmarks/xe_exec_ctx.c b/benchmarks/intel_latency/xe_exec_ctx.c
similarity index 100%
rename from benchmarks/xe_exec_ctx.c
rename to benchmarks/intel_latency/xe_exec_ctx.c
diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index 080eeab11..9d739e6ce 100644
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
@@ -42,3 +39,7 @@ lib_gem_exec_tracer = shared_module(
   include_directories : inc,
   install_dir : benchmarksdir,
   install: true)
+
+# Include intel_latency for build
+  subdir('intel_latency')
+
-- 
2.43.0

