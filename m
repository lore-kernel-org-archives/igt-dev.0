Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C2EC0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 18:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA6C10E1F1;
	Tue, 28 Jan 2025 18:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfR8usYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132B610E1F1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 18:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738089485; x=1769625485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W6eF5YwwRCMEm62m9BOvPenXSm0YewGSnl9AiLmjra0=;
 b=mfR8usYDS/ONXxEdAuwsEEs+Vtuiy3AxjAwzSYSaguIKZEVCWOsxMffr
 qAbemYxXLWPKo23uYDjslfvffDy8p2Jl3zU6crtE36URSPiQ6LrGB8O0g
 8vKOgD6X66XGWV0U25njVS+gJ1Pa3ULJX/lU55ycrSWFu1lWCVcNdUj3V
 vlHTGlAZDs2Pif4xbfoLvDoFn1J/9Z6kGZqtanMedCcN6x94kJGtca9mo
 dvceXuK933yxg76R76ohE5FAHv3YHYIbYQAJ+i1fxirYusFLtFkX9V2Tt
 8Yh7qAoacfP/7xvnIUO41DvWgIWG1N1ddno6kkUYoEVwqmRCC8zqAUeQV A==;
X-CSE-ConnectionGUID: BhO2osFnSqqMp0VYtIDMYA==
X-CSE-MsgGUID: 4QWZczQFTiOrmXEMJtndUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38761862"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38761862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 10:38:04 -0800
X-CSE-ConnectionGUID: bIU45rUQSFuK2BjHIR+LiQ==
X-CSE-MsgGUID: vLPRw7bGRCGLGP6DtDoUBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="113847576"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 10:38:03 -0800
Date: Tue, 28 Jan 2025 19:37:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
Message-ID: <20250128183744.zegxv5uougqwvc4a@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121225733.808978-7-lucas.demarchi@intel.com>
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
On 2025-01-21 at 14:57:32 -0800, Lucas De Marchi wrote:
> Serialize the command line to metadata.txt. The expected format in the
> metadata.txt is like below:
> 
> 	cmdline.argc : 6
> 	cmdline.argv[0] : ./build/runner/igt_runner
> 	cmdline.argv[1] : -o

Sorry for late reponse but imho it should be saved for debugging
purpose but not for reading this in metadata.txt, especially that
this option '-o' is 'override existing results folder', so it
should be used only once by igt_runner in setup phase but not for
igt_resume.

From igt_runner --help:
-o, --overwrite       If the results-path already exists, delete it

imho we should save it into some different file and include it into
results.json

Also +Cc Petri
Cc: Petri Latvala <adrinael@adrinael.net>

Regards,
Kamil

> 	cmdline.argv[2] : --test-list
> 	cmdline.argv[3] : /tmp/testlist.txt
> 	cmdline.argv[4] : build/tests/
> 	cmdline.argv[5] : /tmp/results
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
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
> -- 
> 2.48.0
> 
