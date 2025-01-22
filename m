Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE4C02182
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B23310E300;
	Wed, 22 Jan 2025 12:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AywLp9Qv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55AE10E300
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737548732; x=1769084732;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+0z451eDAxBouiZsUbrDXjJYeqWeCwkMLehSdFyBdOY=;
 b=AywLp9Qv9ZyTQBsjSm+Ldi6VzgHgbMu8l7uggLOVlOKlN8LDAWOoce4V
 bIbghX0Tx8lqX8gftTh1MT3m0OkZ2YzNr46bEv6OFIv9ZhRY0LHuPlbF7
 U0xIdKvGvLrxC7lAq9tNyEDwGbNLEzUxjziD6YL1HDCdB4Ru9fOnnNCCZ
 oONrFQAN/coyn2ramHH5RtPUvRpXW0aPurb6D8QDE9JUUWh6NdTv/OTUN
 ttKWYQgs6WqQp4w3tmNhu0Y8BJNoyJYdi5+zba8Y90rnTN5rmVNTqNWg+
 8mR+0bDRI7Fo03PNljnKrmIlYm7eLNhWFFO/waI3qoGhoKEqOmYRp7uQ+ g==;
X-CSE-ConnectionGUID: /oKKgvd9StmV07gy0OOSqg==
X-CSE-MsgGUID: Tre+kjH9T824Gb9DECm8NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37882659"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="37882659"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:25:31 -0800
X-CSE-ConnectionGUID: D7KFiZvDQQeXlYkbbT/ZVA==
X-CSE-MsgGUID: zXJzaV90RROfmo27gj8BPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="112142694"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:25:29 -0800
Message-ID: <2b7d1110-817c-488d-b859-e06ca312f00d@linux.intel.com>
Date: Wed, 22 Jan 2025 13:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250121225733.808978-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 21.01.2025 23:57, Lucas De Marchi wrote:
> Serialize the command line to metadata.txt. The expected format in the
> metadata.txt is like below:
> 
> 	cmdline.argc : 6
> 	cmdline.argv[0] : ./build/runner/igt_runner
> 	cmdline.argv[1] : -o
> 	cmdline.argv[2] : --test-list
> 	cmdline.argv[3] : /tmp/testlist.txt
> 	cmdline.argv[4] : build/tests/
> 	cmdline.argv[5] : /tmp/results
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

> ---
>  runner/settings.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  runner/settings.h |  5 +++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 2787869ee..ed1afc205 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -529,6 +529,18 @@ static void free_hook_strs(struct igt_vec *hook_strs)
>  	igt_vec_fini(hook_strs);
>  }
>  
> +static void free_cmdline(struct settings *settings)
> +{
> +	if (!settings->cmdline.allocated)
> +		return;
> +
> +	for (size_t i = 0; i < settings->cmdline.argc; i++)
> +		free(settings->cmdline.argv[i]);
> +
> +	free(settings->cmdline.argv);
> +}
> +
> +
>  static bool file_exists_at(int dirfd, const char *filename)
>  {
>  	return faccessat(dirfd, filename, F_OK, 0) == 0;
> @@ -646,6 +658,7 @@ void clear_settings(struct settings *settings)
>  	free_regexes(&settings->exclude_regexes);
>  	free_env_vars(&settings->env_vars);
>  	free_hook_strs(&settings->hook_strs);
> +	free_cmdline(settings);
>  
>  	init_settings(settings);
>  }
> @@ -875,6 +888,8 @@ bool parse_options(int argc, char **argv,
>  		goto error;
>  	}
>  
> +	settings->cmdline.argc = argc;
> +	settings->cmdline.argv = argv;
>  
>  	return true;
>  
> @@ -1055,6 +1070,7 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
>  bool serialize_settings(struct settings *settings)
>  {
>  #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
> +#define SERIALIZE_ARRAY_ITEM(f, s, name, _i, format) fprintf(f, "%s[%d] : " format "\n", #name, _i, s->name[_i])
>  
>  	FILE *f;
>  	int dirfd, covfd;
> @@ -1123,6 +1139,10 @@ bool serialize_settings(struct settings *settings)
>  	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
>  	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
>  
> +	SERIALIZE_LINE(f, settings, cmdline.argc, "%d");
> +	for (int i = 0; i < settings->cmdline.argc; i++)
> +		SERIALIZE_ARRAY_ITEM(f, settings, cmdline.argv, i, "%s");
> +
>  	if (settings->sync) {
>  		fflush(f);
>  		fsync(fileno(f));
> @@ -1177,9 +1197,21 @@ static char *parse_str(char **pval)
>  		s->field = _f(&val);		\
>  		goto cleanup;			\
>  	}
> +#define PARSE_LINE_ARRAY(s, name, val, field, _f, _max)		\
> +	do {							\
> +		int idx;					\
> +		if (sscanf(name, #field "[%u]", &idx) == 1 &&	\
> +		    idx < s->_max) {				\
> +			s->field[idx] = _f(&val);		\
> +			goto cleanup;				\
> +		}						\
> +	} while (0)
> +
>  #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, parse_int)
>  #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, parse_ul)
>  #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, parse_str)
> +#define PARSE_ARRAY_STR(s, name, val, field, _max) \
> +	PARSE_LINE_ARRAY(s, name, val, field, parse_str, _max)
>  
>  bool read_settings_from_file(struct settings *settings, FILE *f)
>  {
> @@ -1211,6 +1243,15 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
>  		PARSE_INT(settings, name, val, enable_code_coverage);
>  		PARSE_INT(settings, name, val, cov_results_per_test);
>  		PARSE_STR(settings, name, val, code_coverage_script);
> +		PARSE_INT(settings, name, val, cmdline.argc);
> +
> +		if (settings->cmdline.argc && !settings->cmdline.argv) {
> +			settings->cmdline.allocated = true;
> +			settings->cmdline.argv = calloc(settings->cmdline.argc,
> +							sizeof(*settings->cmdline.argv));
> +		}
> +
> +		PARSE_ARRAY_STR(settings, name, val, cmdline.argv, cmdline.argc);
>  
>  		printf("Warning: Unknown field in settings file: %s = %s\n",
>  		       name, val);
> @@ -1234,6 +1275,7 @@ cleanup:
>  	return true;
>  }
>  #undef PARSE_LINE
> +#undef PARSE_LINE_ARRAY

Missing undefs here?

>  
>  /**
>   * read_env_vars_from_file() - load env vars from a file
> diff --git a/runner/settings.h b/runner/settings.h
> index f69f09778..d563a0d16 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -75,6 +75,11 @@ struct settings {
>  	char *code_coverage_script;
>  	bool enable_code_coverage;
>  	bool cov_results_per_test;
> +	struct {
> +		bool allocated;
> +		int argc;
> +		char **argv;
> +	} cmdline;
>  };
>  
>  /**

