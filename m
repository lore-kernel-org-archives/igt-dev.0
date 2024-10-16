Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B992D1AD46
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 11:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B7810E187;
	Wed, 16 Oct 2024 11:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xi6HEvzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFF810E187
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729076515; x=1760612515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s5yKRTnGpsrXBnurvA/4M341AYS+wAkjZjval621GTQ=;
 b=Xi6HEvzXC52TpABmhXKG1S+UPtcyKlpgHLL/DKdsHQFxoZI02y8VPVVD
 dDfccxrs742M91qlIjmBLxDbbU1G/mS+n+UQsSh7OQ1jrFdyHYZXXX6KA
 TkzwB+6h6wZC5PkgW4q0pwIb5S49AZFW7tCLu9KGj9ue0PuLCzWOPFHk+
 OY7K3NcFInLO6ssIIwIn5FVr+7RuA6sHGl0e8reVEwpaXK8jaHksQsAPo
 lCv0MYUAeGGAaNaWL6MAZUPX28iKDHpRUAifDdQAuU5Y+v1b5uEoBwm45
 2Gd54JLmz8ufi5aETScGNSLZwFVGHiJeLMmRNICQidXDHgAQfNCq1hb7o w==;
X-CSE-ConnectionGUID: jBzLlM5mTnWhEBvT8FnLYw==
X-CSE-MsgGUID: 5RZcj4X4RA2xZ3MS/PR4QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39065028"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39065028"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:01:55 -0700
X-CSE-ConnectionGUID: VHlcIFf3QdijvqOm5rhV5w==
X-CSE-MsgGUID: 3av+60CtT7mtdHF6xOdCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="83002161"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:01:54 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel: rename drm_fdinfo into i915_fdinfo
Date: Wed, 16 Oct 2024 13:01:44 +0200
Message-ID: <20241016110144.87187-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016110144.87187-1-kamil.konieczny@linux.intel.com>
References: <20241016110144.87187-1-kamil.konieczny@linux.intel.com>
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

This test works only for i915 driver and also uses i915 specific
workload to validate fdinfo so rename it to avoid confusion.

Also while at this, sort out few i915 build names in meson.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/{drm_fdinfo.c => i915_fdinfo.c} | 2 +-
 tests/meson.build                           | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename tests/intel/{drm_fdinfo.c => i915_fdinfo.c} (99%)

diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/i915_fdinfo.c
similarity index 99%
rename from tests/intel/drm_fdinfo.c
rename to tests/intel/i915_fdinfo.c
index b66ac9e1b..c26ae9737 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/i915_fdinfo.c
@@ -34,7 +34,7 @@
 #include "i915/gem_vm.h"
 #include "intel_ctx.h"
 /**
- * TEST: drm fdinfo
+ * TEST: i915 fdinfo
  * Description: Test the i915 drm fdinfo data
  * Category: Core
  * Mega feature: General Core features
diff --git a/tests/meson.build b/tests/meson.build
index 34b87b125..d2b81b38d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -88,7 +88,6 @@ intel_i915_xe_progs = [
 intel_i915_progs = [
 	'api_intel_bb',
 	'debugfs_test',
-	'drm_fdinfo',
 	'gen3_mixed_blits',
 	'gen3_render_linear_blits',
 	'gen3_render_mixed_blits',
@@ -211,15 +210,14 @@ intel_i915_progs = [
 	'gem_wait',
 	'gem_watchdog',
 	'gem_workarounds',
-	'perf',
-	'perf_pmu',
 	'i915_fb_tiling',
+	'i915_fdinfo',
 	'i915_getparams_basic',
-	'i915_pm_freq_api',
 	'i915_hangman',
 	'i915_module_load',
 	'i915_pciid',
 	'i915_pipe_stress',
+	'i915_pm_freq_api',
 	'i915_pm_freq_mult',
 	'i915_pm_rpm',
 	'i915_pm_rc6_residency',
@@ -229,6 +227,8 @@ intel_i915_progs = [
 	'i915_query',
 	'i915_selftest',
 	'i915_suspend',
+	'perf',
+	'perf_pmu',
 	'prime_busy',
 	'prime_mmap',
 	'prime_mmap_coherency',
-- 
2.47.0

