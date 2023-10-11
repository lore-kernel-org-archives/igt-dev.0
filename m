Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7279E10E64F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 10:26:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 15:47:21 +0530
Message-Id: <20231011101722.3188258-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231011101722.3188258-1-bhanuprakash.modem@intel.com>
References: <20231011101722.3188258-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 3/4] tests/intel/pm_rpm: Fix CI with renamed
 tests
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

As Display PM rpm tests are seperated from core, update
the CI testlist with the new ones.

V2: - New patch for module-reload test.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/blacklist-pre-merge.txt | 8 ++++----
 tests/intel-ci/fast-feedback.testlist  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index d4e5ef66e..0a1315aae 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -13,8 +13,8 @@
 #
 # Data acquired on 2020-02-19 by Martin Peres
 ###############################################################################
-igt@i915_pm_rpm@legacy-planes(-dpms)?
-igt@i915_pm_rpm@universal-planes(-dpms)?
+igt@kms_pm_rpm@legacy-planes(-dpms)?
+igt@kms_pm_rpm@universal-planes(-dpms)?
 
 
 ###############################################################################
@@ -67,7 +67,7 @@ igt@gem_exec_alignment@.*
 #
 # Data acquired on 2020-02-20 by Martin Peres
 ###############################################################################
-igt@i915_pm_rpm@debugfs-read
+igt@kms_pm_rpm@debugfs-read
 
 
 ###############################################################################
@@ -109,4 +109,4 @@ igt@gem_tiled_wc
 #
 # Data acquired on 2020-02-20 by Martin Peres
 ###############################################################################
-igt@i915_pm_rpm@modeset-stress-extra-wait
+igt@kms_pm_rpm@modeset-stress-extra-wait
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 3d8b23073..c252e2cf0 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -121,13 +121,13 @@ igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
 igt@kms_pipe_crc_basic@read-crc
 igt@kms_pipe_crc_basic@read-crc-frame-sequence
 igt@kms_pm_backlight@basic-brightness
+igt@kms_pm_rpm@basic-pci-d3-state
+igt@kms_pm_rpm@basic-rte
 igt@kms_psr@primary_page_flip
 igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
 igt@kms_psr@primary_mmap_gtt
 igt@kms_setmode@basic-clone-single-crtc
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@basic-rte
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
-- 
2.40.0
