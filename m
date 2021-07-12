Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3AC89CB8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 14:51:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id ca14so11539974edb.2
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 07:51:52 -0700 (PDT)
Date: Mon, 12 Jul 2021 16:51:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YOxXBcxj55SPhZzV@phenom.ffwll.local>
References: <20210711035204.802908-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210711035204.802908-1-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 0/6] Rework some command parser version
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Jul 10, 2021 at 10:51:58PM -0500, Jason Ekstrand wrote:
> This patch series does two things primarily:
> 
>  1. Rework the way we check for the command parser.  Previously, we had a
>     parameter that claimed to check per-engine but the engine was ignored.
>     With this series, we now have a version which doesn't take an engine
>     for general "Is there a command parser at all?" checks and one which
>     takes a context config and an engine specifier and provides an accurate
>     check.
> 
>  2. Disable tests which don't work with a synchronous command parser when
>     the parser is active.  This will maintain as much coverage as possible
>     while allowing us to move the command parser back to synchronous.  In
>     each case, the test is actively attempting to run a batch while the
>     batch buffer is stuck on a spinner.

Can we either just fix them, or delete them? Carrying gunk around that
skips isn't much use imo.
-Daniel

> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Jason Ekstrand (6):
>   lib/intel_ctx: Add a intel_ctx_cfg_engine_class helper
>   tests/i915/gem_eio: Convert to intel_ctx_t
>   tests/i915/gem_ctx_persistence: Use intel_ctx_t for hang subtests
>   i915: Improve the precision of command parser checks
>   tests/i915/gem_exec_schedule: Avoid cmdparser dependencies in deep()
>   tests/i915/gem_exec_reloc: Don't attempt active relocations with the
>     command parser
> 
>  lib/i915/gem_submission.c        | 38 ++++++++++++++++++--
>  lib/i915/gem_submission.h        |  8 +++--
>  lib/igt_dummyload.c              | 15 +++++---
>  lib/intel_ctx.c                  | 42 +++++++++++++++--------
>  lib/intel_ctx.h                  |  1 +
>  tests/i915/gem_ctx_persistence.c | 43 ++++++++++++++---------
>  tests/i915/gem_eio.c             | 59 +++++++++++++++++---------------
>  tests/i915/gem_exec_balancer.c   |  2 +-
>  tests/i915/gem_exec_reloc.c      | 15 ++++++++
>  tests/i915/gem_exec_schedule.c   | 10 ++++--
>  tests/i915/gen7_exec_parse.c     |  2 +-
>  tests/i915/gen9_exec_parse.c     |  2 +-
>  tests/i915/i915_hangman.c        |  2 +-
>  13 files changed, 163 insertions(+), 76 deletions(-)
> 
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
