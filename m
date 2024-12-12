Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A10AE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 17:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141A110E3E3;
	Thu, 12 Dec 2024 17:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RD7gRsT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C0510E3E3
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734024801; x=1765560801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+SwYH1XuZkRYrYOtxLuZqmRNLAVESOVXTu0TqnfrUKs=;
 b=RD7gRsT6x7FaFSYFc8l1IbAg4gRZSMIaeiGpyDlt7Ib0jefUhbTSRkeV
 tnTfIL+9CW1OLaxcPWty/gZzO0EuUvvXtObtIuYIsGXkd7GUerabdjU95
 GTl/kY51aQdf7j172LdznV4P2OmAOqfS3/7VwFUQGZRiPG1BD/+Qoy7Ya
 o5jqLmlNdU98hLW+JVqQjyx7hx8vpUg8qsl49VnCUveQ/oS7NoxgxzYYL
 qgZ8/YgOVME2PGTet0WZSx10n8HcvX4uR7YP4aWk4aLWKZFgybPg88FK0
 hzLISsqzIgNOxxAMZm24SHLTQndHlbkv4qV/cSN/f7MNYEmEbhZmNnYU6 g==;
X-CSE-ConnectionGUID: pWrLIWtvQCO7qpNxPigxxA==
X-CSE-MsgGUID: /EQYYmmJQli3vZ9vZdqwbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44929167"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44929167"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:33:21 -0800
X-CSE-ConnectionGUID: jkoS1h7gQdC8HQ0h9GCBSw==
X-CSE-MsgGUID: PQefSzIIRlasOFuGmrAsgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="127093364"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 09:33:16 -0800
Date: Thu, 12 Dec 2024 18:33:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>, Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
Subject: Re: [PATCH i-g-t v12 3/3] runner/executor: Integrate igt_facts
 functionality
Message-ID: <20241212173313.lsfttacm5hwaedi4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Helen Koike <helen.koike@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Saarinen <jani.saarinen@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Rob Clark <robdclark@chromium.org>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 dominik.karol.piatkowski@intel.com, himal.prasad.ghimiray@intel.com,
 katarzyna.piecielska@intel.com, luciano.coelho@intel.com,
 nirmoy.das@intel.com, stuart.summers@intel.com
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

Hi Peter,
On 2024-12-12 at 08:15:27 +0100, Peter Senna Tschudin wrote:
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

This should be guarded by settings option, like:
	if (settings->facts)
		igt_facts_lists_init();

>  	if (state->next >= job_list->size) {
>  		outf("All tests already executed.\n");
>  		return true;
> @@ -2492,6 +2496,10 @@ bool execute(struct execute_state *state,
>  		int result;
>  		bool already_written = false;
>  
> +		/* Calls before running each test */
> +		igt_facts(last_test);

Same here.

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

Same here.

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

s/igt_//

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

This should be:
  			settings->facts = true;

Please create an option for it in settings struct, similar to 'sync'
below. Also save it in dry-run and restore in igt_resume.

Regards,
Kamil

> +			break;
>  		case OPT_SYNC:
>  			settings->sync = true;
>  			break;
> -- 
> 2.34.1
> 
