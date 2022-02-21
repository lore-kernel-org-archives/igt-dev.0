Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Feb 2022 14:03:42 +0000
Message-Id: <20220221140342.2487679-2-matthew.auld@intel.com>
In-Reply-To: <20220221140342.2487679-1-matthew.auld@intel.com>
References: <20220221140342.2487679-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] test/i915/gem_exec_await: prefer
 gem_mmap__device_coherent
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make it play nice on at least DG1.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/i915/gem_exec_await.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index bf8eb682..fe176595 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -126,8 +126,8 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 		if (ahnd)
 			exec[e].exec[0].flags = EXEC_OBJECT_PINNED;
 
-		exec[e].cmd = gem_mmap__wc(fd, exec[e].exec[0].handle,
-					   0, 4096, PROT_WRITE);
+		exec[e].cmd = gem_mmap__device_coherent(fd, exec[e].exec[0].handle,
+							0, 4096, PROT_WRITE);
 
 		gem_set_domain(fd, exec[e].exec[0].handle,
 			       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
-- 
2.34.1
