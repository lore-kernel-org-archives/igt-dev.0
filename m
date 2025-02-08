Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA00C02198
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 13:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCC710E030;
	Sat,  8 Feb 2025 13:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWHlWrny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075A310E030
 for <igt-dev@lists.freedesktop.org>; Sat,  8 Feb 2025 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739020070; x=1770556070;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=d7Su4pc7JyHLMxp37JYLhk0RbiFNeZQZj3MUfrPLmZs=;
 b=gWHlWrnyQJ1PIcrj8ypXQMLq1QGNgYLOAlEJUzTHU/m3Bsm814Ccl/SZ
 SXclpUxlXADwTvQ0sFUCTZEO+zu+9IITFa6ZQAMYP00InkItT7km0jPTf
 7VNg9HjwBDpYf1VizXwYYaq78iqngKfRQB6KUU5iQ2kfmk98GxSZLIT4v
 v+Hm/YebZDhk8EMJ/Iy1WW+PurxTIoBlCEBBhwsDL7TUsflcIueDGBWn1
 GyNh/3KhINW9GNa7fcG71E0cQNNOIo5NL7MfXsB4lk47c61GdHgGv+ysv
 xbI25aPPTGtZFi2iU9ePtFICo9xOO49khrao902XoGaYHExVg8Ztsmfbj w==;
X-CSE-ConnectionGUID: Hr61RBvlS3axmr7zM0svGQ==
X-CSE-MsgGUID: /DpfR3dOSUmWk7lPg6orog==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39560910"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; d="scan'208";a="39560910"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:07:49 -0800
X-CSE-ConnectionGUID: 5aDegzNdSA2fmoe4Z6C0sQ==
X-CSE-MsgGUID: r0UDBEARQMK9TILjhoIlYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111604843"
Received: from arossa-mobl1.ger.corp.intel.com (HELO [10.245.98.254])
 ([10.245.98.254])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2025 05:07:48 -0800
Message-ID: <35a27400-fe99-41e2-b1a5-73bf29e46c23@linux.intel.com>
Date: Sat, 8 Feb 2025 14:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI i-g-t 05/10] runner/settings: Match serialization to parse
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
 <20250207231039.2883195-7-lucas.demarchi@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250207231039.2883195-7-lucas.demarchi@intel.com>
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
> Use similarly named macros on both sides of serialize/parse.
> 

Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  runner/settings.c | 58 +++++++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 340d3802a..73d8aa13d 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -1052,10 +1052,12 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
>  	return true;
>  }
>  
> +#define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #name, s->name)
> +#define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
> +#define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
> +#define SERIALIZE_STR(f, s, name) SERIALIZE_LINE(f, s, name, "%s")
>  bool serialize_settings(struct settings *settings)
>  {
> -#define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
> -
>  	FILE *f;
>  	int dirfd, covfd;
>  	char path[PATH_MAX];
> @@ -1097,31 +1099,31 @@ bool serialize_settings(struct settings *settings)
>  		return false;
>  	}
>  
> -	SERIALIZE_LINE(f, settings, abort_mask, "%d");
> -	SERIALIZE_LINE(f, settings, disk_usage_limit, "%zd");
> +	SERIALIZE_INT(f, settings, abort_mask);
> +	SERIALIZE_UL(f, settings, disk_usage_limit);
>  	if (settings->test_list)
> -		SERIALIZE_LINE(f, settings, test_list, "%s");
> +		SERIALIZE_STR(f, settings, test_list);
>  	if (settings->name)
> -		SERIALIZE_LINE(f, settings, name, "%s");
> -	SERIALIZE_LINE(f, settings, dry_run, "%d");
> -	SERIALIZE_LINE(f, settings, allow_non_root, "%d");
> -	SERIALIZE_LINE(f, settings, facts, "%d");
> -	SERIALIZE_LINE(f, settings, sync, "%d");
> -	SERIALIZE_LINE(f, settings, log_level, "%d");
> -	SERIALIZE_LINE(f, settings, overwrite, "%d");
> -	SERIALIZE_LINE(f, settings, multiple_mode, "%d");
> -	SERIALIZE_LINE(f, settings, inactivity_timeout, "%d");
> -	SERIALIZE_LINE(f, settings, per_test_timeout, "%d");
> -	SERIALIZE_LINE(f, settings, overall_timeout, "%d");
> -	SERIALIZE_LINE(f, settings, use_watchdog, "%d");
> -	SERIALIZE_LINE(f, settings, piglit_style_dmesg, "%d");
> -	SERIALIZE_LINE(f, settings, dmesg_warn_level, "%d");
> -	SERIALIZE_LINE(f, settings, prune_mode, "%d");
> -	SERIALIZE_LINE(f, settings, test_root, "%s");
> -	SERIALIZE_LINE(f, settings, results_path, "%s");
> -	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
> -	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
> -	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
> +		SERIALIZE_STR(f, settings, name);
> +	SERIALIZE_INT(f, settings, dry_run);
> +	SERIALIZE_INT(f, settings, allow_non_root);
> +	SERIALIZE_INT(f, settings, facts);
> +	SERIALIZE_INT(f, settings, sync);
> +	SERIALIZE_INT(f, settings, log_level);
> +	SERIALIZE_INT(f, settings, overwrite);
> +	SERIALIZE_INT(f, settings, multiple_mode);
> +	SERIALIZE_INT(f, settings, inactivity_timeout);
> +	SERIALIZE_INT(f, settings, per_test_timeout);
> +	SERIALIZE_INT(f, settings, overall_timeout);
> +	SERIALIZE_INT(f, settings, use_watchdog);
> +	SERIALIZE_INT(f, settings, piglit_style_dmesg);
> +	SERIALIZE_INT(f, settings, dmesg_warn_level);
> +	SERIALIZE_INT(f, settings, prune_mode);
> +	SERIALIZE_STR(f, settings, test_root);
> +	SERIALIZE_STR(f, settings, results_path);
> +	SERIALIZE_INT(f, settings, enable_code_coverage);
> +	SERIALIZE_INT(f, settings, cov_results_per_test);
> +	SERIALIZE_STR(f, settings, code_coverage_script);
>  
>  	if (settings->sync) {
>  		fflush(f);
> @@ -1149,9 +1151,11 @@ bool serialize_settings(struct settings *settings)
>  
>  	close(dirfd);
>  	return true;
> -
> -#undef SERIALIZE_LINE
>  }
> +#undef SERIALIZE_STR
> +#undef SERIALIZE_UL
> +#undef SERIALIZE_INT
> +#undef SERIALIZE_LINE
>  
>  static int parse_int(char **val)
>  {

