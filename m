Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89CC10E503
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 08:34:35 +0000 (UTC)
Date: Wed, 15 Nov 2023 10:34:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <ZVSCl4gsegbhcQnu@intel.com>
References: <20231113081930.1189688-1-bhanuprakash.modem@intel.com>
 <20231113081930.1189688-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113081930.1189688-5-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 4/5] tests/kms_flip: Fix Bigjoiner checks
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

On Mon, Nov 13, 2023 at 01:49:29PM +0530, Bhanuprakash Modem wrote:
> Bigjoiner will come in the picture when the resolution > 5K or
> clock > max dot-clock. Add a support to check the selected mode
> clock is greater than the max dot-clock.
> 
> V2: - Limit the bigjoiner checks to intel hardware
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  tests/kms_flip.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index fc7cee050..d34596599 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
<snip>
> @@ -2136,6 +2139,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  			for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++)
>  				tests[i].flags &= ~(TEST_CHECK_TS | TEST_VBLANK_EXPIRED_SEQ);
>  		}
> +		max_dotclock = igt_get_max_dotclock(drm_fd);

That seems to have broken the test for !display platforms (bat-atsm-1).

>  	}
>  
>  	igt_describe("Tests that nonblocking reading fails correctly");
> -- 
> 2.40.0

-- 
Ville Syrjälä
Intel
