Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256E410E381
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 20:02:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 01:24:50 +0530
Message-Id: <20230807195500.4103092-11-bhanuprakash.modem@intel.com>
In-Reply-To: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
References: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 10/20] tests/i915/kms_draw_crc: Add tiling
 support for XE
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

Remove the tiling restrictions in Xe specific tests

V2: - Update XE blocklist

Fixes: f6d0bacc0 (tests/i915/kms_draw_crc: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_draw_crc.c       | 4 ----
 tests/intel-ci/xe.blocklist.txt | 1 -
 2 files changed, 5 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 01ecb7bb9..d361e7176 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -295,10 +295,6 @@ igt_main
 			for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
 				modifier = modifiers[modifier_idx];
 
-				/* No tiling support in XE. */
-				if (is_xe_device(drm_fd) && modifier != DRM_FORMAT_MOD_LINEAR)
-					continue;
-
 				for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
 					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
 						continue;
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index dc6984c44..20a6c976b 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -54,7 +54,6 @@ igt@.*@.*pipe-(e|f|g|h).*
 igt@kms_bw@.*-(5|6|7|8)-displays-.*
 ##################################################################
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
-igt@kms_draw_crc@fill-fb
 igt@kms_pipe_b_c_ivb@.*
 igt@kms_pwrite_crc
 igt@kms_ccs@.*
-- 
2.40.0
