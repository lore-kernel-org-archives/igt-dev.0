Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ADC10E49C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 13:23:38 +0000 (UTC)
Date: Mon, 12 Sep 2022 16:23:28 +0300
From: Imre Deak <imre.deak@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Yx8y0O55VJJOsRV4@ideak-desk.fi.intel.com>
References: <20220909114911.1852-1-swati2.sharma@intel.com>
 <20220909114911.1852-6-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909114911.1852-6-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/i915/i915_pm_dc: Sleep not
 reqd. to reset counter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 05:19:11PM +0530, Swati Sharma wrote:
> Sleep is not required since we are polling for the same condition.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  tests/i915/i915_pm_dc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 142975e6c..fd5e2c089 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -470,7 +470,6 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
>  	}
>  	prev_rpm = read_runtime_suspended_time(data->drm_fd);
>  	dpms_off(data);
> -	sleep(1); /* wait for counters reset*/
>  	check_dc9(data, dc_target, prev_dc, prev_rpm);
>  	dpms_on(data);
>  }
> -- 
> 2.25.1
> 
