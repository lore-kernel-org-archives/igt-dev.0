Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Wed,  3 Nov 2021 10:04:43 -0700
Message-Id: <20211103170449.1614314-3-John.C.Harrison@Intel.com>
In-Reply-To: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
References: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 i-g-t 2/8] tests/i915/gem_exec_capture: Cope
 with larger page sizes
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
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

At some point, larger than 4KB page sizes were added to the i915
driver. This included adding an informational line to the buffer
entries in error capture logs. However, the error capture test was not
updated to skip this string, thus it would silently abort processing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/i915/gem_exec_capture.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 53649cdb2..47ca64dd6 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -484,6 +484,12 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 		addr |= strtoul(str + 1, &str, 16);
 		igt_assert(*str++ == '\n');
 
+		/* gtt_page_sizes = 0x00010000 */
+		if (strncmp(str, "gtt_page_sizes = 0x", 19) == 0) {
+			str += 19 + 8;
+			igt_assert(*str++ == '\n');
+		}
+
 		if (!(*str == ':' || *str == '~'))
 			continue;
 
-- 
2.25.1
