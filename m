Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3938210E5A2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 13:06:50 +0000 (UTC)
Date: Wed, 10 Jan 2024 14:06:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [PATCH i-g-t v3 2/3] lib/intel_batchbuffer: Select xe2
 rendercopy for LunarLake
Message-ID: <20240110130645.qbmixhr6lbjvbwwp@zkempczy-mobl2>
References: <20240110122514.33495-1-zbigniew.kempczynski@intel.com>
 <20240110122514.33495-3-zbigniew.kempczynski@intel.com>
 <CAM0jSHPWbbtp+FDieJ3udWAdDYZSfnXCTU5NSJSh=3Cog5ZcvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM0jSHPWbbtp+FDieJ3udWAdDYZSfnXCTU5NSJSh=3Cog5ZcvA@mail.gmail.com>
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

On Wed, Jan 10, 2024 at 12:33:03PM +0000, Matthew Auld wrote:
> On Wed, 10 Jan 2024 at 12:25, Zbigniew Kempczyński
> <zbigniew.kempczynski@intel.com> wrote:
> >
> > Along with rendercopy xe2 pipeline / shader selection for LunarLake
> > reorganize if/else conditionals to handle specific selection first.
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > Cc: Matthew Auld <matthew.william.auld@gmail.com>
> > ---
> > v3: Drop feature selection toward direct ver/platform (Matt)
> > ---
> >  lib/intel_batchbuffer.c | 40 +++++++++++++++++++++-------------------
> >  1 file changed, 21 insertions(+), 19 deletions(-)
> >
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index ccab55cec7..85023f9e6f 100644
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
> > -       else if (HAS_FLATCCS(devid))
> > -               copy = gen12p71_render_copyfunc;
> > -       else if (IS_METEORLAKE(devid))
> > +       if (IS_METEORLAKE(devid))
> >                 copy = mtl_render_copyfunc;
> > +       else if (IS_DG2(devid))
> > +               copy = gen12p71_render_copyfunc;
> > +       else if (IS_GEN(devid, 20))
> > +               copy = xe2_render_copyfunc;
> 
> Nit: Maybe keep this sorted by platform. i.e xe2 at the top.
> 
> Reviewed-by: Matthew Auld <matthew.auld@Intel.com>

I think direct platform selection should be first, then
version to avoid being incidentally catched on IS_GEN() macro.

--
Zbigniew

> 
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
