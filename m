Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 17 May 2023 14:40:31 -0000
Message-ID: <168433443130.6588.11836373140475813020@emeril.freedesktop.org>
References: <20230329115642.244296-1-matthew.auld@intel.com>
In-Reply-To: <20230329115642.244296-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJR1Qg?=
 =?utf-8?q?bits_for_small-bar_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: IGT bits for small-bar (rev2)
URL   : https://patchwork.freedesktop.org/series/115786/
State : failure

== Summary ==

Applying: xe: sync small-bar uapi
Applying: lib/xe: add visible vram helpers
Using index info to reconstruct a base tree...
M	lib/xe/xe_query.c
M	lib/xe/xe_query.h
Falling back to patching base and 3-way merge...
Auto-merging lib/xe/xe_query.h
Auto-merging lib/xe/xe_query.c
Applying: tests/xe: handle small-bar systems
Using index info to reconstruct a base tree...
M	tests/xe/xe_dma_buf_sync.c
M	tests/xe/xe_evict.c
M	tests/xe/xe_exec_balancer.c
M	tests/xe/xe_exec_basic.c
M	tests/xe/xe_exec_compute_mode.c
M	tests/xe/xe_exec_fault_mode.c
M	tests/xe/xe_exec_reset.c
M	tests/xe/xe_exec_threads.c
M	tests/xe/xe_guc_pc.c
M	tests/xe/xe_pm.c
M	tests/xe/xe_prime_self_import.c
M	tests/xe/xe_vm.c
Falling back to patching base and 3-way merge...
Auto-merging tests/xe/xe_vm.c
CONFLICT (content): Merge conflict in tests/xe/xe_vm.c
Auto-merging tests/xe/xe_prime_self_import.c
Auto-merging tests/xe/xe_pm.c
Auto-merging tests/xe/xe_guc_pc.c
Auto-merging tests/xe/xe_exec_threads.c
Auto-merging tests/xe/xe_exec_reset.c
Auto-merging tests/xe/xe_exec_fault_mode.c
Auto-merging tests/xe/xe_exec_compute_mode.c
Auto-merging tests/xe/xe_exec_basic.c
Auto-merging tests/xe/xe_exec_balancer.c
Auto-merging tests/xe/xe_evict.c
Auto-merging tests/xe/xe_dma_buf_sync.c
Patch failed at 0003 tests/xe: handle small-bar systems
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

