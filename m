Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA1DCD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 10:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9258010E558;
	Thu, 11 Apr 2024 10:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJzOMRrl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D00910E558
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 10:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712830034; x=1744366034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I7GcDfqhLuXElK7dNofpwFF9AmCcajDVZI2+B8bZS90=;
 b=ZJzOMRrlkf43/H+2vAmbt+tZtAKmOz+KIOS4TooxK0/x4FGuDoU4qbXV
 svLWIjO1ieGJAup710sDGC/n2mnWyQvUY7aG/9nmsjupoaodaggOcE+bA
 CB02P1rEZeQkvT+WLmM+SA2RdXXrNzXEMJo+ratp5UjQsCTctvRrdsZ4O
 j2tZQ1KZQFYf4nsrKH+Y+/91fRhGxRpFnQYGGFobSrwCpTbNLw10JlIPO
 +YfQW3n9eGb+PYbYy3G0639tCQyUSGzmVX9w/wP666uA4Tx9JPiwCUOxy
 R3bhHoR/jZH6KVPhqq4FqwJyJMymhjyhqB28OtYH2Kcs5Ej4xHOsle84H w==;
X-CSE-ConnectionGUID: vKGaR7w4T96Os0/wmtnymw==
X-CSE-MsgGUID: 3lXy/112R/ykMKwtJkZ1dA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8338283"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8338283"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 03:07:13 -0700
X-CSE-ConnectionGUID: YBH3AiPETeySwfs/FQKs4A==
X-CSE-MsgGUID: qjatK5ekSvCuo+btudUfqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25630657"
Received: from unknown (HELO localhost) ([10.245.246.155])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 03:07:12 -0700
Date: Thu, 11 Apr 2024 12:07:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] intel_reg: Stop warning if register spec is not
 there
Message-ID: <20240411100620.gvl2h7o26r3xrzep@zkempczy-mobl2>
References: <20240410231710.3113867-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410231710.3113867-1-lucas.demarchi@intel.com>
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

On Wed, Apr 10, 2024 at 04:17:10PM -0700, Lucas De Marchi wrote:
> Stop suffering when using igt from the git checkout, which is the case
> for all/most developers.
> 
> 	$ sudo ./build/tools/intel_reg write 0x2358 0xdeadbeef
> 	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.
> 
> Pretty annoying when you have a bunch of commands to run and don't want
> to simply ignore stderr.  Keep the other warnings as if the file is
> there and can't be read for some reason, it's good to give a warning.
> However if the file simply isn't there, let it pass.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/intel_reg.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 6c37e14d1..ec311a05a 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -1114,12 +1114,8 @@ static int read_reg_spec(struct config *config)
>  		path = IGT_DATADIR"/registers";
>  
>  	r = stat(path, &st);
> -	if (r) {
> -		fprintf(stderr, "Warning: stat '%s' failed: %s. "
> -			"Using builtin register spec.\n",
> -			path, strerror(errno));

Maybe this warning should stay when verbosity >= 0?

--
Zbigniew

> +	if (r)
>  		goto builtin;
> -	}
>  
>  	if (S_ISDIR(st.st_mode)) {
>  		r = get_reg_spec_file(buf, sizeof(buf), path, config->devid);
> -- 
> 2.43.0
> 
