Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 14 Jun 2021 15:32:05 -0000
Message-ID: <162368472552.10186.10283838893474495468@emeril.freedesktop.org>
References: <20210609173632.248880-1-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBTdG9w?=
 =?utf-8?q?_depending_on_context_mutation_=28rev7=29?=
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

Series: Stop depending on context mutation (rev7)
URL   : https://patchwork.freedesktop.org/series/88986/
State : failure

== Summary ==

Applying: tests/i915: Drop gem_ctx_ringsize
Using index info to reconstruct a base tree...
A	tests/i915/gem_ctx_ringsize.c
M	tests/meson.build
Falling back to patching base and 3-way merge...
Auto-merging tests/meson.build
No changes -- Patch already applied.
Applying: tests/i915/gem_exec_balancer: Drop the ringsize subtest
Using index info to reconstruct a base tree...
M	tests/i915/gem_exec_balancer.c
Falling back to patching base and 3-way merge...
Auto-merging tests/i915/gem_exec_balancer.c
No changes -- Patch already applied.
Applying: tests/i915/gem_exec_endless: Stop setting the ring size
Using index info to reconstruct a base tree...
M	tests/i915/gem_exec_endless.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: tests/i915/gem_ctx_param: Drop the zeromap subtests
Using index info to reconstruct a base tree...
M	tests/i915/gem_ctx_param.c
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: tests/i915: Drop gem_ctx_clone
Using index info to reconstruct a base tree...
A	tests/i915/gem_ctx_clone.c
M	tests/meson.build
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: docs: Add gem_engine_topology.h to the docs
Using index info to reconstruct a base tree...
M	docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
M	lib/i915/gem_engine_topology.c
M	lib/i915/gem_engine_topology.h
Falling back to patching base and 3-way merge...
Auto-merging lib/i915/gem_engine_topology.h
CONFLICT (content): Merge conflict in lib/i915/gem_engine_topology.h
Auto-merging lib/i915/gem_engine_topology.c
CONFLICT (content): Merge conflict in lib/i915/gem_engine_topology.c
Auto-merging docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
Patch failed at 0006 docs: Add gem_engine_topology.h to the docs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
