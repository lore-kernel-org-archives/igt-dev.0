Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01EC89686
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 11:15:41 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Mon, 24 Feb 2020 11:15:38 +0000
Message-ID: <6cdad59c69e520763c0ec37bd0f27f42b8683d15.camel@intel.com>
References: <20200218092308.29434-1-mika.kahola@intel.com>
 <20200218102821.GA4333@ideak-desk.fi.intel.com>
In-Reply-To: <20200218102821.GA4333@ideak-desk.fi.intel.com>
Content-Language: en-US
Content-ID: <B0BB36B819CE404391DC2974C21B7338@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_ccs: Remove unnecessary
 defines
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
To: "Deak, Imre" <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 2020-02-18 at 12:28 +0200, Imre Deak wrote:
> On Tue, Feb 18, 2020 at 11:23:08AM +0200, Mika Kahola wrote:
> > We have defined different unit sizes for GEN12+ platforms. These
> > are not needed anymore so let's just get rid of these.
> 
> A bit more explanation here would be nice, stg like:
> "The stride of CCS planes on GEN12+ is fixed, so we can check for
>  an incorrect stride with the same delta as on earlier platforms." 
> 
> > 
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> 
> Reviewed-by: Imre Deak <imre.deak@intel.com>
Pushed with the comment. Thanks for the review!

Cheers,
Mika

> 
> > ---
> >  tests/kms_ccs.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> > index 7130054a..86681a26 100644
> > --- a/tests/kms_ccs.c
> > +++ b/tests/kms_ccs.c
> > @@ -181,15 +181,9 @@ static void generate_fb(data_t *data, struct
> > igt_fb *fb,
> >  	uint32_t format;
> >  	uint64_t modifier;
> >  	cairo_t *cr;
> > -	int unit;
> >  	int index;
> >  	int ret;
> >  
> > -	if (intel_gen(intel_get_drm_devid(data->drm_fd)) >= 12)
> > -		unit = 64;
> > -	else
> > -		unit = 128;
> > -
> >  	/* Use either compressed or Y-tiled to test. However, given the
> > lack of
> >  	 * available bandwidth, we use linear for the primary plane
> > when
> >  	 * testing sprites, since we cannot fit two CCS planes into the
> > @@ -218,13 +212,13 @@ static void generate_fb(data_t *data, struct
> > igt_fb *fb,
> >  		if (fb_flags & FB_MISALIGN_AUX_STRIDE) {
> >  			igt_skip_on_f(width <= 1024,
> >  				      "FB already has the smallest
> > possible stride\n");
> > -			f.pitches[index] -= (unit/2);
> > +			f.pitches[index] -= 64;
> >  		}
> >  
> >  		if (fb_flags & FB_SMALL_AUX_STRIDE) {
> >  			igt_skip_on_f(width <= 1024,
> >  				      "FB already has the smallest
> > possible stride\n");
> > -			f.pitches[index] = ALIGN(f.pitches[1]/2, unit);
> > +			f.pitches[index] = ALIGN(f.pitches[1]/2, 128);
> >  		}
> >  
> >  		if (fb_flags & FB_ZERO_AUX_STRIDE)
> > -- 
> > 2.17.1
> > 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
