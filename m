Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C8A6E21A
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Nov 2021 20:31:24 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Tue,  2 Nov 2021 01:13:00 +0530
Message-Id: <20211101194300.3997-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_shared: Resolve missing
 context for exec_shared_gtt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Resolved missing context id in exec buf by passing first context i.e
ctx[0].

This change would fix test assertion in gem_execbuf for
"exec_shared_gtt" subtest.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_shared.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index ea1b5dd1..3bf700fe 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -277,6 +277,7 @@ static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
 	scratch = gem_create(i915, 16384);
 	gem_write(i915, scratch, 0, &bbe, sizeof(bbe));
 	obj.handle = scratch;
+	execbuf.rsvd1 = ctx[0]->id;
 	gem_execbuf(i915, &execbuf);
 	obj.flags |= EXEC_OBJECT_PINNED; /* reuse this address */
 	execbuf.rsvd1 = ctx[1]->id; /* and bind the second context image */
-- 
2.25.1
