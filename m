Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BA910EC6D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 07:18:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 12:43:16 +0530
Message-Id: <20230428071350.2561575-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
References: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 13/47] lib/gpgpu_fill: Use RENDER engine flag
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Using I915_EXEC_DEFAULT works fine for i915 selecting appropriate
command streamer. Unfortunately this cannot be used on Xe as it
requires explicit engine selection. Submitting gpgpu work on
render is fine so change to I915_EXEC_RENDER doesn't break i915
and allows run on valid engine on Xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/gpgpu_fill.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index 4f7bab68f..4db877514 100644
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
2.40.0
