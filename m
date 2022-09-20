Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1431910E177
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Sep 2022 09:33:50 +0000 (UTC)
Message-ID: <e9ac32f5-caaa-eb1f-ee24-8731cf888ba4@intel.com>
Date: Tue, 20 Sep 2022 15:03:19 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220421143255.2161-1-mohammed.thasleem@intel.com>
 <20220421143255.2161-2-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220421143255.2161-2-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v8 1/2] tests/kms_lease: Create dynamic
 subtests
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

On Thu-21-04-2022 08:02 pm, Mohammed Thasleem wrote:
> Modified tests/kms_lease to include dynamic test cases.
> 
> v2: Updated dynamic test cases to all test cases.
> v3: Removed dynamic test for which it's not required.
> v4: Moved content of for loop in to igt_dynamic.
> v5: Minor changes.
> v6: Removed run_test which is not required.
> v7: Minor changes.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_lease.c | 55 ++++++++++++++---------------------------------
>   1 file changed, 16 insertions(+), 39 deletions(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 0bf102a6..bd713343 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -808,42 +808,6 @@ static void lease_invalid_plane(data_t *data)
>   	assert_unleased(ret);
>   }
>   
> -
> -static void run_test(data_t *data, void (*testfunc)(data_t *))
> -{
> -	lease_t *master = &data->master;
> -	igt_display_t *display = &master->display;
> -	igt_output_t *output;
> -	enum pipe p;
> -	unsigned int valid_tests = 0;
> -
> -	for_each_pipe_with_valid_output(display, p, output) {
> -		igt_info("Beginning %s on pipe %s, connector %s\n",
> -			 igt_subtest_name(),
> -			 kmstest_pipe_name(p),
> -			 igt_output_name(output));
> -
> -		data->pipe = p;
> -		data->crtc_id = pipe_to_crtc_id(display, p);
> -		data->connector_id = output->id;
> -		data->plane_id =
> -			igt_pipe_get_plane_type(&data->master.display.pipes[data->pipe],
> -						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
> -
> -		testfunc(data);
> -
> -		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
> -			 igt_subtest_name(),
> -			 kmstest_pipe_name(p),
> -			 igt_output_name(output));
> -
> -		valid_tests++;
> -	}
> -
> -	igt_require_f(valid_tests,
> -		      "no valid crtc/connector combinations found\n");
> -}
> -
>   #define assert_double_id_err(ret) \
>   	igt_assert_f((ret) == -EBUSY || (ret) == -ENOSPC, \
>   		     "wrong return code %i, %s\n", ret, \
> @@ -1218,6 +1182,9 @@ static void lease_uevent(data_t *data)
>   igt_main
>   {
>   	data_t data;
> +	igt_output_t *output;
> +	igt_display_t *display = &data.master.display;
> +
>   	const struct {
>   		const char *name;
>   		void (*func)(data_t *);
> @@ -1249,14 +1216,24 @@ igt_main
>   	igt_fixture {
>   		data.master.fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
> -		igt_display_require(&data.master.display, data.master.fd);
> +		igt_display_require(display, data.master.fd);
>   	}
>   
>   	for (f = funcs; f->name; f++) {
>   
>   		igt_describe(f->desc);
> -		igt_subtest_f("%s", f->name) {
> -			run_test(&data, f->func);
> +		igt_subtest_with_dynamic_f("%s", f->name) {
> +			for_each_pipe_with_valid_output(display, data.pipe, output) {
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
> +					      igt_output_name(output)) {
> +					data.crtc_id = pipe_to_crtc_id(display, data.pipe);
> +					data.connector_id = output->id;
> +					data.plane_id =
> +						igt_pipe_get_plane_type(&data.master.display.pipes[data.pipe],
> +								DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
> +					f->func(&data);
> +				}
> +			}
>   		}
>   	}
>   
