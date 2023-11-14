Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 14 Nov 2023 19:33:21 +0100
Message-ID: <18375972.sWSEgdgrri@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20231110085204.2244899e@maurocar-mobl2>
References: <20231106095935.7031-4-janusz.krzysztofik@linux.intel.com>
 <20231106095935.7031-6-janusz.krzysztofik@linux.intel.com>
 <20231110085204.2244899e@maurocar-mobl2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [Intel-xe] [PATCH i-g-t 2/2] lib/kunit: Execute test cases
 synchronously
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny <kamil.konieczny@linux.intel.com>, intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

Thanks for review.  

On Friday, 10 November 2023 08:52:04 CET Mauro Carvalho Chehab wrote:
> On Mon,  6 Nov 2023 10:59:38 +0100
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> 
> > Up to now we've been loading a KUnit test module in background and parsing
> > in parallel its KTAP output with results from all the module's test cases.
> > However, recent KUnit implementation is capable of executing only those
> > test cases that match a user filter specified on test module load.

Having read your comments below, I think that in the first place I need to 
extend this part of my commit description with a more exhaustive explanation 
of my intentions standing behind this series, so its purpose is more clear to 
readers.

Why do we want to execute test cases separately, one test case per one load of 
the KUnit test module?  Because we want to be able to fully synchronize IGT 
output with KTAP output.  That's the main goal of this series.  Without that, 
each CI report from an individual IGT dynamic sub-subtest may contain kernel 
messages not related to its corresponding KUnit test case while missing those 
related.  That's about not misleading not only humans who will be reading 
those reports, but also IGT runner which makes its go / no go decisions based 
on that output.

The only way to reach the goal I can see is to execute individual KUnit test 
cases synchronously to their corresponding IGT dynamic sub-subtests.  That can 
be obtained by executing only one test case per load of KUnit test module. The 
same approach has been successfully used for years with i915 selftests.

> > Stop loading the KUnit test module in background once per the whole
> > subtest.  Instead, load the module on each dynamic sub-subtest execution
> > with a filter that selects a specific test case and wait for its
> > completion.  If successful and no kernel taint then parse the whole KTAP
> > report it has produced and translate it to IGT result of the sub-subtest.
> > 
> > With that in place, we no longer need to skip the whole subtest on a
> > failure from module loading or KTAP reading or parsing.  Since such event
> > is now local to execution of an individual test case, only fail its
> > corresponding dynamic sub-subtests and continue with subsequent ones.
> > However, still omit execution of subsequent test cases once the kernel
> > gets tainted.
> 
> The main reason why loading the module in background was done in the
> first place was because if there is a BUG() or PANIC() or gpu hang
> while executing KUnit, the dmesg KUnit parser was not producing anything,
> and were blocking normal dmesg parsing by IGT runner. 

No, that was not the reason.  See 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/f033d0533b3075beef173f4d0e59f355f0d6c545 
for an explanation of why loading the module in background was implemented.

> While I didn't
> test such changes, we need to check what will be there at the JSON file
> when IGT resume run is enabled, and those kind of bugs are triggered.

I'm not sure what you mean.

> -
> 
> Yet, let's take one step back, as IMO this may not solve the issues.

What do you mean by one step back?  Do you suggest that we should not only 
forget about executing test cases one by one, but also revert the former 
changes that introduced obtaining a list of test cases in advance because of 
issues already introduced by those changes to CI Xe runs?  As you know, those 
issues are caused by the Xe driver itself, which incorrectly depends on KUnit 
base module and makes it impossible to reload that module without also 
reloading the Xe driver.  This series is has nothing to do with those issues. 
Fixing them, in the Xe driver, not in IGT, is what I'm going to focus on next.

> See, when you say:  
> 
> > only fail its
> > corresponding dynamic sub-subtests and continue with subsequent ones.
> 
> When a normal failure happens on KUnit, other tests will be executed. This
> is the normal KUnit behavior. So, except if we're doing something wrong on
> Xe or KMS tests, the other subtests after the failure will be tested.

The paragraph you extracted my words from was not about a normal KUnit 
failure, only (quoting myself) "a failure from module loading or KTAP reading 
or parsing".  Such a failure, not related to actual results from KUnit test 
cases executed, makes awaiting and parsing more KTAP output problematic, I 
believe, if not completely pointless.  That paragraph doesn't describe the 
goals of the changes, only their impact on behavior of IGT KUnit tests.

> However, if such failure is calling BUG_ON(), then the driver will be
> tainted, and will prevent module unload. On such case, it doesn't matter
> if tests are executed in batch or not: IGT will try to unload the
> KUnit module but it will fail due to BUG_ON() behavior.

OK, but if that doesn't matter then I can see no problem in applying the 
proposed changes, as long as their main goal -- synchronization of IGT output 
with KTAP output -- is reached.

> Also, doing module unload/reload every time will bring some performance penalty,
> as loading/unloading KUnit for every individual test case will increase the
> time to execute such tests.

True.  Rough analysis of timestamps from CI pre-merge reports indicate 100-150 
ms of overhead per dynamic sub-subtest.  However, whether that's too much or 
still acceptable depends on time consumed by test cases themselves, and on how 
we value the benefit of synchronized IGT and KTAP output.  Please also bear in 
mind that we've been happily paying a similar cost per each of IGT dynamic 
sub-subtests that provide CI results from i915 selftest.

If you don't agree then I think we should forgot about granularity at the 
level of dynamic sub-subtests, each corresponding to one KUnit test case, and 
report only one IGT subtest result per each KUnit test module, leaving more 
in-depth analysis of the KTAP output to humans solving driver problems.

> Ok, if are there filtering rules on IGT limiting what subtests will be
> executed, then be it.  But for normal execution, I can't see why we
> would be adding a performance penalty.

Our CI can collect reports from IGT subtests, and optionally their dynamic 
sub-subtests if applicable.  In case of KUnit tests, we need to translate KTAP 
results to IGT results for CI to be able to report them.  Are we interested in 
high granularity and high precision of IGT results from KUnit tests?  For me 
the answer is obvious: yes, we are.

Thanks,
Janusz

> 
> Regards,
> Mauro
> 
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_kmod.c | 135 ++++++++++++-------------------------------------
> >  1 file changed, 31 insertions(+), 104 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 37591b7389..5bd8f56088 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -960,6 +960,7 @@ static int kunit_kmsg_get_results(struct igt_list_head *results,
> >  {
> >  	char *suite_name = NULL, *case_name = NULL;
> >  	struct igt_ktap_results *ktap;
> > +	unsigned long taints;
> >  	int flags, err;
> >  
> >  	if (igt_debug_on(tst->kmsg < 0))
> > @@ -998,6 +999,11 @@ static int kunit_kmsg_get_results(struct igt_list_head *results,
> >  	if (err)
> >  		goto out_kmod_unload;
> >  
> > +	if (igt_debug_on(igt_kernel_tainted(&taints))) {
> > +		err = -ENOTRECOVERABLE;
> > +		goto out_remove_module;
> > +	}
> > +
> >  	ktap = igt_ktap_alloc(results);
> >  	if (igt_debug_on(!ktap)) {
> >  		err = -ENOMEM;
> > @@ -1203,84 +1209,43 @@ static void __igt_kunit(struct igt_ktest *tst,
> >  			const char *opts,
> >  			struct igt_list_head *tests)
> >  {
> > -	struct modprobe_data modprobe = { tst->kmod, opts, 0, pthread_self(), };
> > -	char *suite_name = NULL, *case_name = NULL;
> > -	struct igt_ktap_result *t, *r = NULL;
> > -	struct igt_ktap_results *ktap;
> > -	pthread_mutexattr_t attr;
> > -	IGT_LIST_HEAD(results);
> > -	int ret = -EINPROGRESS;
> > -	unsigned long taints;
> > -
> > -	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
> > -
> > -	ktap = igt_ktap_alloc(&results);
> > -	igt_require(ktap);
> > +	struct igt_ktap_result *t;
> >  
> >  	igt_list_for_each_entry(t, tests, link) {
> > +		char *suite_name = NULL, *case_name = NULL;
> > +		IGT_LIST_HEAD(results);
> > +		unsigned long taints;
> > +
> >  		igt_dynamic_f("%s%s%s",
> >  			      strcmp(t->suite_name, name) ?  t->suite_name : "",
> >  			      strcmp(t->suite_name, name) ? "-" : "",
> >  			      t->case_name) {
> > +			struct igt_ktap_result *r = NULL;
> > +			char filter[1024];
> > +			int expect = 2;
> >  
> > -			if (!modprobe.thread) {
> > -				igt_assert_eq(pthread_mutexattr_init(&attr), 0);
> > -				igt_assert_eq(pthread_mutexattr_setrobust(&attr,
> > -							  PTHREAD_MUTEX_ROBUST),
> > -					      0);
> > -				igt_assert_eq(pthread_mutex_init(&modprobe.lock,
> > -								 &attr), 0);
> > -
> > -				modprobe.err = pthread_create(&modprobe.thread,
> > -							      NULL,
> > -							      modprobe_task,
> > -							      &modprobe);
> > -				igt_assert_eq(modprobe.err, 0);
> > -
> > -				igt_assert(igt_list_empty(&results));
> > -				igt_assert_eq(ret, -EINPROGRESS);
> > -				ret = kunit_kmsg_result_get(&results, &modprobe,
> > -							    tst->kmsg, ktap);
> > -				igt_fail_on(igt_list_empty(&results));
> > -
> > -				r = igt_list_first_entry(&results, r, link);
> > -			}
> > +			igt_skip_on(igt_kernel_tainted(&taints));
> >  
> > -			while (igt_debug_on_f(strcmp(r->suite_name, t->suite_name),
> > -					      "suite_name expected: %s, got: %s\n",
> > -					      t->suite_name, r->suite_name) ||
> > -			       igt_debug_on_f(strcmp(r->case_name, t->case_name),
> > -					      "case_name expected: %s, got: %s\n",
> > -					      t->case_name, r->case_name) ||
> > -			       r->code == IGT_EXIT_INVALID) {
> > +			igt_assert_lt(snprintf(filter, sizeof(filter), "filter_glob=%s.%s",
> > +					       t->suite_name, t->case_name), sizeof(filter));
> > +			igt_assert_eq(kunit_kmsg_get_results(&results, tst, filter, opts), 0);
> >  
> > -				int code = r->code;
> > +			do {
> > +				igt_fail_on_f(!expect--, "Invalid result code\n");
> >  
> >  				kunit_result_free(&r, &suite_name, &case_name);
> > -				if (igt_list_empty(&results)) {
> > -					igt_assert_eq(ret, -EINPROGRESS);
> > -					ret = kunit_kmsg_result_get(&results,
> > -								    &modprobe,
> > -								    tst->kmsg,
> > -								    ktap);
> > -					igt_fail_on(igt_list_empty(&results));
> > -				}
> > +				igt_fail_on(igt_list_empty(&results));
> >  
> >  				r = igt_list_first_entry(&results, r, link);
> >  
> > -				if (code != IGT_EXIT_INVALID)
> > -					continue;
> > -
> > -				/* result from parametrized test case */
> > -				igt_fail_on_f(strcmp(r->suite_name, suite_name),
> > +				igt_fail_on_f(strcmp(r->suite_name, t->suite_name),
> >  					      "suite_name expected: %s, got: %s\n",
> > -					      suite_name, r->suite_name);
> > -				igt_fail_on_f(strcmp(r->case_name, case_name),
> > +					      t->suite_name, r->suite_name);
> > +				igt_fail_on_f(strcmp(r->case_name, t->case_name),
> >  					      "case_name expected: %s, got: %s\n",
> > -					      case_name, r->case_name);
> > -			}
> > +					      t->case_name, r->case_name);
> >  
> > -			igt_assert_neq(r->code, IGT_EXIT_INVALID);
> > +			} while (r->code == IGT_EXIT_INVALID);
> >  
> >  			if (r->msg && *r->msg) {
> >  				igt_skip_on_f(r->code == IGT_EXIT_SKIP,
> > @@ -1297,57 +1262,19 @@ static void __igt_kunit(struct igt_ktest *tst,
> >  			}
> >  			igt_assert_eq(r->code, IGT_EXIT_SUCCESS);
> >  
> > -			switch (pthread_mutex_lock(&modprobe.lock)) {
> > -			case 0:
> > -				igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> > -				break;
> > -			case EOWNERDEAD:
> > -				/* leave the mutex unrecoverable */
> > -				igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> > -				__attribute__ ((fallthrough));
> > -			case ENOTRECOVERABLE:
> > -				igt_assert_eq(modprobe.err, 0);
> > -				break;
> > -			default:
> > -				igt_debug("pthread_mutex_lock() failed\n");
> > -				break;
> > -			}
> > -
> >  			igt_assert_eq(igt_kernel_tainted(&taints), 0);
> >  		}
> >  
> > -		if (igt_debug_on(ret != -EINPROGRESS))
> > -			break;
> > -	}
> > +		kunit_results_free(&results, &suite_name, &case_name);
> >  
> > -	kunit_results_free(&results, &suite_name, &case_name);
> > +		igt_debug_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
> > +		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
> >  
> > -	if (modprobe.thread) {
> > -		switch (pthread_mutex_lock(&modprobe.lock)) {
> > -		case 0:
> > -			igt_debug_on(pthread_cancel(modprobe.thread));
> > -			igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> > -			igt_debug_on(pthread_join(modprobe.thread, NULL));
> > -			break;
> > -		case EOWNERDEAD:
> > -			/* leave the mutex unrecoverable */
> > -			igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> > -			break;
> > -		case ENOTRECOVERABLE:
> > -			break;
> > -		default:
> > -			igt_debug("pthread_mutex_lock() failed\n");
> > -			igt_debug_on(pthread_join(modprobe.thread, NULL));
> > +		if (igt_debug_on(igt_kernel_tainted(&taints))) {
> > +			igt_info("Kernel tainted, not executing more selftests.\n");
> >  			break;
> >  		}
> >  	}
> > -
> > -	igt_ktap_free(ktap);
> > -
> > -	igt_skip_on(modprobe.err);
> > -	igt_skip_on(igt_kernel_tainted(&taints));
> > -	if (ret != -EINPROGRESS)
> > -		igt_skip_on_f(ret, "KTAP parser failed\n");
> >  }
> >  
> >  /**
> 





