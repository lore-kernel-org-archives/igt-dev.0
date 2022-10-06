Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282110E888
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Oct 2022 19:56:54 +0000 (UTC)
Date: Thu, 6 Oct 2022 22:56:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Message-ID: <Yz8y/zn5q05WeOsR@intel.com>
References: <20220928133703.55196-1-mohammed.thasleem@intel.com>
 <20221006193319.230261-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006193319.230261-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_properties: Create dynamic
 subtests
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

On Fri, Oct 07, 2022 at 01:03:19AM +0530, Mohammed Thasleem wrote:
> Modified kms_properties to include dynamic test cases.
> 
> v2: Fixed compilation issue.
> v3: Removed redundant code.
> v4: Moved get_prop_sanity calls to igt_subtest_group.
> v5: Replace for loop with for_each_disconnected_output.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/kms_properties.c | 176 ++++++++++++++++++-----------------------
>  1 file changed, 77 insertions(+), 99 deletions(-)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 2958efac..76ef64ab 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -43,6 +43,7 @@ static void prepare_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
>  	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
>  			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
>  
> +	igt_display_reset(display);
>  	igt_output_set_pipe(output, pipe);
>  
>  	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
> @@ -230,77 +231,52 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
>  
>  static void plane_properties(igt_display_t *display, bool atomic)
>  {
> -	bool found_any = false, found;
>  	igt_output_t *output;
>  	enum pipe pipe;
>  
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
> -	for_each_pipe(display, pipe) {
> -		found = false;
> -
> -		for_each_valid_output_on_pipe(display, pipe, output) {
> -			found_any = found = true;
> -
> +	for_each_pipe_with_single_output(display, pipe, output) {
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			      igt_output_name(output)) {
>  			run_plane_property_tests(display, pipe, output, atomic);
> -			break;
>  		}
>  	}
> -
> -	igt_skip_on(!found_any);
>  }
>  
>  static void crtc_properties(igt_display_t *display, bool atomic)
>  {
> -	bool found_any_valid_pipe = false, found;
>  	enum pipe pipe;
>  	igt_output_t *output;
>  
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
> -	for_each_pipe(display, pipe) {
> -		found = false;
> -
> -		for_each_valid_output_on_pipe(display, pipe, output) {
> -			found_any_valid_pipe = found = true;
> -
> +	for_each_pipe_with_single_output(display, pipe, output) {
> +		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +			      igt_output_name(output)) {
>  			run_crtc_property_tests(display, pipe, output, atomic);
> -			break;
>  		}
>  	}
> -
> -	igt_skip_on(!found_any_valid_pipe);
>  }
>  
>  static void connector_properties(igt_display_t *display, bool atomic)
>  {
> -	int i;
>  	enum pipe pipe;
>  	igt_output_t *output;
>  
> -	if (atomic)
> -		igt_skip_on(!display->is_atomic);
> -
>  	for_each_connected_output(display, output) {
> -		bool found = false;
>  
>  		for_each_pipe(display, pipe) {
>  			if (!igt_pipe_connector_valid(pipe, output))
>  				continue;
>  
> -			found = true;
> -			run_connector_property_tests(display, pipe, output, atomic);
> -			break;
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> +				      igt_output_name(output)) {
> +				run_connector_property_tests(display, pipe, output, atomic);
> +			}
>  		}
> +		break;
>  
> -		igt_assert_f(found, "Connected output should have at least 1 valid crtc\n");
>  	}
>  
> -	for (i = 0; i < display->n_outputs; i++)
> -		if (!igt_output_is_connected(&display->outputs[i]))
> -			run_connector_property_tests(display, PIPE_NONE, &display->outputs[i], atomic);
> +	for_each_disconnected_output(display, output)

Nothing to do with the subject of this patch.

> +		run_connector_property_tests(display, PIPE_NONE, output, atomic);
>  }
>  
>  static void test_invalid_properties(int fd,
> @@ -368,7 +344,6 @@ static void test_object_invalid_properties(igt_display_t *display,
>  	igt_output_t *output;
>  	igt_plane_t *plane;
>  	enum pipe pipe;
> -	int i;
>  
>  	for_each_pipe(display, pipe)
>  		test_invalid_properties(display->drm_fd, id, type, display->pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic);
> @@ -377,7 +352,7 @@ static void test_object_invalid_properties(igt_display_t *display,
>  		for_each_plane_on_pipe(display, pipe, plane)
>  			test_invalid_properties(display->drm_fd, id, type, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
>  
> -	for (i = 0, output = &display->outputs[0]; i < display->n_outputs; output = &display->outputs[++i])
> +	for_each_connected_output(display, output)

Those two things are not at all the same.

There are clearly multiple patches hiding inside this single mega
patch of yours. Please split it up properly.

-- 
Ville Syrjälä
Intel
