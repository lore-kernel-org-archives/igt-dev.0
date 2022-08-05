Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5542A10EE25
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 22:21:58 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 Aug 2022 18:21:55 -0400
Message-Id: <20220805222155.371840-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_aux: Fix igt_mem_sleep doc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

I recently had updated the names to use the official names, but
forgot to update the doc.

CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
Fixes: 2983efbdb1a ("lib/igt_aux: Let's use the official mem_sleep names")
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_aux.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 89437a90..c8d487b6 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -197,9 +197,9 @@ enum igt_suspend_test {
 /**
  * igt_mem_sleep:
  * @MEM_SLEEP_NONE: no support
- * @MEM_SLEEP_FREEZE: suspend-to-idle target state, aka S0ix or freeze,
- * @MEM_SLEEP_STANDBY: standby target state, aka S1
- * @MEM_SLEEP_MEM: suspend-to-mem target state aka S3
+ * @MEM_SLEEP_S2IDLE: suspend-to-idle target state, aka S0ix or freeze,
+ * @MEM_SLEEP_SHALLOW: standby target state, aka S1
+ * @MEM_SLEEP_DEEP: suspend-to-mem target state aka S3
  */
 enum igt_mem_sleep {
 	MEM_SLEEP_NONE,
-- 
2.37.1
