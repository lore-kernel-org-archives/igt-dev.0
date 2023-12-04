Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B2D10E137
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 13:11:21 +0000 (UTC)
Date: Mon, 4 Dec 2023 12:11:10 -0100
From: Melissa Wen <mwen@igalia.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231204131055.2c3dfaw633a7d2l3@mail.igalia.com>
References: <20231201132706.84787-1-mwen@igalia.com>
 <20231201143820.q4fkuoycxqg2sdeo@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201143820.q4fkuoycxqg2sdeo@kamilkon-desk.igk.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_atomic: skip mutable zpos
 test on non-mutable planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12/01, Kamil Konieczny wrote:
> Hi Melissa,
> On 2023-12-01 at 12:26:09 -0100, Melissa Wen wrote:
> > plane-primary-overlay-mutable-zpos only works if both plane types have
> > mutable zpos property. However, drivers usually set primary zpos as
> > immutable and the test case just fails. Create a helper to check if a
> > plane have mutable zpos and skip the test case if zpos changes are not
> > allowed.
> > 
> > v1: https://patchwork.freedesktop.org/patch/554257
> > 
> > v2:
> > - document the new public function (Kamil)
> > - improve commit message (Kamil)
> > - rebase on master and replace has_zpos() by has_mutable_zpos()
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks!

Applied to master.

Melissa
> 
> > ---
> >  lib/igt_kms.c      | 28 ++++++++++++++++++++++++++++
> >  lib/igt_kms.h      |  2 ++
> >  tests/kms_atomic.c |  8 ++++----
> >  3 files changed, 34 insertions(+), 4 deletions(-)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 28105a9ef..e4dea1a60 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -3970,6 +3970,34 @@ void igt_plane_set_prop_enum(igt_plane_t *plane,
> >  	igt_assert(igt_plane_try_prop_enum(plane, prop, val));
> >  }
> >  
> > +/**
> > + * igt_plane_check_prop_is_mutable:
> > + * @plane: Target plane.
> > + * @prop: Property to check.
> > + *
> > + * Check if a plane supports a given property and if this property is mutable.
> > + *
> > + * Returns true if the plane has the mutable property. False if the property is
> > + * not support or it's immutable.
> > + */
> > +bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
> > +				     enum igt_atomic_plane_properties igt_prop)
> > +{
> > +	drmModePropertyPtr prop;
> > +	uint64_t value;
> > +	bool has_prop;
> > +
> > +	has_prop = kmstest_get_property(plane->pipe->display->drm_fd,
> > +					plane->drm_plane->plane_id,
> > +					DRM_MODE_OBJECT_PLANE,
> > +				        igt_plane_prop_names[igt_prop], NULL,
> > +					&value, &prop);
> > +	if (!has_prop)
> > +		return false;
> > +
> > +	return !(prop->flags & DRM_MODE_PROP_IMMUTABLE);
> > +}
> > +
> >  /**
> >   * igt_plane_replace_prop_blob:
> >   * @plane: plane to set property on.
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 8e7801a78..b3882808b 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -812,6 +812,8 @@ extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
> >  					enum igt_atomic_plane_properties prop,
> >  					const void *ptr, size_t length);
> >  
> > +extern bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
> > +					    enum igt_atomic_plane_properties igt_prop);
> >  /**
> >   * igt_output_has_prop:
> >   * @output: Output to check.
> > diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> > index aa3af936a..96cd58571 100644
> > --- a/tests/kms_atomic.c
> > +++ b/tests/kms_atomic.c
> > @@ -1354,10 +1354,10 @@ static void atomic_clear(data_t *data, enum pipe pipe, igt_output_t *output)
> >  	igt_remove_fb(data->drm_fd, &data->fb);
> >  }
> >  
> > -/* Returns true if plane supports zpos property. */
> > -static bool has_zpos(igt_plane_t *plane)
> > +/* Returns true if plane supports zpos property and it's mutable. */
> > +static bool has_mutable_zpos(igt_plane_t *plane)
> >  {
> > -	return igt_plane_has_prop(plane, IGT_PLANE_ZPOS);
> > +	return igt_plane_check_prop_is_mutable(plane, IGT_PLANE_ZPOS);
> >  }
> >  
> >  static bool
> > @@ -1457,7 +1457,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
> >  			atomic_setup(&data, pipe, output);
> >  			if (!overlay)
> >  				continue;
> > -			if (!has_zpos(data.primary) || !has_zpos(overlay))
> > +			if (!has_mutable_zpos(data.primary) || !has_mutable_zpos(overlay))
> >  				continue;
> >  			if (!igt_plane_has_format_mod(data.primary, DRM_FORMAT_ARGB8888, 0x0) ||
> >  			    !igt_plane_has_format_mod(overlay, DRM_FORMAT_ARGB1555, 0x0))
> > -- 
> > 2.42.0
> > 
