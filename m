Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F73F6E03D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Nov 2021 12:04:19 +0000 (UTC)
Date: Wed, 10 Nov 2021 14:03:06 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YYu0+nWOZwM9/EDr@platvala-desk.ger.corp.intel.com>
References: <20211109195551.10452-1-jeevan.b@intel.com>
 <20211109195551.10452-2-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109195551.10452-2-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] lib/igt_aux: Rename
 igt_debug_manual_check and assert check if all is supplied
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 01:25:49AM +0530, Jeevan B wrote:
> rename igt_debug_manual_check and patch the igt function
> igt_debug_wait_for_keypress() to assert if "all" is supplied.
> 
> v2: calling igt_debug_wait_for_keypress() with "all" will assert.
> 
> v3: Change igt_assert to igt_assert_f for adding clear log message.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_aux.c            | 9 ++++++---
>  lib/igt_aux.h            | 2 +-
>  tests/i915/kms_dsc.c     | 2 +-
>  tests/i915/kms_psr.c     | 2 +-
>  tests/i915/kms_psr2_sf.c | 2 +-
>  5 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 2445e483..c0e5b01a 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -972,7 +972,7 @@ void igt_drop_root(void)
>   * Waits for a key press when run interactively and when the corresponding debug
>   * var is set in the --interactive-debug=$var variable. Multiple keys
>   * can be specified as a comma-separated list or alternatively "all" if a wait
> - * should happen for all cases.
> + * should happen for all cases. Calling this fucntion with "all" will assert.

Typo in "function".

With that fixed,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>   *
>   * When not connected to a terminal interactive_debug is ignored
>   * and execution immediately continues.
> @@ -993,6 +993,9 @@ void igt_debug_wait_for_keypress(const char *var)
>  	if (!igt_interactive_debug)
>  		return;
>  
> +	if (strstr(var, "all"))
> +		igt_assert_f(false, "Bug in test: Do not call igt_debug_wait_for_keypress with \"all\"\n");
> +
>  	if (!strstr(igt_interactive_debug, var) &&
>  	    !strstr(igt_interactive_debug, "all"))
>  		return;
> @@ -1008,7 +1011,7 @@ void igt_debug_wait_for_keypress(const char *var)
>  }
>  
>  /**
> - * igt_debug_manual_check:
> + * igt_debug_interactive_mode_check:
>   * @var: var lookup to to enable this wait
>   * @expected: message to be printed as expected behaviour before wait for keys Y/n
>   *
> @@ -1028,7 +1031,7 @@ void igt_debug_wait_for_keypress(const char *var)
>   *
>   * Force test fail when N/n is pressed.
>   */
> -void igt_debug_manual_check(const char *var, const char *expected)
> +void igt_debug_interactive_mode_check(const char *var, const char *expected)
>  {
>  	struct termios oldt, newt;
>  	char key;
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index a3c477ab..9f2588ae 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -195,7 +195,7 @@ int igt_get_autoresume_delay(enum igt_suspend_state state);
>  void igt_drop_root(void);
>  
>  void igt_debug_wait_for_keypress(const char *var);
> -void igt_debug_manual_check(const char *var, const char *expected);
> +void igt_debug_interactive_mode_check(const char *var, const char *expected);
>  
>  /* sysinfo cross-arch wrappers from intel_os.c */
>  
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index dcfe8b96..0292ed34 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -72,7 +72,7 @@ int force_dsc_restore_fd = -1;
>  
>  static inline void manual(const char *expected)
>  {
> -	igt_debug_manual_check("all", expected);
> +	igt_debug_interactive_mode_check("all", expected);
>  }
>  
>  static void force_dsc_enable(data_t *data)
> diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
> index 83b8b709..480e2cc7 100644
> --- a/tests/i915/kms_psr.c
> +++ b/tests/i915/kms_psr.c
> @@ -246,7 +246,7 @@ static bool psr_enable_if_enabled(data_t *data)
>  
>  static inline void manual(const char *expected)
>  {
> -	igt_debug_manual_check("all", expected);
> +	igt_debug_interactive_mode_check("all", expected);
>  }
>  
>  static bool drrs_disabled(data_t *data)
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> index a50c3e14..dca2d030 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/i915/kms_psr2_sf.c
> @@ -331,7 +331,7 @@ static void prepare(data_t *data)
>  
>  static inline void manual(const char *expected)
>  {
> -	igt_debug_manual_check("all", expected);
> +	igt_debug_interactive_mode_check("all", expected);
>  }
>  
>  static void plane_update_expected_output(int plane_type, int box_count)
> -- 
> 2.19.1
> 
