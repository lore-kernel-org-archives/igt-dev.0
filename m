Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F006E88B
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2020 09:03:03 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 20 Jan 2020 14:21:58 +0530
Message-Id: <20200120085158.9151-3-anshuman.gupta@intel.com>
In-Reply-To: <20200120085158.9151-1-anshuman.gupta@intel.com>
References: <20200120085158.9151-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] DEBUG/DO_NOT_MERGE: Add HDCP
 atomic-dpms test to CI fast-feedback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add atomic-dpms test to CI fast-feedback list for better
HDCP covergae in CI.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 37a92b4e..c24cb7c4 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -137,6 +137,7 @@ igt@kms_psr@cursor_plane_move
 igt@kms_psr@sprite_plane_onoff
 igt@kms_psr@primary_mmap_gtt
 igt@kms_setmode@basic-clone-single-crtc
+igt@kms_content_protection@atomic-dpms
 igt@i915_pm_backlight@basic-brightness
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
