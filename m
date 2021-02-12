Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 12 Feb 2021 14:29:42 +0000
Message-Id: <20210212142942.27603-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210212142926.27547-1-chris@chris-wilson.co.uk>
References: <20210212142926.27547-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_userptr_blts: Move readonly test
 into common block
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

Since we only run test_readonly for a single sync-flag, place it in the
common block.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_userptr_blits.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 1bc2d3600..a4f137f93 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2474,6 +2474,9 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("set-cache-level")
 			test_set_caching(fd);
 
+		igt_subtest("readonly")
+			test_readonly(fd);
+
 		igt_subtest("userfault")
 			test_userfault(fd);
 
@@ -2515,9 +2518,6 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("dmabuf-unsync")
 			test_dmabuf();
 
-		igt_subtest("readonly-unsync")
-			test_readonly(fd);
-
 		igt_describe("Examine mmap-offset mapping to read-only userptr");
 		igt_subtest_with_dynamic("readonly-mmap-unsync")
 			for_each_mmap_offset_type(fd, t)
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
