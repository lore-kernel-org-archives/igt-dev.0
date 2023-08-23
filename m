Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A55610E080
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 11:51:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 17:13:50 +0530
Message-Id: <20230823114354.787212-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 3/7] tests/i915/pm: Rename i915_pm_dc to kms_pm_dc
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

As i915_pm_dc is a display specific test, rename it with
the "kms_" prefix, i.e kms_pm_dc.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/{i915_pm_dc.c => kms_pm_dc.c} | 3 ++-
 tests/meson.build                        | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename tests/i915/{i915_pm_dc.c => kms_pm_dc.c} (99%)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/kms_pm_dc.c
similarity index 99%
rename from tests/i915/i915_pm_dc.c
rename to tests/i915/kms_pm_dc.c
index 90fe847fc..43d88f38b 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/kms_pm_dc.c
@@ -1,5 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2018 Intel Corporation
+ * Copyright © 2023 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
diff --git a/tests/meson.build b/tests/meson.build
index c98a98dc4..4ba6299f3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -226,7 +226,6 @@ i915_progs = [
 	'i915_pm_freq_mult',
 	'i915_pm_lpsp',
 	'i915_pm_rpm',
-	'i915_pm_dc',
 	'i915_pm_rc6_residency',
 	'i915_pm_rps',
 	'i915_pm_sseu',
@@ -251,6 +250,7 @@ i915_progs = [
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
 	'kms_pm_backlight',
+	'kms_pm_dc',
 	'kms_psr',
 	'kms_psr2_sf',
 	'kms_psr2_su',
-- 
2.40.0
