Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DA58E9FD
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 14:29:05 +0000 (UTC)
Date: Tue, 12 Jul 2022 16:29:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ys2FLTibS/pmcrxS@kamilkon-desk1>
References: <20220708122422.94917-1-zbigniew.kempczynski@intel.com>
 <20220708122422.94917-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708122422.94917-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/i915_module_load: Raise a
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

Hi,

On 2022-07-08 at 14:24:22 +0200, Zbigniew Kempczyński wrote:
> From: Chris Wilson <chris.p.wilson@linux.intel.com>
> 
> If we fail to unload the module after the fault-injection test, we leave
> behind a dangerous modparam that will affect all subsequent tests.
> Better to declare the run void rather than have to triage all the bizarre
--------------------------- ^
maybe s/void/fails/ ?

> bugs.
> 
> Somes the fault injection module load test timeouts out, causing
- ^
s/Somes/Sometimes/

> igt_runner to cancel the test with a SIGQUIT. This unfortunately causes
> us to abort in the middle of the test leaving the module in a broken
> state. That broken module is then used for subsequent tests, casuing a
-------------------------------------------------------------- ^
s/casuing/causing/

> cascade of failures.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/i915/i915_module_load.c | 37 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index a922af0064..170900b1ab 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -163,6 +163,33 @@ static int open_parameters(const char *module_name)
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
> +		if (err && err == -ENOENT) /* -ENOENT == unloaded already */
------------------- ^^^^^^
Drop this.

> +			err = 0;
> +		if (!err || loop >= 10)
--------------------------  ^
Put this at for loop test, e.g.: for(loop = 0; loop <= 10; ++loop)
Btw why 10 ? imho 3 should be more than enough.

> +			break;
> +
> +		sleep(1); /* wait for external clients to drop */
> +		if (!strcmp(module_name, "i915"))
> +			igt_i915_driver_unload();

We are calling this from one place only, with "i915" as param.
Do we plan to change this in near future ? If not, drop if() and
just call igt_i915_driver_unload() (you can add a comment here).

With that fixed you can add my r-b tag.

Regards,
Kamil

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
> @@ -306,6 +333,14 @@ igt_main
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
> @@ -324,7 +359,7 @@ igt_main
>  		while (inject_fault("i915", param, i += 1 + random() % 17) == 0)
>  			;
>  
> -		/* inject_fault() leaves the module unloaded */
> +		unload_or_die("i915");
>  	}
>  
>  	/* Subtests should unload the module themselves if they use modparams */
> -- 
> 2.34.1
> 
