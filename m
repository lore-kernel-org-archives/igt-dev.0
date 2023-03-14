Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9F910EA9C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 16:10:33 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Date: Tue, 14 Mar 2023 21:34:59 +0530
Message-Id: <20230314160503.2237121-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230314160503.2237121-1-bhanuprakash.modem@intel.com>
References: <20230314160503.2237121-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 1/5] lib/drmtest: Add helpers to check and
 require the XE driver
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

In order to add support for features specific to the XE driver, add
helpers for checking and requiring the driver.

This patch will also update igt_require_intel() to support XE, and
create new helper igt_require_i915() as both i915 & XE belongs to
intel.

V2: - Re-use existing helpers for igt_require_intel (Mauro)

Credits-to: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/drmtest.c | 20 ++++++++++++++++++++
 lib/drmtest.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 0ceab1038..3f669740b 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -139,6 +139,16 @@ bool is_vc4_device(int fd)
 	return __is_device(fd, "vc4");
 }
 
+bool is_xe_device(int fd)
+{
+	return __is_device(fd, "xe");
+}
+
+bool is_intel_device(int fd)
+{
+	return is_i915_device(fd) || is_xe_device(fd);
+}
+
 static char _forced_driver[16] = "";
 
 /**
@@ -645,6 +655,11 @@ void igt_require_amdgpu(int fd)
 }
 
 void igt_require_intel(int fd)
+{
+	igt_require(is_intel_device(fd));
+}
+
+void igt_require_i915(int fd)
 {
 	igt_require(is_i915_device(fd));
 }
@@ -658,3 +673,8 @@ void igt_require_vc4(int fd)
 {
 	igt_require(is_vc4_device(fd));
 }
+
+void igt_require_xe(int fd)
+{
+	igt_require(is_xe_device(fd));
+}
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 448ac03b4..392470ac0 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -99,8 +99,10 @@ int __drm_open_driver_render(int chipset);
 
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
+void igt_require_i915(int fd);
 void igt_require_nouveau(int fd);
 void igt_require_vc4(int fd);
+void igt_require_xe(int fd);
 
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
@@ -108,6 +110,8 @@ bool is_mtk_device(int fd);
 bool is_msm_device(int fd);
 bool is_nouveau_device(int fd);
 bool is_vc4_device(int fd);
+bool is_xe_device(int fd);
+bool is_intel_device(int fd);
 
 /**
  * do_or_die:
-- 
2.39.1
