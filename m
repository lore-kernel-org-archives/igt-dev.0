Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA794D730A7
	for <igt-dev@archiver.kernel.org>; Fri,  3 Apr 2026 05:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A71110E1C9;
	Fri,  3 Apr 2026 05:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhhkN7ao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C73510E1C9
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2026 05:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775195739; x=1806731739;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gzX7ydbQ3PwbAoIj0yuiIEcXpWXruBRyAWYYZZ4SwEs=;
 b=BhhkN7aochrxdC8N/vNdMB8XZut10NOSLHq8Cm7vdHm2I7ZJabBN8JnD
 ZfPc9vrDdSCDYuYWgqi/V4XjH1QMZ+0OYUR4xpUNbj45B5nDwopYEBGJU
 jtPTt8lULMnTaSxA3kQAxiTEjaRE4vU8toYmlkYcROlvPO09TTFLUT5mM
 wLQG2Amxk6ysWVBeBf+aOEmx00Tw2Ma90McRkCMOrQei5BoW3ZRIfLxkE
 yzcRJCHNUlPN0OsODx6i8YsOnTDomFmlpnoEoybP9YENLdzA/Hiih4v6P
 qrdmbjZWVnwboPcJ6zuuWSXyfTm+SSdhx3LbX7LZgESLZmVWp5rJCeqpg Q==;
X-CSE-ConnectionGUID: sHr7UFChTWOOK4Kripqc2g==
X-CSE-MsgGUID: 2GDLNE2NRr+PXgiRq2mgZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86964697"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="86964697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 22:55:39 -0700
X-CSE-ConnectionGUID: nknLZK1mToy8Ib9ruVHx9Q==
X-CSE-MsgGUID: VTVG9CFZQK+LZeGPUsXVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; d="scan'208";a="228806967"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 22:55:37 -0700
Date: Fri, 3 Apr 2026 07:55:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v2 6/6] runner: Add hook-exec-allowlist to execute
 hooks selectively
Message-ID: <by2tkf2jpqvff6amgrdrninbd7izgzuo7pcymcvvpujkrgfmfg@3b46lzefc3b2>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-14-zbigniew.kempczynski@intel.com>
 <87h5pxxmjd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h5pxxmjd.fsf@intel.com>
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

On Mon, Mar 30, 2026 at 02:19:34PM -0300, Gustavo Sousa wrote:
> Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> writes:
> 
> > Hook scripts like GuC log copy takes few seconds to complete. This would
> > lead to large increase of CI execution time.  Add -a/--hook-exec-allowlist
> > argument to igt_runner to pass file with regexps which matched will
> > allow executing hook scripts. Syntax of this file is same to blocklists.
> 
> I feel like this is more related to the GuC log hook than a general
> allowlist that the user would like to apply to all types of hooks
> enabled.
> 
> An alternative approach would be to have guc_copy_on_fail.sh
> implementing this type of filtering, with a path that is passed via CLI
> arguments or an environment variable.  I would prefer that instead of
> adding --hook-exec-allowlist, as I'm not much confident it would be very
> useful for other cases.
> 
> Since the hook is written in bash, the filtering could be applied with
> something along the lines of grep -f path/to/allowlist... (It could be
> implemented with bash builtins as well, but I'm not sure it is worth the
> hassle).

Filtering withing guc_copy_on_fail.sh was first thing what comes to my
mind. I got discussion with Kamil about this and he pointed out it blurs
responsibility when to execute to script. From the other hand decision
in the script is individual - allowlist is global so if we would like to
execute copy guc logs for 5 tests and another script for all igts it
wouldn't be possible.

I'm going to drop allowlist approach and try to implement conditional
execution for allowed subtests in guc_copy_on_fail.sh.

Thank you for the review.

--
Zbigniew

> 
> --
> Gustavo Sousa
> 
> >
> > Some limitation of this code is hooks will be executed with subtest
> > granularity - if multiple_mode is used regexp will compare only first
> > subtest so all subtest in group will call hooks. This is likely not
> > a big problem as CI executes each subtest individually (without
> > multiple_mode).
> >
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> >  runner/executor.c | 32 +++++++++++++++++++++++++++++---
> >  runner/settings.c | 14 +++++++++++++-
> >  runner/settings.h |  2 ++
> >  3 files changed, 44 insertions(+), 4 deletions(-)
> >
> > diff --git a/runner/executor.c b/runner/executor.c
> > index bc421f7dbb..ab34ed8258 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -1615,6 +1615,18 @@ static int monitor_output(pid_t child,
> >  	return killed;
> >  }
> >  
> > +static bool matches_any(const char *str, struct regex_list *list)
> > +{
> > +	size_t i;
> > +
> > +	for (i = 0; i < list->size; i++) {
> > +		if (g_regex_match(list->regexes[i], str, 0, NULL))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  static void __attribute__((noreturn))
> >  execute_test_process(int outfd, int errfd, int socketfd,
> >  		     struct settings *settings,
> > @@ -1623,6 +1635,7 @@ execute_test_process(int outfd, int errfd, int socketfd,
> >  	struct igt_vec arg_vec;
> >  	char *arg;
> >  	size_t rootlen;
> > +	bool use_hooks = true;
> >  
> >  	dup2(outfd, STDOUT_FILENO);
> >  	dup2(errfd, STDERR_FILENO);
> > @@ -1646,11 +1659,24 @@ execute_test_process(int outfd, int errfd, int socketfd,
> >  		arg = strdup("--run-subtest");
> >  		igt_vec_push(&arg_vec, &arg);
> >  
> > -		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
> > +		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL) {
> >  			argsize = dynbegin - entry->subtests[0];
> > -		else
> > +		} else {
> >  			argsize = strlen(entry->subtests[0]);
> >  
> > +			if (settings->use_hook_allow_regexes) {
> > +				char *piglit_name;
> > +
> > +				asprintf(&piglit_name, "igt@%s@%s",
> > +					 entry->binary, entry->subtests[0]);
> > +
> > +				if (!matches_any(piglit_name, &settings->hook_allow_regexes))
> > +					use_hooks = false;
> > +
> > +				free(piglit_name);
> > +			}
> > +		}
> > +
> >  		arg = malloc(argsize + 1);
> >  		memcpy(arg, entry->subtests[0], argsize);
> >  		arg[argsize] = '\0';
> > @@ -1677,7 +1703,7 @@ execute_test_process(int outfd, int errfd, int socketfd,
> >  		}
> >  	}
> >  
> > -	for (size_t i = 0; i < igt_vec_length(&settings->hook_strs); i++) {
> > +	for (size_t i = 0; use_hooks && i < igt_vec_length(&settings->hook_strs); i++) {
> >  		arg = strdup("--hook");
> >  		igt_vec_push(&arg_vec, &arg);
> >  		arg = strdup(*((char **)igt_vec_elem(&settings->hook_strs, i)));
> > diff --git a/runner/settings.c b/runner/settings.c
> > index 7c29f2d3ab..eb3d05405c 100644
> > --- a/runner/settings.c
> > +++ b/runner/settings.c
> > @@ -50,6 +50,7 @@ enum {
> >  	OPT_TIMEOUT = 'c',
> >  	OPT_WATCHDOG = 'g',
> >  	OPT_BLACKLIST = 'b',
> > +	OPT_HOOK_EXEC_ALLOWLIST = 'a',
> >  	OPT_LIST_ALL = 'L',
> >  };
> >  
> > @@ -320,6 +321,9 @@ static const char *usage_str =
> >  	"                        Forward HOOK_STR to the --hook option of each test.\n"
> >  	"  --help-hook\n"
> >  	"                        Show detailed usage information for --hook.\n"
> > +	"  -a, --hook-exec-allowlist FILENAME\n"
> > +	"                        Tests name regexes from FILENAME for which hooks scripts\n"
> > +	"                        may be executed\n"
> >  	"\n"
> >  	"  [test_root]           Directory that contains the IGT tests. The environment\n"
> >  	"                        variable IGT_TEST_ROOT will be used if set, overriding\n"
> > @@ -715,6 +719,7 @@ bool parse_options(int argc, char **argv,
> >  		{"dmesg-warn-level", required_argument, NULL, OPT_DMESG_WARN_LEVEL},
> >  		{"prune-mode", required_argument, NULL, OPT_PRUNE_MODE},
> >  		{"blacklist", required_argument, NULL, OPT_BLACKLIST},
> > +		{"hook-exec-allowlist", required_argument, NULL, OPT_HOOK_EXEC_ALLOWLIST},
> >  		{"list-all", no_argument, NULL, OPT_LIST_ALL},
> >  		{ 0, 0, 0, 0},
> >  	};
> > @@ -726,7 +731,7 @@ bool parse_options(int argc, char **argv,
> >  	settings->dmesg_warn_level = -1;
> >  	settings->prune_mode = -1;
> >  
> > -	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk::sl:omb:L",
> > +	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fk::sl:omb:a:L",
> >  				long_options, NULL)) != -1) {
> >  		switch (c) {
> >  		case OPT_VERSION:
> > @@ -852,6 +857,13 @@ bool parse_options(int argc, char **argv,
> >  					"blacklist"))
> >  				goto error;
> >  			break;
> > +		case OPT_HOOK_EXEC_ALLOWLIST:
> > +			if (!parse_list(&settings->hook_allow_regexes,
> > +					absolute_path(optarg),
> > +					"hook-exec-allowlist"))
> > +				goto error;
> > +			settings->use_hook_allow_regexes = true;
> > +			break;
> >  		case OPT_LIST_ALL:
> >  			settings->list_all = true;
> >  			break;
> > diff --git a/runner/settings.h b/runner/settings.h
> > index 6c58c3282c..b81f6adc6d 100644
> > --- a/runner/settings.h
> > +++ b/runner/settings.h
> > @@ -59,6 +59,8 @@ struct settings {
> >  	bool allow_non_root;
> >  	struct regex_list include_regexes;
> >  	struct regex_list exclude_regexes;
> > +	struct regex_list hook_allow_regexes;
> > +	bool use_hook_allow_regexes;
> >  	struct igt_list_head env_vars;
> >  	struct igt_vec hook_strs;
> >  	bool facts;
> > -- 
> > 2.43.0
