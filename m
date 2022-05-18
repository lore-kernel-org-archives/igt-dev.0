Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849AA10F28B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 14:30:01 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 18 May 2022 16:24:44 +0200
Message-Id: <20220518142444.96023-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] docs: Update report link to fd.o GitLab
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

Bugzilla is read-only for a while now, point at the GitLab issue tracker
instead. Fixes #115

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 man/intel_audio_dump.rst            | 2 +-
 man/intel_bios_dumper.rst           | 2 +-
 man/intel_error_decode.rst          | 2 +-
 man/intel_gpu_frequency.rst         | 2 +-
 man/intel_gpu_top.rst               | 2 +-
 man/intel_gtt.rst                   | 2 +-
 man/intel_infoframes.rst            | 2 +-
 man/intel_lid.rst                   | 2 +-
 man/intel_panel_fitter.rst          | 2 +-
 man/intel_reg.rst                   | 2 +-
 man/intel_stepping.rst              | 2 +-
 man/intel_upload_blit_large.rst     | 2 +-
 man/intel_upload_blit_large_gtt.rst | 2 +-
 man/intel_upload_blit_large_map.rst | 2 +-
 man/intel_upload_blit_small.rst     | 2 +-
 man/intel_vbt_decode.rst            | 2 +-
 tools/intel_gpu_abrt                | 7 +++----
 tools/intel_gpu_frequency.c         | 2 +-
 18 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/man/intel_audio_dump.rst b/man/intel_audio_dump.rst
index d4e8423b..7e4df54e 100644
--- a/man/intel_audio_dump.rst
+++ b/man/intel_audio_dump.rst
@@ -27,4 +27,4 @@ HDMI audio handling on Intel GPUs.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_bios_dumper.rst b/man/intel_bios_dumper.rst
index b21a24a8..c581becf 100644
--- a/man/intel_bios_dumper.rst
+++ b/man/intel_bios_dumper.rst
@@ -28,7 +28,7 @@ table handling.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
 
 SEE ALSO
 ========
diff --git a/man/intel_error_decode.rst b/man/intel_error_decode.rst
index b2495b90..d1855b8c 100644
--- a/man/intel_error_decode.rst
+++ b/man/intel_error_decode.rst
@@ -35,4 +35,4 @@ FILENAME
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_gpu_frequency.rst b/man/intel_gpu_frequency.rst
index 8b7c7860..10dc6ad4 100644
--- a/man/intel_gpu_frequency.rst
+++ b/man/intel_gpu_frequency.rst
@@ -76,4 +76,4 @@ intel_gpu_frequency -c max=750
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index f4dbfc5b..2f9a3123 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -96,4 +96,4 @@ LIMITATIONS
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_gtt.rst b/man/intel_gtt.rst
index 203fd717..485453a8 100644
--- a/man/intel_gtt.rst
+++ b/man/intel_gtt.rst
@@ -29,4 +29,4 @@ debugging later overwriting of the GTT with garbage data.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_infoframes.rst b/man/intel_infoframes.rst
index bd212480..ad92b45d 100644
--- a/man/intel_infoframes.rst
+++ b/man/intel_infoframes.rst
@@ -43,7 +43,7 @@ hardware is supported yet.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
 
 SEE ALSO
 ========
diff --git a/man/intel_lid.rst b/man/intel_lid.rst
index f74c5c26..af28818d 100644
--- a/man/intel_lid.rst
+++ b/man/intel_lid.rst
@@ -28,4 +28,4 @@ modesetting for lid opening and closing.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_panel_fitter.rst b/man/intel_panel_fitter.rst
index b1615c9e..c64c2c19 100644
--- a/man/intel_panel_fitter.rst
+++ b/man/intel_panel_fitter.rst
@@ -74,4 +74,4 @@ possible to implement.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_reg.rst b/man/intel_reg.rst
index 4ec24c4c..384a0c9d 100644
--- a/man/intel_reg.rst
+++ b/man/intel_reg.rst
@@ -210,4 +210,4 @@ Reading some registers may hang the GPU or the machine.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_stepping.rst b/man/intel_stepping.rst
index 8f4d5056..445786d2 100644
--- a/man/intel_stepping.rst
+++ b/man/intel_stepping.rst
@@ -34,4 +34,4 @@ devices may not be as specific as possible.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_upload_blit_large.rst b/man/intel_upload_blit_large.rst
index 794fd9b9..24b9223a 100644
--- a/man/intel_upload_blit_large.rst
+++ b/man/intel_upload_blit_large.rst
@@ -31,4 +31,4 @@ of the kernel, and not for general conclusions on graphics performance.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_upload_blit_large_gtt.rst b/man/intel_upload_blit_large_gtt.rst
index 4a1c5934..51188fc8 100644
--- a/man/intel_upload_blit_large_gtt.rst
+++ b/man/intel_upload_blit_large_gtt.rst
@@ -31,4 +31,4 @@ of the kernel, and not for general conclusions on graphics performance.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_upload_blit_large_map.rst b/man/intel_upload_blit_large_map.rst
index d818b6d5..b45e7b94 100644
--- a/man/intel_upload_blit_large_map.rst
+++ b/man/intel_upload_blit_large_map.rst
@@ -31,4 +31,4 @@ of the kernel, and not for general conclusions on graphics performance.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_upload_blit_small.rst b/man/intel_upload_blit_small.rst
index bb6239f5..83ae325d 100644
--- a/man/intel_upload_blit_small.rst
+++ b/man/intel_upload_blit_small.rst
@@ -31,4 +31,4 @@ of the kernel, and not for general conclusions on graphics performance.
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
diff --git a/man/intel_vbt_decode.rst b/man/intel_vbt_decode.rst
index 496ea3f1..b98ec4d5 100644
--- a/man/intel_vbt_decode.rst
+++ b/man/intel_vbt_decode.rst
@@ -61,7 +61,7 @@ OPTIONS
 REPORTING BUGS
 ==============
 
-Report bugs to https://bugs.freedesktop.org.
+Report bugs on fd.o GitLab: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues.
 
 SEE ALSO
 ========
diff --git a/tools/intel_gpu_abrt b/tools/intel_gpu_abrt
index bde6fb0d..037241b0 100755
--- a/tools/intel_gpu_abrt
+++ b/tools/intel_gpu_abrt
@@ -69,10 +69,9 @@ rm $tmpdir -Rf
 
 if [ -f intel_gpu_abrt.tar ] ; then
 	cat <<EOF
-intel_gpu_abrt.tar has been created.
-
-Please attach it to https://bugs.freedesktop.org
-with a good bug description as suggested in this template:
+intel_gpu_abrt.tar has been created. Attach it to a bug report on
+https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues with a
+good bug description as suggested in this template:
 
 System environment:
 -- chipset:
diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 52b11a98..3ed331ab 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -138,7 +138,7 @@ usage(const char *prog)
 	printf("   intel_gpu_frequency --set 400\tLock frequency to 400Mhz\n");
 	printf("   intel_gpu_frequency --custom max=750\tSet the max frequency to 750MHz\n");
 	printf("\n");
-	printf("Report bugs to <bugs.freedesktop.org>\n");
+	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
 	exit(EXIT_FAILURE);
 }
 
-- 
2.36.1
