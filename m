Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E6D10E663
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 14:44:54 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Sep 2022 20:14:08 +0530
Message-Id: <20220919144408.251981-9-riana.tauro@intel.com>
In-Reply-To: <20220919144408.251981-1-riana.tauro@intel.com>
References: <20220919144408.251981-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 8/8] HAX: run i915_pm_rc6_residency tests
 in BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add i915_pm_rc6_residency tests to test hwmon
interface

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index bd5538a0..57c6e618 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -124,6 +124,8 @@ igt@kms_psr@sprite_plane_onoff
 igt@kms_psr@primary_mmap_gtt
 igt@kms_setmode@basic-clone-single-crtc
 igt@i915_pm_backlight@basic-brightness
+igt@i915_pm_rc6_residency@rc6-fence
+igt@i915_pm_rc6_residency@rc6-idle
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
 igt@i915_pm_rps@basic-api
-- 
2.25.1
