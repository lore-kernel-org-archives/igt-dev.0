Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECD2CFA450
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 16:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E105E10E0BA;
	Wed, 23 Oct 2024 16:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qrj6Ly1M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E805110E0BA
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729701954; x=1761237954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F0+CQsDmoOX2LkV/dlY/qZ2TLJwqCPXP9+/4NrG34h0=;
 b=Qrj6Ly1MA0IwKic9Pz8Qu7T2R6SZvgqtmZSv12aJESEmPk7HjK5jD20g
 cK5RRLTB25RZxyclf8KyeThJyqF2TGZJ07Gi4DT32kW1vD/blxEt+0IlO
 PV5kVXlWVw49K79vAeXZl1j3aIlB1L8DggPHHOVS9adVe0Cot6GQdY1C8
 Ye2qNxWDC6F9qTiY6dZvWYUchSy+Fn4PBrXmtEEq9jPoMD047fE0gyu/+
 i3RUerFSBgtQlyAehbP8oSTMROyL5S1KL8uI3M/wfYggba9cKlvXR3IxJ
 yBFdWVD2uC1PnpsayjaYIiRZ3ofYi+v0WApvYRCi4sytL345lILnM4bJY w==;
X-CSE-ConnectionGUID: frSMChJfRBeMrcInhlIo+g==
X-CSE-MsgGUID: R2NwTq/hSKGgwfPPqvRqBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40418223"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40418223"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:45:53 -0700
X-CSE-ConnectionGUID: DUqODc3CSoG2WMHZQCrEQw==
X-CSE-MsgGUID: HPW3dryHQr6q3f0+iRv3sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="117768100"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:45:51 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel: rename drm_fdinfo into i915_fdinfo
Date: Wed, 23 Oct 2024 18:45:36 +0200
Message-ID: <20241023164537.83876-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
References: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
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

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
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

