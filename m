Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A810E3C3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 17:03:30 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 22:32:43 +0530
Message-Id: <20220421170245.11898-2-anshuman.gupta@intel.com>
In-Reply-To: <20220421170245.11898-1-anshuman.gupta@intel.com>
References: <20220421170245.11898-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] test: i915_pm_rpm: init devid in
 setup_envirnoment
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

Refactor out devid initialization out of init_mode_set_data().
Initialize it in setup_environment().

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 461730e8a..2cc89eef2 100644
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
