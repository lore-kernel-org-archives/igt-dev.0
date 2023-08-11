Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DC810E6C0
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 16:50:22 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Date: Fri, 11 Aug 2023 22:19:50 +0530
Message-Id: <20230811164950.11074-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_exec_store: Fix number of
 placements in store_all
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Fix number of placements in store_all using which we can create
multiple engine instances.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/xe/xe_exec_store.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_exec_store.c b/tests/xe/xe_exec_store.c
index bab5ea5bc..498aa0f7f 100644
--- a/tests/xe/xe_exec_store.c
+++ b/tests/xe/xe_exec_store.c
@@ -149,7 +149,8 @@ static void store_all(int fd, int gt, int class)
 		eci[num_placements++] = *hwe;
 	}
 
-	igt_require(num_placements);
+	if (num_placements < 2)
+		return;
 
 	for (i = 0; i < num_placements; i++) {
 		struct drm_xe_exec_queue_create create = {
-- 
2.39.1
