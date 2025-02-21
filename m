Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3029C021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6814510EAFF;
	Fri, 21 Feb 2025 16:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nHuTevkv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CFA10EAFF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740157029; x=1771693029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HxXMsOPl1Vm3v/nNXjmgrAlQORAWVMcAz5qg/rNhmaY=;
 b=nHuTevkv1VdMWKfnB0cIbtpjdCb9ImpQnio93v4cBFAyIiAwKFZLVABL
 BLr5iGkfRtkno15izqORSzOhXCLfB2msTl2sbCbVcWWM69NNOVRNKXtv/
 cszeoeQYd/RxqHy/OlIqJwJc+JcKU1KOtFIp1zxSOXcps3lbl5ZeAU9mO
 izMOQ8QXIXtOK9TR2mxI9MnFCBM/jUO3fw7ToX3mO+jDDs3AWtfmL5Uw3
 PHa+JwCdzicpO0IssNdJMFtMHNXoFV2p20zX4M97a86BxRytrGY6tnNIA
 gFc9CBAvcLQ3MlakbI64HUe6OeqnS3/CB9ciqNyv7uzsZFWeWjyELgwM2 w==;
X-CSE-ConnectionGUID: h052RHGCRFug+GzHf7HLBA==
X-CSE-MsgGUID: X/cCSR9GSJ6FPckritXxjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40833422"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="40833422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:57:09 -0800
X-CSE-ConnectionGUID: EYpJSfeJT4iR9CSs/ZsZ4A==
X-CSE-MsgGUID: CWswRwEyTRacYdMg1HSL7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115249834"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:57:08 -0800
Date: Fri, 21 Feb 2025 17:57:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
Subject: Re: [PATCH i-g-t v3 3/5] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
Message-ID: <20250221165704.thbf7xdka5rp2zht@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
References: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
 <20250218215349.1063788-4-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218215349.1063788-4-ramanaidu.naladala@intel.com>
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
On 2025-02-19 at 03:23:47 +0530, Naladala Ramanaidu wrote:
> Add environment variable to obtain absolute path for PNG files
> at runtime.
> 
> v2: Fix review comments. (Kamil)
> v3: Fix review comments. (kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  runner/settings.c | 13 +++++++++++++
>  runner/settings.h |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index c1f3be77a..77fabafb0 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -601,6 +601,15 @@ char *absolute_path(const char *path)
>  	return result;
>  }
>  
> +int set_runner_datadir(void)

imho better: set_tests_datadir()

> +{
> +	const char *datapath = "../share/igt-gpu-tools";

On my test container I have binaries in

Installing tests/kms_3d to /usr/local/libexec/igt-gpu-tools

while data (testlists, PNG and blocklists) in

/usr/local/share/igt-gpu-tools/

so this would be 
	const char *datapath = "../../share/igt-gpu-tools";

Maybe just check for these two? Also consider developer
running from tests/ folder with data in ../data or ../../data

> +	char *abpath;
> +

Check if IGT_DATA_PATH is already set with getenv()
so no action is needed in such case.

> +	abpath = absolute_path(datapath);

if abpath is NULL do nothing or check alternative.

> +	return setenv("IGT_DATA_PATH", abpath, 1);
> +}
> +
>  static char *bin_path(char *fname)
>  {
>  	char *path, *p;
> @@ -643,6 +652,8 @@ void init_settings(struct settings *settings)
>  {
>  	memset(settings, 0, sizeof(*settings));
>  	IGT_INIT_LIST_HEAD(&settings->env_vars);
> +	if (set_runner_datadir())

setenv() returns -1 on error

> +		fprintf(stderr, "Data dir path not set\n");
>  	igt_vec_init(&settings->hook_strs, sizeof(char *));
>  }
>  
> @@ -660,6 +671,8 @@ void clear_settings(struct settings *settings)
>  	free_hook_strs(&settings->hook_strs);
>  	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
>  
> +	unsetenv("IGT_DATA_PATH");

Use this only when you succesfully used setenv(), I suggest
using settings structure for this.

Regards,
Kamil

> +
>  	init_settings(settings);
>  }
>  
> diff --git a/runner/settings.h b/runner/settings.h
> index 42c96665a..7b8292509 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -154,5 +154,6 @@ bool serialize_settings(struct settings *settings);
>  
>  bool read_settings_from_file(struct settings *settings, FILE* f);
>  bool read_settings_from_dir(struct settings *settings, int dirfd);
> +int set_runner_datadir(void);
>  
>  #endif
> -- 
> 2.43.0
> 
