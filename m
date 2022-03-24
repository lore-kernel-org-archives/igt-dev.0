Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Mar 2022 14:26:21 +0000
Message-Id: <20220324142621.347452-5-matthew.auld@intel.com>
In-Reply-To: <20220324142621.347452-1-matthew.auld@intel.com>
References: <20220324142621.347452-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/gem_lmem_swapping: reduce the
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

300s is way too much for some BAT test. Drop it down to 45s.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 tests/i915/gem_lmem_swapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index ad1c989c..6c47bff2 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -219,7 +219,7 @@ static void __do_evict(int i915,
 	 * For TEST_MULTI runs, make each object counts a loop to
 	 * avoid excessive run times.
 	 */
-	for (l = 0; l < params->loops && igt_seconds_elapsed(&t) < 300; l += num) {
+	for (l = 0; l < params->loops && igt_seconds_elapsed(&t) < 45; l += num) {
 		unsigned int idx = rand() % params->count;
 
 		num = params->flags & TEST_MULTI ? rand() % max_swap_in + 1 : 1;
-- 
2.34.1
