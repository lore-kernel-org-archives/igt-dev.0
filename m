Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F33310E306
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 07:47:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 08:47:07 +0100
Message-Id: <20221206074708.30690-11-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221206074708.30690-1-zbigniew.kempczynski@intel.com>
References: <20221206074708.30690-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 10/11] tools/meson: Move tools out of
 libdrm scope
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

Libdrm was removed from intel tools so lets remove libdrm configuration
and migrate tools to normal tools list.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tools/meson.build | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index 24d0ea7140..d2defec870 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -18,9 +18,12 @@ tools_progs = [
 	'intel_bios_dumper',
 	'intel_display_crc',
 	'intel_display_poller',
+	'intel_dump_decode',
+	'intel_error_decode',
 	'intel_forcewaked',
 	'intel_gpu_frequency',
 	'intel_firmware_decode',
+	'intel_framebuffer_dump',
 	'intel_gpu_time',
 	'intel_gtt',
 	'intel_guc_logger',
@@ -28,6 +31,7 @@ tools_progs = [
 	'intel_lid',
 	'intel_opregion_decode',
 	'intel_panel_fitter',
+	'intel_perf_counters',
 	'intel_pm_rpm',
 	'intel_reg_checker',
 	'intel_residency',
@@ -40,16 +44,7 @@ tools_progs = [
 	'lsgpu',
 ]
 tool_deps = igt_deps
-
-if libdrm_intel.found()
-	tools_progs += [
-		'intel_dump_decode',
-		'intel_error_decode',
-		'intel_framebuffer_dump',
-		'intel_perf_counters',
-	]
-	tool_deps += zlib
-endif
+tool_deps += zlib
 
 foreach prog : tools_progs
 	executable(prog, prog + '.c',
-- 
2.34.1
