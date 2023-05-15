Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F5C10E1E9
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 14:14:47 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-33131d7a26eso90281555ab.0
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 07:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230515133630.2163170-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230515133630.2163170-1-tvrtko.ursulin@linux.intel.com>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 15 May 2023 07:14:35 -0700
Message-ID: <CAJs_Fx4tPYkPo-Oc2BduuzC09OfkB3PbFwBQ3b7U9rG_Akh_Fw@mail.gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] gputop/intel_gpu_top: Move name to
 be the last field
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 15, 2023 at 6:36=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Rob,
>
> I thought maybe when you add memory stats the same field order like top(1=
)
> would feel more natural? That is client name comes last and is left justi=
fied.
> All other stats then come in the middle, between PID and NAME.
>
> DRM minor 0
>     PID     render         copy         video     video-enhance  NAME
>    2704 |=E2=96=8C           ||            ||            ||            | =
kwin_x11
>    2734 |=E2=96=8F           ||            ||            ||            | =
plasmashell
>    3932 |            ||            ||            ||            | krunner
>    4414 |            ||            ||            ||            | xdg-desk=
top-por
> 1999477 |            ||            ||            ||            | firefox
> 2162094 |            ||            ||            ||            | thunderb=
ir

Seems like a good idea, and more in line with top/htop/nvtop

BR,
-R

> intel-gpu-top: Intel Alderlake_s (Gen12) @ /dev/dri/card0 -   15/  15 MHz
>     99% RC6;  0.01/ 5.46 W;       34 irqs/s
>
>          ENGINES     BUSY                                        MI_SEMA =
MI_WAIT
>        Render/3D    1.31% |=E2=96=8C                                   | =
     0%      0%
>          Blitter    0.00% |                                    |      0% =
     0%
>            Video    0.00% |                                    |      0% =
     0%
>     VideoEnhance    0.00% |                                    |      0% =
     0%
>
>     PID   Render/3D      Blitter        Video      VideoEnhance  NAME
>    2734 |=E2=96=8F           ||            ||            ||            | =
plasmashell
>    2704 |=E2=96=8F           ||            ||            ||            | =
kwin_x11
>    1837 |=E2=96=8F           ||            ||            ||            | =
Xorg
> 3429732 |            ||            ||            ||            | kwrite
> 2162094 |            ||            ||            ||            | thunderb=
ird
>
> Cc: Rob Clark <robdclark@chromium.org>
>
> Tvrtko Ursulin (2):
>   gputop: Move client name last
>   intel_gpu_top: Move client name last
>
>  tools/gputop.c        | 19 +++++++++----------
>  tools/intel_gpu_top.c | 19 +++++++++----------
>  2 files changed, 18 insertions(+), 20 deletions(-)
>
> --
> 2.37.2
>
