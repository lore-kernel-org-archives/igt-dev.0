Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6701C77B7F
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 15:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C53510EA45;
	Fri, 27 Jun 2025 15:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFeVdLva";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6172710EA45
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751036983; x=1782572983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nHEN+sgCHQUHHlWBSFfpU+qJOJdNEms61/GQhfzvg2w=;
 b=nFeVdLvazP8a8sKQ/j3IUwabx38NEJmYxFE9hsIEF3tGAx3l/CQ/xujR
 tjn81YtqABBT9zIRqZPHNT7iGh/oKXvkdig5t0WEbIglVER1Jt9/f7qcc
 Y+w0CyhBxIGWA+/FIvS6JtiXxgNqmn9eaFWbQDZIrNi57lRwXZ6nQNS1D
 Q/Kkulaykk+2I5nUvzmk2k+NVJHenTSMeZYDvZPMgZTGbSwbyLXKPkm5v
 Q3EwMZPN6Swu6H2CQXqLJs9yhK0KFgImElJP0lXQdcHEtKV/ZRfeusMmc
 4pnmp3o7xd9NqFlbwTwjkUMTQURY8XnHFuwVTXkjPiNyNwAkyhiqjUPlQ Q==;
X-CSE-ConnectionGUID: 5lLmG/C8TzmI3h0LSFdAvw==
X-CSE-MsgGUID: qmUju/UfQ/K6ClgaJ2lW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57134659"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57134659"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 08:09:42 -0700
X-CSE-ConnectionGUID: H5U+v6D9QE2Vvyi3j8viJQ==
X-CSE-MsgGUID: ljOE2ueOR7mfL7/jKXWedQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="176506411"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 08:09:40 -0700
Date: Fri, 27 Jun 2025 17:09:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
Subject: Re: [i-g-t,v6,4/5] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
Message-ID: <aF60MnVBpNISz-pG@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
References: <20250616210840.3335978-5-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616210840.3335978-5-ramanaidu.naladala@intel.com>
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

On 2025-06-17 at 02:38:39 +0530, Naladala Ramanaidu wrote:
> Add environment variable to obtain absolute path for PNG files
> at runtime.
> 
> v2: Fix review comments. (Kamil)
> v3: Fix review comments. (kamil)
> v4: Fix review comments. (kamil)
> v5: Make code simpler.	 (Kamil)
> v6: Update env only if not exists.    (Kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Looks good, I am still not convinced we need it here, maybe
it will be better to have it at load data file function?

We can improve that later if there will be any need to do it,
so I will not block it. See one nit below.

> ---
>  runner/settings.c | 36 ++++++++++++++++++++++++++++++++++++
>  runner/settings.h |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index b151218cc..28b031a29 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -90,6 +90,8 @@ static const char settings_filename[] = "metadata.txt";
>  static const char env_filename[] = "environment.txt";
>  static const char hooks_filename[] = "hooks.txt";
>  
> +static bool igt_data_path_set_by_runner;
> +
>  static bool set_log_level(struct settings* settings, const char *level)
>  {
>  	typeof(*log_levels) *it;
> @@ -612,6 +614,31 @@ char *absolute_path(const char *path)
>  	return result;
>  }
>  
> +int set_tests_datadir(void)

Why not static? It is not used anywhere outside this settings.c
so it could just be:

static int set_tests_datadir(void)

> +{
> +	const char *datapath = "../share/igt-gpu-tools";
> +	char *abpath;
> +
> +	if (getenv("IGT_DATA_PATH"))
> +		return 0;
> +
> +	abpath = absolute_path(datapath);
> +	if (!abpath) {
> +		fprintf(stderr, "Error: Failed to get absolute path for '%s'\n",
> +			datapath);
> +		return -EINVAL;
> +	}
> +
> +	if (setenv("IGT_DATA_PATH", abpath, 0) == 0) {
> +		igt_data_path_set_by_runner = true;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +
> +
>  static char *bin_path(char *fname)
>  {
>  	char *path, *p;
> @@ -654,6 +681,10 @@ void init_settings(struct settings *settings)
>  {
>  	memset(settings, 0, sizeof(*settings));
>  	IGT_INIT_LIST_HEAD(&settings->env_vars);
> +
> +	if (set_tests_datadir())
> +		fprintf(stderr, "Data dir path not set\n");
> +
>  	igt_vec_init(&settings->hook_strs, sizeof(char *));
>  }
>  
> @@ -671,6 +702,11 @@ void clear_settings(struct settings *settings)
>  	free_hook_strs(&settings->hook_strs);
>  	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
>  
> +	if (igt_data_path_set_by_runner) {
> +		unsetenv("IGT_DATA_PATH");
> +		igt_data_path_set_by_runner = false;
> +	}
> +
>  	init_settings(settings);
>  }
>  
> diff --git a/runner/settings.h b/runner/settings.h
> index 6c58c3282..e8e87d3a5 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -160,5 +160,6 @@ bool serialize_settings(struct settings *settings);
>  
>  bool read_settings_from_file(struct settings *settings, FILE* f);
>  bool read_settings_from_dir(struct settings *settings, int dirfd);
> +int set_tests_datadir(void);

This is only used at setting.c so no need for exporting this,
it could be fixed at merge time, with this fixed:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  
>  #endif
