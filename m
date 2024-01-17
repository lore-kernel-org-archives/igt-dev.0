Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8262710E091
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 06:39:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t 2/2] HAX/DO_NOT_MERGE: Test VRR subtests in BAT
Date: Wed, 17 Jan 2024 12:03:39 +0530
Message-Id: <20240117063339.3805517-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20240117063339.3805517-1-bhanuprakash.modem@intel.com>
References: <20240117063339.3805517-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 6 ++++++
 tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 60ce1efa4..ed971d892 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -128,6 +128,12 @@ igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
 igt@kms_psr@psr-primary-mmap-gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_vrr@flip-basic
+igt@kms_vrr@flipline
+igt@kms_vrr@negative-basic
+igt@kms_vrr@seamless-rr-switch-vrr
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@flip-basic-fastset
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index bef5b0b8a..113f6153a 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -218,6 +218,12 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@kms_vrr@flip-basic
+igt@kms_vrr@flipline
+igt@kms_vrr@negative-basic
+igt@kms_vrr@seamless-rr-switch-vrr
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@flip-basic-fastset
 
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
-- 
2.40.0
