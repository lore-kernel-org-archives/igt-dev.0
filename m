Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5686FC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 15:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9010EBF4;
	Fri,  4 Apr 2025 15:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPg3/Wer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3254B10EBF4
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743780116; x=1775316116;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0g0B36dGPdOYxfFVC28RIN2jmDS7Kfrbd9zALSqZuAE=;
 b=lPg3/Wer56M0I9+yxIkKxE+/UdRB8vFDRj2hGkfPwdAkd4dNJRBRQJwu
 am5/+OaqGnYpvxaIDR3DS2oz2OU76jYYk4FHDPkmAei1SeQQ484iPKkKM
 MhecuRn1zZhy4vfZVqofgq0a7GzwJew6xPRKFaRdFmUMum7vyC8R116s2
 AU1rLjl3+6ryKYXVAuLx5V58oO4FNlI1/uFiikUzY9x75cTJqANlgmoLr
 Gogap5Sfs/EdYOS5J3DGcRNcTNdDGNgsOhG6WDonfmLQJHHpKilfswDKl
 MXck3Y0xEhdEzvfaBMXEqjUw0W/4m3p7WsXYTxyHvJYsilNM/zaLhUIL8 w==;
X-CSE-ConnectionGUID: +PTm2i8vRR+pi+wCrXBV2A==
X-CSE-MsgGUID: vtOwZmdLRBi5hJhUcdafpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45239731"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="45239731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 08:21:56 -0700
X-CSE-ConnectionGUID: 68Y8hJTPTFSjlHHLqlcEmQ==
X-CSE-MsgGUID: OFSyWrd9RheG3mhmj/7nxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="127320219"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 08:21:54 -0700
Date: Fri, 4 Apr 2025 17:21:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v4 3/5] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
Message-ID: <20250404152138.nxtjl54vgvewe6dg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
References: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
 <20250325210146.3338454-4-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325210146.3338454-4-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2025-03-26 at 02:31:44 +0530, Naladala Ramanaidu wrote:
> Add environment variable to obtain absolute path for PNG files
> at runtime.
> 
> v2: Fix review comments. (Kamil)
> v3: Fix review comments. (kamil)
> V4: Fix review comments. (kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  runner/settings.c | 22 ++++++++++++++++++++++
>  runner/settings.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 1ccf345d9..94c95f26e 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -612,6 +612,21 @@ char *absolute_path(const char *path)
>  	return result;
>  }
>  
> +int set_tests_datadir(void)
> +{
> +	const char *datapath = "../share/igt-gpu-tools";

Hmm, maybe try also a build folder for local runs?

../build/data
../../build/data

> +	char *abpath;
> +
> +	abpath = absolute_path(datapath);

Make sure abpath is not NULL before using it.

> +
> +	if (getenv("IGT_DATA_PATH") == NULL)

Please make it simpler:
	if (getenv("IGT_DATA_PATH"))
		return 0;

And here add checks and settings.

> +		return setenv("IGT_DATA_PATH", abpath, 1);

Btw no need for "1" - you already checked it is unset.

> +
> +	return 0;
> +}
> +
> +
> +
>  static char *bin_path(char *fname)
>  {
>  	char *path, *p;
> @@ -654,6 +669,10 @@ void init_settings(struct settings *settings)
>  {
>  	memset(settings, 0, sizeof(*settings));
>  	IGT_INIT_LIST_HEAD(&settings->env_vars);
> +
> +	if (set_tests_datadir())
> +		fprintf(stderr, "Data dir path not set\n");

Could you also add printing of data path here?

	else
		printf("IGT data/ path: %s/\n", setting->data_path);

> +
>  	igt_vec_init(&settings->hook_strs, sizeof(char *));
>  }
>  
> @@ -671,6 +690,9 @@ void clear_settings(struct settings *settings)
>  	free_hook_strs(&settings->hook_strs);
>  	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
>  
> +	if (getenv("IGT_DATA_PATH") != NULL)
> +		unsetenv("IGT_DATA_PATH");
> +

Please remember that is was set by runner so only unset this
if runner was setting this env var.

Overall looks good,

Regards,
Kamil

>  	init_settings(settings);
>  }
>  
> diff --git a/runner/settings.h b/runner/settings.h
> index 30743fc40..cbcf624b0 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -156,5 +156,6 @@ bool serialize_settings(struct settings *settings);
>  
>  bool read_settings_from_file(struct settings *settings, FILE* f);
>  bool read_settings_from_dir(struct settings *settings, int dirfd);
> +int set_tests_datadir(void);
>  
>  #endif
> -- 
> 2.43.0
> 
