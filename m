Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304536EB3B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 12:09:03 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 15 Jul 2020 17:33:39 +0530
Message-Id: <20200715120339.11403-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] tests/kms_big_fb: Use igt_assert on bufmgr
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
To: igt-dev@lists.freedesktop.org, pankaj.laxminarayan.bharadiya@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

NULL bufmgr pointer leads to SIGSEGV. Assert on NULL bufmgr so that
correct failure reason will get dumped in the stack trace.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 tests/kms_big_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index a754b2997..b19b56f90 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -649,6 +649,7 @@ igt_main
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
 		data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
+		igt_assert(data.bufmgr);
 		data.batch = intel_batchbuffer_alloc(data.bufmgr, data.devid);
 	}
 
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
