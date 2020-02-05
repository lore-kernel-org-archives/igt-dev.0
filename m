Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38C56E9AD
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2020 14:29:07 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Wed, 5 Feb 2020 14:29:05 +0000
Message-ID: <6bc718892a4dc05a13580f11eef64309182e4b1a.camel@intel.com>
References: <20200128143054.23907-1-mika.kahola@intel.com>
 <20200205140421.GA4899@ideak-desk.fi.intel.com>
In-Reply-To: <20200205140421.GA4899@ideak-desk.fi.intel.com>
Content-Language: en-US
Content-ID: <A25455C0844CBE4F8AF4AEDF4A8E498D@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_ccs: Select highest resolution
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

On Wed, 2020-02-05 at 16:04 +0200, Imre Deak wrote:
> On Tue, Jan 28, 2020 at 04:30:54PM +0200, Mika Kahola wrote:
> > In some cases we select resolution that is insufficient for testing
> > and we receive unnecessary skips on CI. Let's loop through all
> > available
> > modes and select the higest one when running the tests.
> > 
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  tests/kms_ccs.c | 30 ++++++++++++++++++++++++------
> >  1 file changed, 24 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> > index 2259a4f1..ddc6a30b 100644
> > --- a/tests/kms_ccs.c
> > +++ b/tests/kms_ccs.c
> > @@ -276,12 +276,28 @@ static igt_plane_t
> > *compatible_main_plane(data_t *data)
> >  	return igt_output_get_plane_type(data->output,
> > DRM_PLANE_TYPE_PRIMARY);
> >  }
> >  
> > +static drmModeModeInfo get_mode(igt_output_t *output)
> 
> Should return a ptr to drmModeModeInfo.
> 
> > +{
> > +	const drmModeModeInfo *mode;
> > +	drmModeModeInfo *tmp;
> > +	int i;
> > +
> > +	mode = &output->config.connector->modes[0];
> 
> Let's still default to the preferred mode:
> 
> 	mode = igt_output_get_mode(output);
> 
> and then look for a wide enough mode only for the
> test_fb_flags & (FB_MISALIGN_AUX_STRIDE|FB_SMALL_AUX_STRIDE)
> case. That would have minimal effect on existing unrelated test
> cases.
> 
> > +	for (i = 1; i < output->config.connector->count_modes; i++) {
> > +		tmp = &output->config.connector->modes[i];
> > +		if (tmp->vdisplay > mode->vdisplay)
> 
> The requirement is mode->hdisplay > 1024, so we should look for such
> a
> mode starting from the default one above.
Thanks for the review! I will fix these issues.

-Mika-

> 
> > +			mode = tmp;
> > +	}
> > +
> > +	return *mode;
> > +}
> > +
> >  static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> >  		       igt_crc_t *crc)
> >  {
> >  	igt_display_t *display = &data->display;
> >  	igt_plane_t *primary = compatible_main_plane(data);
> > -	drmModeModeInfo *drm_mode = igt_output_get_mode(data->output);
> > +	drmModeModeInfo drm_mode = get_mode(data->output);
> >  	enum igt_commit_style commit;
> >  	struct igt_fb fb, fb_sprite;
> >  	int ret;
> > @@ -298,25 +314,27 @@ static bool try_config(data_t *data, enum
> > test_fb_flags fb_flags,
> >  				      data->ccs_modifier))
> >  		return false;
> >  
> > +	igt_output_override_mode(data->output, &drm_mode);
> > +
> >  	if (data->plane && fb_flags & FB_COMPRESSED) {
> >  		if (!igt_plane_has_format_mod(data->plane, data-
> > >format,
> >  					      data->ccs_modifier))
> >  			return false;
> >  
> > -		generate_fb(data, &fb, min(MAX_SPRITE_PLANE_WIDTH,
> > drm_mode->hdisplay),
> > -			    drm_mode->vdisplay,
> > +		generate_fb(data, &fb, min(MAX_SPRITE_PLANE_WIDTH,
> > drm_mode.hdisplay),
> > +			    drm_mode.vdisplay,
> >  			    (fb_flags & ~FB_COMPRESSED) |
> > FB_HAS_PLANE);
> >  		generate_fb(data, &fb_sprite, 256, 256, fb_flags);
> >  	} else {
> > -		generate_fb(data, &fb, min(MAX_SPRITE_PLANE_WIDTH,
> > drm_mode->hdisplay),
> > -			    drm_mode->vdisplay, fb_flags);
> > +		generate_fb(data, &fb, min(MAX_SPRITE_PLANE_WIDTH,
> > drm_mode.hdisplay),
> > +			    drm_mode.vdisplay, fb_flags);
> >  	}
> >  
> >  	if (data->flags & TEST_FAIL_ON_ADDFB2)
> >  		return true;
> >  
> >  	igt_plane_set_position(primary, 0, 0);
> > -	igt_plane_set_size(primary, drm_mode->hdisplay, drm_mode-
> > >vdisplay);
> > +	igt_plane_set_size(primary, drm_mode.hdisplay,
> > drm_mode.vdisplay);
> >  	igt_plane_set_fb(primary, &fb);
> >  
> >  	if (data->plane && fb_flags & FB_COMPRESSED) {
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
