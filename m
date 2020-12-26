Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766FE89791
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Dec 2020 16:33:43 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sat, 26 Dec 2020 22:05:59 +0530
Message-Id: <20201226163559.365671-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_render_copy_redux: Remove
 redundant checks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Remove the redundant checks present in copy_flink()

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_render_copy_redux.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
index 8e633567..40308a6e 100644
--- a/tests/i915/gem_render_copy_redux.c
+++ b/tests/i915/gem_render_copy_redux.c
@@ -180,9 +180,6 @@ static void copy_flink(data_t *data)
 	scratch_buf_check(data, &dst, 10, 10, DST_COLOR);
 	scratch_buf_check(data, &dst, WIDTH - 10, HEIGHT - 10, SRC_COLOR);
 
-	scratch_buf_check(data, &dst, 10, 10, DST_COLOR);
-	scratch_buf_check(data, &dst, WIDTH - 10, HEIGHT - 10, SRC_COLOR);
-
 	intel_bb_reset(data->ibb, true);
 	scratch_buf_fini(data, &src);
 	scratch_buf_fini(data, &flink);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
