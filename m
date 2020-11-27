Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FF36EB65
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2020 09:38:34 +0000 (UTC)
Date: Fri, 27 Nov 2020 11:38:31 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201127093831.GZ7444@platvala-desk.ger.corp.intel.com>
References: <20201127073949.18730-1-mohammed.khajapasha@intel.com>
 <20201127073949.18730-2-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127073949.18730-2-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH 1/1] tests/kms_plane_scaling: Correcting typo
 error for plane scaler test
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 27, 2020 at 01:09:49PM +0530, Mohammed Khajapasha wrote:
> Correcting typo error for plane scaler with clipping and clamping
> test case.
> 
> Cc: petri.latvala@intel.com
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/kms_plane_scaling.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 39acad6c..89b82416 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -714,7 +714,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
>  			for_each_pipe_with_single_output(&data.display, pipe, output)
> -				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
> +				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
>  					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
>  		}
>  	}
> -- 
> 2.29.2.154.g7f7ebe054a
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
