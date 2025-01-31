Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805E4C02192
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 12:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FE910EA90;
	Fri, 31 Jan 2025 12:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0McaUCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F63F10EA85
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738327823; x=1769863823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PH/l2dmFsaHiwubZN5yckJcV4ylsVfhKIig45xNcxmM=;
 b=I0McaUCuEVRTYOEx4jzQxo0CoA+VipveeUqta2VsuMbgpZ1ggwG0fJiN
 9oo1i93RC4QNBvNDaSdh1kK7nl+l7YmfcLIeO1g5BvrgV8ugpBru3YbMB
 0EL9c2CAe3p9FvvTdsMYXeUNjw5JycE+bLPfpXx0HZ73iFxMr6zR8xT5b
 a6ZABU5nigNx3x0OavCtve5atdcyp3iePRbjpQ/YGGGyAYiv0PsVc7o7K
 fk1eyUWck9Ts/paJgb5OBS1KpVefsgUfXlJnydhnyqkAtjAoBF0xhrLn5
 FwPE/hcuLbrAI1v6EDaUGUDkwt5pjEUthJxiWEzal85tdBXp6jEIug/wu g==;
X-CSE-ConnectionGUID: iVqGETMXTbWh7P5c6OdRmQ==
X-CSE-MsgGUID: e+oO4lNgRqasQIFTYyMkTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="42645156"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="42645156"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 04:50:23 -0800
X-CSE-ConnectionGUID: ZID9CedkT2iCigr2qv3tBg==
X-CSE-MsgGUID: KwfDAn7dSkC3jyix08s8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132879276"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:50:21 -0800
Date: Fri, 31 Jan 2025 13:50:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v4 2/2] runner/executor: Integrate igt_kmemleak scans
Message-ID: <20250131125018.daqboesdcfuvsqrw@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-3-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128151537.515639-3-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-01-28 at 16:15:37 +0100, Peter Senna Tschudin wrote:
> Modifies igt_runner to include calls to igt_kmemleak(). Kmemleak
> scanning is disabled by default, so add command line options to
> igt_runner to enable kmemleak scanning:  -k, -k<option>, --kmemleak,
> --kmemleak=<option>. The options are:
>  - once: run one kmemleak scan after all tests from the test-list
>          complete.
>  - each: run one kmemleak scan after each test completes.
> 
> If kmemleaks are found they will be saved to the igt_runner results
> directory in a file named kmemleak.txt.
> 
> Updates serialize_settings() and read_settings_from_file() to save
> and restore igt_runner settings to and from disk. This is used when
> calling igt_runner with '--dry-run' and then by calling igt_resume
> instead of igt_runner.
> 
> Updates unit testing for igt_runner to test that:
>  - Kmemleak scans are disabled by default
>  - Kmemleak scans  be enabled by command line arguments
>  - The choice about kmemleaks being enabled or not is saved to disk
>    and restored from disk
> 
> CC: ryszard.knop@intel.com
> CC: lucas.demarchi@intel.com
> CC: katarzyna.piecielska@intel.com
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  runner/executor.c     | 25 +++++++++++++++++++++++--
>  runner/runner_tests.c | 16 +++++++++++++++-
>  runner/settings.c     | 31 ++++++++++++++++++++++++++++++-
>  runner/settings.h     |  2 ++
>  4 files changed, 70 insertions(+), 4 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 999e7f719..992366312 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -31,6 +31,7 @@
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_facts.h"
> +#include "igt_kmemleak.h"
>  #include "igt_taints.h"
>  #include "igt_vec.h"
>  #include "executor.h"
> @@ -2370,6 +2371,13 @@ bool execute(struct execute_state *state,
>  	if (settings->facts)
>  		igt_facts_lists_init();
>  
> +	if (settings->kmemleak)
> +		if (!igt_kmemleak_init(NULL)) {
> +			errf("Failed to initialize kmemleak. Is kernel support enabled?\n");
> +			errf("Disabling kmemleak on igt_runner and continuing...\n");

Make it one errf() call, split string if needed.

> +			settings->kmemleak = settings->kmemleak_each = false;

Avoid this, write two assinments here.

> +		}
> +
>  	if (state->next >= job_list->size) {
>  		outf("All tests already executed.\n");
>  		return true;
> @@ -2497,10 +2505,18 @@ bool execute(struct execute_state *state,
>  		bool already_written = false;
>  
>  		/* Collect facts before running each test */
> -		if (settings->facts) {
> +		if (settings->facts)
>  			igt_facts(last_test);
> +
> +		if (settings->kmemleak_each)
> +			if (!igt_kmemleak(last_test, resdirfd,
> +					  settings->kmemleak_each,
> +					  settings->sync))
> +				errf("Failed to collect kmemleak logs after %s\n",
> +				     last_test);
> +
> +		if (settings->facts || settings->kmemleak_each)
>  			last_test = entry_display_name(&job_list->entries[state->next]);
> -		}
>  
>  		if (should_die_because_signal(sigfd)) {
>  			status = false;
> @@ -2595,6 +2611,11 @@ bool execute(struct execute_state *state,
>  	if (settings->facts)
>  		igt_facts(last_test);
>  
> +	if (settings->kmemleak)
> +		if (!igt_kmemleak(last_test, resdirfd,
> +				  settings->kmemleak_each, settings->sync))
> +			errf("Failed to collect kmemleak logs after the last test\n");
> +
>  	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
>  		dprintf(timefd, "%f\n", timeofday_double());
>  		close(timefd);
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index 8441763f2..769fa2929 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -191,6 +191,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
>  	igt_assert_eq(one->dry_run, two->dry_run);
>  	igt_assert_eq(one->allow_non_root, two->allow_non_root);
>  	igt_assert_eq(one->facts, two->facts);
> +	igt_assert_eq(one->kmemleak, two->kmemleak);
>  	igt_assert_eq(one->sync, two->sync);
>  	igt_assert_eq(one->log_level, two->log_level);
>  	igt_assert_eq(one->overwrite, two->overwrite);
> @@ -304,6 +305,7 @@ igt_main
>  		igt_assert(igt_list_empty(&settings->env_vars));
>  		igt_assert(!igt_vec_length(&settings->hook_strs));
>  		igt_assert(!settings->facts);
> +		igt_assert(!settings->kmemleak);
>  		igt_assert(!settings->sync);
>  		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
>  		igt_assert(!settings->overwrite);
> @@ -426,6 +428,7 @@ igt_main
>  		igt_assert_eq(settings->include_regexes.size, 0);
>  		igt_assert_eq(settings->exclude_regexes.size, 0);
>  		igt_assert(!settings->facts);
> +		igt_assert(!settings->kmemleak);
>  		igt_assert(!settings->sync);
>  		igt_assert_eq(settings->log_level, LOG_LEVEL_NORMAL);
>  		igt_assert(!settings->overwrite);
> @@ -464,6 +467,7 @@ igt_main
>  				       "-b", blacklist_name,
>  				       "--blacklist", blacklist2_name,
>  				       "-f",
> +				       "-k",
>  				       "-s",
>  				       "-l", "verbose",
>  				       "--overwrite",
> @@ -523,6 +527,7 @@ igt_main
>  		igt_assert_eqstr(*((char **)igt_vec_elem(&settings->hook_strs, 1)), "echo world");
>  
>  		igt_assert(settings->facts);
> +		igt_assert(settings->kmemleak);
>  		igt_assert(settings->sync);
>  		igt_assert_eq(settings->log_level, LOG_LEVEL_VERBOSE);
>  		igt_assert(settings->overwrite);
> @@ -718,6 +723,7 @@ igt_main
>  	igt_subtest("parse-clears-old-data") {
>  		const char *argv[] = { "runner",
>  				       "-n", "foo",
> +				       "--overwrite",

Do not make unrelated changes, add only kmemleak.
You also didn't write about this change in description, if you
think it is a fix it should go in separate patch, not here.

>  				       "--dry-run",
>  				       "--allow-non-root",
>  				       "test-root-dir",
> @@ -727,21 +733,29 @@ igt_main
>  		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
>  
>  		igt_assert_eqstr(settings->name, "foo");
> +		igt_assert(settings->overwrite);

Same here, unrelated.

>  		igt_assert(settings->dry_run);
>  		igt_assert(!settings->test_list);
>  		igt_assert(!settings->facts);
> +		igt_assert(!settings->kmemleak);
>  		igt_assert(!settings->sync);
>  
>  		argv[1] = "--test-list";
> +		argv[2] = "foo"; /* Unchanged */

Same here, unrelated.

>  		argv[3] = "--facts";
> -		argv[4] = "--sync";

Same here, unrelated.

> +		argv[4] = "--kmemleak";
> +		argv[5] = "--sync";

Same here, unrelated.

> +		argv[6] = "test-root-dir"; /* Unchanged */

Same here, unrelated.

> +		argv[7] = "results-path"; /* Unchanged */

Same here, unrelated.

>  
>  		igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
>  
>  		igt_assert_eqstr(settings->name, "results-path");
>  		igt_assert(!settings->dry_run);
> +		igt_assert(!settings->overwrite);

Same here, unrelated.

>  		igt_assert(strstr(settings->test_list, "foo") != NULL);
>  		igt_assert(settings->facts);
> +		igt_assert(settings->kmemleak);
>  		igt_assert(settings->sync);
>  	}
>  
> diff --git a/runner/settings.c b/runner/settings.c
> index 92fd42ea6..560bc2b5e 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -41,6 +41,7 @@ enum {
>  	OPT_EXCLUDE = 'x',
>  	OPT_ENVIRONMENT = 'e',
>  	OPT_FACTS = 'f',
> +	OPT_KMEMLEAK = 'k',
>  	OPT_SYNC = 's',
>  	OPT_LOG_LEVEL = 'l',
>  	OPT_OVERWRITE = 'o',
> @@ -232,6 +233,16 @@ static const char *usage_str =
>  	"                                   not respond to ping.\n"
>  	"                         all     - abort for all of the above.\n"
>  	"  -f, --facts           Enable facts tracking\n"
> +	"  -k, -k<option>, --kmemleak, --kmemleak=<option>\n"
> +	"                        Enable kmemleak tracking. Each kmemleak scan\n"
> +	"                        can take from 5 to 60 seconds, slowing down\n"
> +	"                        the run considerably. The default is to scan\n"
> +	"                        only once after the last test. It is also\n"
> +	"                        possible to scan after each test. Possible\n"
> +	"                        options:\n"
> +	"                         once - The default is to run one kmemleak\n"
> +	"                                scan after the last test\n"
> +	"                         each - Run one kmemleak scan after each test\n"
>  	"  -s, --sync            Sync results to disk after every test\n"
>  	"  -l {quiet,verbose,dummy}, --log-level {quiet,verbose,dummy}\n"
>  	"                        Set the logger verbosity level\n"
> @@ -668,6 +679,7 @@ bool parse_options(int argc, char **argv,
>  		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
>  		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
>  		{"facts", no_argument, NULL, OPT_FACTS},
> +		{"kmemleak", optional_argument, NULL, OPT_KMEMLEAK},
>  		{"sync", no_argument, NULL, OPT_SYNC},
>  		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
>  		{"test-list", required_argument, NULL, OPT_TEST_LIST},
> @@ -698,7 +710,7 @@ bool parse_options(int argc, char **argv,
>  	settings->dmesg_warn_level = -1;
>  	settings->prune_mode = -1;
>  
> -	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:L",
> +	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:Lk::",

Why there are two colons at end? Also imho 'k' should be placed after 'f'
like below:

	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk:sl:omb:L",

especially that you add its code after OPT_FACTS below.

>  				long_options, NULL)) != -1) {
>  		switch (c) {
>  		case OPT_VERSION:
> @@ -742,6 +754,19 @@ bool parse_options(int argc, char **argv,
>  		case OPT_FACTS:
>  			settings->facts = true;
>  			break;
> +		case OPT_KMEMLEAK:
> +			settings->kmemleak = true;
> +			if (optarg) {
> +				if (strcmp(optarg, "once") == 0)
> +					settings->kmemleak_each = false;
> +				else if (strcmp(optarg, "each") == 0)
> +					settings->kmemleak_each = true;
> +				else {
> +					usage(stderr, "Invalid kmemleak option");
> +					goto error;
> +				}

Use braces here: if () { ... } else if (...) { ... } else { ... }

> +			}
> +			break;
>  		case OPT_SYNC:
>  			settings->sync = true;
>  			break;
> @@ -1105,6 +1130,8 @@ bool serialize_settings(struct settings *settings)
>  	SERIALIZE_LINE(f, settings, dry_run, "%d");
>  	SERIALIZE_LINE(f, settings, allow_non_root, "%d");
>  	SERIALIZE_LINE(f, settings, facts, "%d");
> +	SERIALIZE_LINE(f, settings, kmemleak, "%d");
> +	SERIALIZE_LINE(f, settings, kmemleak_each, "%d");
>  	SERIALIZE_LINE(f, settings, sync, "%d");
>  	SERIALIZE_LINE(f, settings, log_level, "%d");
>  	SERIALIZE_LINE(f, settings, overwrite, "%d");
> @@ -1176,6 +1203,8 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
>  		PARSE_LINE(settings, name, val, dry_run, numval);
>  		PARSE_LINE(settings, name, val, allow_non_root, numval);
>  		PARSE_LINE(settings, name, val, facts, numval);
> +		PARSE_LINE(settings, name, val, kmemleak, numval);
> +		PARSE_LINE(settings, name, val, kmemleak_each, numval);
>  		PARSE_LINE(settings, name, val, sync, numval);
>  		PARSE_LINE(settings, name, val, log_level, numval);
>  		PARSE_LINE(settings, name, val, overwrite, numval);
> diff --git a/runner/settings.h b/runner/settings.h
> index f69f09778..ab00b3e32 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -58,6 +58,8 @@ struct settings {
>  	struct igt_list_head env_vars;
>  	struct igt_vec hook_strs;
>  	bool facts;
> +	bool kmemleak;
> +	bool kmemleak_each;
>  	bool sync;
>  	int log_level;
>  	bool overwrite;
> -- 
> 2.34.1
> 
