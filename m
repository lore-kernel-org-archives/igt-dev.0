Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2C610E344
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 08:16:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Sep 2022 13:45:47 +0530
Message-Id: <20220929081547.2424642-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220929081547.2424642-1-bhanuprakash.modem@intel.com>
References: <20220929081547.2424642-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 3/3] HAX: Add VRR negative tests to BAT
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
 tests/intel-ci/fast-feedback.testlist | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index bd5538a0..f31e9a24 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -123,6 +123,10 @@ igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
 igt@kms_psr@primary_mmap_gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_vrr@flip-basic
+igt@kms_vrr@flipline
+igt@kms_vrr@negative-basic
+igt@kms_vrr@parse-vrr-range
 igt@i915_pm_backlight@basic-brightness
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
-- 
2.37.3
