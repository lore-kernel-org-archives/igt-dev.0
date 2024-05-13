Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E13C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 17:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2FE10E8BF;
	Mon, 13 May 2024 17:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OE+VPdiH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE58510E8BF
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715620263; x=1747156263;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i+ofg6VHBO62dMuqzEibR8MqekFQND+jItgnaZ+evuU=;
 b=OE+VPdiHcK4AjMYvkntyFp25YnodxGPH7D1qMb51k+XUAYMPA/3M7u3t
 IgRRUUOs+a80CbYXVZFL8R8ZjXcUUyVwUjH3ZvfYm7Sil0S1mnmoAYs6s
 okt7QAgsMveAqEsGtv9NVxJP5+Cknnl03kttHo/Uz9/4O3HowmsJUOVd9
 ajCrk4/HnfN6fE/iiHneqWicW1rb+H/s5PJ1VbVLNCSGD9waW6ccMJM4x
 IbZyLXIBvEM0oiLfi84pEOSxU0dvJZ4JOGletMEK0Ii5lXN4nn1O5MtQy
 AMkH8pljf8Fi9+D4AgbrMBGekNx7d9TB3fxKVjq/lF4gwgf7ONAqYTqas Q==;
X-CSE-ConnectionGUID: lDxoQ6S8Rrm+ybbSX0mh4w==
X-CSE-MsgGUID: pmEPiWKORTuf7NACaJxD6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11727913"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11727913"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:11:03 -0700
X-CSE-ConnectionGUID: UYzpgWc6S96GGEGqRS7bWw==
X-CSE-MsgGUID: jTe61XEySyyLkabsrso6CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30807720"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 10:11:01 -0700
Date: Mon, 13 May 2024 19:10:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t 1/3] igt_hook: Add feature
Message-ID: <20240513171045.xswiai3hvsadeled@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <20240509152442.189166-2-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509152442.189166-2-gustavo.sousa@intel.com>
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

Hi Gustavo,
On 2024-05-09 at 12:24:29 -0300, Gustavo Sousa wrote:

could you prepend lib/ in subject? imho something like:

[PATCH i-g-t 1/3] lib/igt_hook: Add igt_hook feature

> For development purposes, sometimes it is useful to have a way of
> running custom scripts at certain points of test executions. A
> real-world example I bumped into recently is to collect information from
> sysfs before and after running each entry of a testlist.
> 
> While it is possible for the user to handcraft a script that calls each
> test with the correct actions before and after execution, we can provide
> a better experience by adding built-in support for running hooks during
> test execution.
> 
> That would be even better when adding the same kind of support for
> igt_runner (which is done in an upcoming change), since the user can
> also nicely resume with igt_resume with the hook already setup in case a
> crash happens during execution of the test list.
> 
> As such provide implement support for hooks, integrate it into
> igt_core and expose the functionality via --hook CLI option on test
> executables.
> 

I suggest to add Petri to Cc

> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>  lib/igt_core.c                                | 116 +++-
>  lib/igt_hook.c                                | 499 ++++++++++++++++++
>  lib/igt_hook.h                                |  86 +++
>  lib/meson.build                               |   1 +
>  lib/tests/igt_hook.c                          | 187 +++++++
>  lib/tests/igt_hook_integration.c              | 297 +++++++++++
>  lib/tests/meson.build                         |   2 +
>  8 files changed, 1180 insertions(+), 9 deletions(-)
>  create mode 100644 lib/igt_hook.c
>  create mode 100644 lib/igt_hook.h
>  create mode 100644 lib/tests/igt_hook.c
>  create mode 100644 lib/tests/igt_hook_integration.c
> 
> diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> index 9085eb924e85..11458c68124b 100644
> --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> @@ -32,6 +32,7 @@
>      <xi:include href="xml/igt_fb.xml"/>
>      <xi:include href="xml/igt_frame.xml"/>
>      <xi:include href="xml/igt_gt.xml"/>
> +    <xi:include href="xml/igt_hook.xml"/>
>      <xi:include href="xml/igt_io.xml"/>
>      <xi:include href="xml/igt_kmod.xml"/>
>      <xi:include href="xml/igt_kms.xml"/>
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ff3e0392316..291d891cf884 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -70,6 +70,7 @@
>  
>  #include "igt_core.h"
>  #include "igt_aux.h"
> +#include "igt_hook.h"
>  #include "igt_sysfs.h"
>  #include "igt_sysrq.h"
>  #include "igt_rc.h"
> @@ -241,6 +242,9 @@
>   * - '*,!basic*' match any subtest not starting basic
>   * - 'basic*,!basic-render*' match any subtest starting basic but not starting basic-render
>   *
> + * It is possible to run a shell script at certain points of test execution with
> + * "--hook". See the usage description with "--help-hook" for details.
> + *
>   * # Configuration
>   *
>   * Some of IGT's behavior can be configured through a configuration file.
> @@ -273,6 +277,8 @@ static unsigned int exit_handler_count;
>  const char *igt_interactive_debug;
>  bool igt_skip_crc_compare;
>  
> +static struct igt_hook *igt_hook = NULL;
> +
>  /* subtests helpers */
>  static bool show_testlist = false;
>  static bool list_subtests = false;
> @@ -338,6 +344,8 @@ enum {
>  	OPT_INTERACTIVE_DEBUG,
>  	OPT_SKIP_CRC,
>  	OPT_TRACE_OOPS,
> +	OPT_HOOK,
> +	OPT_HELP_HOOK,
>  	OPT_DEVICE,
>  	OPT_VERSION,
>  	OPT_HELP = 'h'
> @@ -810,6 +818,8 @@ static void common_exit_handler(int sig)
>  		bind_fbcon(true);
>  	}
>  
> +	igt_hook_free(igt_hook);
> +
>  	/* When not killed by a signal check that igt_exit() has been properly
>  	 * called. */
>  	assert(sig != 0 || igt_exit_called || igt_is_aborting);
> @@ -907,6 +917,8 @@ static void print_usage(const char *help_str, bool output_on_stderr)
>  		   "  --interactive-debug[=domain]\n"
>  		   "  --skip-crc-compare\n"
>  		   "  --trace-on-oops\n"
> +		   "  --hook [<events>:]<cmd>\n"
> +		   "  --help-hook\n"
>  		   "  --help-description\n"
>  		   "  --describe\n"
>  		   "  --device filters\n"
> @@ -1090,6 +1102,8 @@ static int common_init(int *argc, char **argv,
>  		{"interactive-debug", optional_argument, NULL, OPT_INTERACTIVE_DEBUG},
>  		{"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_CRC},
>  		{"trace-on-oops",     no_argument,       NULL, OPT_TRACE_OOPS},
> +		{"hook",              required_argument, NULL, OPT_HOOK},
> +		{"help-hook",         no_argument,       NULL, OPT_HELP_HOOK},
>  		{"device",            required_argument, NULL, OPT_DEVICE},
>  		{"version",           no_argument,       NULL, OPT_VERSION},
>  		{"help",              no_argument,       NULL, OPT_HELP},
> @@ -1225,6 +1239,24 @@ static int common_init(int *argc, char **argv,
>  		case OPT_TRACE_OOPS:
>  			show_ftrace = true;
>  			break;
> +		case OPT_HOOK:
> +			assert(optarg);
> +			if (igt_hook) {
> +				igt_warn("Overriding previous hook descriptor\n");
> +				igt_hook_free(igt_hook);
> +			}
> +			igt_hook = igt_hook_init(optarg, &ret);
> +			if (!igt_hook) {
> +				igt_critical("Failed to initialize hook data: %s\n",
> +					     igt_hook_error_str(ret));
> +				ret = ret > 0 ? -2 : -3;
> +				goto out;
> +			}
> +			break;
> +		case OPT_HELP_HOOK:
> +			igt_hook_print_help(stdout, "--hook");
> +			ret = -1;
> +			goto out;
>  		case OPT_DEVICE:
>  			assert(optarg);
>  			/* if set by env IGT_DEVICE we need to free it */
> @@ -1274,9 +1306,24 @@ out:
>  			exit(IGT_EXIT_INVALID);
>  	}
>  
> -	if (ret < 0)
> -		/* exit with no error for -h/--help */
> -		exit(ret == -1 ? 0 : IGT_EXIT_INVALID);
> +	if (ret < 0) {
> +		free(igt_hook);
> +		igt_hook = NULL;
> +
> +		switch (ret) {
> +		case -1: /* exit with no error for -h/--help */
> +			exit(0);
> +			break;
> +		case -2:
> +			exit(IGT_EXIT_INVALID);
> +			break;
> +		case -3:
> +			exit(IGT_EXIT_ABORT);
> +			break;
> +		default:
> +			assert(0);
> +		}
> +	}
>  
>  	if (!igt_only_list_subtests()) {
>  		bind_fbcon(false);
> @@ -1284,6 +1331,15 @@ out:
>  		print_version();
>  		igt_srandom();
>  
> +		if (igt_hook) {
> +			struct igt_hook_evt hook_evt = {
> +				.evt_type = IGT_HOOK_PRE_TEST,
> +				.target_name = command_str,
> +			};
> +
> +			igt_hook_push_evt(igt_hook, &hook_evt);
> +		}
> +
>  		sync();
>  		oom_adjust_for_doom();
>  		ftrace_dump_on_oops(show_ftrace);
> @@ -1487,6 +1543,16 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
>  	igt_thread_clear_fail_state();
>  
>  	igt_gettime(&subtest_time);
> +
> +	if (igt_hook) {
> +		struct igt_hook_evt hook_evt = {
> +			.evt_type = IGT_HOOK_PRE_SUBTEST,
> +			.target_name = subtest_name,
> +		};
> +
> +		igt_hook_push_evt(igt_hook, &hook_evt);
> +	}
> +
>  	return (in_subtest = subtest_name);
>  }
>  
> @@ -1517,6 +1583,16 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name)
>  	_igt_dynamic_tests_executed++;
>  
>  	igt_gettime(&dynamic_subtest_time);
> +
> +	if (igt_hook) {
> +		struct igt_hook_evt hook_evt = {
> +			.evt_type = IGT_HOOK_PRE_DYN_SUBTEST,
> +			.target_name = dynamic_subtest_name,
> +		};
> +
> +		igt_hook_push_evt(igt_hook, &hook_evt);
> +	}
> +
>  	return (in_dynamic_subtest = dynamic_subtest_name);
>  }
>  
> @@ -1602,6 +1678,17 @@ __noreturn static void exit_subtest(const char *result)
>  	struct timespec *thentime = in_dynamic_subtest ? &dynamic_subtest_time : &subtest_time;
>  	jmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
>  
> +	if (igt_hook) {
> +		struct igt_hook_evt hook_evt = {
> +			.evt_type = (in_dynamic_subtest
> +					? IGT_HOOK_POST_DYN_SUBTEST
> +					: IGT_HOOK_POST_SUBTEST),
> +			.result = result,
> +		};
> +
> +		igt_hook_push_evt(igt_hook, &hook_evt);
> +	}
> +
>  	if (!igt_thread_is_main()) {
>  		igt_thread_fail();
>  		pthread_exit(NULL);
> @@ -2274,6 +2361,7 @@ void __igt_abort(const char *domain, const char *file, const int line,
>  void igt_exit(void)
>  {
>  	int tmp;
> +	const char *result;
>  
>  	if (!test_with_subtests)
>  		igt_thread_assert_no_failures();
> @@ -2318,12 +2406,7 @@ void igt_exit(void)
>  
>  	assert(waitpid(-1, &tmp, WNOHANG) == -1 && errno == ECHILD);
>  
> -	if (!test_with_subtests) {
> -		struct timespec now;
> -		const char *result;
> -
> -		igt_gettime(&now);
> -
> +	if (!test_with_subtests || igt_hook) {
>  		switch (igt_exitcode) {
>  			case IGT_EXIT_SUCCESS:
>  				result = "SUCCESS";
> @@ -2334,6 +2417,12 @@ void igt_exit(void)
>  			default:
>  				result = "FAIL";
>  		}
> +	}
> +
> +	if (!test_with_subtests) {
> +		struct timespec now;
> +
> +		igt_gettime(&now);
>  
>  		if (test_multi_fork_child) /* parent will do the yelling */
>  			_log_line_fprintf(stdout, "dyn_child pid:%d (%.3fs) ends with err=%d\n",
> @@ -2344,6 +2433,15 @@ void igt_exit(void)
>  					  result, igt_time_elapsed(&subtest_time, &now));
>  	}
>  
> +	if (igt_hook) {
> +		struct igt_hook_evt hook_evt = {
> +			.evt_type = IGT_HOOK_POST_TEST,
> +			.result = result,
> +		};
> +
> +		igt_hook_push_evt(igt_hook, &hook_evt);
> +	}
> +
>  	exit(igt_exitcode);
>  }
>  
> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> new file mode 100644
> index 000000000000..8a39e19e3e5f
> --- /dev/null
> +++ b/lib/igt_hook.c
> @@ -0,0 +1,499 @@
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Please replace this with SPDX, here and in other new files.
Also use checkpatch.pl from Linux kernel for checking.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +#include <assert.h>
> +#include <errno.h>
> +#include <limits.h>
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include "igt_hook.h"
> +
> +/**
> + * SECTION:igt_hook
> + * @short_description: Support for running a hook script on test execution
> + * @title: Hook support
> + *
> + * IGT provides support for running a hook script when executing tests. This
> + * support is provided to users via CLI option `--hook` available in test
> + * binaries. Users should use `--help-hook` for detailed usaged description of
> + * the feature.
> + *
> + * The sole user of the exposed API is `igt_core`, which calls @igt_hook_init()
> + * when initializing a test case, then calls @igt_hook_push_evt() for each event
> + * that occurs during that test's execution and finally calls @igt_hook_free()
> + * to clean up at the end.
> + */
> +
> +#define TEST_NAME_INITIAL_SIZE 16

Can it grow?

Regards,
Kamil

> +
> +typedef uint16_t evt_mask_t;
> +
> +struct igt_hook {
> +	evt_mask_t evt_mask;
> +	char *cmd;
> +	char *test_name;
> +	size_t test_name_size;
> +	char *subtest_name;
> +	size_t subtest_name_size;
> +	char *dyn_subtest_name;
> +	size_t dyn_subtest_name_size;
> +	char *test_fullname;
> +};
> +
> +enum igt_hook_error {
> +	IGT_HOOK_EVT_EMPTY_NAME = 1,
> +	IGT_HOOK_EVT_NO_MATCH,
> +};
> +
> +static_assert(IGT_HOOK_NUM_EVENTS <= sizeof(evt_mask_t) * CHAR_BIT,
> +	      "Number of event types does not fit event type mask");
> +
> +static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt_type)
> +{
> +	switch (evt_type) {
> +	case IGT_HOOK_PRE_TEST:
> +		return "pre-test";
> +	case IGT_HOOK_PRE_SUBTEST:
> +		return "pre-subtest";
> +	case IGT_HOOK_PRE_DYN_SUBTEST:
> +		return "pre-dyn-subtest";
> +	case IGT_HOOK_POST_DYN_SUBTEST:
> +		return "post-dyn-subtest";
> +	case IGT_HOOK_POST_SUBTEST:
> +		return "post-subtest";
> +	case IGT_HOOK_POST_TEST:
> +		return "post-test";
> +	case IGT_HOOK_NUM_EVENTS:
> +		break;
> +	/* No "default:" case, to force a warning from -Wswitch in case we miss
> +	 * any new event type. */
> +	}
> +	return "?";
> +}
> +
> +static int igt_hook_parse_hook_str(const char *hook_str, evt_mask_t *evt_mask, const char **cmd)
> +{
> +	const char *s;
> +
> +	if (!strchr(hook_str, ':')) {
> +		*evt_mask = ~0;
> +		*cmd = hook_str;
> +		return 0;
> +	}
> +
> +	s = hook_str;
> +	*evt_mask = 0;
> +
> +	while (1) {
> +		const char *evt_name;
> +		bool has_match;
> +		bool is_star;
> +		enum igt_hook_evt_type evt_type;
> +
> +		evt_name = s;
> +
> +		while (*s != ':' && *s != ',')
> +			s++;
> +
> +		if (evt_name == s)
> +			return IGT_HOOK_EVT_EMPTY_NAME;
> +
> +		has_match = false;
> +		is_star = *evt_name == '*' && evt_name + 1 == s;
> +
> +		for (evt_type = IGT_HOOK_PRE_TEST; evt_type < IGT_HOOK_NUM_EVENTS; evt_type++) {
> +			if (!is_star) {
> +				const char *this_event_name = igt_hook_evt_type_to_name(evt_type);
> +				size_t len = s - evt_name;
> +
> +				if (len != strlen(this_event_name))
> +					continue;
> +
> +				if (strncmp(evt_name, this_event_name, len))
> +					continue;
> +			}
> +
> +			*evt_mask |= 1 << evt_type;
> +			has_match = true;
> +
> +			if (!is_star)
> +				break;
> +		}
> +
> +		if (!has_match)
> +			return IGT_HOOK_EVT_NO_MATCH;
> +
> +		if (*s++ == ':')
> +			break;
> +	}
> +
> +	*cmd = s;
> +
> +	return 0;
> +}
> +
> +static size_t igt_hook_calc_test_fullname_size(struct igt_hook *igt_hook) {
> +	/* The maximum size of test_fullname will be the maximum length of
> +	 * "igt@<test_name>@<subtest_name>@<dyn_subtest_name>" plus 1 for the
> +	 * null byte. */
> +	return (igt_hook->test_name_size +
> +		igt_hook->subtest_name_size +
> +		igt_hook->dyn_subtest_name_size) + 4;
> +}
> +
> +static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
> +{
> +	int i;
> +	char *s;
> +	const char *values[3] = {
> +		igt_hook->test_name,
> +		igt_hook->subtest_name,
> +		igt_hook->dyn_subtest_name,
> +	};
> +
> +	if (igt_hook->test_name[0] == '\0') {
> +		igt_hook->test_fullname[0] = '\0';
> +		return;
> +	}
> +
> +	s = stpcpy(igt_hook->test_fullname, "igt");
> +	for (i = 0; i < 3 && values[i][0] != '\0'; i++) {
> +		*s++ = '@';
> +		s = stpcpy(s, values[i]);
> +	}
> +}
> +
> +/**
> + * igt_hook_init:
> + * @hook_str: Hook descriptor string.
> + * @error: Pointer to error number.
> + *
> + * Allocate and initialize an #igt_hook structure.
> + *
> + * This function parses the hook descriptor @hook_str and initializes the struct
> + * to be returned.
> + *
> + * The hook descriptor comes from the argument to `--hook` of the test
> + * executable being run.
> + *
> + * If not #NULL, @error is used to store a non-zero error number if an error
> + * happens. A human-readable string for that error number can be obtained with
> + * @igt_hook_error_str().
> + *
> + * Returns: The pointer to the #igt_hook structure on success or #NULL on error.
> + */
> +struct igt_hook *igt_hook_init(const char *hook_str, int *error)
> +{
> +	int err;
> +	evt_mask_t evt_mask;
> +	const char *cmd;
> +	struct igt_hook *igt_hook = NULL;
> +
> +
> +	err = igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
> +	if (err)
> +		goto out;
> +
> +	igt_hook = calloc(1, sizeof(*igt_hook));
> +	igt_hook->evt_mask = evt_mask;
> +
> +	igt_hook->cmd = strdup(cmd);
> +	if (!igt_hook->cmd) {
> +		err = -errno;
> +		goto out;
> +	}
> +
> +	igt_hook->test_name = malloc(TEST_NAME_INITIAL_SIZE);
> +	igt_hook->test_name_size = TEST_NAME_INITIAL_SIZE;
> +	igt_hook->subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
> +	igt_hook->subtest_name_size = TEST_NAME_INITIAL_SIZE;
> +	igt_hook->dyn_subtest_name = malloc(TEST_NAME_INITIAL_SIZE);
> +	igt_hook->dyn_subtest_name_size = TEST_NAME_INITIAL_SIZE;
> +	igt_hook->test_fullname = malloc(igt_hook_calc_test_fullname_size(igt_hook));
> +
> +	igt_hook->test_name[0] = '\0';
> +	igt_hook->subtest_name[0] = '\0';
> +	igt_hook->dyn_subtest_name[0] = '\0';
> +	igt_hook->test_fullname[0] = '\0';
> +
> +out:
> +	if (err) {
> +		if (error)
> +			*error = err;
> +
> +		igt_hook_free(igt_hook);
> +
> +		return NULL;
> +	}
> +
> +	return igt_hook;
> +}
> +
> +/**
> + * igt_hook_free:
> + * @igt_hook: The igt_hook struct.
> + *
> + * De-initialize an igt_hook struct returned by @igt_hook_init().
> + *
> + * This is a no-op if @igt_hook is #NULL.
> + */
> +void igt_hook_free(struct igt_hook *igt_hook)
> +{
> +	if (!igt_hook)
> +		return;
> +
> +	free(igt_hook->cmd);
> +	free(igt_hook->test_name);
> +	free(igt_hook->subtest_name);
> +	free(igt_hook->dyn_subtest_name);
> +	free(igt_hook);
> +}
> +
> +static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
> +{
> +	char **name_ptr;
> +	size_t *size_ptr;
> +	size_t len;
> +
> +	switch (evt->evt_type) {
> +	case IGT_HOOK_PRE_TEST:
> +		name_ptr = &igt_hook->test_name;
> +		size_ptr = &igt_hook->test_name_size;
> +		break;
> +	case IGT_HOOK_PRE_SUBTEST:
> +		name_ptr = &igt_hook->subtest_name;
> +		size_ptr = &igt_hook->subtest_name_size;
> +		break;
> +	case IGT_HOOK_PRE_DYN_SUBTEST:
> +		name_ptr = &igt_hook->dyn_subtest_name;
> +		size_ptr = &igt_hook->dyn_subtest_name_size;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	len = strlen(evt->target_name);
> +	if (len + 1 > *size_ptr) {
> +		size_t fullname_size;
> +
> +		*size_ptr *= 2;
> +		*name_ptr = realloc(*name_ptr, *size_ptr);
> +
> +		fullname_size = igt_hook_calc_test_fullname_size(igt_hook);
> +		igt_hook->test_fullname = realloc(igt_hook->test_fullname, fullname_size);
> +	}
> +
> +	strcpy(*name_ptr, evt->target_name);
> +	igt_hook_update_test_fullname(igt_hook);
> +}
> +
> +static void igt_hook_update_test_name_post_call(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
> +{
> +	switch (evt->evt_type) {
> +	case IGT_HOOK_POST_TEST:
> +		igt_hook->test_name[0] = '\0';
> +		break;
> +	case IGT_HOOK_POST_SUBTEST:
> +		igt_hook->subtest_name[0] = '\0';
> +		break;
> +	case IGT_HOOK_POST_DYN_SUBTEST:
> +		igt_hook->dyn_subtest_name[0] = '\0';
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	igt_hook_update_test_fullname(igt_hook);
> +}
> +
> +static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
> +{
> +	setenv("IGT_HOOK_EVENT", igt_hook_evt_type_to_name(evt->evt_type), 1);
> +	setenv("IGT_HOOK_TEST_FULLNAME", igt_hook->test_fullname, 1);
> +	setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
> +	setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
> +	setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
> +	setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
> +}
> +
> +/**
> + * igt_hook_push_evt:
> + * @igt_hook: The igt_hook structure.
> + * @evt: The event to be pushed.
> + *
> + * Push a new igt_hook event.
> + *
> + * This function must be used to register a new igt_hook event. Calling it will
> + * cause execution of the hook script if the event type matches the filters
> + * provided during initialization of @igt_hook.
> + */
> +void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
> +{
> +	typeof(igt_hook->evt_mask) evt_bit = (1 << evt->evt_type);
> +
> +	igt_hook_update_test_name_pre_call(igt_hook, evt);
> +
> +	if ((evt_bit & igt_hook->evt_mask)) {
> +		igt_hook_update_env_vars(igt_hook, evt);
> +		system(igt_hook->cmd);
> +	}
> +
> +	igt_hook_update_test_name_post_call(igt_hook, evt);
> +}
> +
> +/**
> + * igt_hook_error_str:
> + * @error: Non-zero error number.
> + *
> + * Return a human-readable string containing a description of an error number
> + * generated by one of the `igt_hook_*` functions.
> + *
> + * The string will be the result of strerror() for errors from the C standard
> + * library or a custom description specific to igt_hook.
> + */
> +const char *igt_hook_error_str(int error)
> +{
> +	if (!error)
> +		return "No error";
> +
> +	if (error > 0) {
> +		enum igt_hook_error hook_error = error;
> +
> +		switch (hook_error) {
> +		case IGT_HOOK_EVT_EMPTY_NAME:
> +			return "Empty name in event descriptor";
> +		case IGT_HOOK_EVT_NO_MATCH:
> +			return "Event name in event descriptor does not match any event type";
> +		default:
> +			return "Unknown error";
> +		}
> +	} else {
> +		return strerror(-error);
> +	}
> +}
> +
> +/**
> + * igt_hook_print_help:
> + * @f: File pointer where to write the output.
> + * @option_name: Name of the CLI option that accepts the hook descriptor.
> + *
> + * Print a detailed user help text on hook usage.
> + */
> +void igt_hook_print_help(FILE *f, const char *option_name)
> +{
> +	fprintf(f, "\
> +The option %1$s receives as argument a \"hook descriptor\" and allows the\n\
> +execution of a shell command at different points during execution of tests. Each\n\
> +such a point is called a \"hook event\".\n\
> +\n\
> +Examples:\n\
> +\n\
> +  # Prints hook-specic env vars for every event.\n\
> +  %1$s 'printenv | grep ^IGT_HOOK_'\n\
> +\n\
> +  # Equivalent to the above. Useful if command contains ':'.\n\
> +  %1$s '*:printenv | grep ^IGT_HOOK_'\n\
> +\n\
> +  # Adds a line to out.txt containing the result of each test case.\n\
> +  %1$s 'post-test:echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_RESULT >> out.txt'\n\
> +\n\
> +The accepted format for a hook descriptor is `[<events>:]<cmd>`, where:\n\
> +\n\
> +  - <events> is a comma-separated list of event descriptors, which defines the\n\
> +    set of events be tracked. If omitted, all events are tracked.\n\
> +\n\
> +  - <cmd> is a shell command to be executed on the occurrence each tracked\n\
> +    event. If the command contains ':', then passing <events> is required,\n\
> +    otherwise part of the command would be treated as an event descriptor.\n\
> +\n\
> +", option_name);
> +
> +	fprintf(f, "\
> +An \"event descriptor\" is either the name of an event or the string '*'. The\n\
> +latter matches all event names. The list of possible event names is provided\n\
> +below:\n\
> +\n\
> +");
> +
> +	for (enum igt_hook_evt_type et = 0; et < IGT_HOOK_NUM_EVENTS; et++) {
> +		const char *desc;
> +
> +		switch (et) {
> +		case IGT_HOOK_PRE_TEST:
> +			desc = "Occurs before a test case starts.";
> +			break;
> +		case IGT_HOOK_PRE_SUBTEST:
> +			desc = "Occurs before the execution of a subtest.";
> +			break;
> +		case IGT_HOOK_PRE_DYN_SUBTEST:
> +			desc = "Occurs before the execution of a dynamic subtest.";
> +			break;
> +		case IGT_HOOK_POST_DYN_SUBTEST:
> +			desc = "Occurs after the execution of a dynamic subtest.";
> +			break;
> +		case IGT_HOOK_POST_SUBTEST:
> +			desc = "Occurs after the execution of a subtest.";
> +			break;
> +		case IGT_HOOK_POST_TEST:
> +			desc = "Occurs after a test case has finished.";
> +			break;
> +		default:
> +			desc = "MISSING DESCRIPTION";
> +		}
> +
> +		fprintf(f, "  %s\n  %s\n\n", igt_hook_evt_type_to_name(et), desc);
> +	}
> +
> +	fprintf(f, "\
> +For each event matched by <events>, <cmd> is executed as a shell command. The\n\
> +exit status of the command is ignored. The following environment variables are\n\
> +available to the command:\n\
> +\n\
> +  IGT_HOOK_EVENT\n\
> +  Name of the current event.\n\
> +\n\
> +  IGT_HOOK_TEST_FULLNAME\n\
> +  Full name of the test in the format `igt@<test>[@<subtest>[@<dyn_subtest>]]`.\n\
> +\n\
> +  IGT_HOOK_TEST		   \n\
> +  Name of the current test.\n\
> +\n\
> +  IGT_HOOK_SUBTEST\n\
> +  Name of the current subtest. Will be the empty string if not running a\n\
> +  subtest.\n\
> +\n\
> +  IGT_HOOK_DYN_SUBTEST\n\
> +  Name of the current dynamic subtest. Will be the empty string if not running a\n\
> +  dynamic subtest.\n\
> +\n\
> +  IGT_HOOK_RESULT\n\
> +  String representing the result of the test/subtest/dynamic subtest. Possible\n\
> +  values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*\"\n\
> +  events and will be the empty string for other types of events.\n\
> +\n\
> +");
> +}
> diff --git a/lib/igt_hook.h b/lib/igt_hook.h
> new file mode 100644
> index 000000000000..6fef7254a317
> --- /dev/null
> +++ b/lib/igt_hook.h
> @@ -0,0 +1,86 @@
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +#ifndef IGT_HOOK_H
> +#define IGT_HOOK_H
> +
> +#include <stdio.h>
> +
> +/**
> + * igt_hook:
> + *
> + * Opaque struct to hold data related to hook support.
> + */
> +struct igt_hook;
> +
> +/**
> + * igt_hook_evt_type:
> + * @IGT_HOOK_PRE_TEST: Occurs before a test case (executable) starts the
> + * test code.
> + * @IGT_HOOK_PRE_SUBTEST: Occurs before the execution of a subtest.
> + * @IGT_HOOK_PRE_DYN_SUBTEST: Occurs before the execution of a dynamic subtest.
> + * @IGT_HOOK_POST_DYN_SUBTEST: Occurs after the execution of a dynamic subtest.
> + * @IGT_HOOK_POST_SUBTEST: Occurs after the execution of a subtest..
> + * @IGT_HOOK_POST_TEST: Occurs after a test case (executable) is finished with
> + * the test code.
> + * @IGT_HOOK_NUM_EVENTS: This is not really an event and represents the number
> + * of possible events tracked by igt_hook.
> + *
> + * Events tracked by igt_hook. Those events occur at specific points during the
> + * execution of a test.
> + */
> +enum igt_hook_evt_type {
> +	IGT_HOOK_PRE_TEST,
> +	IGT_HOOK_PRE_SUBTEST,
> +	IGT_HOOK_PRE_DYN_SUBTEST,
> +	IGT_HOOK_POST_DYN_SUBTEST,
> +	IGT_HOOK_POST_SUBTEST,
> +	IGT_HOOK_POST_TEST,
> +	IGT_HOOK_NUM_EVENTS /* This must always be the last one. */
> +};
> +
> +/**
> + * igt_hook_evt:
> + * @evt_type: Type of event.
> + * @target_name: A string pointing to the name of the test, subtest or dynamic
> + * subtest, depending on @evt_type.
> + * @result: A string containing the result of the test, subtest or dynamic
> + * subtest. This is only applicable for the `IGT_HOOK_POST_\*' event types;
> + * other types must initialize this to #NULL.
> + *
> + * An event tracked by igt_hook, which is done with @igt_hook_push_evt(). This must
> + * be zero initialized and fields relevant to the event type must be set before
> + * passing its reference to @igt_hook_push_evt().
> + */
> +struct igt_hook_evt {
> +	enum igt_hook_evt_type evt_type;
> +	const char *target_name;
> +	const char *result;
> +};
> +
> +struct igt_hook *igt_hook_init(const char *hook_str, int *error);
> +void igt_hook_free(struct igt_hook *igt_hook);
> +void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *evt);
> +const char *igt_hook_error_str(int error);
> +void igt_hook_print_help(FILE *f, const char *option_name);
> +
> +#endif /* IGT_HOOK_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index e2f740c116f8..10b8066647f2 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -109,6 +109,7 @@ lib_sources = [
>  	'veboxcopy_gen12.c',
>  	'igt_msm.c',
>  	'igt_dsc.c',
> +	'igt_hook.c',
>  	'xe/xe_gt.c',
>  	'xe/xe_ioctl.c',
>  	'xe/xe_mmio.c',
> diff --git a/lib/tests/igt_hook.c b/lib/tests/igt_hook.c
> new file mode 100644
> index 000000000000..bd7e570f9607
> --- /dev/null
> +++ b/lib/tests/igt_hook.c
> @@ -0,0 +1,187 @@
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <unistd.h>
> +
> +#include "igt_core.h"
> +#include "igt_hook.h"
> +
> +static const char *env_var_names[] = {
> +	"IGT_HOOK_EVENT",
> +	"IGT_HOOK_TEST_FULLNAME",
> +	"IGT_HOOK_TEST",
> +	"IGT_HOOK_SUBTEST",
> +	"IGT_HOOK_DYN_SUBTEST",
> +	"IGT_HOOK_RESULT",
> +};
> +
> +#define num_env_vars (sizeof(env_var_names) / sizeof(env_var_names[0]))
> +
> +static int env_var_name_lookup(char *line)
> +{
> +	int i;
> +	char *c;
> +
> +	c = strchr(line, '=');
> +	if (c)
> +		*c = '\0';
> +
> +	for (i = 0; i < num_env_vars; i++)
> +		if (!strcmp(line, env_var_names[i]))
> +			goto out;
> +
> +	i = -1;
> +out:
> +	if (c)
> +		*c = '=';
> +
> +	return i;
> +}
> +
> +static void test_null_error_pointer(void)
> +{
> +	struct igt_hook *igt_hook;
> +
> +	/* Ensure passing NULL error pointer does not cause issues. */
> +	igt_hook = igt_hook_init("invalid:echo hello", NULL);
> +	igt_assert(igt_hook == NULL);
> +}
> +
> +static void test_invalid_hook_descriptors(void)
> +{
> +	struct {
> +		const char *name;
> +		const char *hook_desc;
> +	} invalid_cases[] = {
> +		{"invalid-event-name", "invalid-event:echo hello"},
> +		{"invalid-empty-event-name", ":echo hello"},
> +		{"invalid-colon-in-cmd", "echo hello:world"},
> +		{},
> +	};
> +
> +	for (int i = 0; invalid_cases[i].name; i++) {
> +		igt_subtest(invalid_cases[i].name) {
> +			int err = 0;
> +			struct igt_hook *igt_hook;
> +
> +			igt_hook = igt_hook_init(invalid_cases[i].hook_desc, &err);
> +			igt_assert(igt_hook == NULL);
> +			igt_assert(err != 0);
> +		}
> +	}
> +}
> +
> +static void test_print_help(void)
> +{
> +	char *buf;
> +	size_t len;
> +	FILE *f;
> +	const char expected_initial_text[] = "The option --hook receives as argument a \"hook descriptor\"";
> +
> +	f = open_memstream(&buf, &len);
> +	igt_assert(f);
> +
> +	igt_hook_print_help(f, "--hook");
> +	fclose(f);
> +
> +	igt_assert(!strncmp(buf, expected_initial_text, sizeof(expected_initial_text) - 1));
> +
> +	/* This is an extra check to catch a case where an event type is added
> +	 * without a proper description. */
> +	igt_assert(!strstr(buf, "MISSING DESCRIPTION"));
> +
> +	free(buf);
> +}
> +
> +static void test_all_env_vars(void)
> +{
> +	struct igt_hook_evt evt = {
> +		.evt_type = IGT_HOOK_PRE_SUBTEST,
> +		.target_name = "foo",
> +	};
> +	bool env_vars_checklist[num_env_vars] = {};
> +	struct igt_hook *igt_hook;
> +	char *hook_str;
> +	FILE *f;
> +	int pipefd[2];
> +	int ret;
> +	int i;
> +	char *line;
> +	size_t line_size;
> +
> +	ret = pipe(pipefd);
> +	igt_assert(ret == 0);
> +
> +	/* Use grep to filter only env var set by us. This should ensure that
> +	 * writing to the pipe will not block due to capacity, since we only
> +	 * read from the pipe after the shell command is done. */
> +	ret = asprintf(&hook_str, "printenv -0 | grep -z ^IGT_HOOK >&%d", pipefd[1]);
> +	igt_assert(ret > 0);
> +
> +	igt_hook = igt_hook_init(hook_str, NULL);
> +	igt_assert(igt_hook);
> +
> +	igt_hook_push_evt(igt_hook, &evt);
> +
> +	close(pipefd[1]);
> +	f = fdopen(pipefd[0], "r");
> +	igt_assert(f);
> +
> +	line = NULL;
> +	line_size = 0;
> +
> +	while (getdelim(&line, &line_size, '\0', f) != -1) {
> +		ret = env_var_name_lookup(line);
> +		igt_assert_f(ret >= 0, "Unexpected env var %s\n", line);
> +		env_vars_checklist[ret] = true;
> +	}
> +
> +	for (i = 0; i < num_env_vars; i++)
> +		igt_assert_f(env_vars_checklist[i], "Missing env var %s\n", env_var_names[i]);
> +
> +	fclose(f);
> +	igt_hook_free(igt_hook);
> +	free(hook_str);
> +	free(line);
> +}
> +
> +igt_main
> +{
> +	igt_subtest("null-error-pointer")
> +		test_null_error_pointer();
> +
> +	test_invalid_hook_descriptors();
> +
> +	igt_subtest("help-description")
> +		test_print_help();
> +
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require_f(system(NULL), "Shell seems not to be available\n");
> +		}
> +
> +		igt_subtest("all-env-vars")
> +			test_all_env_vars();
> +	}
> +}
> diff --git a/lib/tests/igt_hook_integration.c b/lib/tests/igt_hook_integration.c
> new file mode 100644
> index 000000000000..56632b13ae81
> --- /dev/null
> +++ b/lib/tests/igt_hook_integration.c
> @@ -0,0 +1,297 @@
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#include "igt_core.h"
> +
> +#include "igt_tests_common.h"
> +
> +char prog[] = "igt_hook_integration";
> +char hook_opt[] = "--hook";
> +char hook_str[128];
> +char *fake_argv[] = {prog, hook_opt, hook_str};
> +int fake_argc = sizeof(fake_argv) / sizeof(fake_argv[0]);
> +
> +#define ENV_ARRAY(evt_name, fullname_suffix, subtest, dyn_subtest, result) \
> +{ \
> +	"IGT_HOOK_EVENT=" evt_name, \
> +	"IGT_HOOK_TEST_FULLNAME=igt@igt_hook_integration" fullname_suffix, \
> +	"IGT_HOOK_TEST=igt_hook_integration", \
> +	"IGT_HOOK_SUBTEST=" subtest, \
> +	"IGT_HOOK_DYN_SUBTEST=" dyn_subtest, \
> +	"IGT_HOOK_RESULT=" result, \
> +}
> +
> +#define TEST_ENV(evt_name, result) \
> +	ENV_ARRAY(evt_name, "", "", "", result)
> +
> +#define SUBTEST_ENV(evt_name, subtest, result) \
> +	ENV_ARRAY(evt_name, "@" subtest, subtest, "", result)
> +
> +#define DYN_SUBTEST_ENV(evt_name, subtest, dyn_subtest, result) \
> +	ENV_ARRAY(evt_name, "@" subtest "@" dyn_subtest, subtest, dyn_subtest, result)
> +
> +const char *pre_test_env[] = TEST_ENV("pre-test", "");
> +const char *pre_subtest_a_env[] = SUBTEST_ENV("pre-subtest", "a", "");
> +const char *pre_dyn_subtest_a_success_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "success", "");
> +const char *post_dyn_subtest_a_success_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "success", "SUCCESS");
> +const char *pre_dyn_subtest_a_failed_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "failed", "");
> +const char *post_dyn_subtest_a_failed_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "failed", "FAIL");
> +const char *pre_dyn_subtest_a_skipped_env[] = DYN_SUBTEST_ENV("pre-dyn-subtest", "a", "skipped", "");
> +const char *post_dyn_subtest_a_skipped_env[] = DYN_SUBTEST_ENV("post-dyn-subtest", "a", "skipped", "SKIP");
> +const char *post_subtest_a_env[] = SUBTEST_ENV("post-subtest", "a", "FAIL");
> +const char *pre_subtest_b_env[] = SUBTEST_ENV("pre-subtest", "b", "");
> +const char *post_subtest_b_env[] = SUBTEST_ENV("post-subtest", "b", "SUCCESS");
> +const char *post_test_env[] = TEST_ENV("post-test", "FAIL");
> +
> +#define num_env_vars (sizeof(pre_test_env) / sizeof(pre_test_env[0]))
> +
> +__noreturn static void fake_main(void)
> +{
> +	igt_subtest_init(fake_argc, fake_argv);
> +
> +	igt_subtest_with_dynamic("a") {
> +		igt_dynamic("success") {
> +			igt_info("...@a@success\n");
> +		}
> +
> +		igt_dynamic("failed") {
> +			igt_assert_f(false, "Fail on purpose\n");
> +			igt_info("...@a@failed\n");
> +		}
> +
> +		igt_dynamic("skipped") {
> +			igt_require_f(false, "Skip on purpose\n");
> +			igt_info("...@a@skipped\n");
> +		}
> +	}
> +
> +	igt_subtest("b") {
> +		igt_info("...@b\n");
> +	}
> +
> +	igt_exit();
> +}
> +
> +static void test_invalid_hook_str(void)
> +{
> +	int status;
> +	pid_t pid;
> +	static char err[4096];
> +	int errfd;
> +
> +	sprintf(hook_str, "invalid-event:echo hello");
> +
> +	pid = do_fork_bg_with_pipes(fake_main, NULL, &errfd);
> +
> +	read_whole_pipe(errfd, err, sizeof(err));
> +
> +	internal_assert(safe_wait(pid, &status) != -1);
> +	internal_assert_wexited(status, IGT_EXIT_INVALID);
> +
> +	internal_assert(strstr(err, "Failed to initialize hook data:"));
> +
> +	close(errfd);
> +}
> +
> +static bool match_env(FILE *hook_out_stream, const char **expected_env)
> +{
> +	int i;
> +	char hook_env_buf[4096];
> +	size_t buf_len = 0;
> +	char *line = NULL;
> +	size_t line_size;
> +	bool env_checklist[num_env_vars] = {};
> +	bool has_unexpected = false;
> +	bool has_missing = false;
> +
> +	/* Store env from hook so we can show it in case of errors */
> +	while (getdelim(&line, &line_size, '\0', hook_out_stream) != -1) {
> +		internal_assert(buf_len + strlen(line) + 1 <= sizeof(hook_env_buf));
> +		strcpy(hook_env_buf + buf_len, line);
> +		buf_len += strlen(line) + 1;
> +
> +		if (!strcmp(line, "---"))
> +			break;
> +	}
> +
> +	if (!expected_env && !buf_len) {
> +		/* We have consumed everything and we are done now. */
> +		return false;
> +	}
> +
> +
> +	if (!expected_env) {
> +		printf("Detected unexpected hook execution\n");
> +		has_unexpected = true;
> +		goto out;
> +	}
> +
> +	if (!buf_len) {
> +		printf("Expected more hook execution, but none found\n");
> +		has_missing = true;
> +		goto out;
> +	}
> +
> +
> +	line = hook_env_buf;
> +	while (strcmp(line, "---")) {
> +		for (i = 0; i < num_env_vars; i++) {
> +			if (!strcmp(line, expected_env[i])) {
> +				env_checklist[i] = true;
> +				break;
> +			}
> +		}
> +
> +		if (i == num_env_vars) {
> +			printf("Unexpected envline from hook: %s\n", line);
> +			has_unexpected = true;
> +		}
> +
> +		line += strlen(line) + 1;
> +	}
> +
> +	for (i = 0; i < num_env_vars; i++) {
> +		if (!env_checklist[i]) {
> +			has_missing = true;
> +			printf("Missing expected envline: %s\n", expected_env[i]);
> +		}
> +	}
> +
> +out:
> +	if (has_unexpected || has_missing) {
> +		if (expected_env) {
> +			printf("Expected environment:\n");
> +			for (i = 0; i < num_env_vars; i++)
> +				printf("  %s\n", expected_env[i]);
> +		}
> +
> +		if (buf_len) {
> +			printf("Environment from hook:\n");
> +			line = hook_env_buf;
> +			while (strcmp(line, "---")) {
> +				printf("  %s\n", line);
> +				line += strlen(line) + 1;
> +			}
> +		} else {
> +			printf("No hook execution found\n");
> +		}
> +	}
> +
> +	internal_assert(!has_unexpected);
> +	internal_assert(!has_missing);
> +
> +	/* Ready to consume next hook output. */
> +	return true;
> +}
> +
> +static void run_tests_and_match_env(const char *evt_descriptors, const char **expected_envs[])
> +{
> +	int i;
> +	int ret;
> +	int pipefd[2];
> +	pid_t pid;
> +	FILE *f;
> +
> +	ret = pipe(pipefd);
> +	internal_assert(ret == 0);
> +
> +	/* Use grep to filter only env var set by us. This should ensure that
> +	 * writing to the pipe will not block due to capacity, since we only
> +	 * read from the pipe after the shell command is done. */
> +	sprintf(hook_str,
> +		"%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; echo -en ---\\\\x00 >&%2$d",
> +		evt_descriptors,
> +		pipefd[1]);
> +
> +	pid = do_fork_bg_with_pipes(fake_main, NULL, NULL);
> +	internal_assert(safe_wait(pid, &ret) != -1);
> +	internal_assert_wexited(ret, IGT_EXIT_FAILURE);
> +
> +	close(pipefd[1]);
> +	f = fdopen(pipefd[0], "r");
> +	internal_assert(f);
> +
> +	while (match_env(f, expected_envs[i]))
> +		i++;
> +
> +	fclose(f);
> +
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	{
> +		printf("Check invalid hook string\n");
> +		test_invalid_hook_str();
> +	}
> +
> +	{
> +		const char **expected_envs[] = {
> +			pre_test_env,
> +			pre_subtest_a_env,
> +			pre_dyn_subtest_a_success_env,
> +			post_dyn_subtest_a_success_env,
> +			pre_dyn_subtest_a_failed_env,
> +			post_dyn_subtest_a_failed_env,
> +			pre_dyn_subtest_a_skipped_env,
> +			post_dyn_subtest_a_skipped_env,
> +			post_subtest_a_env,
> +			pre_subtest_b_env,
> +			post_subtest_b_env,
> +			post_test_env,
> +			NULL,
> +		};
> +
> +		printf("Check full event tracking\n");
> +		run_tests_and_match_env("*", expected_envs);
> +	}
> +
> +	{
> +		const char **expected_envs[] = {
> +			pre_dyn_subtest_a_success_env,
> +			pre_dyn_subtest_a_failed_env,
> +			pre_dyn_subtest_a_skipped_env,
> +			NULL,
> +		};
> +
> +		printf("Check single event type tracking\n");
> +		run_tests_and_match_env("pre-dyn-subtest", expected_envs);
> +	}
> +
> +	{
> +		const char **expected_envs[] = {
> +			pre_subtest_a_env,
> +			post_dyn_subtest_a_success_env,
> +			post_dyn_subtest_a_failed_env,
> +			post_dyn_subtest_a_skipped_env,
> +			pre_subtest_b_env,
> +			NULL,
> +		};
> +
> +		printf("Check multiple event types tracking\n");
> +		run_tests_and_match_env("post-dyn-subtest,pre-subtest", expected_envs);
> +	}
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index fa3d81de6cef..df8092638eca 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -10,6 +10,8 @@ lib_tests = [
>  	'igt_exit_handler',
>  	'igt_fork',
>  	'igt_fork_helper',
> +	'igt_hook',
> +	'igt_hook_integration',
>          'igt_ktap_parser',
>  	'igt_list_only',
>  	'igt_invalid_subtest_name',
> -- 
> 2.45.0
> 
