Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB12D767F1
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 17:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C60010E41F;
	Thu, 31 Oct 2024 17:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvqV9TIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECC010E41F
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 17:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730396005; x=1761932005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QMEULkuzyYXNh/TUBMK4izZtuLwVRQ3Y3Yv8eDhkQts=;
 b=XvqV9TIETA0AI8+7N79VTxHu/H66C3P3avZ0rCo03YMhdwhgvrk9IABU
 2iiLT/FoPiqbcTMhv/ce22KMKNn/Pr5TBci5MBiJWAiXUrRNU5XIXX2PZ
 YY4BqikAzf9G7I0Q++poLR3j+ipeqtVTRHymN0KN5OfVbcrAqljddq5uf
 FKKjuSVv5ZFWIK3jbLxTxXhi7qLMtg0j0Gzf/NnuC4u5prFLUjYsXkv+n
 0pTfc6JdpnGSQ6ukJrsVwsKYQBBGFI8boX0HJWtI4/BK0aznhIN2It1IR
 /Re8xGwI9oavO6vEvhp7Qhu3u0Kl/JbwRMTXzRhvgq6cR7wH+8yPnS+5v g==;
X-CSE-ConnectionGUID: 3kF9iXx2RpSN7sm3jJWt4A==
X-CSE-MsgGUID: XLEi46IVT1yXfe6eRW3ZSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17789935"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="17789935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 10:33:24 -0700
X-CSE-ConnectionGUID: 0QnEtEvcTfWyraxOkOCS7g==
X-CSE-MsgGUID: q/tNGxw1Tm2hkK7fZnXHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87476121"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 10:33:23 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v4 1/2] tests/intel: rename drm_fdinfo into i915_fdinfo
Date: Thu, 31 Oct 2024 18:32:53 +0100
Message-ID: <20241031173306.73864-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031173306.73864-1-kamil.konieczny@linux.intel.com>
References: <20241031173306.73864-1-kamil.konieczny@linux.intel.com>
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

v2: correct Tvrto address (Kamil)
v3: removed from xe.blocklist and squashed into one patch (Lucas)
v4: corrected lib dependency in meson.build (Kamil)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel-ci/xe.blocklist.txt             |  1 -
 tests/intel/{drm_fdinfo.c => i915_fdinfo.c} |  2 +-
 tests/meson.build                           | 10 +++++-----
 3 files changed, 6 insertions(+), 7 deletions(-)
 rename tests/intel/{drm_fdinfo.c => i915_fdinfo.c} (99%)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index f9ef612c4..6fe893f7a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -33,7 +33,6 @@ igt@kms_selftest.*
 ##################################################################
 igt@debugfs.*
 igt@device_reset
-igt@drm_fdinfo
 igt@drm_read
 igt@dumb.*
 igt@prime_.*
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
index 2724c7a9a..393963093 100644
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
@@ -371,7 +371,6 @@ extra_sources = {
 # Extra dependencies used on core and Intel drivers
 extra_dependencies = {
 	'core_hotunplug': [ lib_igt_i915_perf ],
-	'drm_fdinfo': [ lib_igt_drm_fdinfo ],
 	'dumb_buffer':  [ libatomic ],
 	'gem_barrier_race': [ lib_igt_i915_perf ],
 	'gem_create': [ libatomic ],
@@ -380,6 +379,7 @@ extra_dependencies = {
 	'gem_eio': [ realtime ],
 	'gem_exec_balancer': [ lib_igt_perf ],
 	'gem_mmap_offset': [ libatomic ],
+	'i915_fdinfo': [ lib_igt_drm_fdinfo ],
 	'i915_pm_freq_mult': [ lib_igt_perf ],
 	'i915_pm_rc6_residency': [ lib_igt_perf ],
 	'perf': [ lib_igt_i915_perf ],
-- 
2.47.0

