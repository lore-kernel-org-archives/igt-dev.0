Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117E10E105
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 10:34:08 +0000 (UTC)
Date: Mon, 16 May 2022 13:31:41 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <YoIoDZ09QSQRBd0V@platvala-desk.ger.corp.intel.com>
References: <20220516074417.3097812-1-riana.tauro@intel.com>
 <20220516074417.3097812-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516074417.3097812-3-riana.tauro@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 2/3] tests/i915/i915_suspend: Add
 s2idle and s3 subtests without i915
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

On Mon, May 16, 2022 at 01:14:16PM +0530, Riana Tauro wrote:
> Add new tests basic-s2idle-without-i915 and basic-s3-without-i915
> to exercise s2idle and s3 cycles to know the system wide
> health of suspend/resume
> 
> v2: rebase
> v3: rebase
> v4: skip s3 when platform default state is s2idle to reduce
>     CI time (Anshuman)
> 
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/i915/i915_suspend.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index d34b7a5d..cb33d83e 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -204,12 +204,14 @@ test_forcewake(int fd, bool hibernate)
>  }
>  
>  static void
> -test_suspend_without_i915(void)
> +test_suspend_without_i915(int state)
>  {
>  	igt_kmsg(KMSG_INFO "Unloading i915\n");
>  	igt_assert_eq(igt_i915_driver_unload(),0);
>  
> -	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +	igt_skip_on_f(igt_get_memsleep_state() == MEM_SLEEP_FREEZE && state > SUSPEND_STATE_FREEZE,
> +		      "Platform default state is s2idle\n");

This message will appear alone in the result logs and might be hard to
understand. Expand the text a bit, "Platform default mem sleep state"
or something.


-- 
Petri Latvala


> +	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
>  
>  	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
>  	igt_assert_eq(igt_i915_driver_load(NULL), 0);
> @@ -219,9 +221,13 @@ int fd;
>  
>  igt_main
>  {
> -	igt_describe("Validate system suspend cycle without i915 module");
> -	igt_subtest("system-suspend-without-i915")
> -		test_suspend_without_i915();
> +	igt_describe("Validate suspend-to-idle without i915 module");
> +	igt_subtest("basic-s2idle-without-i915")
> +		test_suspend_without_i915(SUSPEND_STATE_FREEZE);
> +
> +	igt_describe("Validate S3 without i915 module");
> +	igt_subtest("basic-s3-without-i915")
> +		test_suspend_without_i915(SUSPEND_STATE_MEM);
>  
>  	igt_fixture
>  		fd = drm_open_driver(DRIVER_INTEL);
> -- 
> 2.25.1
> 
