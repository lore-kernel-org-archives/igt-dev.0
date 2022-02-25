Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953AB10E3CE
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 15:51:31 +0000 (UTC)
Date: Fri, 25 Feb 2022 17:50:42 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Yhj60m/LjK4lNY4H@platvala-desk.ger.corp.intel.com>
References: <20220225144436.17718-1-swati2.sharma@intel.com>
 <20220225144436.17718-7-swati2.sharma@intel.com>
 <YhjqktSA3V0zqlVA@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhjqktSA3V0zqlVA@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [v7 6/8] tests/kms_plane_scaling: Add negative test
 to check num of scalers
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

On Fri, Feb 25, 2022 at 04:41:22PM +0200, Petri Latvala wrote:
> On Fri, Feb 25, 2022 at 08:14:34PM +0530, Swati Sharma wrote:
> > To validate i915 supports max of 2 scalers, applied upscaling on
> > 3 planes simultaneously. This is a negative test and commit is expected
> > to fail.
> > 
> > v2: -add check for min 2 scalers
> >     -add igt_require() for overlay planes, fixes CRASH on KBL
> > v3: -rebase
> > 
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > ---
> >  tests/kms_plane_scaling.c | 73 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> > 
> > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > index 6fc10d59..5df9ba24 100644
> > --- a/tests/kms_plane_scaling.c
> > +++ b/tests/kms_plane_scaling.c
> > @@ -652,6 +652,71 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
> >  	igt_remove_fb(display->drm_fd, &d->fb[2]);
> >  }
> >  
> > +static void
> > +test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
> > +{
> > +	igt_display_t *display = &d->display;
> > +	igt_pipe_t *pipe_obj = &display->pipes[pipe];
> > +	int width, height, width1, height1;
> > +	drmModeModeInfo *mode;
> > +
> > +	cleanup_crtc(d);
> > +
> > +	igt_output_set_pipe(output, pipe);
> > +
> > +	width = height = 20;
> > +	mode = igt_output_get_mode(output);
> > +	width1 = mode->hdisplay;
> > +	height1 = mode->vdisplay;
> > +
> > +	d->plane1 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
> > +	igt_require(d->plane1);
> > +	d->plane2 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
> > +	igt_require(d->plane2);
> > +	d->plane3 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 2);
> > +	igt_require(d->plane3);
> > +
> > +	igt_create_color_pattern_fb(display->drm_fd,
> > +                                    width, height,
> > +                                    DRM_FORMAT_XRGB8888,
> > +                                    I915_TILING_NONE,
> > +                                    1.0, 0.0, 0.0, &d->fb[1]);
> > +	igt_create_color_pattern_fb(display->drm_fd,
> > +                                    width, height,
> > +                                    DRM_FORMAT_XRGB8888,
> > +                                    I915_TILING_NONE,
> > +                                    0.0, 1.0, 0.0, &d->fb[2]);
> > +	igt_create_color_pattern_fb(display->drm_fd,
> > +                                    width, height,
> > +                                    DRM_FORMAT_XRGB8888,
> > +                                    I915_TILING_NONE,
> > +                                    0.0, 0.0, 1.0, &d->fb[3]);
> > +
> > +	igt_plane_set_fb(d->plane1, &d->fb[1]);
> > +	igt_plane_set_fb(d->plane2, &d->fb[2]);
> > +	igt_plane_set_fb(d->plane3, &d->fb[3]);
> > +
> > +	/* first plane upscaling */
> > +	igt_plane_set_size(d->plane1, width1, height1);
> > +	/* second plane upscaling */
> > +	igt_plane_set_size(d->plane2, width1, height1);
> > +	/* third plane upscaling */
> > +	igt_plane_set_size(d->plane3, width1, height1);
> > +
> > +	/* This commit is expectd to fail as we can have max 2 scalers/pipe
> > +	 * In dmesg, you can find: Too many scaling requests 3 > 2
> > +	 * */
> 
> That assumption only holds for i915 devices, and that can possibly
> change in the future.
> 
> As the goal is to test that too many scalings is rejected with EINVAL,
> this assumption needs to be written down:
> 
> igt_require(get_num_scalers(d, pipe) < 3);
> 
> done preferably before creating the fbs to save some time.
> 
> 

Some notes from offline discussion:

This test will eventually be changed to not assume number of scalers
at all, and will test for EINVAL or success.


-- 
Petri Latvala
