Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 21 Oct 2021 16:40:41 -0700
Message-Id: <20211021234044.3071069-6-John.C.Harrison@Intel.com>
In-Reply-To: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t 5/8] tests/i915/gem_exec_capture: Check
 for memory allocation failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The sysfs file read helper does not actually report any errors if a
realloc fails. It just silently returns a 'valid' but truncated
buffer. This then leads to the decode of the buffer failing in random
ways. So, add a check for ENOMEM being generated during the read.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/gem_exec_capture.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index e373d24ed..8997125ee 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -131,9 +131,11 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
 	char *error, *str;
 	int blobs = 0;
 
+	errno = 0;
 	error = igt_sysfs_get(dir, "error");
 	igt_sysfs_set(dir, "error", "Begone!");
 	igt_assert(error);
+	igt_assert(errno != ENOMEM);
 	igt_debug("%s\n", error);
 
 	/* render ring --- user = 0x00000000 ffffd000 */
-- 
2.25.1
