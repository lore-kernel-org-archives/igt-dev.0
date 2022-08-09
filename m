Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAECD2E5F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:18:22 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:17:59 +0200
Message-Id: <20220809121801.1044402-2-ryszard.knop@intel.com>
In-Reply-To: <20220809121801.1044402-1-ryszard.knop@intel.com>
References: <20220809121801.1044402-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/uwildmat: Move to a dedicated
 vendored library directory
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

This directory is in the igt tree for convenience. It's not immediately
clear that this is a vendored library, so move it into vendor/ and make
Meson add that directory for easy includes etc.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/meson.build                      | 6 +++++-
 lib/{ => vendor}/uwildmat/uwildmat.c | 0
 lib/{ => vendor}/uwildmat/uwildmat.h | 0
 3 files changed, 5 insertions(+), 1 deletion(-)
 rename lib/{ => vendor}/uwildmat/uwildmat.c (100%)
 rename lib/{ => vendor}/uwildmat/uwildmat.h (100%)

diff --git a/lib/meson.build b/lib/meson.build
index 98c2803b..96fe46d9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -78,7 +78,6 @@ lib_sources = [
 	'igt_pm.c',
 	'igt_dummyload.c',
 	'igt_store.c',
-	'uwildmat/uwildmat.c',
 	'igt_kmod.c',
 	'igt_panfrost.c',
 	'igt_v3d.c',
@@ -90,6 +89,9 @@ lib_sources = [
 	'igt_infoframe.c',
 	'veboxcopy_gen12.c',
 	'igt_msm.c',
+
+	# Vendored libraries:
+	'vendor/uwildmat/uwildmat.c',
 ]
 
 lib_deps = [
@@ -109,6 +111,8 @@ lib_deps = [
 	zlib
 ]
 
+inc = [ inc, include_directories('vendor') ]
+
 if libdrm_intel.found()
 	lib_deps += libdrm_intel
 else
diff --git a/lib/uwildmat/uwildmat.c b/lib/vendor/uwildmat/uwildmat.c
similarity index 100%
rename from lib/uwildmat/uwildmat.c
rename to lib/vendor/uwildmat/uwildmat.c
diff --git a/lib/uwildmat/uwildmat.h b/lib/vendor/uwildmat/uwildmat.h
similarity index 100%
rename from lib/uwildmat/uwildmat.h
rename to lib/vendor/uwildmat/uwildmat.h
-- 
2.37.1
