Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900E86FB9C
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:04:19 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Fri, 31 Jan 2020 09:04:16 -0800
Message-Id: <20200131170416.7663-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_basic: Skip subtest gtt
 if gtt mapping is unavailable
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Dixit@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The subtest tries to do a gtt mapping but if there is no mappable
aperture that is not possible.

v2:
	- Skip the whole dynamic subtest. (Petri)

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/i915/gem_exec_basic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 70dce34b..b3c56369 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -141,6 +141,8 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("gtt") {
+		gem_require_mappable_ggtt(fd);
+
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
 				gtt(fd, e->flags);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
