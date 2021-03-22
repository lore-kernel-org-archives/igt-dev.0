Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 22 Mar 2021 22:05:48 -0000
Message-ID: <161645074840.19227.7727738813566414051@emeril.freedesktop.org>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
In-Reply-To: <20210319223233.2982842-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGp1?=
 =?utf-8?q?st_IGT_for_upstream_API_clean-ups_=28rev2=29?=
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

Series: Adjust IGT for upstream API clean-ups (rev2)
URL   : https://patchwork.freedesktop.org/series/88194/
State : failure

== Summary ==

Applying: tests/i915: Drop gem_ctx_ringsize
Applying: tests/i915/gem_exec_balancer: Drop the ringsize subtest
Applying: tests/i915/gem_exec_endless: Stop setting the ring size
Applying: tests/i915/gem_ctx_param: Drop the zeromap subtests
Applying: tests/i915: Drop gem_ctx_clone
Applying: tests/i915/gem_ctx_create: Stop cloning engines
Applying: tests/i915/gem_ctx_persistence: Drop the clone test
Applying: lib/i915/gem_context: Implement VM and engine cloning manually
Applying: lib/i915/gem_context: Implement VM and engine cloning manually (v3)
Using index info to reconstruct a base tree...
M	lib/i915/gem_context.c
M	lib/i915/gem_context.h
M	tests/i915/gem_ctx_shared.c
M	tests/i915/gem_exec_balancer.c
M	tests/i915/gem_exec_schedule.c
Falling back to patching base and 3-way merge...
Auto-merging tests/i915/gem_exec_balancer.c
Auto-merging lib/i915/gem_context.h
Auto-merging lib/i915/gem_context.c
CONFLICT (content): Merge conflict in lib/i915/gem_context.c
Patch failed at 0009 lib/i915/gem_context: Implement VM and engine cloning manually (v3)
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
