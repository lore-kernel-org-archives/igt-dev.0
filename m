Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BC289EF7
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2020 14:05:13 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Thu, 6 Feb 2020 14:05:10 +0000
Message-ID: <1e9358007c6763f1457488dac9d0ee92dbbd0688.camel@intel.com>
References: <20200206074806.32001-1-mika.kahola@intel.com>
 <20200206133012.GA24639@ideak-desk.fi.intel.com>
In-Reply-To: <20200206133012.GA24639@ideak-desk.fi.intel.com>
Content-Language: en-US
Content-ID: <171A32251942344A8077F3B1A12B238D@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_ccs: Select highest
 resolution
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

On Thu, 2020-02-06 at 15:30 +0200, Imre Deak wrote:
> On Thu, Feb 06, 2020 at 09:48:06AM +0200, Mika Kahola wrote:
> > In some cases we select resolution that is insufficient for testing
> > and we receive unnecessary skips on CI. Let's loop through all
> > available
> > modes and select the higest one when running the tests.
> > 
> > v2: Pointer to drmModeModeInfo (Imre)
> >     Set default to back to preferred mode (Imre)
> >     Search mode only in cases with misaligned or small aux strides
> >     test flags (Imre)
> >     Fix requirement to from vertical to horizontal (Imre)
> > 
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  tests/kms_ccs.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> > index 2259a4f1..f1f6cc6b 100644
> > --- a/tests/kms_ccs.c
> > +++ b/tests/kms_ccs.c
> > @@ -276,6 +276,22 @@ static igt_plane_t
> > *compatible_main_plane(data_t *data)
> >  	return igt_output_get_plane_type(data->output,
> > DRM_PLANE_TYPE_PRIMARY);
> >  }
> >  
> > +static drmModeModeInfo *get_mode(drmModeModeInfo *preferred_mode,
> 
> Maybe get_wide_mode() or similar to better describe what's this node
> is
> used for?
> 
> > +				 igt_output_t *output)
> > +{
> > +	drmModeModeInfo *mode, *tmp;
> > +	int i;
> > +
> > +	mode = preferred_mode;
> > +	for (i = 0; i < output->config.connector->count_modes; i++) {
> 
> 		if (mode->hdisplay > 1024)
> 			break;
> 
> > +		tmp = &output->config.connector->modes[i];
> > +		if (tmp->hdisplay > mode->hdisplay)
> > +			mode = tmp;
> > +	}
> > +
> > +	return mode;
> > +}
> > +
> >  static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> >  		       igt_crc_t *crc)
> >  {
> > @@ -298,6 +314,12 @@ static bool try_config(data_t *data, enum
> > test_fb_flags fb_flags,
> >  				      data->ccs_modifier))
> >  		return false;
> >  
> > +	if ((fb_flags & FB_MISALIGN_AUX_STRIDE) ||
> > +	    (fb_flags & FB_SMALL_AUX_STRIDE)) {
> > +		drm_mode = get_mode(drm_mode, data->output);
> > +		igt_output_override_mode(data->output, drm_mode);
> > +	}
> > +
> >  	if (data->plane && fb_flags & FB_COMPRESSED) {
> >  		if (!igt_plane_has_format_mod(data->plane, data-
> > >format,
> >  					      data->ccs_modifier))
> 
> At the end of try_config() we need to restore the default mode:
> 	igt_output_override_mode(output, NULL);
> 
> With the above:
> Reviewed-by: Imre Deak <imre.deak@intel.com>
Pushed with the proposed changes. Thanks for the review!

-Mika-

> 
> 
> > -- 
> > 2.17.1
> > 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
