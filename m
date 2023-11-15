Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D17610E4ED
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 05:28:08 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 11:11:28 +0530
Message-Id: <20231115054128.788684-6-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231115054128.788684-1-sujaritha.sundaresan@intel.com>
References: <20231115054128.788684-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v5 5/5] HAX: Add rc6 residency to fast-feedback.testlist
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

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index aeba0ab29..c02201c3b 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -54,6 +54,7 @@ igt@i915_getparams_basic@basic-eu-total
 igt@i915_getparams_basic@basic-subslice-total
 igt@i915_hangman@error-state-basic
 igt@i915_pciid
+igt@i915_pm_rc6_residency@rc6-accuracy
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
-- 
2.25.1
