Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257DDA96DA
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 06:24:48 +0000 (UTC)
Date: Mon, 18 Jul 2022 11:54:42 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20220718062442.GB32110@intel.com>
References: <20220713155233.1155128-1-rodrigo.vivi@intel.com>
 <20220713155233.1155128-2-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220713155233.1155128-2-rodrigo.vivi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/i915/i915_suspend: Be more
 specific on the S3 mem_sleep requirement.
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

On 2022-07-13 at 11:52:31 -0400, Rodrigo Vivi wrote:
> 1. We are not using DISK
> 2. DISK has no dependency on mem_sleep.
> 
> Let's be clear on what exactly we are trying to do.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/i915/i915_suspend.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index f992d447..222a8e4a 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -209,8 +209,9 @@ test_suspend_without_i915(int state)
>  	igt_kmsg(KMSG_INFO "Unloading i915\n");
>  	igt_assert_eq(igt_i915_driver_unload(),0);
>  
> -	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_S2IDLE && state > SUSPEND_STATE_FREEZE,
> -		      "Platform default mem_sleep state is s2idle\n");
> +	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_S2IDLE &&
> +		      state == SUSPEND_STATE_MEM,
STANDBY state has the dependency on mem_sleep, so "state > SUSPEND_STATE_FREEZE" should be the correct condition,
but as follow on patch removes above hunk.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> +		      "S3 not possible: platform default mem_sleep state is s2idle\n");
>  	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
>  
>  	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
> -- 
> 2.35.3
> 
