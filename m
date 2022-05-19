Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA7E11A36F
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 11:35:58 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 May 2022 17:05:39 +0530
Message-Id: <20220519113542.31219-2-anshuman.gupta@intel.com>
In-Reply-To: <20220519113542.31219-1-anshuman.gupta@intel.com>
References: <20220519113542.31219-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/4] test: i915_pm_rpm: init devid in
 setup_envirnoment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Refactor out devid initialization out of init_mode_set_data().
Initialize it in setup_environment().

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index d2bce5826e..383263a1d2 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -409,7 +409,6 @@ static void init_mode_set_data(struct mode_set_data *data)
 	}
 
 	igt_display_require(&data->display, drm_fd);
-	data->devid = intel_get_drm_devid(drm_fd);
 	init_modeset_cached_params(&ms_data);
 }
 
@@ -797,6 +796,8 @@ static bool setup_environment(bool display_disabled)
 	debugfs = igt_debugfs_dir(drm_fd);
 	igt_require(debugfs != -1);
 
+	ms_data.devid = intel_get_drm_devid(drm_fd);
+
 	if (!display_disabled)
 		init_mode_set_data(&ms_data);
 
-- 
2.26.2
