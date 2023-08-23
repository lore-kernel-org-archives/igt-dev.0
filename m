Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205C710E080
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 11:52:01 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 17:13:52 +0530
Message-Id: <20230823114354.787212-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 5/7] tests/i915/pm: Rename i915_pm_lpsp to
 kms_pm_lpsp
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As i915_pm_lpsp is a display specific test, rename it with
the "kms_" prefix, i.e kms_pm_lpsp.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/{i915_pm_lpsp.c => kms_pm_lpsp.c} | 3 ++-
 tests/meson.build                            | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename tests/i915/{i915_pm_lpsp.c => kms_pm_lpsp.c} (98%)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/kms_pm_lpsp.c
similarity index 98%
rename from tests/i915/i915_pm_lpsp.c
rename to tests/i915/kms_pm_lpsp.c
index 291e56674..a1bd7c10c 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/kms_pm_lpsp.c
@@ -1,5 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2013 Intel Corporation
+ * Copyright © 2023 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
diff --git a/tests/meson.build b/tests/meson.build
index 4ba6299f3..9cf630b94 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -224,7 +224,6 @@ i915_progs = [
 	'i915_pciid',
 	'i915_pipe_stress',
 	'i915_pm_freq_mult',
-	'i915_pm_lpsp',
 	'i915_pm_rpm',
 	'i915_pm_rc6_residency',
 	'i915_pm_rps',
@@ -251,6 +250,7 @@ i915_progs = [
 	'kms_pipe_b_c_ivb',
 	'kms_pm_backlight',
 	'kms_pm_dc',
+	'kms_pm_lpsp',
 	'kms_psr',
 	'kms_psr2_sf',
 	'kms_psr2_su',
-- 
2.40.0
