Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA6D10E5BA
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 07:49:20 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 09:49:01 +0200
Message-Id: <20230803074902.172493-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230803074902.172493-1-zbigniew.kempczynski@intel.com>
References: <20230803074902.172493-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/media_fill: Use RENDER engine flag
 to work on Xe
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

Due to explicit requirement of running on valid hw engine on xe
change I915_EXEC_DEFAULT to I915_EXEC_RENDER. This change doesn't
break i915 media pipeline allowing to create and assign valid xe
engine to execute media fill test.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/media_fill.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/media_fill.c b/lib/media_fill.c
index e80dae1505..2520995d97 100644
--- a/lib/media_fill.c
+++ b/lib/media_fill.c
@@ -281,7 +281,7 @@ __gen9_media_fillfunc(int i915,
 	intel_bb_ptr_align(ibb, 32);
 
 	intel_bb_exec(ibb, intel_bb_offset(ibb),
-		      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC, true);
+		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, true);
 
 	intel_bb_destroy(ibb);
 }
-- 
2.34.1
