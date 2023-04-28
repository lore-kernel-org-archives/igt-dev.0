Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EF610E28D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 11:46:20 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Fri, 28 Apr 2023 17:14:45 +0530
Message-Id: <20230428114445.3244549-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_query.c: Update subtest
 query-engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Log engine instance and tile info along with engine type.

Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_query.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 3f038225..94eb046c 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -183,8 +183,9 @@ test_query_engines(int fd)
 
 	xe_for_each_hw_engine(fd, hwe) {
 		igt_assert(hwe);
-		igt_info("engine %d: %s\n", i++,
-			xe_engine_class_string(hwe->engine_class));
+		igt_info("engine %d: %s, engine instance: %d, tile: TILE-%d\n", i++,
+			 xe_engine_class_string(hwe->engine_class), hwe->engine_instance,
+								    hwe->gt_id);
 	}
 
 	igt_assert(i > 0);
-- 
2.25.1
