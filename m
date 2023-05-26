Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AED10E1CB
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 15:21:12 +0000 (UTC)
Date: Fri, 26 May 2023 17:18:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Message-ID: <20230526151850.y7i3klflnb5obqok@kamilkon-desk1>
References: <20230526020731.5250-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230526020731.5250-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [RFC,
 i-g-t] tests/kms_vrr: New VRR test to toggle the VRR during fastsets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Hidhi,

On 2023-05-26 at 07:37:31 +0530, Nidhi Gupta wrote:
> Allow VRR to be toggled during fastsets, without
> the need of full modeset.
> 

Please add cc here for some KMS devs for review, you can
loop up at git log:

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>

> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_vrr.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index d2d79c4e..ea6528e1 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -45,7 +45,8 @@ enum {
>  	TEST_DPMS = 1 << 1,
>  	TEST_SUSPEND = 1 << 2,
>  	TEST_FLIPLINE = 1 << 3,
> -	TEST_NEGATIVE = 1 << 4,
> +	TEST_FASTSET = 1 << 4,
> +	TEST_NEGATIVE = 1 << 5,
>  };
>  
>  typedef struct range {
> @@ -193,11 +194,14 @@ static bool vrr_capable(igt_output_t *output)
>  }
>  
>  /* Toggles variable refresh rate on the pipe. */
> -static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
> +static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
> +			    bool need_modeset, bool enabled)
>  {
>  	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
>  				enabled);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (need_modeset)
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>  
>  /* Prepare the display for testing on the given pipe. */
> @@ -370,7 +374,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
>  
> -	set_vrr_on_pipe(data, pipe, true);
> +	set_vrr_on_pipe(data, pipe, (flags & ~TEST_FASTSET), true);
>  
>  	/*
>  	 * Do a short run with VRR, but don't check the result.
> @@ -436,7 +440,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>  	 * modeset. And the expected behavior is the same as disabling VRR on
>  	 * a VRR capable panel.
>  	 */
> -	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
> +	set_vrr_on_pipe(data, pipe, (flags & ~TEST_FASTSET), (flags & TEST_NEGATIVE)? true : false);
>  	rate = vtest_ns.mid;
>  	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
>  	igt_assert_f(result < 10,
> @@ -526,6 +530,13 @@ igt_main
>  	igt_subtest_with_dynamic("negative-basic")
>  		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
>  
> +	igt_fixture
> +		igt_require_intel(data.drm_fd);
--------------- ^
Move this below, please avoid adding igt_require in fixtures.
You can do this at one global at beginning, but later on they
may clobber output.

> +
> +	igt_describe("Tests that VRR basic without modeset");
> +	igt_subtest_with_dynamic("flip-basic-fastset")
> +		run_vrr_test(&data, test_basic, TEST_FASTSET);
> +

imho better:
	igt_subtest_with_dynamic("flip-basic-fastset") {
		igt_require_intel(data.drm_fd);
		run_vrr_test(&data, test_basic, TEST_FASTSET);
	}

Regards,
Kamil

>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  	}
> -- 
> 2.39.0
> 
