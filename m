Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BD16E2E0
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 08:27:56 +0000 (UTC)
Date: Thu, 26 Mar 2020 10:23:21 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20200326082321.GA8941@intel.com>
References: <20200326070928.30377-1-mika.kahola@intel.com>
 <20200326080423.GA8829@intel.com>
 <ef3eb33fdd4b4b909bee6ea4021407aa@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef3eb33fdd4b4b909bee6ea4021407aa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Test maximum
 number of planes supported by the platform
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 10:20:10AM +0200, Kahola, Mika wrote:
> 
> 
> -----Original Message-----
> From: Lisovskiy, Stanislav <stanislav.lisovskiy@intel.com> 
> Sent: Thursday, March 26, 2020 10:04 AM
> To: Kahola, Mika <mika.kahola@intel.com>
> Cc: igt-dev@lists.freedesktop.org; juhapekka.heikkla@gmail.com
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Test maximum number of planes supported by the platform
> 
> On Thu, Mar 26, 2020 at 09:09:28AM +0200, Mika Kahola wrote:
> > There was an error in commit 0ab05a51a059 on computing number of 
> > maximum supported planes. This patch proposes a fix to this commit by 
> > first computing the number of planes that are within platform's 
> > bandwidth requirements, resets the display and then executes the actual testing.
> > 
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  tests/kms_concurrent.c | 104 
> > +++++++++++++++++++----------------------
> >  1 file changed, 47 insertions(+), 57 deletions(-)
> > 
> > diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c index 
> > 61137139..98a115da 100644
> > --- a/tests/kms_concurrent.c
> > +++ b/tests/kms_concurrent.c
> > @@ -195,6 +195,27 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
> >  	igt_plane_set_fb(data->plane[primary->index], 
> > &data->fb[primary->index]);  }
> >  
> > +static int test_bandwidth(data_t *data, enum pipe pipe, igt_output_t 
> > +*output) {
> > +
> > +	int n_planes = data->display.pipes[pipe].n_planes;
> > +	int max_planes;
> > +	int i;
> > +	int ret;
> > +
> > +	igt_pipe_refresh(&data->display, pipe, true);
> > +
> > +	for (i = 1; i <= n_planes; i++) {
> > +		prepare_planes(data, pipe, i, output);
> > +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC | DRM_MODE_ATOMIC_TEST_ONLY);
> > +		if (ret != 0)
> > +			break;          => this will leave max_planes ununitialized if commit fails for i==1
> > +		max_planes = i;
> > +	}
> > +
> > +	return max_planes;
> > +}
> 
> This code might return uninitialized max_planes. For example you start cycle, igt_display_commit2 returns non-zero, then you break, but max_planes is left uninitialized and then garbage is returned. 
> 
> You actually don't even need max_planes variable - could just return i - 1, thus avoiding unnecessary assignments or otherwise should initialize max_planes with 0.
> 
> Stan
> 
> You're propably right. One shouldn't take granted that variable is initialized as 0. Actually, that wouldn't make any sense either. I'll go by returning i-1 as you proposed. 
> 
> Thanks for the review!

I think only global or static variables are initialized as 0(unless there is some sneak gcc option I'm not aware of).
Static function itself doesn't make it's data static(in fact that naming is confusing, because static function is about
scope basically while static data is completely different story)

Got curious and built example even - nope it returns garbage :)

Stan

> 
> Cheers,
> Mika
> > +
> >  static void
> >  test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
> >  				igt_output_t *output)
> > @@ -208,7 +229,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
> >  	i = 0;
> >  	while (i < iterations || loop_forever) {
> >  		prepare_planes(data, pipe, max_planes, output);
> > -		igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> > +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >  		i++;
> >  	}
> >  }
> > @@ -241,44 +262,17 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
> >  	return mode;
> >  }
> >  
> > -static int
> > +static void
> >  test_resolution_with_output(data_t *data, enum pipe pipe, 
> > igt_output_t *output)  {
> >  	const drmModeModeInfo *mode_hi, *mode_lo;
> >  	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
> >  	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
> > -	int i, c, ret;
> > -	int max_planes = data->display.pipes[pipe].n_planes;
> > -	igt_plane_t *primary;
> > -	drmModeModeInfo *mode;
> > +	int i;
> >  
> >  	i = 0;
> >  	while (i < iterations || loop_forever) {
> >  		igt_output_set_pipe(output, pipe);
> > -		for (c = 0; c < max_planes; c++) {
> > -			igt_plane_t *plane = igt_output_get_plane(output, c);
> > -
> > -			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> > -				continue;
> > -			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > -			data->plane[primary->index] = primary;
> > -			mode = igt_output_get_mode(output);
> > -			igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> > -						DRM_FORMAT_XRGB8888,
> > -						LOCAL_I915_FORMAT_MOD_X_TILED,
> > -						0.0f, 0.0f, 1.0f,
> > -						&data->fb[primary->index]);
> > -			igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
> > -			ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> > -			if (ret) {
> > -				igt_plane_set_fb(data->plane[i], NULL);
> > -				igt_remove_fb(data->drm_fd, &data->fb[i]);
> > -				data->plane[i] = NULL;
> > -				break;
> > -			}
> > -		}
> > -		max_planes = c;
> > -		igt_assert_lt(0, max_planes);
> >  
> >  		mode_hi = igt_output_get_mode(output);
> >  		mode_lo = get_lowres_mode(data, mode_hi, output); @@ -293,48 
> > +287,35 @@ test_resolution_with_output(data_t *data, enum pipe pipe, 
> > igt_output_t *output)
> >  
> >  		i++;
> >  	}
> > -
> > -	return max_planes;
> >  }
> >  
> >  static void
> > -run_test(data_t *data, enum pipe pipe, igt_output_t *output)
> > +run_test(data_t *data, enum pipe pipe, int max_planes, igt_output_t 
> > +*output)
> >  {
> > -	int connected_outs;
> > -	int n_planes = data->display.pipes[pipe].n_planes;
> > -	int max_planes = n_planes;
> > -
> >  	if (!opt.user_seed)
> >  		opt.seed = time(NULL);
> >  
> > -	connected_outs = 0;
> > -	for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > -		igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
> > -			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
> > -
> > -		test_init(data, pipe, n_planes, output);
> > -		max_planes = test_resolution_with_output(data, pipe, output);
> > -
> > -		igt_fork(child, 1) {
> > -			test_plane_position_with_output(data, pipe, max_planes, output);
> > -		}
> > +	igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
> > +		 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
> >  
> > -		test_resolution_with_output(data, pipe, output);
> > +	test_init(data, pipe, max_planes, output);
> > +	igt_fork(child, 1) {
> > +		test_plane_position_with_output(data, pipe, max_planes, output);
> > +	}
> >  
> > -		igt_waitchildren();
> > +	test_resolution_with_output(data, pipe, output);
> >  
> > -		test_fini(data, pipe, n_planes, output);
> > +	igt_waitchildren();
> >  
> > -		connected_outs++;
> > -	}
> > +	test_fini(data, pipe, max_planes, output);
> >  
> > -	igt_skip_on(connected_outs == 0);
> >  }
> >  
> >  static void
> >  run_tests_for_pipe(data_t *data, enum pipe pipe)  {
> >  	igt_output_t *output;
> > +	int max_planes;
> >  
> >  	igt_fixture {
> >  		int valid_tests = 0;
> > @@ -348,9 +329,18 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
> >  		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
> >  	}
> >  
> > -	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
> > -		for_each_valid_output_on_pipe(&data->display, pipe, output)
> > -			run_test(data, pipe, output);
> > +	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe)) {
> > +		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> > +			int n_planes = data->display.pipes[pipe].n_planes;
> > +
> > +			test_init(data, pipe, n_planes, output);
> > +			max_planes = test_bandwidth(data, pipe, output);
> > +			test_fini(data, pipe, n_planes, output);
> > +
> > +			igt_display_reset(&data->display);
> > +			run_test(data, pipe, max_planes, output);
> > +		}
> > +	}
> >  }
> >  
> >  static int opt_handler(int option, int option_index, void *input)
> > --
> > 2.20.1
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
