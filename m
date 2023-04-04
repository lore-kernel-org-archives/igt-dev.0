Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA8A10E5D3
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 06:36:11 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 12:06:15 +0530
Message-Id: <20230404063615.3453716-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/i915_power: skip power sanity test on
 simulation
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

skip power sanity test on simulation

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_power.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
index 333ea002..51b412e3 100644
--- a/tests/i915/i915_power.c
+++ b/tests/i915/i915_power.c
@@ -66,6 +66,7 @@ igt_main
 	int i915;
 
 	igt_fixture {
+		igt_skip_on_simulation();
 		i915 = drm_open_driver_master(DRIVER_INTEL);
 	}
 
-- 
2.40.0
