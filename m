Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E698710E4B0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 16:55:19 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 May 2022 22:24:53 +0530
Message-Id: <20220518165454.17352-4-anshuman.gupta@intel.com>
In-Reply-To: <20220518165454.17352-1-anshuman.gupta@intel.com>
References: <20220518165454.17352-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/4] test: i915_pm_rpm: conditional
 initialization of igt_display_t
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

Initialize igt_display_t display only in case of there are
valid drm kms resources.

v2:
- Move igt_display_fini under the 'if (data->res)' cond. [Ashutosh]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rpm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index b836656c29..a6035e60b8 100644
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
 
@@ -420,9 +420,8 @@ static void fini_mode_set_data(struct mode_set_data *data)
 			drmModeFreePropertyBlob(data->edids[i]);
 		}
 		drmModeFreeResources(data->res);
+		igt_display_fini(&data->display);
 	}
-
-	igt_display_fini(&data->display);
 }
 
 static void get_drm_info(struct compare_data *data)
-- 
2.26.2
