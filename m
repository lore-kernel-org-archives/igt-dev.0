Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6FEE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 16:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8B510EE2F;
	Thu, 12 Dec 2024 16:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+7JGH1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D996210EE2F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734020594; x=1765556594;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0Ixejeq+JSck3TgIHn0ylbGTwuYqvsZ3XlYg75IH4oE=;
 b=b+7JGH1vF4Pg5NIJ1ezUM9oBYUW9i1AYJfFgu89NCxnkFB4nP29ewY7Q
 1VsBGvCoC5N4qpRkuHKMoaSCwJ8egQcX57BuXBHiyMNLwEADZpOH8heZh
 dCMNq7fOqZyw1LtmR0jaS0nwzGUj6x8RsihFnKKF8aMWq1J1j4dT7xL5+
 UJtWXadhjaMGcA3uaWDnu3cO9WXQbc1HS0ENSUlpfk1mpb2TzDHZpG8OB
 tEpum8S+jyodrqFIb2X5KcihC0F9raqT/JiY8Y417ao7zBZdR6oe9EHXa
 uJsrfkUe8j+3RJ+s2F73e/j00wdNvjje68nACx2V+P4bvdDLwaP/7SY8M g==;
X-CSE-ConnectionGUID: 13ScaRTGQLyJwp69MyMigQ==
X-CSE-MsgGUID: 8TC+9sBMSZ+9Y6uhvJluqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37292117"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="37292117"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:23:13 -0800
X-CSE-ConnectionGUID: HkgwfYuoTdGW6dG7k+FRQw==
X-CSE-MsgGUID: 1YBJVqmYSK20P9hemsI+4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97071712"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 08:23:06 -0800
Date: Thu, 12 Dec 2024 17:23:02 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v12 3/3] runner/executor: Integrate igt_facts
 functionality
Message-ID: <20241212162302.r43stekuwqpij3ls@zkempczy-mobl2>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <20241212071527.64595-1-peter.senna@linux.intel.com>
 <20241212071527.64595-4-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212071527.64595-4-peter.senna@linux.intel.com>
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

On Thu, Dec 12, 2024 at 08:15:27AM +0100, Peter Senna Tschudin wrote:
> Modifies the igt_runner to include calls to igt_facts() before the
> execution of each test and after the final test concludes. Also adds
> command line options to igt_runner:
>  -f, --facts to enable igt_facts
> 
> igt_facts is disabled by default. If not explicitly enabled with the
> command-line argument -f or --facts, igt_facts() will return
> immediately without performing any operations.
> 
> The test name is obtained by calling
> entry_display_name(&job_list->entries[state->next]).
> 
> CC: Helen Koike <helen.koike@collabora.com>
> CC: Jani Nikula <jani.nikula@linux.intel.com>
> CC: Jani Saarinen <jani.saarinen@intel.com>
> CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> CC: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: Maíra Canal <mcanal@igalia.com>
> CC: Melissa Wen <mwen@igalia.com>
> CC: Petri Latvala <adrinael@adrinael.net>
> CC: Rob Clark <robdclark@chromium.org>
> CC: Ryszard Knop <ryszard.knop@intel.com>
> CC: Swati Sharma <swati2.sharma@intel.com>
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> CC: dominik.karol.piatkowski@intel.com
> CC: himal.prasad.ghimiray@intel.com
> CC: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> CC: katarzyna.piecielska@intel.com
> CC: luciano.coelho@intel.com
> CC: nirmoy.das@intel.com
> CC: stuart.summers@intel.com
> Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  runner/executor.c | 10 ++++++++++
>  runner/settings.c |  9 ++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 49ae8c90d..d4d704a34 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -30,6 +30,7 @@
>  
>  #include "igt_aux.h"
>  #include "igt_core.h"
> +#include "igt_facts.h"
>  #include "igt_taints.h"
>  #include "igt_vec.h"
>  #include "executor.h"
> @@ -2360,12 +2361,15 @@ bool execute(struct execute_state *state,
>  	sigset_t sigmask;
>  	double time_spent = 0.0;
>  	bool status = true;
> +	char *last_test = NULL;
>  
>  	if (state->dry) {
>  		outf("Dry run, not executing. Invoke igt_resume if you want to execute.\n");
>  		return true;
>  	}
>  
> +	igt_facts_lists_init();
> +
>  	if (state->next >= job_list->size) {
>  		outf("All tests already executed.\n");
>  		return true;
> @@ -2492,6 +2496,10 @@ bool execute(struct execute_state *state,
>  		int result;
>  		bool already_written = false;
>  
> +		/* Calls before running each test */
> +		igt_facts(last_test);
> +		last_test = entry_display_name(&job_list->entries[state->next]);
> +
>  		if (should_die_because_signal(sigfd)) {
>  			status = false;
>  			goto end;
> @@ -2580,6 +2588,8 @@ bool execute(struct execute_state *state,
>  			return execute(state, settings, job_list);
>  		}
>  	}
> +	/* Last call to collect facts after the last test runs */
> +	igt_facts(last_test);
>  
>  	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
>  		dprintf(timefd, "%f\n", timeofday_double());
> diff --git a/runner/settings.c b/runner/settings.c
> index 0d27e7af3..0e8e4572e 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -1,3 +1,4 @@
> +#include "igt_facts.h"
>  #include "igt_hook.h"
>  #include "igt_vec.h"
>  #include "settings.h"
> @@ -40,6 +41,7 @@ enum {
>  	OPT_INCLUDE = 't',
>  	OPT_EXCLUDE = 'x',
>  	OPT_ENVIRONMENT = 'e',
> +	OPT_FACTS = 'f',
>  	OPT_SYNC = 's',
>  	OPT_LOG_LEVEL = 'l',
>  	OPT_OVERWRITE = 'o',
> @@ -230,6 +232,7 @@ static const char *usage_str =
>  	"                                   environment variable IGT_PING_HOSTNAME does\n"
>  	"                                   not respond to ping.\n"
>  	"                         all     - abort for all of the above.\n"
> +	"  -f, --facts           Enable igt_facts tracking\n"
>  	"  -s, --sync            Sync results to disk after every test\n"
>  	"  -l {quiet,verbose,dummy}, --log-level {quiet,verbose,dummy}\n"
>  	"                        Set the logger verbosity level\n"
> @@ -665,6 +668,7 @@ bool parse_options(int argc, char **argv,
>  		{"environment", required_argument, NULL, OPT_ENVIRONMENT},
>  		{"abort-on-monitored-error", optional_argument, NULL, OPT_ABORT_ON_ERROR},
>  		{"disk-usage-limit", required_argument, NULL, OPT_DISK_USAGE_LIMIT},
> +		{"facts", no_argument, NULL, OPT_FACTS},
>  		{"sync", no_argument, NULL, OPT_SYNC},
>  		{"log-level", required_argument, NULL, OPT_LOG_LEVEL},
>  		{"test-list", required_argument, NULL, OPT_TEST_LIST},
> @@ -695,7 +699,7 @@ bool parse_options(int argc, char **argv,
>  	settings->dmesg_warn_level = -1;
>  	settings->prune_mode = -1;
>  
> -	while ((c = getopt_long(argc, argv, "hn:dt:x:e:sl:omb:L",
> +	while ((c = getopt_long(argc, argv, "hn:dt:x:e:fsl:omb:L",
>  				long_options, NULL)) != -1) {
>  		switch (c) {
>  		case OPT_VERSION:
> @@ -736,6 +740,9 @@ bool parse_options(int argc, char **argv,
>  				goto error;
>  			}
>  			break;
> +		case OPT_FACTS:
> +			igt_facts_config.enabled = true;
> +			break;

Use local static for this. We don't want to change internal
state of the library from the runner, just use its API.
Then call igt_facts() conditionally depending on this flag.

With this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		case OPT_SYNC:
>  			settings->sync = true;
>  			break;
> -- 
> 2.34.1
> 
