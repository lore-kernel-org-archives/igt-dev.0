Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C3110E43B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 16:36:49 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 22:06:45 +0530
Message-Id: <20230912163645.1316734-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel-ci: add dsc-basic as part ffb
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

Add dsc-basic as part of ffb.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 1 +
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index ba66bde2f..3d8b23073 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -102,6 +102,7 @@ igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
 igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_dsc@dsc-basic
 igt@kms_flip@basic-flip-vs-dpms
 igt@kms_flip@basic-flip-vs-modeset
 igt@kms_flip@basic-flip-vs-wf_vblank
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index e11594123..610cc958c 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -222,6 +222,7 @@ igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
 igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_dsc@dsc-basic
 igt@kms_flip@basic-flip-vs-dpms
 igt@kms_flip@basic-flip-vs-modeset
 igt@kms_flip@basic-flip-vs-wf_vblank
-- 
2.25.1
