Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9406EA6A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 19:03:13 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 18 Feb 2020 19:03:09 +0000
Message-ID: <f3d385bd9e0487e3f6ab06c62619e1fb59197597.camel@intel.com>
References: <20200216180006.14439-1-anshuman.gupta@intel.com>
 <20200216180006.14439-2-anshuman.gupta@intel.com>
In-Reply-To: <20200216180006.14439-2-anshuman.gupta@intel.com>
Content-Language: en-US
Content-ID: <3B920FFB846A3A4DBFA54E4D156DF8A1@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915_pm_dc: Dump
 power_domain_info on DC test failures
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, 2020-02-16 at 23:30 +0530, Anshuman Gupta wrote:
> Dump i915_power_domain_info debugfs attribute on DC state
> test failures, it will help to identify culprit, which
> causes non zero refcount for "DC off" power well.
> 
> Cc: Animesh Manna <animesh.manna@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index afcc10bc..4bca8559 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -206,11 +206,13 @@ static bool dc_state_wait_entry(int debugfs_fd,
> int dc_flag, int prev_dc_count)
>  static void check_dc_counter(int debugfs_fd, int dc_flag, uint32_t
> prev_dc_count)
>  {
>  	char tmp[64];
> +	char file[64] = "i915_power_domain_info";
>  
>  	snprintf(tmp, sizeof(tmp), "%s", dc_flag & CHECK_DC3CO ?
> "DC3CO" :
>  		(dc_flag & CHECK_DC5 ? "DC5" : "DC6"));
>  	igt_assert_f(dc_state_wait_entry(debugfs_fd, dc_flag,
> prev_dc_count),
> -		     "%s state is not achieved\n", tmp);
> +		     "%s state is not achieved\n%s:\n%s\n",
> +		     tmp, file, igt_sysfs_get(debugfs_fd, file));
>  }

You are leaking the return of igt_sysfs_get() also why add the variable
file? 

>  
>  static void setup_videoplayback(data_t *data)
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
