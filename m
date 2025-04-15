Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A1DC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 17:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8F410E806;
	Tue, 15 Apr 2025 17:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePd+AcwD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B79610E806
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744736540; x=1776272540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVwidPYPY6XYNpsyt7z2EbTF2jRLA98ZPdsIXCqLl5U=;
 b=ePd+AcwDeThlAjr4j4EABJ+PKIumjwFAFoPZaB4Ge1BCVLUqXI2+zmAK
 E+b8ridpoVD6+Lb7YCpnCochmhhrMVhxDUSovF/9JJPw61xtsAyW2sq8i
 9lrJWf2VDhTY5P86wak7Lrv3730iM/02efpkLO5XmWTWOUUxvgqoX80S6
 2zOFf8iX1TDIHs+UuvOCmYRcdhlE8fjf57t7knJyPvpVIfdhIZo/RgFay
 3r8U59WiChj2fzcEspnIp9iRwJu665WFmiX5iP53R5UQLeJ82M2Q0Mk+Z
 ij++KYaVxXWwCYZefsj03GYaqms9TTRlDT6XUBLGuqefL1ww28Te2h/go g==;
X-CSE-ConnectionGUID: H4H6DMe4QXSBTG+eVE0R9w==
X-CSE-MsgGUID: iQd0x920QCy7EKwIOysiUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33876458"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="33876458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:02:20 -0700
X-CSE-ConnectionGUID: Aoq3/WzPTuqx4CpSj3CP+A==
X-CSE-MsgGUID: JgleXFD0Rde+A7/HbmcW1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135030428"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:02:18 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v6 1/2] tests/intel: rename drm_fdinfo into
 i915_drm_fdinfo
Date: Tue, 15 Apr 2025 19:02:07 +0200
Message-ID: <20250415170208.198730-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415170208.198730-1-kamil.konieczny@linux.intel.com>
References: <20250415170208.198730-1-kamil.konieczny@linux.intel.com>
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

v2: correct Tvrto address (Kamil)
v3: removed from xe.blocklist and squashed into one patch (Lucas)
v4: corrected lib dependency in meson.build (Kamil)
v5: drop sorting other tests in meson.build (Kamil)
v6: use i915_drm_fdinfo as there is xe_drm_fdinfo (Lucas)
  correct test name in documentation (Kamil)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel-ci/xe.blocklist.txt                 | 1 -
 tests/intel/{drm_fdinfo.c => i915_drm_fdinfo.c} | 2 +-
 tests/meson.build                               | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename tests/intel/{drm_fdinfo.c => i915_drm_fdinfo.c} (99%)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index d02d0f73e..506a6001e 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -38,7 +38,6 @@ igt@xe_live_ktest@xe_bo_shrink
 ##################################################################
 igt@debugfs.*
 igt@device_reset
-igt@drm_fdinfo
 igt@drm_read
 igt@dumb.*
 igt@prime_.*
diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/i915_drm_fdinfo.c
similarity index 99%
rename from tests/intel/drm_fdinfo.c
rename to tests/intel/i915_drm_fdinfo.c
index 3c1f0a739..f5aadc9eb 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/i915_drm_fdinfo.c
@@ -34,7 +34,7 @@
 #include "i915/gem_vm.h"
 #include "intel_ctx.h"
 /**
- * TEST: drm fdinfo
+ * TEST: i915 drm fdinfo
  * Description: Test the i915 drm fdinfo data
  * Category: Core
  * Mega feature: General Core features
diff --git a/tests/meson.build b/tests/meson.build
index 9224145cf..8cb3fc4d2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -88,7 +88,6 @@ intel_i915_xe_progs = [
 
 intel_i915_progs = [
 	'api_intel_bb',
-	'drm_fdinfo',
 	'gen3_mixed_blits',
 	'gen3_render_linear_blits',
 	'gen3_render_mixed_blits',
@@ -213,6 +212,7 @@ intel_i915_progs = [
 	'gem_workarounds',
 	'perf',
 	'perf_pmu',
+	'i915_drm_fdinfo',
 	'i915_fb_tiling',
 	'i915_getparams_basic',
 	'i915_pm_freq_api',
@@ -386,7 +386,6 @@ extra_sources = {
 # Extra dependencies used on core and Intel drivers
 extra_dependencies = {
 	'core_hotunplug': [ lib_igt_i915_perf ],
-	'drm_fdinfo': [ lib_igt_drm_fdinfo ],
 	'dumb_buffer':  [ libatomic ],
 	'gem_barrier_race': [ lib_igt_i915_perf ],
 	'gem_create': [ libatomic ],
@@ -395,6 +394,7 @@ extra_dependencies = {
 	'gem_eio': [ realtime ],
 	'gem_exec_balancer': [ lib_igt_perf ],
 	'gem_mmap_offset': [ libatomic ],
+	'i915_drm_fdinfo': [ lib_igt_drm_fdinfo ],
 	'i915_pm_freq_mult': [ lib_igt_perf ],
 	'i915_pm_rc6_residency': [ lib_igt_perf ],
 	'perf': [ lib_igt_i915_perf ],
-- 
2.49.0

