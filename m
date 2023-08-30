Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D023910E552
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 15:39:40 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Aug 2023 21:09:37 +0530
Message-Id: <20230830153937.1215474-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel-ci: add basic audio test to ffb
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

Add basic audio test to i915/XE fast feedback testlist.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 1 +
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c09c6c417..841051058 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -110,6 +110,7 @@ igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
+igt@kms_hdmi_inject@inject-audio
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
 igt@kms_pipe_crc_basic@hang-read-crc
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index ef7ddff24..a395fa8c3 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -229,6 +229,7 @@ igt@kms_force_connector_basic@force-connector-state
 igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
+igt@kms_hdmi_inject@inject-audio
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
 igt@kms_pipe_crc_basic@hang-read-crc
-- 
2.25.1
