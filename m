Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DCC10E24E
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 05:45:09 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Oct 2023 11:22:52 +0530
Message-Id: <20231017055252.781140-3-kunal1.joshi@intel.com>
In-Reply-To: <20231017055252.781140-1-kunal1.joshi@intel.com>
References: <20231017055252.781140-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] lib/meson.build: Add igt_dpcd for compilation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added igt_dpcd in meson.build for compilation

Cc: Swati Sharma <swati2.sharma@intel.com> 
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index a7bccafc3..5e62d3eda 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -24,6 +24,7 @@ lib_sources = [
 	'igt_device_scan.c',
 	'igt_drm_clients.h',
 	'igt_drm_fdinfo.c',
+	'igt_dpcd.c',
 	'igt_aux.c',
 	'igt_gt.c',
 	'igt_halffloat.c',
@@ -254,6 +255,10 @@ lib_igt_perf_build = static_library('igt_perf',
 lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
 				  include_directories : inc)
 
+lib_igt_dpcd = static_library('igt_dpcd',
+	['igt_dpcd.c'],
+	include_directories : inc)
+
 scan_dep = [
 	glib,
 	libudev,
-- 
2.25.1
