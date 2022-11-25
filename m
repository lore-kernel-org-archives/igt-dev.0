Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C710E273
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 08:56:12 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 14:24:29 +0530
Message-Id: <20221125085429.249000-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_isolation.c : Increase
 MAX_REG
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Steve Hampson <steven.t.hampson@intel.com>

Increase MAX_REG from 0x200000 to 0x400000 to support new large MMIO
base addresses (such as GEN12_BCS8_RING_BASE == 0x3ee000).

Signed-off-by: Steve Hampson <steven.t.hampson@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_ctx_isolation.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index dc52a9a03..ec6935714 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -27,7 +27,8 @@
 #include "igt_dummyload.h"
 #include "igt_types.h"
 
-#define MAX_REG 0x200000
+/* MAX_REG must be greater than the maximum register address. */
+#define MAX_REG 0x400000
 #define NUM_REGS (MAX_REG / sizeof(uint32_t))
 
 #define PAGE_ALIGN(x) ALIGN(x, 4096)
-- 
2.25.1
