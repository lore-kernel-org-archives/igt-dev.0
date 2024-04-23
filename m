Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC43C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 19:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758ED113609;
	Tue, 23 Apr 2024 19:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmxwbvUb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1B2113609
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 19:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713901726; x=1745437726;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0FACAMB6eyOp7ntNphZHgU/lPyTa4Uv364sR2CF14OI=;
 b=OmxwbvUbpC5Yzvtr0dekoviEcdSuLxmciulHIp0ylfeyPPmpK9HkEqph
 Qu4sHy+oDWGfQugey3m4ml6KeCuwJ5uLgXKUgZVhWgCRqX9hRef7SFrZ9
 NGU24+rsF+iyTf8FzqHRMC6q+4HNKT9nf594nThTMHfk2ez0HjIIOiIDt
 BfgCMMprd8tECcBT1bPNYxESftlDxQPVUWBShDeLET8NuDyyEsqKI9IQr
 TZz1kmRx19ZAMiZQgrp8F2SPh4QdaQ35OeCLdPXFNoKYZ30A+yVp7Fkho
 fQI62VNt19OnOIRH1KPwdMF2hRHpc4JH/6sEbZYNlHRm8n8rthlBRVtTV A==;
X-CSE-ConnectionGUID: S6ALaoA6RMqKdWkZwNkCow==
X-CSE-MsgGUID: JlZHiJevTKq5giXQYxIIQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9615948"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9615948"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 12:48:46 -0700
X-CSE-ConnectionGUID: I8z4gzMgSzWEyU9ycFm7oQ==
X-CSE-MsgGUID: CAoZgUVMTN2tEi4Pw86JQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24445226"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:48:44 -0700
Date: Tue, 23 Apr 2024 21:48:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] intel_reg: Move decoding behind an option
Message-ID: <20240423194828.mk7gbfe25gmhomcm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20240416154338.102157-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416154338.102157-1-lucas.demarchi@intel.com>
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
On 2024-04-16 at 10:42:07 -0500, Lucas De Marchi wrote:

small nit, use prefix "tools/" in subject, so instead of

[PATCH] intel_reg: Move decoding behind an option

better:
[PATCH i-g-t] tools/intel_reg: Move decoding behind an option

with that
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> Decoding the register can be only as good as the reg_spec being used.
> The current builtin register spec is not that. Move that decoding behind
> an option to make it better for the normal case when running from the
> repo checkout where the external reg spec is not available. Passing any
> of --decode, --all, --spec brings the old behavior back:
> 
> 	$ sudo ./build/tools/intel_reg --decode read 0x2358
> 	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.
> 					    (0x00002358): 0x00000000
> 
> vs the new behavior:
> 
> 	$ sudo ./build/tools/intel_reg --decode read 0x2358
> 					    (0x00002358): 0x00000000
> 
> We could probably reduce the leading space since we won't have any name,
> but that can be improved later.
> 
> v2: Instead of removing the warning, move the whole decoding logic
>     behind a command line option
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/intel_reg.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 6c37e14d1..1b6a07aca 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -68,6 +68,9 @@ struct config {
>  	/* write: do a posting read */
>  	bool post;
>  
> +	/* decode registers, otherwise use just raw values */
> +	bool decode;
> +
>  	/* decode register for all platforms */
>  	bool all_platforms;
>  
> @@ -195,7 +198,7 @@ static bool port_is_mmio(enum port_addr port)
>  	}
>  }
>  
> -static void dump_decode(struct config *config, struct reg *reg, uint32_t val)
> +static void dump_regval(struct config *config, struct reg *reg, uint32_t val)
>  {
>  	char decode[1300];
>  	char tmp[1024];
> @@ -206,8 +209,11 @@ static void dump_decode(struct config *config, struct reg *reg, uint32_t val)
>  	else
>  		*bin = '\0';
>  
> -	intel_reg_spec_decode(tmp, sizeof(tmp), reg, val,
> -			      config->all_platforms ? 0 : config->devid);
> +	if (config->decode)
> +		intel_reg_spec_decode(tmp, sizeof(tmp), reg, val,
> +				      config->all_platforms ? 0 : config->devid);
> +	else
> +		*tmp = '\0';
>  
>  	if (*tmp) {
>  		/* We have a decode result, and maybe binary decode. */
> @@ -573,7 +579,7 @@ static void dump_register(struct config *config, struct reg *reg)
>  	uint32_t val;
>  
>  	if (read_register(config, reg, &val) == 0)
> -		dump_decode(config, reg, val);
> +		dump_regval(config, reg, val);
>  }
>  
>  static int write_register(struct config *config, struct reg *reg, uint32_t val)
> @@ -941,7 +947,7 @@ static int intel_reg_decode(struct config *config, int argc, char *argv[])
>  			continue;
>  		}
>  
> -		dump_decode(config, &reg, val);
> +		dump_regval(config, &reg, val);
>  	}
>  
>  	return EXIT_SUCCESS;
> @@ -1037,10 +1043,11 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
>  	printf("\n\n");
>  
>  	printf("OPTIONS common to most COMMANDS:\n");
> -	printf(" --spec=PATH    Read register spec from directory or file\n");
> +	printf(" --spec=PATH    Read register spec from directory or file. Implies --decode\n");
>  	printf(" --mmio=FILE    Use an MMIO snapshot\n");
>  	printf(" --devid=DEVID  Specify PCI device ID for --mmio=FILE\n");
> -	printf(" --all          Decode registers for all known platforms\n");
> +	printf(" --decode       Decode registers\n");
> +	printf(" --all          Decode registers for all known platforms. Implies --decode\n");
>  	printf(" --binary       Binary dump registers\n");
>  	printf(" --verbose      Increase verbosity\n");
>  	printf(" --quiet        Reduce verbosity\n");
> @@ -1106,6 +1113,9 @@ static int read_reg_spec(struct config *config)
>  	struct stat st;
>  	int r;
>  
> +	if (!config->decode)
> +		return 0;
> +
>  	path = config->specfile;
>  	if (!path)
>  		path = getenv("INTEL_REG_SPEC");
> @@ -1154,6 +1164,7 @@ enum opt {
>  	OPT_DEVID,
>  	OPT_COUNT,
>  	OPT_POST,
> +	OPT_DECODE,
>  	OPT_ALL,
>  	OPT_BINARY,
>  	OPT_SPEC,
> @@ -1188,6 +1199,7 @@ int main(int argc, char *argv[])
>  		/* options specific to write */
>  		{ "post",	no_argument,		NULL,	OPT_POST },
>  		/* options specific to read, dump and decode */
> +		{ "decode",	no_argument,		NULL,	OPT_DECODE },
>  		{ "all",	no_argument,		NULL,	OPT_ALL },
>  		{ "binary",	no_argument,		NULL,	OPT_BINARY },
>  		{ 0 }
> @@ -1223,6 +1235,7 @@ int main(int argc, char *argv[])
>  			config.post = true;
>  			break;
>  		case OPT_SPEC:
> +			config.decode = true;
>  			config.specfile = strdup(optarg);
>  			if (!config.specfile) {
>  				fprintf(stderr, "strdup: %s\n",
> @@ -1232,6 +1245,10 @@ int main(int argc, char *argv[])
>  			break;
>  		case OPT_ALL:
>  			config.all_platforms = true;
> +			config.decode = true;
> +			break;
> +		case OPT_DECODE:
> +			config.decode = true;
>  			break;
>  		case OPT_BINARY:
>  			config.binary = true;
> -- 
> 2.44.0
> 
