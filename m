Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B14110E419
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 06:24:13 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 sai.gowtham.ch@intel.com
Date: Wed, 26 Jul 2023 11:54:03 +0530
Message-Id: <20230726062403.11349-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_exec_store: Fix the num of
 placements check to run test on all engines.
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

Intension is to submit workload on all engine instances, this change
will make test to run on all engines including render and copy engines.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/xe/xe_exec_store.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_exec_store.c b/tests/xe/xe_exec_store.c
index ab1bde36e..fbce1aecc 100644
--- a/tests/xe/xe_exec_store.c
+++ b/tests/xe/xe_exec_store.c
@@ -149,7 +149,7 @@ static void store_all(int fd, int gt, int class)
 		eci[num_placements++] = *hwe;
 	}
 
-	igt_require(num_placements > 1);
+	igt_require(num_placements);
 
 	for (i = 0; i < num_placements; i++) {
 		struct drm_xe_engine_create create = {
-- 
2.39.1
