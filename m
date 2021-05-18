Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDA56E06D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 May 2021 07:00:33 +0000 (UTC)
Date: Tue, 18 May 2021 10:01:54 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YKNmYmvFRE82i6b1@platvala-desk.ger.corp.intel.com>
References: <20210513145352.2790280-1-markyacoub@chromium.org>
 <20210513211658.tkx23qdmqciptexx@outlook.office365.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513211658.tkx23qdmqciptexx@outlook.office365.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_panel_fitting: Move Intel GEN check
 under a is_i915_device
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
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, hersenxs.wu@amd.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 13, 2021 at 05:16:58PM -0400, Rodrigo Siqueira wrote:
> On 05/13, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> > 
> > Encapsulate intel-only operations such as intel_get_drm_devid under a is_i915_device check.
> > 
> > This allows the subtests to run on non-i915 devices.
> > ---
> >  tests/kms_panel_fitting.c | 61 +++++++++++++++++++++++----------------
> >  1 file changed, 36 insertions(+), 25 deletions(-)
> > 
> > diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> > index 4f4c5608..0c028c69 100644
> > --- a/tests/kms_panel_fitting.c
> > +++ b/tests/kms_panel_fitting.c
> > @@ -89,7 +89,7 @@ static void test_panel_fitting(data_t *d)
> >  
> >  	for_each_pipe_with_valid_output(display, pipe, output) {
> >  		drmModeModeInfo *mode, native_mode;
> > -		uint32_t devid = intel_get_drm_devid(display->drm_fd);
> > +		bool is_plane_scaling_active = true;
> >  
> >  		/* Check that the "scaling mode" property has been set. */
> >  		if (!igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
> > @@ -132,25 +132,26 @@ static void test_panel_fitting(data_t *d)
> >  		igt_fb_set_size(&d->fb2, d->plane2, d->fb2.width-200, d->fb2.height-200);
> >  		igt_plane_set_position(d->plane2, 100, 100);
> >  
> > -		/*
> > -		 * Most of gen7 and all of gen8 doesn't support plane scaling
> > -		 * at all.
> > -		 *
> > -		 * gen9 pipe C has only 1 scaler shared with the crtc, which
> > -		 * means pipe scaling can't work simultaneously with panel
> > -		 * fitting.
> > -		 *
> > -		 * Since this is the legacy path, userspace has to know about
> > -		 * the HW limitations, whereas atomic can ask.
> > -		 */
> > -		if (IS_GEN8(devid) ||
> > -		    (IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
> > -		    (IS_GEN9(devid) && pipe == PIPE_C))
> > -			/* same as visible area of fb => no scaling */
> > -			igt_plane_set_size(d->plane2,
> > -					   d->fb2.width-200,
> > -					   d->fb2.height-200);
> > -		else
> > +		if (is_i915_device(display->drm_fd)) {
> > +			uint32_t devid = intel_get_drm_devid(display->drm_fd);
> > +			/*
> > +			 * Most of gen7 and all of gen8 doesn't support plane scaling
> > +			 * at all.
> > +			 *
> > +			 * gen9 pipe C has only 1 scaler shared with the crtc, which
> > +			 * means pipe scaling can't work simultaneously with panel
> > +			 * fitting.
> > +			 *
> > +			 * Since this is the legacy path, userspace has to know about
> > +			 * the HW limitations, whereas atomic can ask.
> > +			 */
> > +			if (IS_GEN8(devid) ||
> > +				(IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
> > +				(IS_GEN9(devid) && pipe == PIPE_C)) {
> > +				is_plane_scaling_active = false;
> > +			}
> > +		}
> > +		if (is_plane_scaling_active) {
> >  			/*
> >  			 * different than visible area of fb => plane scaling
> >  			 * active
> > @@ -158,6 +159,13 @@ static void test_panel_fitting(data_t *d)
> >  			igt_plane_set_size(d->plane2,
> >  					   mode->hdisplay-200,
> >  					   mode->vdisplay-200);
> > +		}
> > +		else {
> > +			/* same as visible area of fb => no scaling */
> > +			igt_plane_set_size(d->plane2,
> > +				d->fb2.width - 200,
> > +				d->fb2.height - 200);
> > +		}
> >  
> >  		/* Plane scaling active (if possible), pfit off */
> >  		igt_display_commit2(display, COMMIT_UNIVERSAL);
> > @@ -229,13 +237,16 @@ static void test_atomic_fastset(data_t *data)
> >  	int valid_tests = 0;
> >  	struct stat sb;
> >  
> > -	/* Until this is force enabled, force modeset evasion. */
> > -	if (stat("/sys/module/i915/parameters/fastboot", &sb) == 0)
> > -		igt_set_module_param_int(data->drm_fd, "fastboot", 1);
> >  
> > -	igt_require(display->is_atomic);
> > -	igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >= 5);
> > +	if (is_i915_device(display->drm_fd)) {
> > +		/* Until this is force enabled, force modeset evasion. */
> > +		if (stat("/sys/module/i915/parameters/fastboot", &sb) == 0)
> > +			igt_set_module_param_int(data->drm_fd, "fastboot", 1);
> >  
> > +		igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >= 5);
> > +	}
> > +
> > +	igt_require(display->is_atomic);
> >  	for_each_pipe_with_valid_output(display, pipe, output) {
> >  		if (!igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE))
> >  			continue;
> > -- 
> > 2.31.1.607.g51e8a6a459-goog
> > 
> 
> Hi Mark,
> 
> I tested it in a Raven system, and now I can see it failing in a good
> way in my system. Nice patch, thanks.
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>


Merged now, thanks.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
