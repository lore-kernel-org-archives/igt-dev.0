Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0471B10E39B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:40:22 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 22:02:04 +0530
Message-Id: <20230816163206.402705-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
References: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 18/20] tests/intel-ci: Update Xe ffb testlist &
 blocklist for kms_frontbuffer_tracking
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

Add kms_frontbuffer_tracking tests back to xe fast-feedback testlist and
drop them from xe blocklist.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 tests/intel-ci/xe.blocklist.txt          | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 26c09ab8b..4f4991fba 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -231,6 +231,7 @@ igt@kms_flip@basic-plain-flip
 igt@kms_force_connector_basic@force-connector-state
 igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@prune-stale-modes
+igt@kms_frontbuffer_tracking@basic
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
 igt@kms_pipe_crc_basic@hang-read-crc
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index b89b0b951..3b7c565bd 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -56,7 +56,7 @@ igt@kms_bw@.*-(5|6|7|8)-displays-.*
 igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
 igt@kms_pipe_b_c_ivb@.*
 igt@kms_pwrite_crc
-igt@kms_frontbuffer_tracking@.*
+igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
 igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
 igt@kms_fence_pin_leak
 igt@kms_busy@.*
-- 
2.40.0
