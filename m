Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CED10E16D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 11:27:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Apr 2023 16:52:43 +0530
Message-Id: <20230419112243.1719789-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20230419112243.1719789-1-bhanuprakash.modem@intel.com>
References: <20230419112243.1719789-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 6/6] xe-fast-feedback: Add kms tests to XE BAT
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

Add kms tests to XE BAT.
- kms_chamelium_*
- kms_cursor_legacy
- kms_flip
- kms_pipe_crc_basic
- kms_psr

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5db27c634..c9ab687cf 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -165,8 +165,39 @@ igt@kms_addfb_basic@unused-handle
 igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
+igt@kms_chamelium_edid@dp-edid-read
+igt@kms_chamelium_edid@hdmi-edid-read
+igt@kms_chamelium_edid@vga-edid-read
+igt@kms_chamelium_frames@dp-crc-fast
+igt@kms_chamelium_frames@hdmi-crc-fast
+igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-fast
+igt@kms_chamelium_hpd@hdmi-hpd-fast
+igt@kms_chamelium_hpd@vga-hpd-fast
+igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
+igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
+igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
+igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
+igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
+igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
+igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
+igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_flip@basic-flip-vs-dpms
+igt@kms_flip@basic-flip-vs-modeset
+igt@kms_flip@basic-flip-vs-wf_vblank
+igt@kms_flip@basic-plain-flip
 igt@kms_force_connector_basic@force-connector-state
 igt@kms_force_connector_basic@force-edid
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_force_connector_basic@prune-stale-modes
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck
+igt@kms_pipe_crc_basic@hang-read-crc
+igt@kms_pipe_crc_basic@nonblocking-crc
+igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
+igt@kms_pipe_crc_basic@read-crc
+igt@kms_pipe_crc_basic@read-crc-frame-sequence
+igt@kms_pipe_crc_basic@suspend-read-crc
 igt@kms_prop_blob@basic
+igt@kms_psr@primary_page_flip
+igt@kms_psr@cursor_plane_move
+igt@kms_psr@sprite_plane_onoff
-- 
2.40.0
