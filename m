Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC3010E67D
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Feb 2023 10:18:15 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Feb 2023 12:18:07 +0200
Message-Id: <20230228101807.921863-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tools/intel_vbt_decode: fix division by
 zero child device size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Real world VBTs keep fuzzing our decoder, this time with a legacy child
devices block #11 that has child_dev_size 0, leading to division by
zero. Check for it, and bail out early, both for legacy and current
child device blocks.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 8f707c1f822a..3294f74c2e7c 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1118,8 +1118,6 @@ static void dump_general_definitions(struct context *context,
 	const struct bdb_general_definitions *defs = block_data(block);
 	int child_dev_num;
 
-	child_dev_num = (block->size - sizeof(*defs)) / defs->child_dev_size;
-
 	printf("\tCRT DDC GMBUS addr: 0x%02x\n", defs->crt_ddc_gmbus_pin);
 	printf("\tUse DPMS on AIM devices: %s\n", YESNO(defs->dpms_aim));
 	printf("\tSkip CRT detect at boot: %s\n",
@@ -1129,6 +1127,11 @@ static void dump_general_definitions(struct context *context,
 	printf("\tBoot display type: 0x%02x%02x\n", defs->boot_display[1],
 	       defs->boot_display[0]);
 	printf("\tChild device size: %d\n", defs->child_dev_size);
+
+	if (!defs->child_dev_size)
+		return;
+
+	child_dev_num = (block->size - sizeof(*defs)) / defs->child_dev_size;
 	printf("\tChild device count: %d\n", child_dev_num);
 
 	dump_child_devices(context, defs->devices,
@@ -1141,9 +1144,12 @@ static void dump_legacy_child_devices(struct context *context,
 	const struct bdb_legacy_child_devices *defs = block_data(block);
 	int child_dev_num;
 
-	child_dev_num = (block->size - sizeof(*defs)) / defs->child_dev_size;
-
 	printf("\tChild device size: %d\n", defs->child_dev_size);
+
+	if (!defs->child_dev_size)
+		return;
+
+	child_dev_num = (block->size - sizeof(*defs)) / defs->child_dev_size;
 	printf("\tChild device count: %d\n", child_dev_num);
 
 	dump_child_devices(context, defs->devices,
-- 
2.39.1
