Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9AF10E5DA
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 17:03:32 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 22:32:44 +0530
Message-Id: <20220421170245.11898-3-anshuman.gupta@intel.com>
In-Reply-To: <20220421170245.11898-1-anshuman.gupta@intel.com>
References: <20220421170245.11898-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] test: i915_pm_rpm: conditional
 initialization of igt_display_t
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

Initialize igt_display_t display only in case of there are
valid drm kms resources.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 2cc89eef2..7a0176b2f 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -406,9 +406,9 @@ static void init_mode_set_data(struct mode_set_data *data)
 		}
 
 		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data->display, drm_fd);
 	}
 
-	igt_display_require(&data->display, drm_fd);
 	init_modeset_cached_params(&ms_data);
 }
 
-- 
2.26.2
