Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840496EB7B
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 03:52:09 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so13641494otf.9
 for <igt-dev@lists.freedesktop.org>; Sat, 10 Jul 2021 20:52:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Sat, 10 Jul 2021 22:51:58 -0500
Message-Id: <20210711035204.802908-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/6] Rework some command parser version
 checks
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
List-ID: <igt-dev@lists.freedesktop.org>

This patch series does two things primarily:

 1. Rework the way we check for the command parser.  Previously, we had a
    parameter that claimed to check per-engine but the engine was ignored.
    With this series, we now have a version which doesn't take an engine
    for general "Is there a command parser at all?" checks and one which
    takes a context config and an engine specifier and provides an accurate
    check.

 2. Disable tests which don't work with a synchronous command parser when
    the parser is active.  This will maintain as much coverage as possible
    while allowing us to move the command parser back to synchronous.  In
    each case, the test is actively attempting to run a batch while the
    batch buffer is stuck on a spinner.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Jason Ekstrand (6):
  lib/intel_ctx: Add a intel_ctx_cfg_engine_class helper
  tests/i915/gem_eio: Convert to intel_ctx_t
  tests/i915/gem_ctx_persistence: Use intel_ctx_t for hang subtests
  i915: Improve the precision of command parser checks
  tests/i915/gem_exec_schedule: Avoid cmdparser dependencies in deep()
  tests/i915/gem_exec_reloc: Don't attempt active relocations with the
    command parser

 lib/i915/gem_submission.c        | 38 ++++++++++++++++++--
 lib/i915/gem_submission.h        |  8 +++--
 lib/igt_dummyload.c              | 15 +++++---
 lib/intel_ctx.c                  | 42 +++++++++++++++--------
 lib/intel_ctx.h                  |  1 +
 tests/i915/gem_ctx_persistence.c | 43 ++++++++++++++---------
 tests/i915/gem_eio.c             | 59 +++++++++++++++++---------------
 tests/i915/gem_exec_balancer.c   |  2 +-
 tests/i915/gem_exec_reloc.c      | 15 ++++++++
 tests/i915/gem_exec_schedule.c   | 10 ++++--
 tests/i915/gen7_exec_parse.c     |  2 +-
 tests/i915/gen9_exec_parse.c     |  2 +-
 tests/i915/i915_hangman.c        |  2 +-
 13 files changed, 163 insertions(+), 76 deletions(-)

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
