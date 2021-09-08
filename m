Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0604A6E255
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Sep 2021 18:55:02 +0000 (UTC)
Date: Wed, 8 Sep 2021 21:54:57 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20210908185457.GA4059482@ideak-desk.fi.intel.com>
References: <20210908111543.1552728-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908111543.1552728-1-jigar.bhatt@intel.com>
Subject: Re: [igt-dev] [ PATCH i-g-t v1 ] tests/i915/i915_pm_dc: Fix DC9 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org, uma.shankar@intel.com, nischal.varide@intel.com, anshuman.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 08, 2021 at 04:45:43PM +0530, Jigar Bhatt wrote:
> Currently, check_dc9 is being called with reference
> (previous) counter being read after dpms_off call.
> At this time, already the counter is 0.
> We need to read the counter before dpms_off is called
> so that it holds the previous value which had
> incremented while testing shallow states (DC5 or DC6).
> 
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 9d0a15d8..d1925e5a 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -400,8 +400,8 @@ static bool check_dc9(uint32_t debugfs_fd, int prev_dc, bool dc6_supported, int
>  	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
>  	 */
>  	return igt_wait(dc6_supported ? read_dc_counter(debugfs_fd, CHECK_DC6) <
> -			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) <
> -			prev_dc, seconds, 100);
> +			prev_dc : read_dc_counter(debugfs_fd, CHECK_DC5) < prev_dc
> +			, seconds, 100);
>  }
>  
>  static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
> @@ -418,15 +418,16 @@ static void setup_dc9_dpms(data_t *data, int prev_dc, bool dc6_supported)
>  static void test_dc9_dpms(data_t *data)
>  
>  	bool dc6_supported;

The fix looks good, but while at it could you also make things a bit cleaner by

	int dc_target = support_dc6() ? CHECK_DC6 : CHECK_DC5;

> +	int prev_dc;
>  
>  	require_dc_counter(data->debugfs_fd, CHECK_DC5);
>  	dc6_supported = support_dc6(data->debugfs_fd);
>  	setup_dc9_dpms(data, dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
>  			read_dc_counter(data->debugfs_fd, CHECK_DC5), dc6_supported);

	setup_dc9_dpms(data, dc_target);

and read out the counter within setup_dc9_dpms().

> +	prev_dc = dc6_supported ? read_dc_counter(data->debugfs_fd, CHECK_DC6) :
> +		read_dc_counter(data->debugfs_fd, CHECK_DC5);

	prev_dc = read_dc_counter(dc_target);

>  	dpms_off(data);
> -	igt_assert_f(check_dc9(data->debugfs_fd, dc6_supported ?
> -				read_dc_counter(data->debugfs_fd, CHECK_DC6) :
> -				read_dc_counter(data->debugfs_fd, CHECK_DC5),
> +	igt_assert_f(check_dc9(data->debugfs_fd, prev_dc,
>  				dc6_supported, 3000), "Not in DC9\n");

		     check_dc9(data->debugfs_fd, target_dc, 3000, ...

and simplify check_dc9() accordingly?

>  	dpms_on(data);
>  }
> -- 
> 2.25.1
> 
