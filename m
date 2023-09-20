Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C94210E556
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 20:43:50 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Thu, 21 Sep 2023 02:16:32 +0530
Message-Id: <20230920204632.730526-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_compute: Fix Incorrect array size
 for XEHPC platforms
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

Correct the STATE_BASE_ADDRESS Instruction data size.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 4f6716d23..0c30f39c1 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1030,7 +1030,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 			       unsigned int size)
 {
 #define XEHPC_BO_DICT_ENTRIES 6
-	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
+	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {
 		{ .addr = XEHP_ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = XEHP_ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
-- 
2.25.1
