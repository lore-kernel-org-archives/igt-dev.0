Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748F710E080
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 11:51:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 17:13:48 +0530
Message-Id: <20230823114354.787212-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
References: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/7] tests/i915/pm: Rename i915_pm_backlight to
 kms_pm_backlight
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

As i915_pm_backlight is a display specific test, rename it with
the "kms_" prefix, i.e kms_pm_backlight.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/{i915_pm_backlight.c => kms_pm_backlight.c} | 3 ++-
 tests/intel-ci/fast-feedback.testlist                  | 2 +-
 tests/meson.build                                      | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename tests/i915/{i915_pm_backlight.c => kms_pm_backlight.c} (99%)

diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/kms_pm_backlight.c
similarity index 99%
rename from tests/i915/i915_pm_backlight.c
rename to tests/i915/kms_pm_backlight.c
index 3c73b054b..ade5539d2 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/kms_pm_backlight.c
@@ -1,5 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2015 Intel Corporation
+ * Copyright © 2023 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c09c6c417..4e1ed921c 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -117,12 +117,12 @@ igt@kms_pipe_crc_basic@nonblocking-crc
 igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
 igt@kms_pipe_crc_basic@read-crc
 igt@kms_pipe_crc_basic@read-crc-frame-sequence
+igt@kms_pm_backlight@basic-brightness
 igt@kms_psr@primary_page_flip
 igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
 igt@kms_psr@primary_mmap_gtt
 igt@kms_setmode@basic-clone-single-crtc
-igt@i915_pm_backlight@basic-brightness
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
 igt@i915_pm_rps@basic-api
diff --git a/tests/meson.build b/tests/meson.build
index 4d325bed1..c98a98dc4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -223,7 +223,6 @@ i915_progs = [
 	'i915_module_load',
 	'i915_pciid',
 	'i915_pipe_stress',
-	'i915_pm_backlight',
 	'i915_pm_freq_mult',
 	'i915_pm_lpsp',
 	'i915_pm_rpm',
@@ -251,6 +250,7 @@ i915_progs = [
 	'kms_legacy_colorkey',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
+	'kms_pm_backlight',
 	'kms_psr',
 	'kms_psr2_sf',
 	'kms_psr2_su',
-- 
2.40.0
