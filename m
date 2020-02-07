Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869E16EAB5
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 13:06:32 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 7 Feb 2020 13:06:29 +0000
Message-ID: <caf51747735d246511e04a00b41cb79b8af52428.camel@intel.com>
References: <20200207115834.26620-1-mika.kahola@intel.com>
 <20200207130144.GB9004@ideak-desk.fi.intel.com>
In-Reply-To: <20200207130144.GB9004@ideak-desk.fi.intel.com>
Content-Language: en-US
Content-ID: <436D9DB316291045ACB9B5526E575049@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_ccs: Simplify FB width check
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

On Fri, 2020-02-07 at 15:01 +0200, Imre Deak wrote:
> On Fri, Feb 07, 2020 at 01:58:34PM +0200, Mika Kahola wrote:
> > FB size doesn't have to match with the available modes
> > on connector. We can select higher width if the selected
> > mode has a FB width less than 1024. This change conserns
> > only misaligned and short AUX stride subtests.
> > 
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> 
> Thanks, this simplifies things:
> 
> Reviewed-by: Imre Deak <imre.deak@intel.com>
Thanks for the review! Let's wait for CI results before pushing the
patch upstream.

-Mika-

> 
> > ---
> >  tests/kms_ccs.c | 31 +++++++------------------------
> >  1 file changed, 7 insertions(+), 24 deletions(-)
> > 
> > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> > index 7ea86613..fa8f624c 100644
> > --- a/tests/kms_ccs.c
> > +++ b/tests/kms_ccs.c
> > @@ -276,28 +276,13 @@ static igt_plane_t
> > *compatible_main_plane(data_t *data)
> >  	return igt_output_get_plane_type(data->output,
> > DRM_PLANE_TYPE_PRIMARY);
> >  }
> >  
> > -static drmModeModeInfo *get_wide_mode(drmModeModeInfo
> > *preferred_mode,
> > -				      igt_output_t *output)
> > -{
> > -	drmModeModeInfo *mode, *tmp;
> > -	int i;
> > -
> > -	mode = preferred_mode;
> > -	for (i = 0; i < output->config.connector->count_modes; i++) {
> > -		tmp = &output->config.connector->modes[i];
> > -		if (tmp->hdisplay > mode->hdisplay)
> > -			mode = tmp;
> > -	}
> > -
> > -	return mode;
> > -}
> > -
> >  static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> >  		       igt_crc_t *crc)
> >  {
> >  	igt_display_t *display = &data->display;
> >  	igt_plane_t *primary = compatible_main_plane(data);
> >  	drmModeModeInfo *drm_mode = igt_output_get_mode(data->output);
> > +	int fb_width = drm_mode->hdisplay;
> >  	enum igt_commit_style commit;
> >  	struct igt_fb fb, fb_sprite;
> >  	int ret;
> > @@ -315,23 +300,21 @@ static bool try_config(data_t *data, enum
> > test_fb_flags fb_flags,
> >  		return false;
> >  
> >  	if ((fb_flags & FB_MISALIGN_AUX_STRIDE) ||
> > -	    (fb_flags & FB_SMALL_AUX_STRIDE)) {
> > -		drm_mode = get_wide_mode(drm_mode, data->output);
> > -		igt_output_override_mode(data->output, drm_mode);
> > -	}
> > +	    (fb_flags & FB_SMALL_AUX_STRIDE))
> > +		fb_width = max(fb_width, 1536);
> > +
> > +	fb_width = min(MAX_SPRITE_PLANE_WIDTH, fb_width);
> >  
> >  	if (data->plane && fb_flags & FB_COMPRESSED) {
> >  		if (!igt_plane_has_format_mod(data->plane, data-
> > >format,
> >  					      data->ccs_modifier))
> >  			return false;
> >  
> > -		generate_fb(data, &fb, min(MAX_SPRITE_PLANE_WIDTH,
> > drm_mode->hdisplay),
> > -			    drm_mode->vdisplay,
> > +		generate_fb(data, &fb, fb_width, drm_mode->vdisplay,
> >  			    (fb_flags & ~FB_COMPRESSED) |
> > FB_HAS_PLANE);
> >  		generate_fb(data, &fb_sprite, 256, 256, fb_flags);
> >  	} else {
> > -		generate_fb(data, &fb, min(MAX_SPRITE_PLANE_WIDTH,
> > drm_mode->hdisplay),
> > -			    drm_mode->vdisplay, fb_flags);
> > +		generate_fb(data, &fb, fb_width, drm_mode->vdisplay,
> > fb_flags);
> >  	}
> >  
> >  	if (data->flags & TEST_FAIL_ON_ADDFB2)
> > -- 
> > 2.17.1
> > 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
