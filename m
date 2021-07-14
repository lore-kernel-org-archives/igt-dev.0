Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E55A6E235
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:31:48 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id a14so1817413pls.4
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:31:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:32 -0500
Message-Id: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/9] Prepare for a synchronous command parser
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

We're trying to move the command parser in i915 back to being synchronous
and happening in execbuf().  This patch series does two things primarily:

 1. Rework the way we check for the command parser.  Previously, we had a
    parameter that claimed to check per-engine but the engine was ignored.
    With this series, we now have a version which doesn't take an engine
    for general "Is there a command parser at all?" checks and one which
    takes a context config and an engine specifier and provides an accurate
    check.

 2. Delete tests which don't work with a synchronous command parser.
    Originally, I took a more conservative approach and just made those
    tests skip but Daniel had patches to delete them since we'd like to
    make relocations immediate again as well and then they won't work at
    all.

Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>

Daniel Vetter (4):
  tests/gem_exec_schedule: Use store_dword_plug again (v2)
  Revert "test/i915/gem_exec_reloc: Restore interclient testings"
  Revert "i915/gem_exec_reloc: Flood the ring with GPU relocs"
  Revert "i915/gem_exec_reloc: Check that relocations do not block"

Jason Ekstrand (5):
  lib/intel_ctx: Add a intel_ctx_cfg_engine_class helper
  tests/i915/gem_eio: Convert to intel_ctx_t
  tests/i915/gem_ctx_persistence: Use intel_ctx_t for hang subtests
  i915: Improve the precision of command parser checks
  tests/i915/gen9_exec_parse: Expect sync_fence_status to succeed

 lib/i915/gem_submission.c        |  38 ++-
 lib/i915/gem_submission.h        |   8 +-
 lib/igt_dummyload.c              |  15 +-
 lib/intel_ctx.c                  |  42 +--
 lib/intel_ctx.h                  |   1 +
 tests/i915/gem_ctx_persistence.c |  43 +--
 tests/i915/gem_eio.c             |  59 ++--
 tests/i915/gem_exec_balancer.c   |   2 +-
 tests/i915/gem_exec_reloc.c      | 445 -------------------------------
 tests/i915/gem_exec_schedule.c   |  52 +---
 tests/i915/gen7_exec_parse.c     |   2 +-
 tests/i915/gen9_exec_parse.c     |   6 +-
 tests/i915/i915_hangman.c        |   2 +-
 13 files changed, 146 insertions(+), 569 deletions(-)

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
