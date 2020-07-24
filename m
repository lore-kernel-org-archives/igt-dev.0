Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 24 Jul 2020 18:06:49 +0100
Message-Id: <20200724170649.463842-4-chris@chris-wilson.co.uk>
In-Reply-To: <20200724170649.463842-1-chris@chris-wilson.co.uk>
References: <20200724170649.463842-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/i915: Pick a subtest conformant
 name for an unknown engine
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

IGT disallows ':' in its subtest names, and as we use the engine name
for dynamic subtest names, pick a name that doesn't accidentally cause
IGT to assert (even when those tests are not being run).

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/gem_engine_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 76222186c..63e1b7ddc 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -136,7 +136,7 @@ static void init_engine(struct intel_execution_engine2 *e2,
 	} else {
 		igt_debug("found unknown engine (%d, %d)\n", class, instance);
 		e2->flags = -1;
-		ret = snprintf(e2->name, sizeof(e2->name), "%u:%u",
+		ret = snprintf(e2->name, sizeof(e2->name), "c%u_%u",
 			       class, instance);
 	}
 
-- 
2.28.0.rc1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
