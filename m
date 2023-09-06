Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B887910E594
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 08:16:51 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 13:38:35 +0530
Message-Id: <20230906080840.1714917-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230906080840.1714917-1-bhanuprakash.modem@intel.com>
References: <20230906080840.1714917-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 1/6] lib/igt_gt: Fix igt_post_hang_ring for XE
 driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fix igt_post_hang_ring() to not execute gem specific logic
for XE driver.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_gt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 7cf0e468e..a24a566c7 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -384,6 +384,8 @@ void igt_post_hang_ring(int fd, igt_hang_t arg)
 	if (is_xe_device(fd)) {
 		igt_spin_free(fd, arg.spin);
 		xe_post_hang_ring(fd, arg);
+
+		return;
 	}
 
 	gem_sync(fd, arg.spin->handle); /* Wait until it hangs */
-- 
2.40.0
