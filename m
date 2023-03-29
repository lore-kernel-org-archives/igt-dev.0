Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8BE10E4AB
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 04:59:01 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Mar 2023 21:58:54 -0700
Message-Id: <20230329045855.11263-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230329045855.11263-1-niranjana.vishwanathapura@intel.com>
References: <20230329045855.11263-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_chipset: Add
 IS_PONTEVECCHIO() macro
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

Add IS_PONTEVECCHIO() macro based on version check.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/intel_chipset.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index c2c8998dd..21ddb0169 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -203,6 +203,7 @@ void intel_check_pch(void);
 #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
+#define IS_GEN_VER(devid, x, y)	(intel_graphics_ver(devid) == IP_VER(x, y))
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
 
 #define IS_GEN2(devid)		IS_GEN(devid, 2)
@@ -217,6 +218,8 @@ void intel_check_pch(void);
 #define IS_GEN11(devid)		IS_GEN(devid, 11)
 #define IS_GEN12(devid)		IS_GEN(devid, 12)
 
+#define IS_PONTEVECCHIO(devid)	IS_GEN_VER(devid, 12, 60)
+
 #define IS_MOBILE(devid)	(intel_get_device_info(devid)->is_mobile)
 #define IS_965(devid)		AT_LEAST_GEN(devid, 4)
 
-- 
2.21.0.rc0.32.g243a4c7e27
