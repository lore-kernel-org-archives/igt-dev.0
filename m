Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98F710E300
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 08:35:46 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 14:05:36 +0530
Message-Id: <20230816083536.1093139-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3] tests/intel-ci: chamelium specific fast-feedback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In BAT, chamelium setups are not frequently deployed. To enhance
overall execution efficiency, it's recommended to remove chamelium
tests from fast-feedback/xe-fast-feedback and create a dedicated
fast-feedback-chamelium-only/xe-fast-feedback-chamelium-only
testlists for executing chamelium tests.

v2: -update xe fast-feedback testlist (Kunal)
v3: -update commit message (Kamil)
    -sort test names (Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .../fast-feedback-chamelium-only.testlist         | 15 +++++++++++++++
 tests/intel-ci/fast-feedback.testlist             |  9 ---------
 .../xe-fast-feedback-chamelium-only.testlist      | 15 +++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist          |  9 ---------
 4 files changed, 30 insertions(+), 18 deletions(-)
 create mode 100644 tests/intel-ci/fast-feedback-chamelium-only.testlist
 create mode 100644 tests/intel-ci/xe-fast-feedback-chamelium-only.testlist

diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/fast-feedback-chamelium-only.testlist
new file mode 100644
index 000000000..e6df42ff5
--- /dev/null
+++ b/tests/intel-ci/fast-feedback-chamelium-only.testlist
@@ -0,0 +1,15 @@
+# Should be the first test
+igt@i915_module_load@load
+
+# Keep alphabetically sorted by default
+igt@kms_chamelium_edid@dp-edid-read
+igt@kms_chamelium_edid@hdmi-edid-read
+igt@kms_chamelium_edid@vga-edid-read
+igt@kms_chamelium_frames@dp-crc-fast
+igt@kms_chamelium_frames@hdmi-crc-fast
+igt@kms_chamelium_hpd@dp-hpd-fast
+igt@kms_chamelium_hpd@hdmi-hpd-fast
+igt@kms_chamelium_hpd@vga-hpd-fast
+
+# System wide suspend tests in the end
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
diff --git a/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
new file mode 100644
index 000000000..0d10637f8
--- /dev/null
+++ b/tests/intel-ci/xe-fast-feedback-chamelium-only.testlist
@@ -0,0 +1,15 @@
+# Should be the first test
+igt@xe_module_load@load
+
+# Keep alphabetically sorted by default
+igt@kms_chamelium_edid@dp-edid-read
+igt@kms_chamelium_edid@hdmi-edid-read
+igt@kms_chamelium_edid@vga-edid-read
+igt@kms_chamelium_frames@dp-crc-fast
+igt@kms_chamelium_frames@hdmi-crc-fast
+igt@kms_chamelium_hpd@dp-hpd-fast
+igt@kms_chamelium_hpd@hdmi-hpd-fast
+igt@kms_chamelium_hpd@vga-hpd-fast
+
+# System wide suspend tests in the end
+igt@kms_chamelium_hpd@common-hpd-after-suspend
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5dcca4aec..311f90c79 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -207,15 +207,6 @@ igt@kms_addfb_basic@unused-handle
 igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
-igt@kms_chamelium_edid@dp-edid-read
-igt@kms_chamelium_edid@hdmi-edid-read
-igt@kms_chamelium_edid@vga-edid-read
-igt@kms_chamelium_frames@dp-crc-fast
-igt@kms_chamelium_frames@hdmi-crc-fast
-igt@kms_chamelium_hpd@common-hpd-after-suspend
-igt@kms_chamelium_hpd@dp-hpd-fast
-igt@kms_chamelium_hpd@hdmi-hpd-fast
-igt@kms_chamelium_hpd@vga-hpd-fast
 igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
 igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
 igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
-- 
2.25.1
