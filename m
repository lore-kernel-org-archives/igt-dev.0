Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7610E056
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 06:39:41 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Apr 2023 08:39:07 +0200
Message-Id: <20230420063908.66568-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230420063908.66568-1-zbigniew.kempczynski@intel.com>
References: <20230420063908.66568-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 09/10] lib/gpgpu_fill: Use RENDER engine
 flag to work on Xe
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

Using I915_EXEC_DEFAULT works fine for i915 selecting appropriate
command streamer. Unfortunately this cannot be used on Xe as it
requires explicit engine selection. Submitting gpgpu work on
render is fine so change to I915_EXEC_RENDER doesn't break i915
and allows run on valid engine on Xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpgpu_fill.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index 4f7bab68f2..4db8775145 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -288,7 +288,7 @@ __gen9_gpgpu_fillfunc(int i915,
 	intel_bb_ptr_align(ibb, 32);
 
 	intel_bb_exec(ibb, intel_bb_offset(ibb),
-		      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC, true);
+		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, true);
 
 	intel_bb_destroy(ibb);
 }
@@ -329,7 +329,7 @@ __xehp_gpgpu_fillfunc(int i915,
 	intel_bb_ptr_align(ibb, 32);
 
 	intel_bb_exec(ibb, intel_bb_offset(ibb),
-		      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC, true);
+		      I915_EXEC_RENDER | I915_EXEC_NO_RELOC, true);
 
 	intel_bb_destroy(ibb);
 }
-- 
2.34.1
