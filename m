Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 21 Oct 2021 16:40:37 -0700
Message-Id: <20211021234044.3071069-2-John.C.Harrison@Intel.com>
In-Reply-To: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/8] tests/i915/gem_exec_capture: Remove
 pointless assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The 'many' test ended with an 'assert(count)', presumably meaning to
ensure that some objects were actually captured. However, 'count' is
the number of objects created not how many were captured. Plus, there
is already a 'require(count > 1)' at the start and count is invarient
so the final assert is basically pointless.

General concensus appears to be that the test should not fail
irrespective of how many blobs are captured as low memory situations
could cause the capture to be abbreviated. So just remove the
pointless assert completely.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/gem_exec_capture.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 7e0a8b8ad..53649cdb2 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -524,7 +524,6 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 	}
 	igt_info("Captured %lu %"PRId64"-blobs out of a total of %lu\n",
 		 blobs, size >> 12, count);
-	igt_assert(count);
 
 	free(error);
 	free(offsets);
-- 
2.25.1
