Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD67410FB3F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 09:08:52 +0000 (UTC)
Message-ID: <2185d1c9-efaa-b04d-164a-567e4714d604@intel.com>
Date: Fri, 15 Jul 2022 14:38:26 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220620104932.148696-1-mohammed.thasleem@intel.com>
 <20220620104932.148696-2-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220620104932.148696-2-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_lease: Create dynamic
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

On Mon-20-06-2022 04:19 pm, Mohammed Thasleem wrote:
> Modified tests/kms_lease to include dynamic test cases.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_lease.c | 101 ++++++++++++++++++++++++++++------------------
>   1 file changed, 61 insertions(+), 40 deletions(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 0bf102a6..5e948671 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -47,6 +47,8 @@
>   
>   IGT_TEST_DESCRIPTION("Test of CreateLease.");
>   
> +unsigned int valid_tests;
> +
>   typedef struct {
>   	int fd;
>   	uint32_t lessee_id;
> @@ -809,39 +811,31 @@ static void lease_invalid_plane(data_t *data)
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
> +	igt_info("Beginning %s on pipe %s, connector %s\n",
> +		 igt_subtest_name(),
> +		 kmstest_pipe_name(p),
> +		 igt_output_name(output));
>   
> -		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
> -			 igt_subtest_name(),
> -			 kmstest_pipe_name(p),
> -			 igt_output_name(output));
> +	data->pipe = p;
> +	data->crtc_id = pipe_to_crtc_id(display, p);
> +	data->connector_id = output->id;
> +	data->plane_id =
> +		igt_pipe_get_plane_type(&data->master.display.pipes[data->pipe],
> +					DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
>   
> -		valid_tests++;
> -	}
> +	testfunc(data);
>   
> -	igt_require_f(valid_tests,
> -		      "no valid crtc/connector combinations found\n");
> +	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
> +		 igt_subtest_name(),
> +		 kmstest_pipe_name(p),
> +		 igt_output_name(output));
> +
> +	valid_tests++;
>   }
>   
>   #define assert_double_id_err(ret) \
> @@ -1218,6 +1212,8 @@ static void lease_uevent(data_t *data)
>   igt_main
>   {
>   	data_t data;
> +	igt_output_t *output;
> +	enum pipe p;
>   	const struct {
>   		const char *name;
>   		void (*func)(data_t *);
> @@ -1255,36 +1251,61 @@ igt_main
>   	for (f = funcs; f->name; f++) {
>   
>   		igt_describe(f->desc);
> -		igt_subtest_f("%s", f->name) {
> -			run_test(&data, f->func);
> +		igt_subtest_with_dynamic_f("%s", f->name) {
> +			for_each_pipe_with_valid_output(&data.master.display, p, output) {
> +				igt_dynamic_f("%s-pipe-%s", igt_output_name(output),
> +					      kmstest_pipe_name(p)) {
> +					run_test(&data, f->func, p, output);
> +				}
> +			}
> +			igt_require_f(valid_tests,
> +					"no valid crtc/connector combinations found\n");
>   		}
>   	}
>   
>   	igt_describe("Tests error handling while creating invalid corner-cases for "
>   		     "create-lease ioctl");
> -	igt_subtest("invalid-create-leases")
> -		invalid_create_leases(&data);
> +	igt_subtest_with_dynamic_f("invalid-create-leases") {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {

This is not correct.

If you want to use dynamic subtests, you must loop over all output/pipe 
combinations.

So using uninitialized output/pipe will cause IGT CRASH.

This comment is applicable all the places in this patch.

- Bhanu

> +			invalid_create_leases(&data);
> +		}
> +	}
>   
>   	igt_describe("Tests that  possible_crtcs logically match between master and "
>   		     "lease, and that the values are correctly renumbered on the lease side.");
> -	igt_subtest("possible-crtcs-filtering")
> -		possible_crtcs_filtering(&data);
> +	igt_subtest_with_dynamic_f("possible-crtcs-filtering") {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
> +			possible_crtcs_filtering(&data);
> +		}
> +	}
>   
>   	igt_describe("Tests the drop/set_master interactions.");
> -	igt_subtest("master-vs-lease")
> -		master_vs_lease(&data);
> +	igt_subtest_with_dynamic_f("master-vs-lease") {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
> +			master_vs_lease(&data);
> +		}
> +	}
>   
>   	igt_describe("Tests that the 2nd master can only create leases while being active "
>   		     "master, and that leases on the first master don't prevent lease creation "
>   		     "for the 2nd master.");
> -	igt_subtest("multimaster-lease")
> -		multimaster_lease(&data);
> +	igt_subtest_with_dynamic_f("multimaster-lease") {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
> +			multimaster_lease(&data);
> +		}
> +	}
>   
>   	igt_describe("Tests the implicitly added planes.");
> -	igt_subtest("implicit-plane-lease")
> -		implicit_plane_lease(&data);
> +	igt_subtest_with_dynamic_f("implicit-plane-lease") {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
> +			implicit_plane_lease(&data);
> +		}
> +	}
>   
>   	igt_describe("Tests all the uevent cases");
> -	igt_subtest("lease-uevent")
> -		lease_uevent(&data);
> +	igt_subtest_with_dynamic_f("lease-uevent") {
> +		igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
> +			lease_uevent(&data);
> +		}
> +	}
>   }
