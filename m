Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B4914B4CD
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 10:18:55 +0000 (UTC)
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 5 Aug 2022 12:18:43 +0200
Message-ID: <20220805101843.1153103-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/drmtest: add support for STM drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Yannick
 Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Since CRC feature is now supported on STM display drivers, IGT would be
an interesting solution for testing.

This patch adds basic support for IGT to run with STM drivers.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 lib/drmtest.c | 13 +++++++++++++
 lib/drmtest.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4f9d8a11..1051b4fe 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -134,6 +134,11 @@ bool is_nouveau_device(int fd)
 #endif
 }
 
+bool is_stm_device(int fd)
+{
+	return __is_device(fd, "stm");
+}
+
 bool is_vc4_device(int fd)
 {
 	return __is_device(fd, "vc4");
@@ -186,6 +191,7 @@ static const struct module {
 	{ DRIVER_INTEL, "i915", modprobe_i915 },
 	{ DRIVER_MSM, "msm" },
 	{ DRIVER_PANFROST, "panfrost" },
+	{ DRIVER_STM, "stm32-display" },
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
 	{ DRIVER_VGEM, "vgem" },
@@ -548,6 +554,8 @@ static const char *chipset_to_str(int chipset)
 		return "panfrost";
 	case DRIVER_MSM:
 		return "msm";
+	case DRIVER_STM:
+		return "stm";
 	case DRIVER_ANY:
 		return "any";
 	default:
@@ -652,6 +660,11 @@ void igt_require_nouveau(int fd)
 	igt_require(is_nouveau_device(fd));
 }
 
+void igt_require_stm(int fd)
+{
+	igt_require(is_stm_device(fd));
+}
+
 void igt_require_vc4(int fd)
 {
 	igt_require(is_vc4_device(fd));
diff --git a/lib/drmtest.h b/lib/drmtest.h
index b5debd44..6a7ab082 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -51,6 +51,7 @@
 #define DRIVER_V3D	(1 << 4)
 #define DRIVER_PANFROST	(1 << 5)
 #define DRIVER_MSM	(1 << 6)
+#define DRIVER_STM	(1 << 7)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
@@ -99,6 +100,7 @@ int __drm_open_driver_render(int chipset);
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
 void igt_require_nouveau(int fd);
+void igt_require_stm(int fd);
 void igt_require_vc4(int fd);
 
 bool is_amdgpu_device(int fd);
@@ -106,6 +108,7 @@ bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
 bool is_msm_device(int fd);
 bool is_nouveau_device(int fd);
+bool is_stm_device(int fd);
 bool is_vc4_device(int fd);
 
 /**
-- 
2.25.1
