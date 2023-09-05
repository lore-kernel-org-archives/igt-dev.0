Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBB110E2E9
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 16:50:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 22:12:30 +0530
Message-Id: <20230905164230.1679263-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230905164230.1679263-1-bhanuprakash.modem@intel.com>
References: <20230905164230.1679263-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 5/5] HAX: Add hang tests to xe BAT
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
 tests/intel-ci/xe-fast-feedback.testlist | 105 ++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index a395fa8c3..7c1c26fda 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -221,14 +221,17 @@ igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
 igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic
+igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy
 igt@kms_flip@basic-flip-vs-dpms
 igt@kms_flip@basic-flip-vs-modeset
 igt@kms_flip@basic-flip-vs-wf_vblank
 igt@kms_flip@basic-plain-flip
+igt@kms_flip@flip-vs-modeset-vs-hang
+igt@kms_flip@flip-vs-panning-vs-hang
 igt@kms_force_connector_basic@force-connector-state
 igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@prune-stale-modes
-igt@kms_frontbuffer_tracking@basic
 igt@kms_hdmi_inject@inject-audio
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
 igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
@@ -242,6 +245,106 @@ igt@kms_prop_blob@basic
 igt@kms_psr@primary_page_flip
 igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
+igt@kms_vblank@pipe-A-accuracy-idle
+igt@kms_vblank@pipe-A-query-busy
+igt@kms_vblank@pipe-A-query-busy-hang
+igt@kms_vblank@pipe-A-query-forked
+igt@kms_vblank@pipe-A-query-forked-busy
+igt@kms_vblank@pipe-A-query-forked-busy-hang
+igt@kms_vblank@pipe-A-query-forked-hang
+igt@kms_vblank@pipe-A-query-idle
+igt@kms_vblank@pipe-A-query-idle-hang
+igt@kms_vblank@pipe-A-ts-continuation-dpms-rpm
+igt@kms_vblank@pipe-A-ts-continuation-dpms-suspend
+igt@kms_vblank@pipe-A-ts-continuation-idle
+igt@kms_vblank@pipe-A-ts-continuation-idle-hang
+igt@kms_vblank@pipe-A-ts-continuation-modeset
+igt@kms_vblank@pipe-A-ts-continuation-modeset-hang
+igt@kms_vblank@pipe-A-ts-continuation-modeset-rpm
+igt@kms_vblank@pipe-A-ts-continuation-suspend
+igt@kms_vblank@pipe-A-wait-busy
+igt@kms_vblank@pipe-A-wait-busy-hang
+igt@kms_vblank@pipe-A-wait-forked
+igt@kms_vblank@pipe-A-wait-forked-busy
+igt@kms_vblank@pipe-A-wait-forked-busy-hang
+igt@kms_vblank@pipe-A-wait-forked-hang
+igt@kms_vblank@pipe-A-wait-idle
+igt@kms_vblank@pipe-A-wait-idle-hang
+igt@kms_vblank@pipe-B-accuracy-idle
+igt@kms_vblank@pipe-B-query-busy
+igt@kms_vblank@pipe-B-query-busy-hang
+igt@kms_vblank@pipe-B-query-forked
+igt@kms_vblank@pipe-B-query-forked-busy
+igt@kms_vblank@pipe-B-query-forked-busy-hang
+igt@kms_vblank@pipe-B-query-forked-hang
+igt@kms_vblank@pipe-B-query-idle
+igt@kms_vblank@pipe-B-query-idle-hang
+igt@kms_vblank@pipe-B-ts-continuation-dpms-rpm
+igt@kms_vblank@pipe-B-ts-continuation-dpms-suspend
+igt@kms_vblank@pipe-B-ts-continuation-idle
+igt@kms_vblank@pipe-B-ts-continuation-idle-hang
+igt@kms_vblank@pipe-B-ts-continuation-modeset
+igt@kms_vblank@pipe-B-ts-continuation-modeset-hang
+igt@kms_vblank@pipe-B-ts-continuation-modeset-rpm
+igt@kms_vblank@pipe-B-ts-continuation-suspend
+igt@kms_vblank@pipe-B-wait-busy
+igt@kms_vblank@pipe-B-wait-busy-hang
+igt@kms_vblank@pipe-B-wait-forked
+igt@kms_vblank@pipe-B-wait-forked-busy
+igt@kms_vblank@pipe-B-wait-forked-busy-hang
+igt@kms_vblank@pipe-B-wait-forked-hang
+igt@kms_vblank@pipe-B-wait-idle
+igt@kms_vblank@pipe-B-wait-idle-hang
+igt@kms_vblank@pipe-C-accuracy-idle
+igt@kms_vblank@pipe-C-query-busy
+igt@kms_vblank@pipe-C-query-busy-hang
+igt@kms_vblank@pipe-C-query-forked
+igt@kms_vblank@pipe-C-query-forked-busy
+igt@kms_vblank@pipe-C-query-forked-busy-hang
+igt@kms_vblank@pipe-C-query-forked-hang
+igt@kms_vblank@pipe-C-query-idle
+igt@kms_vblank@pipe-C-query-idle-hang
+igt@kms_vblank@pipe-C-ts-continuation-dpms-rpm
+igt@kms_vblank@pipe-C-ts-continuation-dpms-suspend
+igt@kms_vblank@pipe-C-ts-continuation-idle
+igt@kms_vblank@pipe-C-ts-continuation-idle-hang
+igt@kms_vblank@pipe-C-ts-continuation-modeset
+igt@kms_vblank@pipe-C-ts-continuation-modeset-hang
+igt@kms_vblank@pipe-C-ts-continuation-modeset-rpm
+igt@kms_vblank@pipe-C-ts-continuation-suspend
+igt@kms_vblank@pipe-C-wait-busy
+igt@kms_vblank@pipe-C-wait-busy-hang
+igt@kms_vblank@pipe-C-wait-forked
+igt@kms_vblank@pipe-C-wait-forked-busy
+igt@kms_vblank@pipe-C-wait-forked-busy-hang
+igt@kms_vblank@pipe-C-wait-forked-hang
+igt@kms_vblank@pipe-C-wait-idle
+igt@kms_vblank@pipe-C-wait-idle-hang
+igt@kms_vblank@pipe-D-accuracy-idle
+igt@kms_vblank@pipe-D-query-busy
+igt@kms_vblank@pipe-D-query-busy-hang
+igt@kms_vblank@pipe-D-query-forked
+igt@kms_vblank@pipe-D-query-forked-busy
+igt@kms_vblank@pipe-D-query-forked-busy-hang
+igt@kms_vblank@pipe-D-query-forked-hang
+igt@kms_vblank@pipe-D-query-idle
+igt@kms_vblank@pipe-D-query-idle-hang
+igt@kms_vblank@pipe-D-ts-continuation-dpms-rpm
+igt@kms_vblank@pipe-D-ts-continuation-dpms-suspend
+igt@kms_vblank@pipe-D-ts-continuation-idle
+igt@kms_vblank@pipe-D-ts-continuation-idle-hang
+igt@kms_vblank@pipe-D-ts-continuation-modeset
+igt@kms_vblank@pipe-D-ts-continuation-modeset-hang
+igt@kms_vblank@pipe-D-ts-continuation-modeset-rpm
+igt@kms_vblank@pipe-D-ts-continuation-suspend
+igt@kms_vblank@pipe-D-wait-busy
+igt@kms_vblank@pipe-D-wait-busy-hang
+igt@kms_vblank@pipe-D-wait-forked
+igt@kms_vblank@pipe-D-wait-forked-busy
+igt@kms_vblank@pipe-D-wait-forked-busy-hang
+igt@kms_vblank@pipe-D-wait-forked-hang
+igt@kms_vblank@pipe-D-wait-idle
+igt@kms_vblank@pipe-D-wait-idle-hang
 
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
-- 
2.40.0
