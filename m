Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A5812B148
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 08:32:18 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Jun 2022 10:32:01 +0200
Message-Id: <20220607083201.116570-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220607083201.116570-1-zbigniew.kempczynski@intel.com>
References: <20220607083201.116570-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915/gem_exec_schedule: Add 48b
 address flag in store-dword
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

On discrete detected default alignment may be bigger than single page
so it is likely we enter offsets > 32b. To avoid getting -EINVAL adding
flag EXEC_OBJECT_SUPPORTS_48B_ADDRESS is now necessary.

Fixes: deep, smoketest, smoketest-all

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_schedule.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index db3637e88a..6c11e92af4 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -123,13 +123,13 @@ static uint32_t __store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 	obj[2].handle = gem_create(fd, 4096);
 	if (ahnd) {
 		obj[0].offset = cork_offset;
-		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 		obj[1].offset = target_offset;
-		obj[1].flags |= EXEC_OBJECT_PINNED;
+		obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 		if (write_domain)
 			obj[1].flags |= EXEC_OBJECT_WRITE;
 		obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0);
-		obj[2].flags |= EXEC_OBJECT_PINNED;
+		obj[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 	} else {
 		obj[0].offset = cork << 20;
 		obj[1].offset = target << 20;
@@ -2179,6 +2179,7 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	int fence;
 	uint64_t ahnd = get_reloc_ahnd(fd, 0), result_offset;
 
+
 	ctx = malloc(sizeof(*ctx)*MAX_CONTEXTS);
 	for (int n = 0; n < MAX_CONTEXTS; n++)
 		ctx[n] = intel_ctx_create(fd, cfg);
-- 
2.32.0
