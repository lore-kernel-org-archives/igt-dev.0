Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B46B10E0DB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 15:27:45 +0000 (UTC)
Date: Thu, 19 Oct 2023 17:27:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231019152718.myvwj2n5oxi2adp7@kamilkon-desk.igk.intel.com>
References: <20231017143654.617723-1-marcin.bernatowicz@linux.intel.com>
 <20231018152807.46mc4l2ubrb5ttuv@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231018152807.46mc4l2ubrb5ttuv@kamilkon-desk.igk.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_blt.c: ensure uint64_t result
 of multiplication
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Marcin,

On 2023-10-18 at 17:28:11 +0200, Kamil Konieczny wrote:
> Hi Marcin,
> On 2023-10-17 at 14:36:54 +0000, Marcin Bernatowicz wrote:
> > Additionally check for overflow.
> - ^^^^^^^^^^^^
> This type was from the start uint64, so imho change subject from:
> 
> lib/intel_blt.c: ensure uint64_t result of multiplication
> ------------ ^^
> sidenote: remove ".c"
> 
> into:
> lib/intel_blt: check for overflow in multiplication
> 
> and adjust description.
> 
> > 
> > This should allow to exercise large buffers
> > ex. xe_exercise_blt -W 16384 -H 16384
> 
> Please explain - this should fit in 32bit? 16K*16K*32 = 0x40000000
> Or do you mean much higher values for W and H?
> 

You were right here, sorry.

> > 
> > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > ---
> >  lib/intel_blt.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > index a76c7a404..f46c85e91 100644
> > --- a/lib/intel_blt.c
> > +++ b/lib/intel_blt.c
> > @@ -1607,12 +1607,18 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
> >  		  bool create_mapping)
> >  {
> >  	struct blt_copy_object *obj;
> > -	uint64_t size = width * height * bpp / 8;
> >  	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
> >  	uint32_t handle;
> > +	uint64_t size;
> >  
> >  	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
> >  
> > +	igt_assert_f((UINT64_MAX / 8) >= width &&
> ----------------- ^^^^^^^^^^^^^^
> This is not needed, it checks for MAX >= w * 8, while you want
> size > 0, imho add a second assert after calculating size.
> 
> Regards,
> Kamil
> 

One more thing, before these asserts you should check that
both width and height are not zero.

Regards,
Kamil

> > +		     (UINT64_MAX / width) >= height &&
> > +		     (UINT64_MAX / (width * height)) >= bpp, "Overflow detected!\n");
> > +
> > +	size = (uint64_t)width * height * bpp / 8;
> > +
> >  	obj = calloc(1, sizeof(*obj));
> >  
> >  	obj->size = size;
> > -- 
> > 2.42.0
> > 
