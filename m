Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6466E4F3
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 13:19:25 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p14so2709734wmg.1
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 06:19:25 -0700 (PDT)
Date: Wed, 29 Jul 2020 15:19:22 +0200
From: daniel@ffwll.ch
Message-ID: <20200729131922.GN6419@phenom.ffwll.local>
References: <20200708132015.334750-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708132015.334750-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/5] tests: Add timeline semaphore tests
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
To: 
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 04:20:10PM +0300, Lionel Landwerlin wrote:
> Just a rebase of the tests sent a while ago.
> 
> Cheers,
> 
> Chunming Zhou (1):
>   igt: add timeline test cases
> 
> Lionel Landwerlin (4):
>   drm-uapi: bump i915_drm.h for timeline semaphores
>   tests/syncobj_timeline: add more timeline tests
>   tests/i915/exec_fence: add timeline fence tests
>   tests/i915/gem_exec_fence: add engine chaining tests

I kinda got all blurry-eyed looking at this. I think all the gaps I've
spotted in Zhou's original series you've filled in, so I'm happy. On the
series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think only thing missing here is do another CI run with kernel+igt side
together, using

https://intel-gfx-ci.01.org/test-with.html

to make sure the tests to all reflect current kernel uapi in the patches
and we haven't done any accident.

I think it'd would also be useful to get an ack from amd's side (or anyone
else who cares about timelin syncobj), so maybe just cc everyone (zhou,
bas/airlie from radv, maybe msm folks) for the final CI testing round. But
if you get nada, then no blocker imo, this has been bobbing around aimless
for way too long :-/

Cheers, Daniel

> 
>  include/drm-uapi/i915_drm.h |   65 +-
>  lib/igt_syncobj.c           |  236 ++++++
>  lib/igt_syncobj.h           |   22 +
>  lib/intel_reg.h             |    2 +
>  tests/i915/gem_exec_fence.c | 1319 ++++++++++++++++++++++++++++++
>  tests/meson.build           |    1 +
>  tests/syncobj_timeline.c    | 1537 +++++++++++++++++++++++++++++++++++
>  7 files changed, 3179 insertions(+), 3 deletions(-)
>  create mode 100644 tests/syncobj_timeline.c
> 
> --
> 2.27.0
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
