Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EFD10E2F1
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 07:01:53 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 12:31:46 +0530
Message-Id: <20230912070149.1305060-2-swati2.sharma@intel.com>
In-Reply-To: <20230912070149.1305060-1-swati2.sharma@intel.com>
References: <20230912070149.1305060-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 1/4] tests: rename feature_discovery to
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
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
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
index 94b1e2e12..7201958b7 100644
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
