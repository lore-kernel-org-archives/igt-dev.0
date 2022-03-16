Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC61410E33E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Mar 2022 12:42:34 +0000 (UTC)
From: venkata.sai.patnana@intel.com
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Mar 2022 17:54:54 +0530
Message-Id: <20220316122454.19360-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_edge_walk: Reduce NCRCS
 count for simulation platform
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

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

currently NCRCS value is 128, it is taking more than expected on
simulation, hence reduced to 10.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/kms_cursor_edge_walk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index cce562e0e7..9d5f3f6295 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -102,7 +102,7 @@ static void cursor_move(data_t *data, int x, int y, int i)
 
 #define XSTEP 8
 #define YSTEP 8
-#define NCRC 128
+#define NCRC SLOW_QUICK(128, 10)
 
 static void test_edge_pos(data_t *data, int sx, int ex, int y, bool swap_axis)
 {
-- 
2.25.1
