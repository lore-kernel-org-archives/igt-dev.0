Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB4B10E10B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 15:49:15 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 08:49:11 -0700
Message-Id: <20231004154922.3478014-3-lucas.demarchi@intel.com>
In-Reply-To: <20231004154922.3478014-1-lucas.demarchi@intel.com>
References: <20231004154922.3478014-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 02/13] lib/gpu_cmds: Remove prefix from
 gen7_fill_binding_table()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This function is used by pretty much all versions. It's odd to have a
gen7 function end up calling next-gen functions and it's error prone:
when adding something to e.g. a gen8 function to realize that behavior
breaks previous platforms.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/gpu_cmds.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index bb35204fb..648451f74 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -259,8 +259,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
 }
 
 static uint32_t
-gen7_fill_binding_table(struct intel_bb *ibb,
-			struct intel_buf *buf)
+fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 {
 	uint32_t binding_table_offset;
 	uint32_t *binding_table;
@@ -321,7 +320,7 @@ gen7_fill_interface_descriptor(struct intel_bb *ibb,
 	uint32_t offset;
 	uint32_t binding_table_offset, kernel_offset;
 
-	binding_table_offset = gen7_fill_binding_table(ibb, buf);
+	binding_table_offset = fill_binding_table(ibb, buf);
 	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
 
 	intel_bb_ptr_align(ibb, 64);
@@ -357,7 +356,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
 	uint32_t offset;
 	uint32_t binding_table_offset, kernel_offset;
 
-	binding_table_offset = gen7_fill_binding_table(ibb, buf);
+	binding_table_offset = fill_binding_table(ibb, buf);
 	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
 
 	intel_bb_ptr_align(ibb, 64);
@@ -803,7 +802,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
 {
 	uint32_t binding_table_offset, kernel_offset;
 
-	binding_table_offset = gen7_fill_binding_table(ibb, dst);
+	binding_table_offset = fill_binding_table(ibb, dst);
 	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
 
 	memset(idd, 0, sizeof(*idd));
-- 
2.40.1
