Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85618D68BC2
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 14:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406B210E011;
	Fri, 15 Nov 2024 14:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvv8ceJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A9A10E011
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 14:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731681442; x=1763217442;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cXkJXndKV/U6SAf+EuY+NxoDj7aSM6pCyA8Q1TeWdpI=;
 b=dvv8ceJSHvQdhPSvGnko6wwTueDB7rapxqjHMlBrde+1ilJNrabyXdtK
 GDVRM5pibkeGBGdexLPfirwWjCa/fNcR88NbZWMmpV+RC4dSJf6AY4Yna
 fytLGh/ncyWR24bNMlgsF2RN3+UBILuCGBDW8lDE6I/xH7sMq50B76Wn0
 IJdfpu77bITLgAiiIu5Y4Nh9CEHTqhD7o51/VOIfJg6b/RxNlG43WDP33
 jpR7gyL7LHsOYKR3IYxu/3Zb2WwP8UGQEd/Wq09Q3Js+OpM03e8QzjQap
 gea4Gvo50YfotpQqknM0HySxWS9yi1XN4kgDFTIDHIf5FPvAOorP9lKoY g==;
X-CSE-ConnectionGUID: nlBS40CmQ1aXBlzXbgQ69w==
X-CSE-MsgGUID: JpW8yEVSS7+p3BqIz8aQpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31637155"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31637155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:37:21 -0800
X-CSE-ConnectionGUID: noKpIitGQG2LGyqhF8fcdA==
X-CSE-MsgGUID: 2AF6QjiTSeKsbddf4KqmSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88333048"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 06:37:18 -0800
Date: Fri, 15 Nov 2024 15:36:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH v5 1/3] lib/igt_sysfs: Add igt_sysfs_get_next_engine
Message-ID: <20241115143658.xtmjago5s3f7az2r@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 vinay.belgaumkar@intel.com
References: <20241107225254.302010-1-jonathan.cavitt@intel.com>
 <20241107225254.302010-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107225254.302010-2-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-11-07 at 22:52:52 +0000, Jonathan Cavitt wrote:
> Create a new helper function, igt_sysfs_get_next_engine, that iterates
> over sysfs/engines and stores the next engine for the user.  The
> function returns true if the next engine in the list is available, and
> false otherwise.  The function will be used in the test suite in a later
> patch.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  lib/igt_sysfs.c | 36 ++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 26a3aa31fb..3d0dada969 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1236,6 +1236,42 @@ static uint16_t xe_get_engine_class(char *name)
>  	return class;
>  }
>  
> +/**
> + * igt_sysfs_get_next_engine:
> + * @engines: fd of the directory engine
> + * @prior: previous engine from the sysfs/engines list
> + *
> + * Iterates over sysfs/engines and stores the next engine in prior.
> + * Returns true if there are more engines to iterate over, and false otherwise.
> + */
> +bool igt_sysfs_get_next_engine(int engines, int *prior)
> +{
> +	struct dirent *de;
> +	DIR *dir;
> +
> +	if (!prior)

This looks buggy, did you mean:
	if (!*prior)

Btw I do not get how it should work, who will close dir?
You could either devise for example iterator:
igt_sysfs_get_first_engine/_next_engine

or for example igt_sysfs_get_egines_names --> return list of engines
names (as seen by 'ls engines') and then iterate over returned list?

List could be na igt_list or something simpler like concatenation of strings
or N * strings\0 + '\0' zero string as end guard?

> +		lseek(engines, 0, SEEK_SET);
> +	else
> +		close(*prior);
> +
> +	dir = fdopendir(engines);

This will open dir at every function call.

Regards,
Kamil

> +	if (!dir) {
> +		close(engines);
> +		return false;
> +	}
> +
> +	while ((de = readdir(dir))) {
> +		if (*de->d_name == '.')
> +			continue;
> +
> +		*prior = openat(engines, de->d_name, O_RDONLY);
> +		if (*prior >= 0)
> +			return true;
> +	}
> +	return false;
> +}
> +
> +
>  /**
>   * igt_sysfs_engines:
>   * @xe: fd of the device
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 852b95053f..bff5ed68e6 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -163,6 +163,7 @@ typedef struct igt_sysfs_rw_attr {
>  
>  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
>  
> +bool igt_sysfs_get_next_engine(int engines, int *prior);
>  void igt_sysfs_engines(int xe, int engines, int gt, bool all, const char **property,
>  		       void (*test)(int, int, const char **, uint16_t, int));
>  
> -- 
> 2.43.0
> 
