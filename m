Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD6C10EA5B
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 10:46:01 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 May 2022 16:13:15 +0530
Message-Id: <20220509104315.3302564-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220509072637.3291112-7-bhanuprakash.modem@intel.com>
References: <20220509072637.3291112-7-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 6/6] tests/intel-ci: Rename tests in BAT
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

As we converted the subtests to dynamic, we must rename the
same subtests in BAT.

V2:
* Remove dynamic subtests

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 28 +++++++++------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index d075aa31..8428d62e 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -97,14 +97,9 @@ igt@kms_chamelium@hdmi-crc-fast
 igt@kms_chamelium@vga-hpd-fast
 igt@kms_chamelium@vga-edid-read
 igt@kms_prop_blob@basic
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
-igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_cursor_legacy@basic-busy-flip-before-cursor
+igt@kms_cursor_legacy@basic-flip-after-cursor
+igt@kms_cursor_legacy@basic-flip-before-cursor
 igt@kms_flip@basic-flip-vs-dpms
 igt@kms_flip@basic-flip-vs-modeset
 igt@kms_flip@basic-flip-vs-wf_vblank
@@ -114,17 +109,12 @@ igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
 igt@kms_frontbuffer_tracking@basic
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d
-igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
-igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
-igt@kms_pipe_crc_basic@read-crc-pipe-a
-igt@kms_pipe_crc_basic@read-crc-pipe-b
-igt@kms_pipe_crc_basic@read-crc-pipe-c
-igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@hang-read-crc
+igt@kms_pipe_crc_basic@nonblocking-crc
+igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
+igt@kms_pipe_crc_basic@read-crc
+igt@kms_pipe_crc_basic@read-crc-frame-sequence
 igt@kms_psr@primary_page_flip
 igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
-- 
2.35.1
