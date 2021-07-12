Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5296089CD9
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 15:50:56 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id a16so29722219ybt.8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jul 2021 08:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210711035204.802908-1-jason@jlekstrand.net>
 <YOxXBcxj55SPhZzV@phenom.ffwll.local>
In-Reply-To: <YOxXBcxj55SPhZzV@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Jul 2021 10:50:44 -0500
Message-ID: <CAOFGe966WaSfdz-1v1iaJrEFNSZa9SVi79tsPFy0joTBYU3j9g@mail.gmail.com>
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 9:51 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Jul 10, 2021 at 10:51:58PM -0500, Jason Ekstrand wrote:
> > This patch series does two things primarily:
> >
> >  1. Rework the way we check for the command parser.  Previously, we had a
> >     parameter that claimed to check per-engine but the engine was ignored.
> >     With this series, we now have a version which doesn't take an engine
> >     for general "Is there a command parser at all?" checks and one which
> >     takes a context config and an engine specifier and provides an accurate
> >     check.
> >
> >  2. Disable tests which don't work with a synchronous command parser when
> >     the parser is active.  This will maintain as much coverage as possible
> >     while allowing us to move the command parser back to synchronous.  In
> >     each case, the test is actively attempting to run a batch while the
> >     batch buffer is stuck on a spinner.
>
> Can we either just fix them, or delete them? Carrying gunk around that
> skips isn't much use imo.

If we're going to make relocations synchronous, the answer is to
delete them.  Given what they're testing, making them skip is the
"fix" if we're only making the command parser synchronous.

--Jason

> -Daniel
>
> >
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Jason Ekstrand (6):
> >   lib/intel_ctx: Add a intel_ctx_cfg_engine_class helper
> >   tests/i915/gem_eio: Convert to intel_ctx_t
> >   tests/i915/gem_ctx_persistence: Use intel_ctx_t for hang subtests
> >   i915: Improve the precision of command parser checks
> >   tests/i915/gem_exec_schedule: Avoid cmdparser dependencies in deep()
> >   tests/i915/gem_exec_reloc: Don't attempt active relocations with the
> >     command parser
> >
> >  lib/i915/gem_submission.c        | 38 ++++++++++++++++++--
> >  lib/i915/gem_submission.h        |  8 +++--
> >  lib/igt_dummyload.c              | 15 +++++---
> >  lib/intel_ctx.c                  | 42 +++++++++++++++--------
> >  lib/intel_ctx.h                  |  1 +
> >  tests/i915/gem_ctx_persistence.c | 43 ++++++++++++++---------
> >  tests/i915/gem_eio.c             | 59 +++++++++++++++++---------------
> >  tests/i915/gem_exec_balancer.c   |  2 +-
> >  tests/i915/gem_exec_reloc.c      | 15 ++++++++
> >  tests/i915/gem_exec_schedule.c   | 10 ++++--
> >  tests/i915/gen7_exec_parse.c     |  2 +-
> >  tests/i915/gen9_exec_parse.c     |  2 +-
> >  tests/i915/i915_hangman.c        |  2 +-
> >  13 files changed, 163 insertions(+), 76 deletions(-)
> >
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
