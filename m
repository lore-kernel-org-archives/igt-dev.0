Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 14 Jan 2021 20:23:52 -0000
Message-ID: <161065583258.19646.10138005179682705288@emeril.freedesktop.org>
References: <20210114195736.62948-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210114195736.62948-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJbnRy?=
 =?utf-8?q?oduce_IGT_allocator_=28rev16=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce IGT allocator (rev16)
URL   : https://patchwork.freedesktop.org/series/82954/
State : failure

== Summary ==

Applying: tests/gem_softpin: Fix object leak in softpin test
Using index info to reconstruct a base tree...
M	tests/i915/gem_softpin.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: lib/igt_list: igt_hlist implementation.
Applying: lib/igt_map: Introduce igt_map
Applying: lib/igt_core: Track child process pid and tid
Applying: lib/intel_allocator_simple: Add simple allocator
Applying: lib/intel_allocator_random: Add random allocator
Applying: lib/intel_allocator: Add intel_allocator core
Applying: lib/intel_allocator: Try to stop smoothly instead of deinit
Applying: lib/intel_allocator_msgchannel: Scale to 4k of parallel clients
Applying: lib/intel_bufops: Removes handle from allocator, change size
Applying: lib/intel_bufops: Add init with handle and size function
Applying: lib/intel_batchbuffer: Integrate intel_bb with allocator
Applying: lib/intel_batchbuffer: Add tracking intel_buf to intel_bb
Applying: lib/intel_aux_pgtable: Get addresses for aux table from an allocator
Applying: lib/igt_fb: Initialize intel_buf with same size as fb
Applying: tests/api_intel_bb: Modify test to verify intel_bb with allocator
Applying: tests/api_intel_bb: Add compressed->compressed copy
Applying: tests/api_intel_allocator: Simple allocator test suite
Applying: tests/gem_softpin: Verify allocator and execbuf pair work together
Applying: tests/gem|kms: Remove intel_bb from fixture
Applying: tests/gem_mmap_offset: Use intel_buf wrapper code instead direct
Applying: tests/gem_ppgtt: Adopt test to use intel_bb with allocator
Using index info to reconstruct a base tree...
M	tests/i915/gem_ppgtt.c
Falling back to patching base and 3-way merge...
Auto-merging tests/i915/gem_ppgtt.c
CONFLICT (content): Merge conflict in tests/i915/gem_ppgtt.c
Patch failed at 0022 tests/gem_ppgtt: Adopt test to use intel_bb with allocator
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
