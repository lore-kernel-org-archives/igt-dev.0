Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E8F10F6F1
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 05:59:41 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Apr 2022 11:29:30 +0530
Message-Id: <20220422055930.19377-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Reorder system suspend to last
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reorder the system wide igt tests to last of fast-feedback.testlist,
so we don't loose the other tests coverage on the platforms which
are largely getting hit by Suspend/Resume related failures.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index f6329708b..c9613e609 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -25,8 +25,6 @@ igt@gem_exec_fence@nb-await
 igt@gem_exec_gttfill@basic
 igt@gem_exec_parallel@engines
 igt@gem_exec_store@basic
-igt@gem_exec_suspend@basic-s0
-igt@gem_exec_suspend@basic-s3
 igt@gem_flink_basic@bad-flink
 igt@gem_flink_basic@bad-open
 igt@gem_flink_basic@basic
@@ -98,7 +96,6 @@ igt@kms_chamelium@hdmi-edid-read
 igt@kms_chamelium@hdmi-crc-fast
 igt@kms_chamelium@vga-hpd-fast
 igt@kms_chamelium@vga-edid-read
-igt@kms_chamelium@common-hpd-after-suspend
 igt@kms_prop_blob@basic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
@@ -128,7 +125,6 @@ igt@kms_pipe_crc_basic@read-crc-pipe-a
 igt@kms_pipe_crc_basic@read-crc-pipe-b
 igt@kms_pipe_crc_basic@read-crc-pipe-c
 igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
-igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a
 igt@kms_psr@primary_page_flip
 igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
@@ -174,8 +170,14 @@ igt@gem_lmem_swapping@parallel-random-engines
 igt@gem_lmem_swapping@random-engines
 igt@gem_lmem_swapping@verify-random
 igt@i915_pm_rpm@module-reload
-igt@i915_suspend@system-suspend-without-i915
 
 # Kernel selftests
 igt@i915_selftest@live
 igt@dmabuf@all
+
+# System wide Suspend Test
+igt@i915_suspend@system-suspend-without-i915
+igt@gem_exec_suspend@basic-s0
+igt@gem_exec_suspend@basic-s3
+igt@kms_chamelium@common-hpd-after-suspend
+igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a
-- 
2.26.2
