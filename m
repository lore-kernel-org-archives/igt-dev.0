Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8839A14AF2A
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 07:40:03 +0000 (UTC)
Date: Wed, 13 Jul 2022 09:39:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ys52zraeF1Lt38Xm@kamilkon-desk1>
References: <20220713065113.12916-1-zbigniew.kempczynski@intel.com>
 <20220713065113.12916-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220713065113.12916-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] i915/i915_module_load: Raise a
 fatal-error on failing to unload a module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-07-13 at 08:51:13 +0200, Zbigniew Kempczyński wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> If we fail to unload the module after the fault-injection test, we leave
> behind a dangerous modparam that will affect all subsequent tests.
> Better to declare the run void rather than have to triage all the
> bizarre bugs.
> 
> Sometimes the fault injection module load test timeouts out, causing
> igt_runner to cancel the test with a SIGQUIT. This unfortunately causes
> us to abort in the middle of the test leaving the module in a broken
> state. That broken module is then used for subsequent tests, causing a
> cascade of failures.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
> v2: Commit msg fix + remove unnecessay condition check (Kamil)

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/i915_module_load.c | 37 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index 0ce433869d..4c72157c07 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -166,6 +166,33 @@ static int open_parameters(const char *module_name)
>  	return open(path, O_RDONLY);
>  }
>  
> +static void unload_or_die(const char *module_name)
> +{
> +	int err, loop;
> +
> +	/* should be unloaded, so expect a no-op */
> +	for (loop = 0;; loop++) {
> +		err = igt_kmod_unload(module_name, 0);
> +		if (err == -ENOENT) /* -ENOENT == unloaded already */
> +			err = 0;
> +		if (!err || loop >= 10)
> +			break;
> +
> +		sleep(1); /* wait for external clients to drop */
> +		if (!strcmp(module_name, "i915"))
> +			igt_i915_driver_unload();
> +	}
> +
> +	igt_abort_on_f(err,
> +		       "Failed to unload '%s' err:%d after %ds, leaving dangerous modparams intact!\n",
> +		       module_name, err, loop);
> +}
> +
> +static void must_unload(int sig)
> +{
> +	unload_or_die("i915");
> +}
> +
>  static int
>  inject_fault(const char *module_name, const char *opt, int fault)
>  {
> @@ -349,6 +376,14 @@ igt_main
>  
>  		igt_i915_driver_unload();
>  
> +		/*
> +		 * inject_fault() leaves the module unloaded, but if that fails
> +		 * we must abort the run. Otherwise, we leave a dangerous
> +		 * modparam affecting all subsequent tests causing bizarre
> +		 * failures.
> +		 */
> +		igt_install_exit_handler(must_unload);
> +
>  		i = 0;
>  		param = getenv("IGT_SRANDOM");
>  		if (param)
> @@ -367,7 +402,7 @@ igt_main
>  		while (inject_fault("i915", param, i) == 0)
>  			i += 1 + random() % 17;
>  
> -		/* inject_fault() leaves the module unloaded */
> +		unload_or_die("i915");
>  	}
>  
>  	igt_describe("Check whether lmem bar size can be resized to only supported sizes.");
> -- 
> 2.34.1
> 
