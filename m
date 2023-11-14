Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8380A10E460
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 09:01:47 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 14:39:25 +0530
Message-Id: <20231114090926.1618995-8-kunal1.joshi@intel.com>
In-Reply-To: <20231114090926.1618995-1-kunal1.joshi@intel.com>
References: <20231114090926.1618995-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 7/8] tests/intel-ci/fast-feedback: update renamed
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

Previously since there were only two categories
psr and psr2, there was no psr_ prefix, updated
testlist with prefix

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c252e2cf0..aeba0ab29 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -123,10 +123,10 @@ igt@kms_pipe_crc_basic@read-crc-frame-sequence
 igt@kms_pm_backlight@basic-brightness
 igt@kms_pm_rpm@basic-pci-d3-state
 igt@kms_pm_rpm@basic-rte
-igt@kms_psr@primary_page_flip
-igt@kms_psr@cursor_plane_move
-igt@kms_psr@sprite_plane_onoff
-igt@kms_psr@primary_mmap_gtt
+igt@kms_psr@psr_primary_page_flip
+igt@kms_psr@psr_cursor_plane_move
+igt@kms_psr@psr_sprite_plane_onoff
+igt@kms_psr@psr_primary_mmap_gtt
 igt@kms_setmode@basic-clone-single-crtc
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
-- 
2.25.1
