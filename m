Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 22 Jan 2020 15:23:49 +0000
Message-Id: <20200122152349.12154-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200122152349.12154-1-tvrtko.ursulin@linux.intel.com>
References: <20200122152349.12154-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/gem_engine_topology: Fix virtual
 engine check
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Engine class/instance have to be u16 for the virtual engine check to work.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/gem_engine_topology.c | 2 +-
 lib/igt_gt.h                   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index c3645eab8538..989a6e26d6ef 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -105,7 +105,7 @@ static const char *class_names[] = {
 };
 
 static void init_engine(struct intel_execution_engine2 *e2,
-			int class, int instance, uint64_t flags)
+			uint16_t class, uint16_t instance, uint64_t flags)
 {
 	int ret;
 
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index 6a8eceb68817..e880cd4ed11f 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -96,8 +96,8 @@ bool gem_class_can_store_dword(int fd, int class);
 
 extern const struct intel_execution_engine2 {
 	char name[16];
-	int class;
-	int instance;
+	uint16_t class;
+	uint16_t instance;
 	uint64_t flags;
 	bool is_virtual;
 } intel_execution_engines2[];
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
