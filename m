Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC0810E056
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 12:04:40 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 17:33:34 +0530
Message-Id: <20230515120334.220022-3-swati2.sharma@intel.com>
In-Reply-To: <20230515120334.220022-1-swati2.sharma@intel.com>
References: <20230515120334.220022-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] intel-ci: Update fastfeedback testlist
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index cfe7cb4a..3bed1d85 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -118,7 +118,14 @@ igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-red
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-green
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb-blue
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-red
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-green
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12-blue
 igt@kms_pipe_crc_basic@hang-read-crc
 igt@kms_pipe_crc_basic@nonblocking-crc
 igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
-- 
2.25.1
