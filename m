Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA2B89CA0
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Dec 2020 13:45:00 +0000 (UTC)
Date: Tue, 1 Dec 2020 15:44:52 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201201134452.GB7444@platvala-desk.ger.corp.intel.com>
References: <20201201023258.5351-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201023258.5351-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [RFC, i-g-t] Added Dynamic Subtest
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
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 01, 2020 at 08:02:58AM +0530, nidhi1.gupta@intel.com wrote:
> From: Nidhi Gupta <nidhi1.gupta@intel.com>
> 
> In kms_plane_scaling have a subtest with 2 pipe it
> will execute it weather 2 pipes are available or not.
> Later it has to be analysed and discard it as valid skip.
> To save this time updated in test to first check the available
> outputs and then execute the test
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_plane_scaling.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 89b82416..95be07cc 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -682,6 +682,7 @@ static data_t data;
>  igt_main_args("", long_opts, help_str, opt_handler, &data)
>  {
>  	enum pipe pipe;
> +	int count = 0;
>  
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
> @@ -717,10 +718,17 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
>  					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
>  		}
> -	}
>  
> -	igt_subtest_f("2x-scaler-multi-pipe")
> -		test_scaler_with_multi_pipe_plane(&data);
> +		igt_subtest_with_dynamic("scaler-multi-pipe") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +				++count;
> +			}
> +			if (count >= 2) {
> +				igt_dynamic_f("2x-scaler-multi-pipe")
> +					test_scaler_with_multi_pipe_plane(&data);
> +			}
> +		}
> +	}

NAK. This will make the test still skip on less than 2 outputs, but
the skip is now harder to filter. (The skip will be for
"scaler-multi-pipe" with the message "no dynamic subtests entered")

To save human time in cibuglog analysis, rather make the
less-than-required-outputs skip messages consistent so one filter can
cover them all.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
