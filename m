Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9433010F165
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 09:17:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 31 Mar 2023 11:16:58 +0200
Message-Id: <20230331091700.69801-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230331091700.69801-1-zbigniew.kempczynski@intel.com>
References: <20230331091700.69801-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/xe_query: Add
 xe_for_each_mem_region iterator
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

Add iterator useful for tests which wants to exercise all memory regions.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 3a00ecd1c2..fddd05cf73 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -69,6 +69,10 @@ struct xe_device {
 #define xe_for_each_gt(__fd, __gt) \
 	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
 
+#define xe_for_each_mem_region(__fd, __memreg, __r) \
+	for (uint64_t __i = 0; __i < igt_fls(__memreg); __i++) \
+		for_if(__r = (__memreg & (1ull << __i)))
+
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == XE_MEM_REGION_CLASS_VRAM)
 
-- 
2.34.1
