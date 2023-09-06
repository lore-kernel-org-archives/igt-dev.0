Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 Sep 2023 20:56:07 -0000
Message-ID: <169403376713.17388.16442970206648502108@emeril.freedesktop.org>
References: <20230906181001.498395-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230906181001.498395-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBTdWJq?=
 =?utf-8?q?ect=3A_Xe=3A_set_Run_type_from_testlist_instead_of_defining_it?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Subject: Xe: set Run type from testlist instead of defining it
URL   : https://patchwork.freedesktop.org/series/123344/
State : failure

== Summary ==

Applying: test_list.py: add support for reading testlist regular expressions
Applying: xe_test_config.json: add testlists and blocklists
Applying: kms_test_config.json: add testlists and blocklists
Applying: tests: Intel Xe: drop Run type field
Using index info to reconstruct a base tree...
M	tests/intel/xe_ccs.c
M	tests/intel/xe_create.c
M	tests/intel/xe_debugfs.c
M	tests/intel/xe_dma_buf_sync.c
M	tests/intel/xe_evict.c
M	tests/intel/xe_exec_balancer.c
M	tests/intel/xe_exec_basic.c
M	tests/intel/xe_exec_compute_mode.c
M	tests/intel/xe_exec_fault_mode.c
M	tests/intel/xe_exercise_blt.c
M	tests/intel/xe_intel_bb.c
M	tests/intel/xe_media_fill.c
M	tests/intel/xe_mmap.c
M	tests/intel/xe_mmio.c
M	tests/intel/xe_noexec_ping_pong.c
M	tests/intel/xe_pm.c
M	tests/intel/xe_query.c
M	tests/intel/xe_spin_batch.c
M	tests/intel/xe_sysfs_scheduler.c
M	tests/intel/xe_vm.c
Falling back to patching base and 3-way merge...
Auto-merging tests/intel/xe_vm.c
CONFLICT (content): Merge conflict in tests/intel/xe_vm.c
Auto-merging tests/intel/xe_sysfs_scheduler.c
CONFLICT (content): Merge conflict in tests/intel/xe_sysfs_scheduler.c
Auto-merging tests/intel/xe_spin_batch.c
Auto-merging tests/intel/xe_query.c
CONFLICT (content): Merge conflict in tests/intel/xe_query.c
Auto-merging tests/intel/xe_pm.c
Auto-merging tests/intel/xe_noexec_ping_pong.c
CONFLICT (content): Merge conflict in tests/intel/xe_noexec_ping_pong.c
Auto-merging tests/intel/xe_mmio.c
CONFLICT (content): Merge conflict in tests/intel/xe_mmio.c
Auto-merging tests/intel/xe_mmap.c
CONFLICT (content): Merge conflict in tests/intel/xe_mmap.c
Auto-merging tests/intel/xe_media_fill.c
CONFLICT (content): Merge conflict in tests/intel/xe_media_fill.c
Auto-merging tests/intel/xe_intel_bb.c
Auto-merging tests/intel/xe_exercise_blt.c
Auto-merging tests/intel/xe_exec_fault_mode.c
CONFLICT (content): Merge conflict in tests/intel/xe_exec_fault_mode.c
Auto-merging tests/intel/xe_exec_compute_mode.c
CONFLICT (content): Merge conflict in tests/intel/xe_exec_compute_mode.c
Auto-merging tests/intel/xe_exec_basic.c
CONFLICT (content): Merge conflict in tests/intel/xe_exec_basic.c
Auto-merging tests/intel/xe_exec_balancer.c
CONFLICT (content): Merge conflict in tests/intel/xe_exec_balancer.c
Auto-merging tests/intel/xe_evict.c
CONFLICT (content): Merge conflict in tests/intel/xe_evict.c
Auto-merging tests/intel/xe_dma_buf_sync.c
CONFLICT (content): Merge conflict in tests/intel/xe_dma_buf_sync.c
Auto-merging tests/intel/xe_debugfs.c
Auto-merging tests/intel/xe_create.c
CONFLICT (content): Merge conflict in tests/intel/xe_create.c
Auto-merging tests/intel/xe_ccs.c
CONFLICT (content): Merge conflict in tests/intel/xe_ccs.c
Patch failed at 0004 tests: Intel Xe: drop Run type field
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



