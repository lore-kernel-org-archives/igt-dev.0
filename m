Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1950710E72C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Oct 2022 10:40:07 +0000 (UTC)
Message-ID: <f287826f-993d-147c-7341-9630e40ab9a3@intel.com>
Date: Fri, 14 Oct 2022 16:09:46 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20221010201130.35343-1-mohammed.thasleem@intel.com>
 <20221010201130.35343-3-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20221010201130.35343-3-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v6 2/2] tests/kms_properties: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue-11-10-2022 01:41 am, Mohammed Thasleem wrote:
> Sanitize the system state before starting the subtest.
> Removed redundant code and Replace for loop with
> for_each_disconnected_output.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_properties.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index bcc8fbdd..21a33afa 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -43,6 +43,7 @@ static void prepare_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
>   	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
>   			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
>   
> +	igt_display_reset(display);
>   	igt_output_set_pipe(output, pipe);
>   
>   	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
> @@ -256,7 +257,6 @@ static void crtc_properties(igt_display_t *display, bool atomic)
>   
>   static void connector_properties(igt_display_t *display, bool atomic)
>   {
> -	int i;
>   	enum pipe pipe;
>   	igt_output_t *output;
>   
> @@ -275,9 +275,8 @@ static void connector_properties(igt_display_t *display, bool atomic)
>   
>   	}
>   
> -	for (i = 0; i < display->n_outputs; i++)
> -		if (!igt_output_is_connected(&display->outputs[i]))
> -			run_connector_property_tests(display, PIPE_NONE, &display->outputs[i], atomic);
> +	for_each_disconnected_output(display, output)
> +		run_connector_property_tests(display, PIPE_NONE, output, atomic);
>   }
>   
>   static void test_invalid_properties(int fd,
> @@ -345,7 +344,6 @@ static void test_object_invalid_properties(igt_display_t *display,
>   	igt_output_t *output;
>   	igt_plane_t *plane;
>   	enum pipe pipe;
> -	int i;
>   
>   	for_each_pipe(display, pipe)
>   		test_invalid_properties(display->drm_fd, id, type, display->pipes[pipe].crtc_id, DRM_MODE_OBJECT_CRTC, atomic);
> @@ -354,7 +352,7 @@ static void test_object_invalid_properties(igt_display_t *display,
>   		for_each_plane_on_pipe(display, pipe, plane)
>   			test_invalid_properties(display->drm_fd, id, type, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
>   
> -	for (i = 0, output = &display->outputs[0]; i < display->n_outputs; output = &display->outputs[++i])
> +	for_each_connected_output(display, output)

These two things are completely different.

- Bhanu

>   		test_invalid_properties(display->drm_fd, id, type, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
>   }
>   
> @@ -646,9 +644,8 @@ static void expect_no_props(int fd, uint32_t obj_type, uint32_t obj_id)
>   	igt_assert_neq(drmIoctl(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &properties), 0);
>   }
>   
> -static void get_prop_sanity(igt_display_t *display, bool atomic)
> +static void get_prop_sanity(int fd, bool atomic)
>   {
> -	int fd = display->drm_fd;
>   	drmModePlaneResPtr plane_res;
>   	drmModeResPtr res;
>   
> @@ -758,7 +755,7 @@ igt_main
>   		igt_subtest("get_properties-sanity-non-atomic") {
>   			if (display.is_atomic)
>   				igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 0), 0);
> -			get_prop_sanity(&display, false);
> +			get_prop_sanity(display.drm_fd, false);
>   			if (display.is_atomic)
>   				igt_assert_eq(drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1), 0);
>   		}
> @@ -768,7 +765,7 @@ igt_main
>   
>   		igt_describe("Test validates the properties of all planes, crtc and connectors with atomic commit");
>   		igt_subtest("get_properties-sanity-atomic")
> -			get_prop_sanity(&display, true);
> +			get_prop_sanity(display.drm_fd, true);
>   	}
>   
>   	igt_fixture {
