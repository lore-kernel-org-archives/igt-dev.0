Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A67C02198
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 13:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB6110E284;
	Sat,  8 Feb 2025 13:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiDWIqM+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E526510E030
 for <igt-dev@lists.freedesktop.org>; Sat,  8 Feb 2025 13:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739020045; x=1770556045;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1AMZjCLY99sL29yqRkgq+AWS/C6aoD1t+JwKK2EkpXw=;
 b=aiDWIqM+t58DH+QnHiGWAZvQYoeIL8+zPm5B33+WoJ0LpSzVnqnxZ56J
 lt1HEdqTCYrPVxLBj7lkedf6O5A7ihNs9ACPXORCd2zlXOSqp+/hU+WH7
 ytr06/2UkhoD5iDsF1li383gSLI5iaU+fMaA65WWubfTSfvCAVb9LdzKr
 EbfqAg/6PeXIi14gLpNexJPtCChJZoJX/AchfqcayPaCjqrKTjyNrZo2T
 qyROF2mpNFTV1ltQ9Jg7eTm2ERnNIHydF+TL2l8afE4ML/bbHsOkfYUib
 5eYD25iXrjHSBD3UxoapJV5ISaUJ+l14pUDPhuMOcamE87RBECNLNjClp g==;
X-CSE-ConnectionGUID: Pi1vOtDrRzWhvcGU4UFqlw==
X-CSE-MsgGUID: YsAAOY4MTqmao+vBk6IFcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39560888"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; d="scan'208";a="39560888"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:07:24 -0800
X-CSE-ConnectionGUID: nflHfKWuQCWwJlEEQY5E7Q==
X-CSE-MsgGUID: k0j1C8HuSLmAsobpMuZTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111604823"
Received: from arossa-mobl1.ger.corp.intel.com (HELO [10.245.98.254])
 ([10.245.98.254])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:07:22 -0800
Message-ID: <7635c655-034f-4616-9d76-c1377d2ed10c@linux.intel.com>
Date: Sat, 8 Feb 2025 14:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI i-g-t 04/10] runner/settings: Use wrapper macros for each type
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
 <20250207231039.2883195-6-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250207231039.2883195-6-lucas.demarchi@intel.com>
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



On 08.02.2025 00:09, Lucas De Marchi wrote:
> Simplify assigning the variables by using functions called by wrapper
> macros. This avoids calling atoi() on every iteration and will help
> future refactors on functions parsing the values.
> 
> The pointer to the value is passed to the parse function since it will
> be useful later when parsing a string and leaking it to the settings
> struct rather than duplicating.

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  runner/settings.c | 78 +++++++++++++++++++++++++++++------------------
>  1 file changed, 48 insertions(+), 30 deletions(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 89df4990e..340d3802a 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -1153,43 +1153,59 @@ bool serialize_settings(struct settings *settings)
>  #undef SERIALIZE_LINE
>  }
>  
> -bool read_settings_from_file(struct settings *settings, FILE *f)
> +static int parse_int(char **val)
> +{
> +	return atoi(*val);
> +}
> +
> +static unsigned long parse_ul(char **val)
>  {
> -#define PARSE_LINE(s, name, val, field, write)	\
> +	return strtoul(*val, NULL, 10);
> +}
> +
> +static char *parse_str(char **val)
> +{
> +	return *val ? strdup(*val) : NULL;
> +}
> +
> +#define PARSE_LINE(s, name, val, field, _f)	\
>  	if (!strcmp(name, #field)) {		\
> -		s->field = write;		\
> +		s->field = _f(val);		\
>  		goto cleanup;			\
>  	}
> -
> +#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, &val, field, parse_int)
> +#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, &val, field, parse_ul)
> +#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, &val, field, parse_str)
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
> @@ -1211,9 +1227,11 @@ cleanup:
>  	free(val);
>  
>  	return true;
> -
> -#undef PARSE_LINE
>  }
> +#undef PARSE_STR
> +#undef PARSE_UL
> +#undef PARSE_INT
> +#undef PARSE_LINE
>  
>  /**
>   * read_env_vars_from_file() - load env vars from a file

