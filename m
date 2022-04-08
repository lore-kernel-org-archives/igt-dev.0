Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4749010F770
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Apr 2022 06:20:15 +0000 (UTC)
Date: Fri, 8 Apr 2022 09:20:03 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <Yk/UE4uWFSu7hr3n@platvala-desk.ger.corp.intel.com>
References: <20220407192856.15813-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407192856.15813-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_flip_scaled_crc: Fix
 error message
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

On Thu, Apr 07, 2022 at 10:28:56PM +0300, Juha-Pekka Heikkila wrote:
> There was newline missing from skipping message which caused skips
> to show as incomplete.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/i915/kms_flip_scaled_crc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> index 67ccef31d..9740715f0 100644
> --- a/tests/i915/kms_flip_scaled_crc.c
> +++ b/tests/i915/kms_flip_scaled_crc.c
> @@ -398,7 +398,7 @@ igt_main
>  				if (rval == NOREQUESTEDFORMATONPIPE)
>  					igt_debug("No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
>  			}
> -			igt_require_f(validtests > 0, "No valid pipe/connector/format/mod combination found");
> +			igt_require_f(validtests > 0, "No valid pipe/connector/format/mod combination found\n");

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Add a closes: line as well if there's a bug report for the incomplete.

>  		}
>  	}
>  	igt_fixture {
> -- 
> 2.28.0
> 
