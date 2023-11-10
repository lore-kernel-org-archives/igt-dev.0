Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 10 Nov 2023 08:52:04 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20231110085204.2244899e@maurocar-mobl2>
In-Reply-To: <20231106095935.7031-6-janusz.krzysztofik@linux.intel.com>
References: <20231106095935.7031-4-janusz.krzysztofik@linux.intel.com>
 <20231106095935.7031-6-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/kunit: Execute test cases
 synchronously
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon,  6 Nov 2023 10:59:38 +0100
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Up to now we've been loading a KUnit test module in background and parsing
> in parallel its KTAP output with results from all the module's test cases.
> However, recent KUnit implementation is capable of executing only those
> test cases that match a user filter specified on test module load.
> 
> Stop loading the KUnit test module in background once per the whole
> subtest.  Instead, load the module on each dynamic sub-subtest execution
> with a filter that selects a specific test case and wait for its
> completion.  If successful and no kernel taint then parse the whole KTAP
> report it has produced and translate it to IGT result of the sub-subtest.
> 
> With that in place, we no longer need to skip the whole subtest on a
> failure from module loading or KTAP reading or parsing.  Since such event
> is now local to execution of an individual test case, only fail its
> corresponding dynamic sub-subtests and continue with subsequent ones.
> However, still omit execution of subsequent test cases once the kernel
> gets tainted.

The main reason why loading the module in background was done in the
first place was because if there is a BUG() or PANIC() or gpu hang
while executing KUnit, the dmesg KUnit parser was not producing anything,
and were blocking normal dmesg parsing by IGT runner. While I didn't
test such changes, we need to check what will be there at the JSON file
when IGT resume run is enabled, and those kind of bugs are triggered.

-

Yet, let's take one step back, as IMO this may not solve the issues.
See, when you say:  

> only fail its
> corresponding dynamic sub-subtests and continue with subsequent ones.

When a normal failure happens on KUnit, other tests will be executed. This
is the normal KUnit behavior. So, except if we're doing something wrong on
Xe or KMS tests, the other subtests after the failure will be tested.

However, if such failure is calling BUG_ON(), then the driver will be
tainted, and will prevent module unload. On such case, it doesn't matter
if tests are executed in batch or not: IGT will try to unload the
KUnit module but it will fail due to BUG_ON() behavior.

Also, doing module unload/reload every time will bring some performance penalty,
as loading/unloading KUnit for every individual test case will increase the
time to execute such tests.

Ok, if are there filtering rules on IGT limiting what subtests will be
executed, then be it.  But for normal execution, I can't see why we
would be adding a performance penalty.

Regards,
Mauro

> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  lib/igt_kmod.c | 135 ++++++++++++-------------------------------------
>  1 file changed, 31 insertions(+), 104 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 37591b7389..5bd8f56088 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -960,6 +960,7 @@ static int kunit_kmsg_get_results(struct igt_list_head *results,
>  {
>  	char *suite_name = NULL, *case_name = NULL;
>  	struct igt_ktap_results *ktap;
> +	unsigned long taints;
>  	int flags, err;
>  
>  	if (igt_debug_on(tst->kmsg < 0))
> @@ -998,6 +999,11 @@ static int kunit_kmsg_get_results(struct igt_list_head *results,
>  	if (err)
>  		goto out_kmod_unload;
>  
> +	if (igt_debug_on(igt_kernel_tainted(&taints))) {
> +		err = -ENOTRECOVERABLE;
> +		goto out_remove_module;
> +	}
> +
>  	ktap = igt_ktap_alloc(results);
>  	if (igt_debug_on(!ktap)) {
>  		err = -ENOMEM;
> @@ -1203,84 +1209,43 @@ static void __igt_kunit(struct igt_ktest *tst,
>  			const char *opts,
>  			struct igt_list_head *tests)
>  {
> -	struct modprobe_data modprobe = { tst->kmod, opts, 0, pthread_self(), };
> -	char *suite_name = NULL, *case_name = NULL;
> -	struct igt_ktap_result *t, *r = NULL;
> -	struct igt_ktap_results *ktap;
> -	pthread_mutexattr_t attr;
> -	IGT_LIST_HEAD(results);
> -	int ret = -EINPROGRESS;
> -	unsigned long taints;
> -
> -	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
> -
> -	ktap = igt_ktap_alloc(&results);
> -	igt_require(ktap);
> +	struct igt_ktap_result *t;
>  
>  	igt_list_for_each_entry(t, tests, link) {
> +		char *suite_name = NULL, *case_name = NULL;
> +		IGT_LIST_HEAD(results);
> +		unsigned long taints;
> +
>  		igt_dynamic_f("%s%s%s",
>  			      strcmp(t->suite_name, name) ?  t->suite_name : "",
>  			      strcmp(t->suite_name, name) ? "-" : "",
>  			      t->case_name) {
> +			struct igt_ktap_result *r = NULL;
> +			char filter[1024];
> +			int expect = 2;
>  
> -			if (!modprobe.thread) {
> -				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
> -				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
> -							  PTHREAD_MUTEX_ROBUST),
> -					      0);
> -				igt_assert_eq(pthread_mutex_init(&modprobe.lock,
> -								 &attr), 0);
> -
> -				modprobe.err = pthread_create(&modprobe.thread,
> -							      NULL,
> -							      modprobe_task,
> -							      &modprobe);
> -				igt_assert_eq(modprobe.err, 0);
> -
> -				igt_assert(igt_list_empty(&results));
> -				igt_assert_eq(ret, -EINPROGRESS);
> -				ret = kunit_kmsg_result_get(&results, &modprobe,
> -							    tst->kmsg, ktap);
> -				igt_fail_on(igt_list_empty(&results));
> -
> -				r = igt_list_first_entry(&results, r, link);
> -			}
> +			igt_skip_on(igt_kernel_tainted(&taints));
>  
> -			while (igt_debug_on_f(strcmp(r->suite_name, t->suite_name),
> -					      "suite_name expected: %s, got: %s\n",
> -					      t->suite_name, r->suite_name) ||
> -			       igt_debug_on_f(strcmp(r->case_name, t->case_name),
> -					      "case_name expected: %s, got: %s\n",
> -					      t->case_name, r->case_name) ||
> -			       r->code == IGT_EXIT_INVALID) {
> +			igt_assert_lt(snprintf(filter, sizeof(filter), "filter_glob=%s.%s",
> +					       t->suite_name, t->case_name), sizeof(filter));
> +			igt_assert_eq(kunit_kmsg_get_results(&results, tst, filter, opts), 0);
>  
> -				int code = r->code;
> +			do {
> +				igt_fail_on_f(!expect--, "Invalid result code\n");
>  
>  				kunit_result_free(&r, &suite_name, &case_name);
> -				if (igt_list_empty(&results)) {
> -					igt_assert_eq(ret, -EINPROGRESS);
> -					ret = kunit_kmsg_result_get(&results,
> -								    &modprobe,
> -								    tst->kmsg,
> -								    ktap);
> -					igt_fail_on(igt_list_empty(&results));
> -				}
> +				igt_fail_on(igt_list_empty(&results));
>  
>  				r = igt_list_first_entry(&results, r, link);
>  
> -				if (code != IGT_EXIT_INVALID)
> -					continue;
> -
> -				/* result from parametrized test case */
> -				igt_fail_on_f(strcmp(r->suite_name, suite_name),
> +				igt_fail_on_f(strcmp(r->suite_name, t->suite_name),
>  					      "suite_name expected: %s, got: %s\n",
> -					      suite_name, r->suite_name);
> -				igt_fail_on_f(strcmp(r->case_name, case_name),
> +					      t->suite_name, r->suite_name);
> +				igt_fail_on_f(strcmp(r->case_name, t->case_name),
>  					      "case_name expected: %s, got: %s\n",
> -					      case_name, r->case_name);
> -			}
> +					      t->case_name, r->case_name);
>  
> -			igt_assert_neq(r->code, IGT_EXIT_INVALID);
> +			} while (r->code == IGT_EXIT_INVALID);
>  
>  			if (r->msg && *r->msg) {
>  				igt_skip_on_f(r->code == IGT_EXIT_SKIP,
> @@ -1297,57 +1262,19 @@ static void __igt_kunit(struct igt_ktest *tst,
>  			}
>  			igt_assert_eq(r->code, IGT_EXIT_SUCCESS);
>  
> -			switch (pthread_mutex_lock(&modprobe.lock)) {
> -			case 0:
> -				igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> -				break;
> -			case EOWNERDEAD:
> -				/* leave the mutex unrecoverable */
> -				igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> -				__attribute__ ((fallthrough));
> -			case ENOTRECOVERABLE:
> -				igt_assert_eq(modprobe.err, 0);
> -				break;
> -			default:
> -				igt_debug("pthread_mutex_lock() failed\n");
> -				break;
> -			}
> -
>  			igt_assert_eq(igt_kernel_tainted(&taints), 0);
>  		}
>  
> -		if (igt_debug_on(ret != -EINPROGRESS))
> -			break;
> -	}
> +		kunit_results_free(&results, &suite_name, &case_name);
>  
> -	kunit_results_free(&results, &suite_name, &case_name);
> +		igt_debug_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
> +		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>  
> -	if (modprobe.thread) {
> -		switch (pthread_mutex_lock(&modprobe.lock)) {
> -		case 0:
> -			igt_debug_on(pthread_cancel(modprobe.thread));
> -			igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> -			igt_debug_on(pthread_join(modprobe.thread, NULL));
> -			break;
> -		case EOWNERDEAD:
> -			/* leave the mutex unrecoverable */
> -			igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> -			break;
> -		case ENOTRECOVERABLE:
> -			break;
> -		default:
> -			igt_debug("pthread_mutex_lock() failed\n");
> -			igt_debug_on(pthread_join(modprobe.thread, NULL));
> +		if (igt_debug_on(igt_kernel_tainted(&taints))) {
> +			igt_info("Kernel tainted, not executing more selftests.\n");
>  			break;
>  		}
>  	}
> -
> -	igt_ktap_free(ktap);
> -
> -	igt_skip_on(modprobe.err);
> -	igt_skip_on(igt_kernel_tainted(&taints));
> -	if (ret != -EINPROGRESS)
> -		igt_skip_on_f(ret, "KTAP parser failed\n");
>  }
>  
>  /**
