Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A7A10E050
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 12:24:11 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon,  4 Dec 2023 17:58:22 +0530
Message-Id: <20231204122825.3689117-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20231204122825.3689117-1-janga.rahul.kumar@intel.com>
References: <20231204122825.3689117-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/4] lib/intel_compute: Rename compute
 state addresses
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Rename platform specific state base and binding offset address variable
names to generic ones as they can be resued for most of the platforms.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/intel_compute.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index dd921bf46..c8dc42338 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -37,9 +37,9 @@
 #define OFFSET_INDIRECT_DATA_START	0xFFFD0000
 #define OFFSET_KERNEL			0xFFFE0000
 
-#define XEHP_ADDR_GENERAL_STATE_BASE		0x80000000UL
-#define XEHP_ADDR_INSTRUCTION_STATE_BASE	0x90000000UL
-#define XEHP_OFFSET_BINDING_TABLE		0x1000
+#define ADDR_GENERAL_STATE_BASE		0x80000000UL
+#define ADDR_INSTRUCTION_STATE_BASE	0x90000000UL
+#define OFFSET_BINDING_TABLE		0x1000
 
 struct bo_dict_entry {
 	uint64_t addr;
@@ -867,7 +867,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 {
 #define XEHP_BO_DICT_ENTRIES 9
 	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
-		{ .addr = XEHP_ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
+		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
 		  .size = 0x100000,
@@ -875,16 +875,16 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = 0x1000,
 		  .name = "surface state base"},
-		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
+		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size =  0x1000,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
 		  .name = "general state base" },
-		{ .addr = ADDR_SURFACE_STATE_BASE + XEHP_OFFSET_BINDING_TABLE,
+		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = 0x1000,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
@@ -912,10 +912,10 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		((float *)dinput)[i] = rand() / (float)RAND_MAX;
 
 	xehp_compute_exec_compute(bo_dict[8].data,
-				  XEHP_ADDR_GENERAL_STATE_BASE,
+				  ADDR_GENERAL_STATE_BASE,
 				  ADDR_SURFACE_STATE_BASE,
 				  ADDR_DYNAMIC_STATE_BASE,
-				  XEHP_ADDR_INSTRUCTION_STATE_BASE,
+				  ADDR_INSTRUCTION_STATE_BASE,
 				  OFFSET_INDIRECT_DATA_START,
 				  OFFSET_KERNEL);
 
@@ -1081,16 +1081,16 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 {
 #define XEHPC_BO_DICT_ENTRIES 6
 	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {
-		{ .addr = XEHP_ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
+		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
-		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
+		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
 		  .size =  0x10000,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE, .size = 0x10000,
+		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x10000,
 		  .name = "general state base" },
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
 		  .name = "batch" },
@@ -1114,10 +1114,10 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		((float *)dinput)[i] = rand() / (float)RAND_MAX;
 
 	xehpc_compute_exec_compute(bo_dict[5].data,
-				   XEHP_ADDR_GENERAL_STATE_BASE,
+				   ADDR_GENERAL_STATE_BASE,
 				   ADDR_SURFACE_STATE_BASE,
 				   ADDR_DYNAMIC_STATE_BASE,
-				   XEHP_ADDR_INSTRUCTION_STATE_BASE,
+				   ADDR_INSTRUCTION_STATE_BASE,
 				   OFFSET_INDIRECT_DATA_START,
 				   OFFSET_KERNEL);
 
-- 
2.25.1
