Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 13 Jan 2022 23:25:07 -0000
Message-ID: <164211630736.19001.13197236391870614894@emeril.freedesktop.org>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBGaXhl?=
 =?utf-8?q?s_for_i915=5Fhangman_and_gem=5Fexec=5Fcapture_=28rev7=29?=
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
To: john.c.harrison@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Fixes for i915_hangman and gem_exec_capture (rev7)
URL   : https://patchwork.freedesktop.org/series/97981/
State : failure

== Summary ==

Applying: tests/i915/i915_hangman: Add descriptions
Applying: lib/hang: Fix igt_require_hang_ring to work with all engines
Applying: tests/i915/i915_hangman: Update capture test to use engine structure
Applying: tests/i915/i915_hangman: Explicitly test per engine reset vs full GPU reset
Applying: tests/i915/i915_hangman: Add uevent test & fix detector
Applying: tests/i915/i915_hangman: Use the correct context in hangcheck_unterminated
Applying: lib/store: Refactor common store code into helper function
Applying: tests/i915/i915_hangman: Add alive-ness test after error capture
Applying: tests/i915/i915_hangman: Remove reliance on context persistance
Applying: tests/i915/i915_hangman: Run background task on all engines
Applying: tests/i915/i915_hangman: Don't let background contexts cause a ban
Applying: tests/i915/gem_exec_fence: Configure correct context
Applying: lib/i915: Add helper for non-destructive engine property updates
Applying: tests/i915/i915_hangman: Configure engine properties for quicker hangs
Using index info to reconstruct a base tree...
M	tests/i915/i915_hangman.c
Falling back to patching base and 3-way merge...
Auto-merging tests/i915/i915_hangman.c
CONFLICT (content): Merge conflict in tests/i915/i915_hangman.c
Patch failed at 0014 tests/i915/i915_hangman: Configure engine properties for quicker hangs
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

