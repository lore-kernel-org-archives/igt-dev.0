Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FD38EC35
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 09:34:37 +0000 (UTC)
Message-ID: <d9da37be-20dc-ba8d-3ab1-1455a6b2ebd3@intel.com>
Date: Tue, 2 Aug 2022 15:04:16 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220801110710.95609-1-mohammed.thasleem@intel.com>
 <20220801110710.95609-2-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220801110710.95609-2-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 1/2] tests/kms_lease: Create dynamic
 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon-01-08-2022 04:37 pm, Mohammed Thasleem wrote:
> Modified tests/kms_lease to include dynamic test cases.
> 
> v2: Updated dynamic test cases to all test cases.
> v3: Removed dynamic test for which it's not required.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_lease.c | 56 +++++++++++++++++++----------------------------
>   1 file changed, 23 insertions(+), 33 deletions(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 0bf102a6..6126ded9 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -809,39 +809,20 @@ static void lease_invalid_plane(data_t *data)
>   }
>   
>   
> -static void run_test(data_t *data, void (*testfunc)(data_t *))
> +static void run_test(data_t *data, void (*testfunc)(data_t *), enum pipe p, igt_output_t *output)
>   {
>   	lease_t *master = &data->master;
>   	igt_display_t *display = &master->display;
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
>   
> -		testfunc(data);
> +	data->pipe = p;
> +	data->crtc_id = pipe_to_crtc_id(display, p);
> +	data->connector_id = output->id;
> +	data->plane_id =
> +		igt_pipe_get_plane_type(&data->master.display.pipes[data->pipe],
> +					DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
>   
> -		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
> -			 igt_subtest_name(),
> -			 kmstest_pipe_name(p),
> -			 igt_output_name(output));
> -
> -		valid_tests++;
> -	}
> +	testfunc(data);
>   
> -	igt_require_f(valid_tests,
> -		      "no valid crtc/connector combinations found\n");
>   }
>   
>   #define assert_double_id_err(ret) \
> @@ -1028,10 +1009,12 @@ static void possible_crtcs_filtering(data_t *data)
>   		igt_assert_eq(create_lease(master_fd, &mcl), 0);
>   		lease_fd = mcl.fd;
>   
> -		drmSetClientCap(lease_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> -
> -		check_crtc_masks(master_fd, lease_fd, 1 << i);
> +		igt_dynamic_f("pipe-%s", kmstest_pipe_name(i)) {

I think all the stuff inside the below loop should go to igt_dynamic

for (i = 0; i < resources->count_crtcs; i++) {}

> +			drmSetClientCap(lease_fd,
> +					DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>   
> +			check_crtc_masks(master_fd, lease_fd, 1 << i);
> +		}
>   		close(lease_fd);
>   	}
>   
> @@ -1218,6 +1201,8 @@ static void lease_uevent(data_t *data)
>   igt_main
>   {
>   	data_t data;
> +	igt_output_t *output;
> +	enum pipe p;
>   	const struct {
>   		const char *name;
>   		void (*func)(data_t *);
> @@ -1255,8 +1240,13 @@ igt_main
>   	for (f = funcs; f->name; f++) {
>   
>   		igt_describe(f->desc);
> -		igt_subtest_f("%s", f->name) {
> -			run_test(&data, f->func);
> +		igt_subtest_with_dynamic_f("%s", f->name) {
> +			for_each_pipe_with_valid_output(&data.master.display, p, output) {
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p),
> +					      igt_output_name(output)) {
> +					run_test(&data, f->func, p, output);
> +				}
> +			}
>   		}
>   	}
>   
> @@ -1267,7 +1257,7 @@ igt_main
>   
>   	igt_describe("Tests that  possible_crtcs logically match between master and "
>   		     "lease, and that the values are correctly renumbered on the lease side.");
> -	igt_subtest("possible-crtcs-filtering")
> +	igt_subtest_with_dynamic_f("possible-crtcs-filtering")

_f variant is not required.

- Bhanu

>   		possible_crtcs_filtering(&data);
>   
>   	igt_describe("Tests the drop/set_master interactions.");
