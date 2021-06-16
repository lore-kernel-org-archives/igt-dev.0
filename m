Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 16 Jun 2021 18:08:31 -0000
Message-ID: <162386691112.8273.10677503129962033964@emeril.freedesktop.org>
References: <20210614163704.365989-1-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBTdG9w?=
 =?utf-8?q?_depending_on_context_mutation_=28rev11=29?=
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

Series: Stop depending on context mutation (rev11)
URL   : https://patchwork.freedesktop.org/series/88986/
State : failure

== Summary ==

Applying: tests/i915/gem_exec_fence: Move the engine data into inter_engine_context (v3)
Applying: tests/i915/gem_exec_fence: Convert to intel_ctx_t
Applying: tests/i915/gem_shrink: Convert to intel_ctx_t (v3)
Using index info to reconstruct a base tree...
M	tests/i915/gem_exec_schedule.c
Falling back to patching base and 3-way merge...
Auto-merging tests/i915/gem_exec_schedule.c
CONFLICT (content): Merge conflict in tests/i915/gem_exec_schedule.c
Patch failed at 0003 tests/i915/gem_shrink: Convert to intel_ctx_t (v3)
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
