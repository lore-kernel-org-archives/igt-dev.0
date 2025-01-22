Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E975C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 12:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A7110E1BA;
	Wed, 22 Jan 2025 12:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsEektLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0878910E1BA
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737548508; x=1769084508;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1v/n2Pg2daHyeJFWE0D0H7MooBqJ284ejCPO6UbhfKg=;
 b=ZsEektLV96hXmf8rkMwXk2QNIzh1s/EmY2DVXDWoUPD+v3rtdx9qUOFC
 QD9f3Ct7UeIMhOw4/hPwUu4lOtWvIYlKh92aIC/gaCuNU05kBSaEPwElb
 dSVTUmrLlwouxjWFIlhaypD2eoZVbtD56MEAo8h6J/3zuPGxloKjso9FR
 xCXWFk7i+4jByskmnTUrndInhURaSwwFY2gX4sF5d1viXCOjkKFvoWOln
 XlXlKHZ3cfr+B5R+ph62wUxeEpuuy1XdRZVzdKyIr0Z2rKr5GiCFxesZE
 Uqw1EgyB3sDG/Mb6vztvRR4wPnc8JVjb9qM2I29RGH0StJdjZmm5yODIw Q==;
X-CSE-ConnectionGUID: RDnk835nR2+pRSQcu0L2WQ==
X-CSE-MsgGUID: qIeigpjRS8mgPXJ+lg578Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48987851"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48987851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:21:48 -0800
X-CSE-ConnectionGUID: 4FpD5Xc9TWKgitmdutGIMw==
X-CSE-MsgGUID: hHSf0ea5Tp2ACol0eoJWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="106939224"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 04:21:46 -0800
Message-ID: <a3c447fa-75e0-4d14-aa44-356c67fa5120@linux.intel.com>
Date: Wed, 22 Jan 2025 13:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/7] runner/settings: Use wrapper functions for
 each type
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-3-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250121225733.808978-3-lucas.demarchi@intel.com>
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

Hi Lucas,

On 21.01.2025 23:57, Lucas De Marchi wrote:
> Simplify assigning the variables by using wrapper functions. This avoids
macros, not functions(please also update subject). When I read v2 and saw
functions here, I went oh cool, but they are still macros. :-)


> calling atoi() on every iteration and will allow to simplify the
> strdup() calls in future.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  runner/settings.c | 74 ++++++++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 29 deletions(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 80d95be5b..13694a51c 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -1152,43 +1152,60 @@ bool serialize_settings(struct settings *settings)
>  #undef SERIALIZE_LINE
>  }
>  
> -bool read_settings_from_file(struct settings *settings, FILE *f)
> +static int parse_int(char **pval)
> +{
> +	return atoi(*pval);
> +}
> +
> +static unsigned long parse_ul(char **pval)
> +{
> +	return strtoul(*pval, NULL, 10);
> +}
> +
> +static char *parse_str(char **pval)
>  {
> -#define PARSE_LINE(s, name, val, field, write)	\
> +	return *pval ? strdup(*pval) : NULL;
> +}
> +
> +#define PARSE_LINE(s, name, val, field, _f)	\
>  	if (!strcmp(name, #field)) {		\
> -		s->field = write;		\
> +		s->field = _f(&val);		\
>  		goto cleanup;			\
>  	}
> +#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, parse_int)
> +#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, parse_ul)
> +#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, parse_str)
>  
> +bool read_settings_from_file(struct settings *settings, FILE *f)
> +{
>  	char *name = NULL, *val = NULL;
>  
>  	settings->dmesg_warn_level = -1;
>  
>  	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
> -		int numval = atoi(val);
> -		PARSE_LINE(settings, name, val, abort_mask, numval);
> -		PARSE_LINE(settings, name, val, disk_usage_limit, strtoul(val, NULL, 10));
> -		PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
> -		PARSE_LINE(settings, name, val, name, val ? strdup(val) : NULL);
> -		PARSE_LINE(settings, name, val, dry_run, numval);
> -		PARSE_LINE(settings, name, val, allow_non_root, numval);
> -		PARSE_LINE(settings, name, val, facts, numval);
> -		PARSE_LINE(settings, name, val, sync, numval);
> -		PARSE_LINE(settings, name, val, log_level, numval);
> -		PARSE_LINE(settings, name, val, overwrite, numval);
> -		PARSE_LINE(settings, name, val, multiple_mode, numval);
> -		PARSE_LINE(settings, name, val, inactivity_timeout, numval);
> -		PARSE_LINE(settings, name, val, per_test_timeout, numval);
> -		PARSE_LINE(settings, name, val, overall_timeout, numval);
> -		PARSE_LINE(settings, name, val, use_watchdog, numval);
> -		PARSE_LINE(settings, name, val, piglit_style_dmesg, numval);
> -		PARSE_LINE(settings, name, val, dmesg_warn_level, numval);
> -		PARSE_LINE(settings, name, val, prune_mode, numval);
> -		PARSE_LINE(settings, name, val, test_root, val ? strdup(val) : NULL);
> -		PARSE_LINE(settings, name, val, results_path, val ? strdup(val) : NULL);
> -		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
> -		PARSE_LINE(settings, name, val, cov_results_per_test, numval);
> -		PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
> +		PARSE_INT(settings, name, val, abort_mask);
> +		PARSE_UL(settings, name, val, disk_usage_limit);
> +		PARSE_STR(settings, name, val, test_list);
> +		PARSE_STR(settings, name, val, name);
> +		PARSE_INT(settings, name, val, dry_run);
> +		PARSE_INT(settings, name, val, allow_non_root);
> +		PARSE_INT(settings, name, val, facts);
> +		PARSE_INT(settings, name, val, sync);
> +		PARSE_INT(settings, name, val, log_level);
> +		PARSE_INT(settings, name, val, overwrite);
> +		PARSE_INT(settings, name, val, multiple_mode);
> +		PARSE_INT(settings, name, val, inactivity_timeout);
> +		PARSE_INT(settings, name, val, per_test_timeout);
> +		PARSE_INT(settings, name, val, overall_timeout);
> +		PARSE_INT(settings, name, val, use_watchdog);
> +		PARSE_INT(settings, name, val, piglit_style_dmesg);
> +		PARSE_INT(settings, name, val, dmesg_warn_level);
> +		PARSE_INT(settings, name, val, prune_mode);
> +		PARSE_STR(settings, name, val, test_root);
> +		PARSE_STR(settings, name, val, results_path);
> +		PARSE_INT(settings, name, val, enable_code_coverage);
> +		PARSE_INT(settings, name, val, cov_results_per_test);
> +		PARSE_STR(settings, name, val, code_coverage_script);
>  
>  		printf("Warning: Unknown field in settings file: %s = %s\n",
>  		       name, val);
> @@ -1210,9 +1227,8 @@ cleanup:
>  	free(val);
>  
>  	return true;
> -
> -#undef PARSE_LINE
>  }
> +#undef PARSE_LINE

Please add undefs for PARSE_INT, PARSE_UL, and PARSE_STR.

>  
>  /**
>   * read_env_vars_from_file() - load env vars from a fileTested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

