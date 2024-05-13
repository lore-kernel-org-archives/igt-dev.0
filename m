Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95924C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 16:09:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F60110E84D;
	Mon, 13 May 2024 16:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJieTyHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BF010E84D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 16:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715616576; x=1747152576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HhsGLgoOPh1MsdPDSJ2woSK8nOs+IZXC9L1/8elr5B0=;
 b=kJieTyHFK747k490EIDypAAKRKFMxYy6JxJiwAZswSsviQAlId3taNwc
 IQy08z60pADSXUHjil019j/K/0iuNThH1epz4Xii29SawI0ek4J2sNmZR
 T+WgTy9HrXf9OuIo3vubTV4pHXD/3OJazojmI6q9S1yVArcumISBjtAwU
 5w/62Lc9xZc71KtPPQft+OeaGyRyCbbGDY6VPTeOdui9KxHM5CzGO3H8H
 bPaShwPtwTn9NdMvSteT4rG+Bwg4xCnJ3oJxq4n+UWBtZXsFMpdcU31l6
 WAphacC0+ISqHr63qoP2z3waP8uuI+kpx6tiNp6MnujYZKPdl8MUMpZIP A==;
X-CSE-ConnectionGUID: qV6RbhUZRz+O9+TV9W6DEA==
X-CSE-MsgGUID: M14ZYMTkT9yKfYUkhwqibg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="36936345"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="36936345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:06:45 -0700
X-CSE-ConnectionGUID: 745QaZ+6RBihd5fjsGIUtw==
X-CSE-MsgGUID: +ODNFHu7S0Wp9yDHjbDlgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34938803"
Received: from monicael-mobl3 (HELO localhost) ([10.245.246.11])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:06:43 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] tests/intel/perf: move igt_require into subtests
Date: Mon, 13 May 2024 18:06:38 +0200
Message-ID: <20240513160638.137890-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

Using igt_require() and igt_skip() in second or later
igt_fixture can confuse developers reading failure logs. Move all
such igt_require() to subtest which needs them.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/perf.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 7a63a3bdd..8ac48feca 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -6048,22 +6048,24 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture igt_require(intel_gen(devid) >= 12);
-
 		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
 		igt_subtest_with_dynamic("gen12-mi-rpc") {
+			igt_require(intel_gen(devid) >= 12);
 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
 			__for_each_render_engine(drm_fd, e)
 				gen12_test_mi_rpc(e);
 		}
 
 		igt_describe("Test OA TLB invalidate");
-		igt_subtest_with_dynamic("gen12-oa-tlb-invalidate")
+		igt_subtest_with_dynamic("gen12-oa-tlb-invalidate") {
+			igt_require(intel_gen(devid) >= 12);
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				gen12_test_oa_tlb_invalidate(e);
+		}
 
 		igt_describe("Measure performance for a specific context using OAR in Gen 12");
 		igt_subtest_with_dynamic("gen12-unprivileged-single-ctx-counters") {
+			igt_require(intel_gen(devid) >= 12);
 			igt_require(has_class_instance(drm_fd, I915_ENGINE_CLASS_RENDER, 0));
 			igt_require_f(render_copy, "no render-copy function\n");
 			__for_each_render_engine(drm_fd, e)
@@ -6072,11 +6074,11 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture igt_require(i915_perf_revision(drm_fd) >= 6);
-
 		igt_describe("Verify invalid class instance");
-		igt_subtest("gen12-invalid-class-instance")
+		igt_subtest("gen12-invalid-class-instance") {
+			igt_require(i915_perf_revision(drm_fd) >= 6);
 			test_invalid_class_instance();
+		}
 
 		/*
 		 * OAR and OAG use cases can be separately opened only on gen12
@@ -6095,8 +6097,10 @@ igt_main
 		}
 
 		igt_describe("Verify concurrent reads from OA buffers in different groups");
-		igt_subtest("gen12-group-concurrent-oa-buffer-read")
+		igt_subtest("gen12-group-concurrent-oa-buffer-read") {
+			igt_require(i915_perf_revision(drm_fd) >= 6);
 			test_group_concurrent_oa_buffer_read();
+		}
 	}
 
 	igt_subtest("rc6-disable")
@@ -6108,20 +6112,23 @@ igt_main
 			test_stress_open_close(e);
 
 	igt_subtest_group {
-		igt_fixture {
+		igt_describe("Verify invalid SSEU opening parameters");
+		igt_subtest_with_dynamic("global-sseu-config-invalid") {
 			igt_require(i915_perf_revision(drm_fd) >= 4);
 			igt_require(intel_graphics_ver(devid) < IP_VER(12, 50));
-		}
 
-		igt_describe("Verify invalid SSEU opening parameters");
-		igt_subtest_with_dynamic("global-sseu-config-invalid")
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config_invalid(ctx, e);
+		}
 
 		igt_describe("Verify specifying SSEU opening parameters");
-		igt_subtest_with_dynamic("global-sseu-config")
+		igt_subtest_with_dynamic("global-sseu-config") {
+			igt_require(i915_perf_revision(drm_fd) >= 4);
+			igt_require(intel_graphics_ver(devid) < IP_VER(12, 50));
+
 			__for_random_engine_in_each_group(perf_oa_groups, ctx, e)
 				test_global_sseu_config(ctx, e);
+		}
 	}
 
 	igt_subtest("invalid-create-userspace-config")
-- 
2.42.0

