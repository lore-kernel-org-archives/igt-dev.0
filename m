Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7E7C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 06:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB76B10E1C6;
	Thu, 23 Jan 2025 06:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/ApBuCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE7310E1C6
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 06:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737613334; x=1769149334;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gxhI48sjV2j8/NdzlcepnQcc0fQ6DtQlpaQikzAd6gA=;
 b=a/ApBuCnunIjvXDXNpf3z7MF7pqoeB6titjlrTWD4QN605zn56KopfCf
 s1Gbtm2OghaOrXleRNeaXl2BNdwSkAQGEh+xPk+DeaBoMTDFLrukyPjPw
 cBYubNBZG3JbAOyUgLWxAGgcyJnOhyXe8HndI7SOoImjaOVPqTCDiFpAg
 QVIkZaeKukxmTkkP10r421tqSrDa4WqYpGWIOCwJo+t9ROkNXJELSqIzf
 yce+pCS9/kEcqzuntR1dWJXjvk2nt+dPl3RLbISH1Xq0O0gmhh/0GZTmL
 zJtuZbY7imEeLDvR26R5i3fMQjAlFExsQEfPiIRsmMgbfElViKnKnIOl+ A==;
X-CSE-ConnectionGUID: 4zNk5XyDTPSna5sY2gz6Zg==
X-CSE-MsgGUID: NcQYNN+xR6SFcxbWj5TTEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38245616"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="38245616"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:22:14 -0800
X-CSE-ConnectionGUID: eBM+tWBcSV+VAP9So7XE3A==
X-CSE-MsgGUID: p2nCWv1/SK2eAX1ers1DmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="130659452"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:22:13 -0800
Date: Thu, 23 Jan 2025 00:22:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 2/7] runner/settings: Use wrapper functions for
 each type
Message-ID: <xfr6zm4cq57myiaco3lfxvjw23tdjzp7lpgsvhfes5ypl2plf3@wyte4y7lt4fl>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-3-lucas.demarchi@intel.com>
 <a3c447fa-75e0-4d14-aa44-356c67fa5120@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3c447fa-75e0-4d14-aa44-356c67fa5120@linux.intel.com>
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

On Wed, Jan 22, 2025 at 01:21:43PM +0100, Peter Senna Tschudin wrote:
>Hi Lucas,
>
>On 21.01.2025 23:57, Lucas De Marchi wrote:
>> Simplify assigning the variables by using wrapper functions. This avoids
>macros, not functions(please also update subject). When I read v2 and saw
>functions here, I went oh cool, but they are still macros. :-)

the wrappers are actually functions: parse_int, parse_ul, parse_str.
The additional macros is just to avoid the repetition of doing this
everywhere:

	PARSE_LINE(s, name, val, field, parse_int)

I'm not a fan of these macros, but it would be more verbose without.
Probably something like this:

	if (!strcmp(name, "field_name")
		settings->field_name = parse_int(val);
	else if (!strcmp ...

in other places I´ve coded this pattern by using a table and offsetof().
It's another possibility but will make the "allocate after parsing a
field" in the patches after this harder.

I didn't feel much the need to polish this though as it's barely
touched. Maybe the if/else chain wouldn't be so horrible.

>
>
>> calling atoi() on every iteration and will allow to simplify the
>> strdup() calls in future.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  runner/settings.c | 74 ++++++++++++++++++++++++++++-------------------
>>  1 file changed, 45 insertions(+), 29 deletions(-)
>>
>> diff --git a/runner/settings.c b/runner/settings.c
>> index 80d95be5b..13694a51c 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -1152,43 +1152,60 @@ bool serialize_settings(struct settings *settings)
>>  #undef SERIALIZE_LINE
>>  }
>>
>> -bool read_settings_from_file(struct settings *settings, FILE *f)
>> +static int parse_int(char **pval)
>> +{
>> +	return atoi(*pval);
>> +}
>> +
>> +static unsigned long parse_ul(char **pval)
>> +{
>> +	return strtoul(*pval, NULL, 10);
>> +}
>> +
>> +static char *parse_str(char **pval)
>>  {
>> -#define PARSE_LINE(s, name, val, field, write)	\
>> +	return *pval ? strdup(*pval) : NULL;
>> +}
>> +
>> +#define PARSE_LINE(s, name, val, field, _f)	\
>>  	if (!strcmp(name, #field)) {		\
>> -		s->field = write;		\
>> +		s->field = _f(&val);		\
>>  		goto cleanup;			\
>>  	}
>> +#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, parse_int)
>> +#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, parse_ul)
>> +#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, parse_str)
>>
>> +bool read_settings_from_file(struct settings *settings, FILE *f)
>> +{
>>  	char *name = NULL, *val = NULL;
>>
>>  	settings->dmesg_warn_level = -1;
>>
>>  	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
>> -		int numval = atoi(val);
>> -		PARSE_LINE(settings, name, val, abort_mask, numval);
>> -		PARSE_LINE(settings, name, val, disk_usage_limit, strtoul(val, NULL, 10));
>> -		PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
>> -		PARSE_LINE(settings, name, val, name, val ? strdup(val) : NULL);
>> -		PARSE_LINE(settings, name, val, dry_run, numval);
>> -		PARSE_LINE(settings, name, val, allow_non_root, numval);
>> -		PARSE_LINE(settings, name, val, facts, numval);
>> -		PARSE_LINE(settings, name, val, sync, numval);
>> -		PARSE_LINE(settings, name, val, log_level, numval);
>> -		PARSE_LINE(settings, name, val, overwrite, numval);
>> -		PARSE_LINE(settings, name, val, multiple_mode, numval);
>> -		PARSE_LINE(settings, name, val, inactivity_timeout, numval);
>> -		PARSE_LINE(settings, name, val, per_test_timeout, numval);
>> -		PARSE_LINE(settings, name, val, overall_timeout, numval);
>> -		PARSE_LINE(settings, name, val, use_watchdog, numval);
>> -		PARSE_LINE(settings, name, val, piglit_style_dmesg, numval);
>> -		PARSE_LINE(settings, name, val, dmesg_warn_level, numval);
>> -		PARSE_LINE(settings, name, val, prune_mode, numval);
>> -		PARSE_LINE(settings, name, val, test_root, val ? strdup(val) : NULL);
>> -		PARSE_LINE(settings, name, val, results_path, val ? strdup(val) : NULL);
>> -		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
>> -		PARSE_LINE(settings, name, val, cov_results_per_test, numval);
>> -		PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
>> +		PARSE_INT(settings, name, val, abort_mask);
>> +		PARSE_UL(settings, name, val, disk_usage_limit);
>> +		PARSE_STR(settings, name, val, test_list);
>> +		PARSE_STR(settings, name, val, name);
>> +		PARSE_INT(settings, name, val, dry_run);
>> +		PARSE_INT(settings, name, val, allow_non_root);
>> +		PARSE_INT(settings, name, val, facts);
>> +		PARSE_INT(settings, name, val, sync);
>> +		PARSE_INT(settings, name, val, log_level);
>> +		PARSE_INT(settings, name, val, overwrite);
>> +		PARSE_INT(settings, name, val, multiple_mode);
>> +		PARSE_INT(settings, name, val, inactivity_timeout);
>> +		PARSE_INT(settings, name, val, per_test_timeout);
>> +		PARSE_INT(settings, name, val, overall_timeout);
>> +		PARSE_INT(settings, name, val, use_watchdog);
>> +		PARSE_INT(settings, name, val, piglit_style_dmesg);
>> +		PARSE_INT(settings, name, val, dmesg_warn_level);
>> +		PARSE_INT(settings, name, val, prune_mode);
>> +		PARSE_STR(settings, name, val, test_root);
>> +		PARSE_STR(settings, name, val, results_path);
>> +		PARSE_INT(settings, name, val, enable_code_coverage);
>> +		PARSE_INT(settings, name, val, cov_results_per_test);
>> +		PARSE_STR(settings, name, val, code_coverage_script);
>>
>>  		printf("Warning: Unknown field in settings file: %s = %s\n",
>>  		       name, val);
>> @@ -1210,9 +1227,8 @@ cleanup:
>>  	free(val);
>>
>>  	return true;
>> -
>> -#undef PARSE_LINE
>>  }
>> +#undef PARSE_LINE
>
>Please add undefs for PARSE_INT, PARSE_UL, and PARSE_STR.
>
>>
>>  /**
>>   * read_env_vars_from_file() - load env vars from a fileTested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>
