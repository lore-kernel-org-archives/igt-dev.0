Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F180E10E2C5
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 14:22:50 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 19:52:11 +0530
Message-Id: <20230529142211.333069-3-swati2.sharma@intel.com>
In-Reply-To: <20230529142211.333069-1-swati2.sharma@intel.com>
References: <20230529142211.333069-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] intel-ci: update fastfeedback
 testlist
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

Update fastfeedback testlist.

v2: -fixed typo, renamed xrg888 to xr24 (Bhanu)
    -updated xe fastfeedback testlist too (Bhanu)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 3 ++-
 tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index cfe7cb4a..31639c89 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -118,7 +118,8 @@ igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
 igt@kms_pipe_crc_basic@hang-read-crc
 igt@kms_pipe_crc_basic@nonblocking-crc
 igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 7242c8d8..bdd12e57 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -259,7 +259,8 @@ igt@kms_flip@basic-plain-flip
 igt@kms_force_connector_basic@force-connector-state
 igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@prune-stale-modes
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
 igt@kms_pipe_crc_basic@hang-read-crc
 igt@kms_pipe_crc_basic@nonblocking-crc
 igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
-- 
2.25.1
