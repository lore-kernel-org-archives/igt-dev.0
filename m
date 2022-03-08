Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B1E10E30E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 09:26:52 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Tue,  8 Mar 2022 14:57:17 +0530
Message-Id: <20220308092717.5528-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_lmem_swapping: move the obj
 to lmem before init
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When lmem obj is created through ttm, by default pages resides at smem.
So before start initializing through mmap, lets move the pages into
lmem. Else this will overload smem and OOM-killer will be triggered

[10163.886990] containerd invoked oom-killer:
gfp_mask=0x1140cca(GFP_HIGHUSER_MOVABLE|__GFP_COMP), order=0,
oom_score_adj=-999
[10163.956048] CPU: 1 PID: 1707 Comm: containerd Not tainted
5.17.0-rc6-4425-ram+ #2
[10163.963536] Hardware name: Intel Corporation CoffeeLake Client
Platform/CoffeeLake S UDIMM RVP, BIOS CNLSFWR1.R00.X220.B00.2103302221
03/30/2021
[10163.976467] Call Trace:
[10163.978925]  <TASK>
[10163.981039]  dump_stack_lvl+0x57/0x7d
[10163.984708]  dump_header+0x45/0x2f4
[10163.988206]  oom_kill_process.cold+0xb/0x10
[10163.992395]  out_of_memory+0x104/0x3a0
[10163.996152]  __alloc_pages_slowpath.constprop.0+0xbe6/0xd30
[10164.001734]  __alloc_pages+0x316/0x350
[10164.005492]  __folio_alloc+0x12/0x40
[10164.009071]  __filemap_get_folio+0x1de/0x730
[10164.013356]  filemap_fault+0x55a/0x1100
[10164.017202]  ? filemap_map_pages+0x167/0x690
[10164.021482]  __do_fault+0x2f/0xa0
[10164.024810]  __handle_mm_fault+0xd2f/0x1490
[10164.029009]  handle_mm_fault+0x146/0x410
[10164.032943]  do_user_addr_fault+0x1e5/0x670
[10164.037133]  exc_page_fault+0x65/0x250
[10164.040889]  ? asm_exc_page_fault+0x8/0x30
[10164.044995]  asm_exc_page_fault+0x1e/0x30
[10164.049014] RIP: 0033:0x55c0c67174f0
[10164.052597] Code: Unable to access opcode bytes at RIP
0x55c0c67174c6.
[10164.059120] RSP: 002b:000000c00024d9c8 EFLAGS: 00010206
[10164.064345] RAX: 0000000000002000 RBX: 0000000000000004 RCX:
000055c0c8dfc1a0
[10164.071474] RDX: 000055c0c8e68f38 RSI: 00000000000000af RDI:
00000000000000aa
[10164.078607] RBP: 000000c00024da20 R08: 000055c0c80b9ca0 R09:
0000000000203000
[10164.085738] R10: 0000000000000008 R11: 000000000fffffc0 R12:
0000000000000006
[10164.092868] R13: 00000000000000a4 R14: 00000000000000aa R15:
00000000000000aa
[10164.100009]  </TASK>
[10164.169081] Mem-Info:
[10164.185134] active_anon:811 inactive_anon:74186 isolated_anon:0
                active_file:285 inactive_file:321 isolated_file:0
                unevictable:3794624 dirty:0 writeback:0
                slab_reclaimable:34539 slab_unreclaimable:106743
                mapped:482 shmem:3795382 pagetables:1707 bounce:0
                kernel_misc_reclaimable:0
                free:37283 free_pcp:51 free_cma:0

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
---
 tests/i915/gem_lmem_swapping.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 39f9e1f536dd..582111dddeb9 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -201,11 +201,10 @@ static void __do_evict(int i915,
 		}
 		obj->handle = create_bo(i915, obj->size, region, params->oom_test);
 
+		move_to_lmem(i915, objects + i, 1, batch, engine,
+			     params->oom_test);
 		if (params->flags & TEST_VERIFY)
 			init_object(i915, obj, rand(), params->flags);
-		else
-			move_to_lmem(i915, objects + i, 1, batch, engine,
-				     params->oom_test);
 	}
 
 	igt_debug("obj size min/max=%lu %s/%lu %s, count=%u, seed: %u\n",
-- 
2.20.1
