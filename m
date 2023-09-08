Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5725F10E880
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 07:01:01 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:30:50 +0530
Message-Id: <20230908070053.1283474-2-swati2.sharma@intel.com>
In-Reply-To: <20230908070053.1283474-1-swati2.sharma@intel.com>
References: <20230908070053.1283474-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests: rename feature_discovery to
 kms_feature_discovery
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

Since feature discovery test is only having kms tests,
rename to kms_feature_discovery.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/{feature_discovery.c => kms_feature_discovery.c} | 0
 tests/meson.build                                      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/{feature_discovery.c => kms_feature_discovery.c} (100%)

diff --git a/tests/feature_discovery.c b/tests/kms_feature_discovery.c
similarity index 100%
rename from tests/feature_discovery.c
rename to tests/kms_feature_discovery.c
diff --git a/tests/meson.build b/tests/meson.build
index aa8e3434c..eb643d4dd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -14,7 +14,6 @@ test_progs = [
 	'drm_mm',
 	'drm_read',
 	'fbdev',
-	'feature_discovery',
 	'kms_3d',
 	'kms_addfb_basic',
 	'kms_async_flips',
@@ -31,6 +30,7 @@ test_progs = [
 	'kms_dither',
 	'kms_display_modes',
 	'kms_dp_aux_dev',
+	'kms_feature_discovery',
 	'kms_flip',
 	'kms_flip_event_leak',
 	'kms_force_connector_basic',
-- 
2.25.1
