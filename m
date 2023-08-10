Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6B310E50A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 11:23:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 16:52:59 +0530
Message-Id: <20230810112259.1072622-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel-ci: chamelium specific
 fast-feedback
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

In BAT, we hardly have chamelium setups. So, to optimize
execution remove chamelium tests from fast-feedback and create
a separate fast-feedback testlist specific to
chamelium tests only.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 .../intel-ci/fast-feedback-chamelium-only.testlist  | 13 +++++++++++++
 tests/intel-ci/fast-feedback.testlist               |  9 ---------
 2 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 tests/intel-ci/fast-feedback-chamelium-only.testlist

diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/fast-feedback-chamelium-only.testlist
new file mode 100644
index 000000000..9416a12cc
--- /dev/null
+++ b/tests/intel-ci/fast-feedback-chamelium-only.testlist
@@ -0,0 +1,13 @@
+# Try to load the driver if it's not available yet.
+igt@i915_module_load@load
+
+# Keep alphabetically sorted by default
+igt@kms_chamelium_hpd@dp-hpd-fast
+igt@kms_chamelium_edid@dp-edid-read
+igt@kms_chamelium_frames@dp-crc-fast
+igt@kms_chamelium_hpd@hdmi-hpd-fast
+igt@kms_chamelium_edid@hdmi-edid-read
+igt@kms_chamelium_frames@hdmi-crc-fast
+igt@kms_chamelium_hpd@vga-hpd-fast
+igt@kms_chamelium_edid@vga-edid-read
+igt@kms_chamelium_hpd@common-hpd-after-suspend
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 31639c892..c09c6c417 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -92,14 +92,6 @@ igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
 igt@kms_busy@basic
-igt@kms_chamelium_hpd@dp-hpd-fast
-igt@kms_chamelium_edid@dp-edid-read
-igt@kms_chamelium_frames@dp-crc-fast
-igt@kms_chamelium_hpd@hdmi-hpd-fast
-igt@kms_chamelium_edid@hdmi-edid-read
-igt@kms_chamelium_frames@hdmi-crc-fast
-igt@kms_chamelium_hpd@vga-hpd-fast
-igt@kms_chamelium_edid@vga-edid-read
 igt@kms_prop_blob@basic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
@@ -179,5 +171,4 @@ igt@i915_suspend@basic-s2idle-without-i915
 igt@i915_suspend@basic-s3-without-i915
 igt@gem_exec_suspend@basic-s0
 igt@gem_exec_suspend@basic-s3
-igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_pipe_crc_basic@suspend-read-crc
-- 
2.25.1
