Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Erico Nunes <nunes.erico@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 15:49:28 +0200
Message-Id: <20230524134930.61911-2-nunes.erico@gmail.com>
In-Reply-To: <20230524134930.61911-1-nunes.erico@gmail.com>
References: <20230524134930.61911-1-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib: Add support for opening lima
 devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: anarsoul@gmail.com, yuq825@gmail.com, lima@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This will be to test the lima drm driver specific ioctls, so adding lima
to the list.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 lib/drmtest.c | 3 +++
 lib/drmtest.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index aa2e6b08..677f411c 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -195,6 +195,7 @@ static const struct module {
 } modules[] = {
 	{ DRIVER_AMDGPU, "amdgpu" },
 	{ DRIVER_INTEL, "i915", modprobe_i915 },
+	{ DRIVER_LIMA, "lima" },
 	{ DRIVER_MSM, "msm" },
 	{ DRIVER_PANFROST, "panfrost" },
 	{ DRIVER_V3D, "v3d" },
@@ -596,6 +597,8 @@ static const char *chipset_to_str(int chipset)
 		return "xe";
 	case DRIVER_VMWGFX:
 		return "vmwgfx";
+	case DRIVER_LIMA:
+		return "lima";
 	case DRIVER_ANY:
 		return "any";
 	default:
diff --git a/lib/drmtest.h b/lib/drmtest.h
index ae86ee19..cedac89b 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -53,6 +53,7 @@
 #define DRIVER_MSM	(1 << 6)
 #define DRIVER_XE	(1 << 7)
 #define DRIVER_VMWGFX   (1 << 8)
+#define DRIVER_LIMA	(1 << 9)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
-- 
2.40.1
