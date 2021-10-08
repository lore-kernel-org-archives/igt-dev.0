Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312536E057
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 11:44:03 +0000 (UTC)
Date: Fri, 8 Oct 2021 14:47:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YWAv1tIQW547u8O+@platvala-desk.ger.corp.intel.com>
References: <20211008113230.2238719-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008113230.2238719-1-jigar.bhatt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Fix condition in
 dc9-test
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
Cc: igt-dev@lists.freedesktop.org, nischal.varide@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 08, 2021 at 05:02:30PM +0530, Jigar Bhatt wrote:
> Inside dc9_wait_entry, we do not have DC9 counter,
> so we rely on dc5/dc6 counter reset
> to check if display engine was in DC9.
> Test is passed if live counter is less
> than the previous counter. Correcting condition
> igt_wait(read_dc_counter(debugfs_fd, dc_target) <
> 			prev_dc, seconds, 100);
> 
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>

Yep, looks like this check was accidentally reversed in
2f4e6430a97f04284d1cafb1479e7c1b0b2d596a.

Are there bug reports that this commits should close with a Fixes:
line?

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/i915/i915_pm_dc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 4c9b871c..9db66ba2 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -404,7 +404,7 @@ static bool dc9_wait_entry(uint32_t debugfs_fd, int dc_target, int prev_dc, int
>  	 * since we do not have DC9 counter,
>  	 * so we rely on dc5/dc6 counter reset to check if display engine was in DC9.
>  	 */
> -	return igt_wait(read_dc_counter(debugfs_fd, dc_target) >
> +	return igt_wait(read_dc_counter(debugfs_fd, dc_target) <
>  			prev_dc, seconds, 100);
>  }
>  
> -- 
> 2.25.1
> 
