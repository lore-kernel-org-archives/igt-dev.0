Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253AF6E1A3
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 11:32:49 +0000 (UTC)
Date: Thu, 23 Jul 2020 14:32:46 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200723113246.GW20883@platvala-desk.ger.corp.intel.com>
References: <20200723111615.1933636-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723111615.1933636-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_atomic_transition: Add
 explicit curly brackets
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mohammed Khajapasha <mohammed.khajapasha@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 02:16:14PM +0300, Arkadiusz Hiler wrote:
> To clean up a bit and get rid of compilation warnings.
> 
> Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> ---
>  tests/kms_atomic_transition.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index f54591e6..a71bbe10 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -788,8 +788,9 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
>  
>  			if (fencing)
>  				igt_pipe_request_out_fence(&display->pipes[i]);
> -		} else
> +		} else {
>  			igt_plane_set_fb(plane, NULL);
> +		}
>  	}
>  
>  	iter_max = 1 << j;
> @@ -859,9 +860,10 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
>  	set_combinations(display, 0, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  
> -	if (is_i915_device(display->drm_fd))
> +	if (is_i915_device(display->drm_fd)) {
>  		for_each_pipe(display, i)
>  			igt_pipe_crc_free(pipe_crcs[i]);
> +	}
>  
>  	igt_remove_fb(display->drm_fd, &fbs[1]);
>  	igt_remove_fb(display->drm_fd, &fbs[0]);
> -- 
> 2.25.4
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
