Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 01 Apr 2021 10:20:40 -0000
Message-ID: <161727244071.12179.17440925304947335134@emeril.freedesktop.org>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBTdG9w?=
 =?utf-8?q?_cloning_contexts?=
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Stop cloning contexts
URL   : https://patchwork.freedesktop.org/series/88646/
State : failure

== Summary ==

Applying: lib/i915/gem_engine_topology: Expose the __query_engines helper
Applying: lib: Add an intel_ctx wrapper struct and helpers
Applying: lib/i915/gem_engine_topology: Add an iterator for intel_ctx_t
Applying: tests/i915/gem_exec_basic: Convert to intel_ctx_t
Applying: lib/igt_spin: Rename igt_spin_factory::ctx to ctx_id
Applying: lib/igt_spin: Support intel_ctx_t
Applying: tests/i915/gem_exec_fence: Convert to intel_ctx_t
Applying: tests/i915/gem_exec_schedule: Convert to intel_ctx_t
Applying: tests/i915/perf_pmu: Convert to intel_ctx_t
Applying: tests/i915/gem_exec_nop: Convert to intel_ctx_t
Applying: tests/i915/gem_exec_reloc: Convert to intel_ctx_t
Applying: tests/i915/gem_busy: Convert to intel_ctx_t
Applying: tests/i915/gem_ctx_isolation: Convert to intel_ctx_t
Applying: tests/i915/gem_exec_async: Convert to intel_ctx_t
Applying: tests/i915/sysfs_clients: Convert to intel_ctx_t
Applying: tests/i915/gem_exec_fair: Convert to intel_ctx_t
Applying: tests/i915/gem_spin_batch: Convert to intel_ctx_t
Applying: tests/i915/gem_exec_store: Convert to intel_ctx_t
Applying: tests/amdgpu/amd_prime: Convert to intel_ctx_t
Applying: tests/i915/i915_hangman: Convert to intel_ctx_t
Applying: tests/i915/gem_ringfill: Convert to intel_ctx_t
Applying: tests/prime_busy: Convert to intel_ctx_t
Applying: tests/prime_vgem: Convert to intel_ctx_t
Applying: tests/gem_exec_whisper: Convert to intel_ctx_t
Applying: tests/i915/gem_ctx_exec: Convert to intel_ctx_t
Applying: tests/i915/gem_exec_suspend: Convert to intel_ctx_t
Using index info to reconstruct a base tree...
M	tests/i915/gem_exec_suspend.c
Falling back to patching base and 3-way merge...
Auto-merging tests/i915/gem_exec_suspend.c
CONFLICT (content): Merge conflict in tests/i915/gem_exec_suspend.c
Patch failed at 0026 tests/i915/gem_exec_suspend: Convert to intel_ctx_t
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
