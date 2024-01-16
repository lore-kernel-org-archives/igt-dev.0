Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ED510E549
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 14:57:06 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] lib/xe/xe_query: Fix compilation -Wshadow warning
Date: Tue, 16 Jan 2024 15:43:33 +0100
Message-ID: <20240116144336.18068-2-nirmoy.das@intel.com>
In-Reply-To: <20240116144336.18068-1-nirmoy.das@intel.com>
References: <20240116144336.18068-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fix -Wshadow warning when xe_for_each_engine() and
xe_for_each_mem_region are used together.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/xe/xe_query.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 1e3a7bdb9..032db1308 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -67,8 +67,8 @@ struct xe_device {
 	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
 
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
-	for (uint64_t __i = 0; __i < igt_fls(__memreg); __i++) \
-		for_if(__r = (__memreg & (1ull << __i)))
+	for (uint64_t __j = 0; __j < igt_fls(__memreg); __j++) \
+		for_if(__r = (__memreg & (1ull << __j)))
 
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
-- 
2.42.0
