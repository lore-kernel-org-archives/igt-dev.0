Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
 <20200221135620.2794706-1-chris@chris-wilson.co.uk>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <efbae310-47f4-d774-ccac-31ee30a0f96b@linux.intel.com>
Date: Mon, 24 Feb 2020 11:16:02 +0200
MIME-Version: 1.0
In-Reply-To: <20200221135620.2794706-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_pm_rpm: Only check for
 suspend failures after each debugfs entry
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-02-21 15:56, Chris Wilson wrote:
> Since we check before and then after each debugfs entry, we do not need
> to check before each time as well. We will error out as soon as it does
> fail, at all other times we know the system to be idle.
> 
> No impact on runtime for glk (which apparently is one of the better
> behaving systems).
> 
> v2: Assert that we are currently suspended prior to opening the file,
> i.e. that nothing else is waking up the device behind our backs.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Martin Peres <martin.peres@linux.intel.com>

This changes the purpose of this test, but checking that nothing is
waking the driver in the background sound like a good test and could
explain the terribly-slow runtime on some platforms!

Reviewed-by: Martin Peres <martin.peres@linux.intel.com>

Please inform me before merging the patch, so as I can suppress the test
ahead of the merge.

> ---
>  tests/i915/i915_pm_rpm.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index 0c2821122..36416a9db 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -183,6 +183,14 @@ static enum pc8_status get_pc8_status(void)
>  		return PC8_DISABLED;
>  }
>  
> +static bool is_suspended(void)
> +{
> +	if (has_pc8 && !has_runtime_pm)
> +		return get_pc8_status() == PC8_ENABLED;
> +	else
> +		return igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_SUSPENDED;
> +}
> +
>  static bool wait_for_pc8_status(enum pc8_status status)
>  {
>  	return igt_wait(get_pc8_status() == status, 10000, 100);
> @@ -932,7 +940,7 @@ static int read_entry(const char *filepath,
>  	int fd;
>  	int rc;
>  
> -	igt_assert_f(wait_for_suspended(), "Before opening: %s (%s)\n",
> +	igt_assert_f(is_suspended(), "Before opening: %s (%s)\n",
>  		     filepath + pathinfo->base, filepath);
>  
>  	fd = open(filepath, O_RDONLY | O_NONBLOCK);
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
