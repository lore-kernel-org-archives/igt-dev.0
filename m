Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2BA6E53C
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 18:20:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so11677147wmy.5
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 11:20:30 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:20:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YFjf67FUnHKacMJB@phenom.ffwll.local>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319223233.2982842-1-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 0/8] Adjust IGT for upstream API
 clean-ups
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

On Fri, Mar 19, 2021 at 05:32:25PM -0500, Jason Ekstrand wrote:
> I'm trying to remove some unused APIs from upstream i915.  This i-g-t
> series updates tests in accordance with those removals.  For a few things,
> it simply deletes tests which test explicitly for that feature.  For
> cloning, we do actually use that for a bunch of stuff today so I just
> implement the two clones we care about (engines and VMs) directly with
> getparam and a create setparam.
> 
> Jason Ekstrand (8):
>   tests/i915: Drop gem_ctx_ringsize
>   tests/i915/gem_exec_balancer: Drop the ringsize subtest
>   tests/i915/gem_exec_endless: Stop setting the ring size
>   tests/i915/gem_ctx_param: Drop the zeromap subtests
>   tests/i915: Drop gem_ctx_clone
>   tests/i915/gem_ctx_create: Stop cloning engines
>   tests/i915/gem_ctx_persistence: Drop the clone test
>   lib/i915/gem_context: Implement VM and engine cloning manually

igt also uses sob/developer certificate, so need to add those. I wanted to
otherwise review this today but just didn't get around to it :-/

Hopefully tomorrow.
-Daniel

> 
>  lib/i915/gem_context.c           |  90 +++++--
>  lib/i915/gem_context.h           |   7 +-
>  tests/Makefile.sources           |   6 -
>  tests/i915/gem_ctx_clone.c       | 450 -------------------------------
>  tests/i915/gem_ctx_create.c      |   4 +-
>  tests/i915/gem_ctx_param.c       |  33 ---
>  tests/i915/gem_ctx_persistence.c |  30 ---
>  tests/i915/gem_ctx_ringsize.c    | 345 ------------------------
>  tests/i915/gem_ctx_shared.c      |  10 +-
>  tests/i915/gem_exec_balancer.c   |  60 +----
>  tests/i915/gem_exec_endless.c    |  12 +-
>  tests/i915/gem_exec_schedule.c   |   8 +-
>  tests/meson.build                |   2 -
>  13 files changed, 88 insertions(+), 969 deletions(-)
>  delete mode 100644 tests/i915/gem_ctx_clone.c
>  delete mode 100644 tests/i915/gem_ctx_ringsize.c
> 
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
