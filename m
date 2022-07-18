Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2B5A9167
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 05:54:57 +0000 (UTC)
Date: Mon, 18 Jul 2022 11:24:46 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20220718055445.GA32110@intel.com>
References: <20220713155233.1155128-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220713155233.1155128-1-rodrigo.vivi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/igt_aux: Let's use the official
 mem_sleep names
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

On 2022-07-13 at 11:52:30 -0400, Rodrigo Vivi wrote:
> Mixing the names with the state names can cause confusion.
> Let's stick with the official names.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/igt_aux.c             | 8 ++++----
>  lib/igt_aux.h             | 6 +++---
>  tests/i915/i915_suspend.c | 2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 35c67f10..5129d9f0 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -712,9 +712,9 @@ static const char *suspend_test_name[] = {
>  };
>  
>  static const char *mem_sleep_name[] = {
> -	[MEM_SLEEP_FREEZE] = "s2idle",
> -	[MEM_SLEEP_STANDBY] = "shallow",
> -	[MEM_SLEEP_MEM] = "deep"
> +	[MEM_SLEEP_S2IDLE] = "s2idle",
> +	[MEM_SLEEP_SHALLOW] = "shallow",
> +	[MEM_SLEEP_DEEP] = "deep"
>  };
>  
>  static enum igt_suspend_test get_suspend_test(int power_dir)
> @@ -993,7 +993,7 @@ int igt_get_memsleep_state(void)
>  		return MEM_SLEEP_NONE;
>  	}
>  
> -	for (mem_sleep = MEM_SLEEP_FREEZE; mem_sleep < MEM_SLEEP_NUM; mem_sleep++) {
> +	for (mem_sleep = MEM_SLEEP_S2IDLE; mem_sleep < MEM_SLEEP_NUM; mem_sleep++) {
>  		if (strcmp(mem_sleep_name[mem_sleep], mem_sleep_state) == 0)
>  			break;
>  	}
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index af663d2c..9d5b7bd2 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -196,9 +196,9 @@ enum igt_suspend_test {
>   */
>  enum igt_mem_sleep {
>  	MEM_SLEEP_NONE,
> -	MEM_SLEEP_FREEZE,
> -	MEM_SLEEP_STANDBY,
> -	MEM_SLEEP_MEM,
> +	MEM_SLEEP_S2IDLE,
> +	MEM_SLEEP_SHALLOW,
> +	MEM_SLEEP_DEEP,
>  
>  	/*<private>*/
>  	MEM_SLEEP_NUM,
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index 23e451d3..f992d447 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -209,7 +209,7 @@ test_suspend_without_i915(int state)
>  	igt_kmsg(KMSG_INFO "Unloading i915\n");
>  	igt_assert_eq(igt_i915_driver_unload(),0);
>  
> -	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_FREEZE && state > SUSPEND_STATE_FREEZE,
> +	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_S2IDLE && state > SUSPEND_STATE_FREEZE,
>  		      "Platform default mem_sleep state is s2idle\n");
>  	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
Looks good to me.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>  
> -- 
> 2.35.3
> 
