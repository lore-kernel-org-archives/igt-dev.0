Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56228112282
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 07:34:52 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:32:47 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Luca Coelho <luca@coelho.fi>
Message-ID: <YqGiH9LNcDIJDFW/@platvala-desk.ger.corp.intel.com>
References: <20220607074240.1202404-1-luca@coelho.fi>
 <20220607074240.1202404-3-luca@coelho.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607074240.1202404-3-luca@coelho.fi>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/kms_sysfs_edid_timing: fail
 if probing a single connector takes too long
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

On Tue, Jun 07, 2022 at 10:42:38AM +0300, Luca Coelho wrote:
> From: Luca Coelho <luciano.coelho@intel.com>
> 
> There's no point in just warning if probing a single connector takes
> too long.  If a test finds any issues, it should just fail.
> 
> Convert the warning into an assertion.
> 
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  tests/kms_sysfs_edid_timing.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index 028a5323c0b2..ea0e169e6ed9 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -81,11 +81,11 @@ igt_simple_main
>  			  mean.max, mean.max / 1e3, mean.max / 1e6,
>  			  mean.mean, mean.mean / 1e3, mean.mean / 1e6);
>  
> -		if (mean.max > (THRESHOLD_PER_CONNECTOR * 1e6)) {
> -			igt_warn("%s: probe time exceed %dms, max=%.2fms, avg=%.2fms\n",
> -				 de->d_name, THRESHOLD_PER_CONNECTOR,
> -				 mean.max / 1e6, mean.mean / 1e6);
> -		}
> +		igt_assert_f(mean.max < THRESHOLD_PER_CONNECTOR * 1e6,
> +			     "%s: probe time exceed %dms, max=%.2fms, avg=%.2fms\n",
> +			     de->d_name, THRESHOLD_PER_CONNECTOR,
> +			     mean.max / 1e6, mean.mean / 1e6);
> +


120ms on KBL:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7242/shard-kbl4/igt@kms_sysfs_edid_timing.html


80-ish ms on APL:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7242/shard-apl4/igt@kms_sysfs_edid_timing.html


As for whether that makes this IGT patch an acceptable change, depends
on whether those times are considered anomalies that someone plans to
fix somehow...

-- 
Petri Latvala




>  		igt_assert_f(mean.mean < (THRESHOLD_TOTAL * 1e6),
>  			     "%s: average probe time exceeded %dms, max=%.2fms, avg=%.2fms\n",
>  			     de->d_name, THRESHOLD_TOTAL,
> -- 
> 2.36.1
> 
