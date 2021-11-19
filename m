Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 19 Nov 2021 12:59:40 +0000
Message-Id: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/6] tests/api_intel_allocator: Fix build
 warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

.../tests/i915/api_intel_allocator.c: In function ‘basic_alloc’:
.../tests/i915/api_intel_allocator.c:158:25: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
  158 |                         if (j == i)
      |                         ^~

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_allocator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index 4b74317ed3d0..6d7764ca3f51 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -157,7 +157,7 @@ static void basic_alloc(int fd, int cnt, uint8_t type)
 		for (j = 0; j < cnt; j++) {
 			if (j == i)
 				continue;
-				igt_assert(!overlaps(&obj[i], &obj[j]));
+			igt_assert(!overlaps(&obj[i], &obj[j]));
 		}
 	}
 
-- 
2.32.0
