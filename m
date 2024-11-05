Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B207D1267D
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 10:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2A210E558;
	Tue,  5 Nov 2024 10:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEU1irkj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D32210E558
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730803213; x=1762339213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TmF2Hp4yo/u58NhdeW0agz8d/SXn9+JW+547mJhCOiY=;
 b=CEU1irkjfaoUXc3jJp5TrxKg+NfqmG3txoF5vcq6xHO0RpzTyLjWAvZ9
 Sht0PE76cwzSue/Qg4NtckifB4xo/aO9f3jm2mspdbo1tsa4B6iZg3vK7
 734N0zqB6IiOkPzW8NG465rFp8wlOuRxmwx7R9gyfjQdJkfz2yOTB5/b9
 MeXx8ifhK21fTu4qRpHdNQl9VWjQI+8MZJyTFuqYWZJ2cf9Au69YxUHeB
 iTAtpnMIoYdYR3C4+3A2ANOEH/sQAZSaq2F0PSQBuxYGtdNuzrmgJeCT9
 akXm9Lf8xkl/8rMRozqbk3iFvK06Oyp6V+66+Cx3o9M4KK4yRxuGxOBjr g==;
X-CSE-ConnectionGUID: jHXJazn7Sey0my5uEJFhCg==
X-CSE-MsgGUID: LPrNRWt8QrKyXw6djlMGXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30317952"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30317952"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:40:13 -0800
X-CSE-ConnectionGUID: ZC78y7H0R16utH+YLo40Ig==
X-CSE-MsgGUID: fEcs2rXXT02WoykOn1p7Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="107302391"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.89])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:40:12 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/3] lib/igt_kmod: Drop legacy kunit fallback
Date: Tue, 05 Nov 2024 11:40:09 +0100
Message-ID: <2181607.3Lj2Plt8kZ@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241105055255.2466236-2-lucas.demarchi@intel.com>
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
 <20241105055255.2466236-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Lucas,

On Tuesday, 5 November 2024 06:52:53 CET Lucas De Marchi wrote:
> Kunit has support for listing tests with debugfs for quite some time,
> there's no need for the fallback to be happening: let's just start
> failing the tests if we can't get the list of tests from debugfs.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_kmod.c | 285 +++----------------------------------------------
>  1 file changed, 13 insertions(+), 272 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 87036d06c..4eeab79ec 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -959,121 +959,6 @@ static bool kunit_set_filtering(const char *filter_glob, const char *filter,
>  	return ret;
>  }
>  
> -struct modprobe_data {
> -	struct kmod_module *kmod;
> -	const char *opts;
> -	int err;
> -	pthread_t parent;
> -	pthread_mutex_t lock;
> -	pthread_t thread;
> -};
> -
> -static void *modprobe_task(void *arg)
> -{
> -	struct modprobe_data *data = arg;
> -
> -	data->err = modprobe(data->kmod, data->opts);
> -
> -	if (igt_debug_on(data->err)) {
> -		bool once = false;
> -		int err;
> -
> -		while (err = pthread_mutex_trylock(&data->lock),
> -		       err && !igt_debug_on(err != EBUSY)) {
> -			igt_debug_on(pthread_kill(data->parent, SIGCHLD) &&
> -				     !once);
> -			once = true;
> -		}
> -	} else {
> -		/* let main thread use mutex to detect modprobe completion */
> -		igt_debug_on(pthread_mutex_lock(&data->lock));
> -	}
> -
> -	return NULL;
> -}
> -
> -static void kunit_sigchld_handler(int signal)
> -{
> -}
> -
> -static int kunit_kmsg_result_get(struct igt_list_head *results,
> -				 struct modprobe_data *modprobe,
> -				 int fd, struct igt_ktap_results *ktap)
> -{
> -	struct sigaction sigchld = { .sa_handler = kunit_sigchld_handler, },
> -			 saved;
> -	char record[BUF_LEN + 1], *buf;
> -	unsigned long taints;
> -	int ret;
> -
> -	do {
> -		int err;
> -
> -		if (igt_debug_on(igt_kernel_tainted(&taints)))
> -			return -ENOTRECOVERABLE;
> -
> -		if (modprobe) {
> -			err = igt_debug_on(sigaction(SIGCHLD, &sigchld, &saved));
> -			if (err == -1)
> -				return -errno;
> -			else if (unlikely(err))
> -				return err;
> -
> -			err = pthread_mutex_lock(&modprobe->lock);
> -			switch (err) {
> -			case EOWNERDEAD:
> -				/* leave the mutex unrecoverable */
> -				igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
> -				__attribute__ ((fallthrough));
> -			case ENOTRECOVERABLE:
> -				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
> -				if (igt_debug_on(modprobe->err))
> -					return modprobe->err;
> -				break;
> -			case 0:
> -				break;
> -			default:
> -				igt_debug("pthread_mutex_lock() error: %d\n", err);
> -				igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
> -				return -err;
> -			}
> -		}
> -
> -		ret = read(fd, record, BUF_LEN);
> -
> -		if (modprobe && !err) {	/* pthread_mutex_lock() succeeded */
> -			igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
> -			igt_debug_on(sigaction(SIGCHLD, &saved, NULL));
> -		}
> -
> -		if (igt_debug_on(!ret))
> -			return -ENODATA;
> -		if (igt_debug_on(ret == -1))
> -			return -errno;
> -		if (unlikely(igt_debug_on(ret < 0)))
> -			break;
> -
> -		/* skip kmsg continuation lines */
> -		if (igt_debug_on(*record == ' '))
> -			continue;
> -
> -		/* NULL-terminate the record */
> -		record[ret] = '\0';
> -
> -		/* detect start of log message, continue if not found */
> -		buf = strchrnul(record, ';');
> -		if (igt_debug_on(*buf == '\0'))
> -			continue;
> -		buf++;
> -
> -		ret = igt_ktap_parse(buf, ktap);
> -		if (!ret || igt_debug_on(ret != -EINPROGRESS))
> -			break;
> -	} while (igt_list_empty(results));
> -
> -	return ret;
> -}
> -
>  static void kunit_result_free(struct igt_ktap_result **r,
>  			      char **suite_name, char **case_name)
>  {
> @@ -1148,146 +1033,6 @@ out_fclose:
>  	return err;
>  }
>  
> -static void __igt_kunit_legacy(struct igt_ktest *tst,
> -			       const char *subtest,
> -			       const char *opts)
> -{
> -	struct modprobe_data modprobe = { tst->kmod, opts, 0, pthread_self(), };
> -	char *suite_name = NULL, *case_name = NULL;
> -	struct igt_ktap_results *ktap;
> -	struct igt_ktap_result *r;
> -	pthread_mutexattr_t attr;
> -	IGT_LIST_HEAD(results);
> -	unsigned long taints;
> -	int flags, ret;
> -
> -	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
> -
> -	igt_skip_on((flags = fcntl(tst->kmsg, F_GETFL, 0), flags < 0));
> -	igt_skip_on_f(fcntl(tst->kmsg, F_SETFL, flags & ~O_NONBLOCK) == -1,
> -		      "Could not set /dev/kmsg to blocking mode\n");
> -
> -	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
> -
> -	igt_skip_on(pthread_mutexattr_init(&attr));
> -	igt_skip_on(pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST));
> -	igt_skip_on(pthread_mutex_init(&modprobe.lock, &attr));
> -
> -	ktap = igt_ktap_alloc(&results);
> -	igt_require(ktap);
> -
> -	if (igt_debug_on(pthread_create(&modprobe.thread, NULL,
> -					modprobe_task, &modprobe))) {
> -		igt_ktap_free(&ktap);
> -		igt_skip("Failed to create a modprobe thread\n");
> -	}
> -
> -	do {
> -		ret = kunit_kmsg_result_get(&results, &modprobe,
> -					    tst->kmsg, ktap);
> -		if (igt_debug_on(ret && ret != -EINPROGRESS))
> -			break;
> -
> -		if (igt_debug_on(igt_list_empty(&results)))
> -			break;
> -
> -		r = igt_list_first_entry(&results, r, link);
> -
> -		igt_dynamic_f("%s%s%s",
> -			      strcmp(r->suite_name, subtest) ?  r->suite_name : "",
> -			      strcmp(r->suite_name, subtest) ? "-" : "",
> -			      r->case_name) {
> -
> -			if (r->code == IGT_EXIT_INVALID) {
> -				/* parametrized test case, get actual result */
> -				kunit_result_free(&r, &suite_name, &case_name);
> -
> -				igt_assert(igt_list_empty(&results));
> -
> -				ret = kunit_kmsg_result_get(&results, &modprobe,
> -							    tst->kmsg, ktap);
> -				if (ret != -EINPROGRESS)
> -					igt_fail_on(ret);
> -
> -				igt_fail_on(igt_list_empty(&results));
> -
> -				r = igt_list_first_entry(&results, r, link);
> -
> -				igt_fail_on_f(strcmp(r->suite_name, suite_name),
> -					      "suite_name expected: %s, got: %s\n",
> -					      suite_name, r->suite_name);
> -				igt_fail_on_f(strcmp(r->case_name, case_name),
> -					      "case_name expected: %s, got: %s\n",
> -					      case_name, r->case_name);
> -			}
> -
> -			igt_assert_neq(r->code, IGT_EXIT_INVALID);
> -
> -			if (r->msg && *r->msg) {
> -				igt_skip_on_f(r->code == IGT_EXIT_SKIP,
> -					      "%s\n", r->msg);
> -				igt_fail_on_f(r->code == IGT_EXIT_FAILURE,
> -					      "%s\n", r->msg);
> -				igt_abort_on_f(r->code == IGT_EXIT_ABORT,
> -					      "%s\n", r->msg);
> -			} else {
> -				igt_skip_on(r->code == IGT_EXIT_SKIP);
> -				igt_fail_on(r->code == IGT_EXIT_FAILURE);
> -				if (r->code == IGT_EXIT_ABORT)
> -					igt_fail(r->code);
> -			}
> -			igt_assert_eq(r->code, IGT_EXIT_SUCCESS);
> -
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
> -			igt_assert_eq(igt_kernel_tainted(&taints), 0);
> -		}
> -
> -		kunit_result_free(&r, &suite_name, &case_name);
> -
> -	} while (ret == -EINPROGRESS);
> -
> -	kunit_results_free(&results, &suite_name, &case_name);
> -
> -	switch (pthread_mutex_lock(&modprobe.lock)) {
> -	case 0:
> -		igt_debug_on(pthread_cancel(modprobe.thread));
> -		igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> -		igt_debug_on(pthread_join(modprobe.thread, NULL));
> -		break;
> -	case EOWNERDEAD:
> -		/* leave the mutex unrecoverable */
> -		igt_debug_on(pthread_mutex_unlock(&modprobe.lock));
> -		break;
> -	case ENOTRECOVERABLE:
> -		break;
> -	default:
> -		igt_debug("pthread_mutex_lock() failed\n");
> -		igt_debug_on(pthread_join(modprobe.thread, NULL));
> -		break;
> -	}
> -
> -	igt_ktap_free(&ktap);
> -
> -	igt_skip_on(modprobe.err);
> -	igt_skip_on(igt_kernel_tainted(&taints));
> -	igt_skip_on_f(ret, "KTAP parser failed\n");
> -}
> -
>  static bool kunit_get_tests(struct igt_list_head *tests,
>  			    struct igt_ktest *tst,
>  			    const char *suite,
> @@ -1476,8 +1221,13 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  		}
>  	}
>  
> +	/* We need the base KUnit module loaded if not built-in */
> +	igt_ignore_warn(igt_kmod_load("kunit", NULL));
> +	kunit_debugfs_path(debugfs_path);
> +
>  	igt_fixture {
>  		igt_require(subtest);
> +		igt_require(*debugfs_path);

Moving this here makes sense to me.

>  
>  		igt_skip_on(igt_ktest_init(&tst, module_name));
>  		igt_skip_on(igt_ktest_begin(&tst));
> @@ -1485,30 +1235,21 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>  		igt_assert(igt_list_empty(&tests));
>  	}
>  
> -	/* We need the base KUnit module loaded if not built-in */
> -	igt_ignore_warn(igt_kmod_load("kunit", NULL));
> -
>  	/*
>  	 * We need to use igt_subtest here, as otherwise it may crash with:
> -	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
> +	 * "skipping is allowed only in fixtures, subtests or igt_simple_main"
>  	 * if used on igt_main. This is also needed in order to provide
>  	 * proper namespace for dynamic subtests, with is required for CI
>  	 * and for documentation.
>  	 */
>  	igt_subtest_with_dynamic(subtest) {
> -		/*
> -		 * TODO: As soon as no longer needed by major Linux
> -		 *	 distributions, replace the fallback to
> -		 *	 __igt_kunit_legacy() processing path, required by
> -		 *	 LTS kernels not capable of using KUnit filters for
> -		 *	 listing test cases in KTAP format, with igt_require.
> -		 */
> -		kunit_debugfs_path(debugfs_path);
> -		if (igt_debug_on(!*debugfs_path) ||
> -		    !kunit_get_tests(&tests, &tst, suite, opts, debugfs_path, &debugfs_dir, &ktap))
> -			__igt_kunit_legacy(&tst, subtest, opts);
> -		else
> -			__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
> +		bool has_tests;
> +
> +		has_tests = kunit_get_tests(&tests, &tst, suite, opts,
> +					    debugfs_path, &debugfs_dir, &ktap);
> +		igt_skip_on(!has_tests);

NIT: In fact, we don't really need this skip.  Since !has_tests means 'tests' 
pointing to an empty list, __igt_kunit() just won't execute any dynamic 
sub-subtests and the subtest result will be SKIP anyway.  Then, either 
we might ignore the return value of kunit_get_tests(), which already takes 
care of submitting debug messages if returning prematurely, or 
kunit_get_tests() might return void instead of boolean, which (and not empty 
'tests', to avoid ambiguity) was needed only for taking the legacy path.

Anyway,

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Thanks,
Janusz

> +
> +		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>  	}
>  
>  	igt_fixture {
> 




