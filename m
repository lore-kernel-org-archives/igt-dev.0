Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30426C02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 09:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E298110E91D;
	Thu, 16 Jan 2025 09:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQ1eKMj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808110E91D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 09:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737021065; x=1768557065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ii3CXyaE2z6ePqGbJtWfsOn2W7NHk5tUnLSsHxXJKes=;
 b=JQ1eKMj0dCHU11Nqbw1aFK6X0/6JJ9gGrrDzCpexbyJxHTFo9/BbgcfI
 skX6fJ47Es2OVryMmY0bUC48EFFbZl4nY56TdzunUMDLH27uLgzgrNWDb
 4jCCmWvffuAPtl8cxjnZbZQjbvD7hKQqE5YBP0zYVGQOeW46618Hr+wy0
 qZAbYb/s5c5LSyhbd+d9jEJad8CK72qHYOwXN98AauIuce+vux8lvnlNk
 OBrhwwm/wXYTHFOYqAFTrYJY2wAdWoU4XezSSADSB5N5uKIq3b7y0+uUa
 Dw2f9m2TNh/ZAiKrq/GmOgNzhvAhn+ABhQLDtvv3fPGJ50FZX9U/J3uky Q==;
X-CSE-ConnectionGUID: tYzw76EnRx6wQUH9o8Oj+Q==
X-CSE-MsgGUID: TNYPtwpISwKgHbmDQPs5Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48056689"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="48056689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:51:05 -0800
X-CSE-ConnectionGUID: nCVKrC1ETdmc3RdeYSawgg==
X-CSE-MsgGUID: Mcqe+rlZQmGxKVwaJK4OmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109468971"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 01:51:04 -0800
Date: Thu, 16 Jan 2025 10:51:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
Subject: Re: [PATCH i-g-t v2 3/5] runner/settings: Add function to set
 IGT_RUNNER_DATA environment variable
Message-ID: <20250116095101.vnp2j6k44qxxoosh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
References: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
 <20250107200614.963199-4-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107200614.963199-4-ramanaidu.naladala@intel.com>
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
On 2025-01-08 at 01:36:12 +0530, Naladala Ramanaidu wrote:
> Introduced set_runner_datadir() to set the IGT_RUNNER_DATA environment

enviroment could be also read by test itself so imho better
name for it would be IGT_DATA_PATH

Regards,
Kamil

> variable. This function uses absolute_path() to convert the relative
> path "../share/igt-gpu-tools" to an absolute path. Update the
> runner/runner code to call set_runner_datadir() and handle errors
> appropriately.
> 
> v2: Fix review comments. (Kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  runner/runner.c   | 8 ++++++++
>  runner/settings.c | 9 +++++++++
>  runner/settings.h | 1 +
>  3 files changed, 18 insertions(+)
> 
> diff --git a/runner/runner.c b/runner/runner.c
> index 4855ad641..950eb5662 100644
> --- a/runner/runner.c
> +++ b/runner/runner.c
> @@ -12,8 +12,13 @@ int main(int argc, char **argv)
>  	struct job_list job_list;
>  	struct execute_state state;
>  	int exitcode = 0;
> +	int data_flag = 0;
>  
>  	init_settings(&settings);
> +	data_flag = set_runner_datadir();
> +	if (data_flag)
> +		fprintf(stderr, "Data dir path not set\n");
> +
>  	init_job_list(&job_list);
>  
>  	if (!parse_options(argc, argv, &settings)) {
> @@ -49,6 +54,9 @@ int main(int argc, char **argv)
>  		exitcode = 1;
>  	}
>  
> +	if (!data_flag)
> +		unsetenv("IGT_RUNNER_DATA");
> +
>  	printf("Done.\n");
>  	return exitcode;
>  }
> diff --git a/runner/settings.c b/runner/settings.c
> index bea0c3059..c8220be32 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -589,6 +589,15 @@ char *absolute_path(const char *path)
>  	return result;
>  }
>  
> +int set_runner_datadir(void)
> +{
> +	const char *datapath = "../share/igt-gpu-tools";
> +	char *abpath;
> +
> +	abpath = absolute_path(datapath);
> +	return setenv("IGT_RUNNER_DATA", abpath, 1);
> +}
> +
>  static char *bin_path(char *fname)
>  {
>  	char *path, *p;
> diff --git a/runner/settings.h b/runner/settings.h
> index 7e6cd11e2..5926817b6 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -150,5 +150,6 @@ bool serialize_settings(struct settings *settings);
>  
>  bool read_settings_from_file(struct settings *settings, FILE* f);
>  bool read_settings_from_dir(struct settings *settings, int dirfd);
> +int set_runner_datadir(void);
>  
>  #endif
> -- 
> 2.43.0
> 
