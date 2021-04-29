Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 29 Apr 2021 09:41:30 +0100
Message-Id: <20210429084130.850426-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_workarounds: Prepare for
 read mask
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

I plan to extend i915 to expose the read mask in i915_wa_registers so
prepare the IGT for that format change.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_workarounds.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 00b475c27ff1..be5c5d83f405 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -47,6 +47,7 @@ struct intel_wa_reg {
 	uint32_t addr;
 	uint32_t value;
 	uint32_t mask;
+	uint32_t read;
 };
 
 static struct write_only_list {
@@ -157,8 +158,8 @@ static int workaround_fail_count(int i915, uint32_t ctx)
 		if (out[i] == 0)
 			out[i] = *(volatile uint32_t *)(igt_global_mmio + wa_regs[i].addr);
 
-		if ((wa_regs[i].value & wa_regs[i].mask) ==
-		    (out[i] & wa_regs[i].mask)) {
+		if ((wa_regs[i].value & wa_regs[i].read) ==
+		    (out[i] & wa_regs[i].read)) {
 			igt_debug("%s\tOK\n", buf);
 		} else if (write_only(wa_regs[i].addr)) {
 			igt_debug("%s\tIGNORED (w/o)\n", buf);
@@ -274,7 +275,7 @@ igt_main
 		sscanf(str, "Workarounds applied: %d", &num_wa_regs);
 		igt_require(num_wa_regs > 0);
 
-		wa_regs = malloc(num_wa_regs * sizeof(*wa_regs));
+		wa_regs = calloc(num_wa_regs, sizeof(*wa_regs));
 		igt_assert(wa_regs);
 
 		i = 0;
@@ -283,11 +284,19 @@ igt_main
 				break;
 
 			igt_debug("%s", line);
-			if (sscanf(line, "0x%X: 0x%08X, mask: 0x%08X",
+			if (sscanf(line, "0x%X: 0x%08X, mask: 0x%08X, read: 0x%08X",
 				   &wa_regs[i].addr,
 				   &wa_regs[i].value,
-				   &wa_regs[i].mask) == 3)
+				   &wa_regs[i].mask,
+				   &wa_regs[i].read) == 4) {
 				i++;
+			} else if (sscanf(line, "0x%X: 0x%08X, mask: 0x%08X",
+				   &wa_regs[i].addr,
+				   &wa_regs[i].value,
+				   &wa_regs[i].mask) == 3) {
+				wa_regs[i].read = wa_regs[i].mask;
+				i++;
+			}
 		}
 
 		igt_assert_lte(i, num_wa_regs);
-- 
2.30.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
