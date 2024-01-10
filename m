Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F180E10E598
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 12:04:13 +0000 (UTC)
Date: Wed, 10 Jan 2024 13:02:54 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [PATCH i-g-t 2/3] lib/intel_batchbuffer: Select xe2 rendercopy
 for LunarLake
Message-ID: <20240110120254.b4bgm3mbqjbkzn44@zkempczy-mobl2>
References: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
 <20240108113012.382557-3-zbigniew.kempczynski@intel.com>
 <CAM0jSHP-mzpUDQVse-ZmDisqWvm+b11sTWaRWBRT2o60WgDv3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0jSHP-mzpUDQVse-ZmDisqWvm+b11sTWaRWBRT2o60WgDv3A@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 11:25:18AM +0000, Matthew Auld wrote:
> Hi,
> 
> On Mon, 8 Jan 2024 at 11:36, Zbigniew Kempczyński
> <zbigniew.kempczynski@intel.com> wrote:
> >
> > Along with rendercopy xe2 pipeline / shader selection for LunarLake
> > reorganize if/else conditionals to handle specific selection first.
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > ---
> >  lib/intel_batchbuffer.c | 38 ++++++++++++++++++++------------------
> >  1 file changed, 20 insertions(+), 18 deletions(-)
> >
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index ccab55cec7..d374645d99 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -656,28 +656,30 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
> >  {
> >         igt_render_copyfunc_t copy = NULL;
> >
> > -       if (IS_GEN2(devid))
> > -               copy = gen2_render_copyfunc;
> > -       else if (IS_GEN3(devid))
> > -               copy = gen3_render_copyfunc;
> > -       else if (IS_GEN4(devid) || IS_GEN5(devid))
> > -               copy = gen4_render_copyfunc;
> > -       else if (IS_GEN6(devid))
> > -               copy = gen6_render_copyfunc;
> > -       else if (IS_GEN7(devid))
> > -               copy = gen7_render_copyfunc;
> > -       else if (IS_GEN8(devid))
> > -               copy = gen8_render_copyfunc;
> > -       else if (IS_GEN9(devid) || IS_GEN10(devid))
> > -               copy = gen9_render_copyfunc;
> > -       else if (IS_GEN11(devid))
> > -               copy = gen11_render_copyfunc;
> > +       if (IS_METEORLAKE(devid))
> > +               copy = mtl_render_copyfunc;
> > +       else if (IS_LUNARLAKE(devid))
> > +               copy = genxe2_render_copyfunc;
> 
> This doesn't work with any xe2? Can we not make this conditional on
> graphics version == 20?

Agree, limiting to LNL will require unnecessary modification whereas
I can spread this to graphics version covering likely most ver20
platforms.

> 
> >         else if (HAS_FLATCCS(devid))
> >                 copy = gen12p71_render_copyfunc;
> 
> Should we not not make this a normal platform or graphics version
> check? This will also catch all xe2+ platforms that are not LNL, but
> have flat_ccs support. I think it is better to just return NULL for
> new platforms, that way we get a clear skip in tests using this
> instead of seeing job timeouts due to using the wrong shader/kernel.
> See VLK-54191 for example. What do you think?

Fully agree. Platform/version checking makes clear pipeline/shader
selection instead of relying on platform feature (flatccs) which
requires further digging is it supported or not.

Thanks for the review, I'm going to rearrange this if/else block.

--
Zbigniew

> 
> > -       else if (IS_METEORLAKE(devid))
> > -               copy = mtl_render_copyfunc;
> >         else if (IS_GEN12(devid))
> >                 copy = gen12_render_copyfunc;
> > +       else if (IS_GEN11(devid))
> > +               copy = gen11_render_copyfunc;
> > +       else if (IS_GEN9(devid) || IS_GEN10(devid))
> > +               copy = gen9_render_copyfunc;
> > +       else if (IS_GEN8(devid))
> > +               copy = gen8_render_copyfunc;
> > +       else if (IS_GEN7(devid))
> > +               copy = gen7_render_copyfunc;
> > +       else if (IS_GEN6(devid))
> > +               copy = gen6_render_copyfunc;
> > +       else if (IS_GEN4(devid) || IS_GEN5(devid))
> > +               copy = gen4_render_copyfunc;
> > +       else if (IS_GEN3(devid))
> > +               copy = gen3_render_copyfunc;
> > +       else if (IS_GEN2(devid))
> > +               copy = gen2_render_copyfunc;
> >
> >         return copy;
> >  }
> > --
> > 2.34.1
> >
