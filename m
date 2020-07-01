Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BFF6E5D2
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2020 07:04:34 +0000 (UTC)
From: "Khajapasha, Mohammed" <mohammed.khajapasha@intel.com>
Date: Wed, 1 Jul 2020 07:04:30 +0000
Message-ID: <DM6PR11MB2938B173A6E99270FB67E43AE96C0@DM6PR11MB2938.namprd11.prod.outlook.com>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
 <20200625062318.26368-1-mohammed.khajapasha@intel.com>
 <20200625062318.26368-2-mohammed.khajapasha@intel.com>
 <20200630120205.tly2cdeq3kjf7kj6@ahiler-desk1.fi.intel.com>
In-Reply-To: <20200630120205.tly2cdeq3kjf7kj6@ahiler-desk1.fi.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/7] lib/igt_kms: Add support for
 display with non-contiguous pipes
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
To: "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Hiler, Arkadiusz <arkadiusz.hiler@intel.com>
> Sent: Tuesday, June 30, 2020 5:32 PM
> To: Khajapasha, Mohammed <mohammed.khajapasha@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t v3 1/7] lib/igt_kms: Add support for display with
> non-contiguous pipes
> 
> On Thu, Jun 25, 2020 at 11:53:12AM +0530, Mohammed Khajapasha wrote:
> > Add support for non-contiguous pipe display by allocating upper bound
> > pipes array for display. Set the pipe enum name to igt pipe for
> > enabled pipes in drm.
> >
> > v3:
> >     Avoiding calling get pipe from crtc id ioctl for non i915 device
> >     (petri)
> >
> > Signed-off-by: Mohammed Khajapasha
> <mohammed.khajapasha@intel.com>
> > ---
> >  lib/igt_kms.c | 58
> > ++++++++++++++++++++++++++++++++++++++++++++-------
> >  lib/igt_kms.h | 13 +++++++-----
> >  2 files changed, 58 insertions(+), 13 deletions(-)
> >
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c index afef5939..1b20c7e8
> > 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -1888,13 +1888,14 @@ void igt_display_require(igt_display_t
> > *display, int drm_fd)  {
> >  	drmModeRes *resources;
> >  	drmModePlaneRes *plane_resources;
> > -	int i;
> > +	int i, i915_dev;
> 
> Would be beter to name this is_i915_dev and make it bool.
> 
> >  	memset(display, 0, sizeof(igt_display_t));
> >
> >  	LOG_INDENT(display, "init");
> >
> >  	display->drm_fd = drm_fd;
> > +	i915_dev = is_i915_device(drm_fd);
> >
> >  	resources = drmModeGetResources(display->drm_fd);
> >  	if (!resources)
> > @@ -1921,10 +1922,37 @@ void igt_display_require(igt_display_t
> *display, int drm_fd)
> >  	 * We cache the number of pipes, that number is a physical limit of
> the
> >  	 * hardware and cannot change of time (for now, at least).
> >  	 */
> > -	display->n_pipes = resources->count_crtcs;
> > +	if (i915_dev)
> > +		display->n_pipes = IGT_MAX_PIPES;
> > +	else
> > +		display->n_pipes = resources->count_crtcs;
> 
> I don't think this if is necessary - we can always roll with n_pipes ==
> IGT_MAX_PIPES, and the ones that are not there will be pipe->enabled ==
> 0.
> 
> >  	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
> >  	igt_assert_f(display->pipes, "Failed to allocate memory for %d
> > pipes\n", display->n_pipes);
> >
> > +	for(i = 0; i < resources->count_crtcs; i++) {
>            ^ missing space
> 
> > +		igt_pipe_t *pipe;
> > +
> > +		if (i915_dev) {
>                                ^ tailing whitespace
> 
> > +			/* Get right pipe enum from kernel for a pipe */
> > +			struct drm_i915_get_pipe_from_crtc_id get_pipe;
> 
> I see that we don't have anything similar for other drivers.
> 
> I would extend the comment here a bit to explain the background of why
> we have this i915 check and special case for it. Mention non-continous
> pipes and explain a bit on pipe to crtc mapping.
> 

The i915 check has been introduced as per previous review comments in
https://patchwork.freedesktop.org/patch/369594/?series=78198&rev=1 

> > +
> > +			get_pipe.pipe = 0;
> > +			get_pipe.crtc_id =  resources->crtcs[i];
> > +			do_ioctl(display->drm_fd,
> > +
> 	DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID, &get_pipe);
> > +			pipe = &display->pipes[get_pipe.pipe];
> > +			pipe->pipe = get_pipe.pipe;
> > +		}
> > +		else {
> > +			pipe = &display->pipes[i];
> > +			pipe->pipe = i;
> > +		}
> > +
> > +		pipe->enabled = true;
> > +		pipe->crtc_id = resources->crtcs[i];
> > +	}
> > +
> >  	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES,
> 1);
> >  	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
> >  		display->is_atomic = 1;
> > @@ -1955,25 +1983,33 @@ void igt_display_require(igt_display_t
> *display, int drm_fd)
> >  	for_each_pipe(display, i) {
> >  		igt_pipe_t *pipe = &display->pipes[i];
> >  		igt_plane_t *plane;
> > -		int p = 1;
> > +		int p = 1, k = 0;
> >  		int j, type;
> >  		uint8_t last_plane = 0, n_planes = 0;
> >
> > -		pipe->crtc_id = resources->crtcs[i];
> >  		pipe->display = display;
> > -		pipe->pipe = i;
> >  		pipe->plane_cursor = -1;
> >  		pipe->plane_primary = -1;
> >  		pipe->planes = NULL;
> >
> >  		igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS,
> igt_crtc_prop_names);
> >
> > +		/* Get valid crtc index from crtcs */
> > +		if (i915_dev) {
> > +			for(k = 0; k < resources->count_crtcs; k++) {
> > +				if(pipe->crtc_id == resources->crtcs[k])
> > +					break;
> > +			}
> > +		} else {
> > +			k = i;
> > +		}
> 
> I would drop the special case here as well. The i915 section although
> not optimal should for for the generic case too.
> 
> You could even extract this to a helper:
> 
> static int __get_crtc_mask_for_pipe(*resources, *pipe) {
> 	for (int offset = 0; offset < resources->count_crtcs; offset++) {
> 		if(pipe->crtc_id == resources->crtcs[offset])
> 			break;
> 	}
> 
> 	return (1 << offset);
> }
> 
> So you can then
> 
> crtc_mask = __get_crtc_mask_for_pipe(resources, pipe);
> if (drm_plane->possible_crtcs & crtc_mask) ...
> 
> This would improve readability quite a bit.
> 
> 
> >  		/* count number of valid planes */
> >  		for (j = 0; j < display->n_planes; j++) {
> >  			drmModePlane *drm_plane = display-
> >planes[j].drm_plane;
> >  			igt_assert(drm_plane);
> >
> > -			if (drm_plane->possible_crtcs & (1 << i))
> > +			if (drm_plane->possible_crtcs & (1 << k))
> >  				n_planes++;
> >  		}
> >
> > @@ -1987,7 +2023,7 @@ void igt_display_require(igt_display_t *display,
> int drm_fd)
> >  			igt_plane_t *global_plane = &display->planes[j];
> >  			drmModePlane *drm_plane = global_plane-
> >drm_plane;
> >
> > -			if (!(drm_plane->possible_crtcs & (1 << i)))
> > +			if (!(drm_plane->possible_crtcs & (1 << k)))
> >  				continue;
> >
> >  			type = global_plane->type;
> > @@ -2409,12 +2445,18 @@ static bool
> output_is_internal_panel(igt_output_t *output)
> >
> >  igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
> igt_output_t **chosen_outputs)
> >  {
> > -	unsigned full_pipe_mask = (1 << (display->n_pipes)) - 1,
> assigned_pipes = 0;
> > +	unsigned full_pipe_mask, assigned_pipes = 0;
> >  	igt_output_t *output;
> >  	int i, j;
> >
> >  	memset(chosen_outputs, 0, sizeof(*chosen_outputs) * display-
> >n_pipes);
> >
> > +	for( i = 0; i < display->n_pipes; i++) {
> > +		igt_pipe_t *pipe = &display->pipes[i];
> > +		if (pipe->enabled)
> > +			full_pipe_mask |= (1 << i);
> > +	}
> > +
> >  	/*
> >  	 * Try to assign all outputs to the first available CRTC for
> >  	 * it, start with the outputs restricted to 1 pipe, then increase
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 32a0e4cc..e91a2094 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -341,6 +341,7 @@ typedef struct igt_plane {
> >  struct igt_pipe {
> >  	igt_display_t *display;
> >  	enum pipe pipe;
> > +	bool enabled;
> >
> >  	int n_planes;
> >  	int plane_cursor;
> > @@ -510,8 +511,9 @@ static inline bool
> igt_output_is_connected(igt_output_t *output)
> >   * depends upon runtime probing of the actual kms driver that is being
> tested.
> >   * Use #for_each_pipe_static instead.
> >   */
> > -#define for_each_pipe(display, pipe)
> 	\
> > -	for (pipe = 0; assert(igt_can_fail()), pipe <
> igt_display_get_n_pipes(display); pipe++)
> > +#define for_each_pipe(display, pipe) \
> > +	for_each_pipe_static(pipe) \
> > +		for_each_if((display)->pipes[(pipe)].enabled)
> 
> This may break with the n_pipes = count_crtcs if count_crtcs <
> IGT_MAX_PIPES
> you will end addressing not allocated memory here.
> 
> If follow the recommendation on making n_pipes == IGT_MAX_PIPES, then
> this potential issue is not a problem.
> 
> --
> Cheers,
> Arek
> 
> >  /**
> >   * for_each_pipe_with_valid_output:
> > @@ -530,8 +532,9 @@ static inline bool
> igt_output_is_connected(igt_output_t *output)
> >  	for (int con__ = (pipe) = 0; \
> >  	     assert(igt_can_fail()), (pipe) < igt_display_get_n_pipes((display))
> && con__ < (display)->n_outputs; \
> >  	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe =
> pipe + 1, 0)) \
> > -		for_each_if ((((output) = &(display)->outputs[con__]), \
> > -			     igt_pipe_connector_valid((pipe), (output))))
> > +		 for_each_if((display)->pipes[pipe].enabled) \
> > +			for_each_if ((((output) = &(display)-
> >outputs[con__]), \
> > +
> 	igt_pipe_connector_valid((pipe), (output))))
> >
> >  igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
> >  					   igt_output_t **chosen_outputs);
> > @@ -549,7 +552,7 @@ igt_output_t
> **__igt_pipe_populate_outputs(igt_display_t *display,
> >  #define for_each_pipe_with_single_output(display, pipe, output) \
> >  	for (igt_output_t *__outputs[(display)->n_pipes], \
> >  	     **__output = __igt_pipe_populate_outputs((display),
> __outputs); \
> > -	     __output < &__outputs[(display)->n_pipes]; __output++) \
> > +		 __output < &__outputs[(display)->n_pipes]; __output++) \
> >  		for_each_if (*__output && \
> >  			     ((pipe) = (__output - __outputs), (output) =
> *__output, 1))
> >
> > --
> > 2.24.1
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
