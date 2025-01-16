Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5F2C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 12:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614B310E582;
	Thu, 16 Jan 2025 12:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbmdMyrr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC4810E582
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737031015; x=1768567015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JiJsquTiVr9GktiWcHWS9YITAtyWO4mUGJjnuyoBWTo=;
 b=KbmdMyrr4iT5eg8arcvhrV0uIzxUq4OIOn4tBgYF9rQfYROgWKTrDH76
 D/rSSYXAfhh2IShekS8xLA5S2Y8bs6TKIoYHED0ydFTfjfL3H1CCc1luO
 8Fy3YIvIMGS+SUd+neT4Xvwho0EyGkvhHdIsovEu26t2Twb8VfuYMFuCu
 zx4DbCA6Lgtzkz7CnC0qnmLUf3aZF7XVV5mPFJH1euk6Z9Fi8pFr5+Jpx
 Lg/PPSzStQepVKoT9DGOeMtOjbr74T2Q5UOjeQuMQNHnh8v+gL1/ZEypE
 gtsVPlzY6QxeB5VJtLpyvKCF3O119751L52h8dd/5XfjNNsnZ3iqUOC8m g==;
X-CSE-ConnectionGUID: iYPvITC2RyiiA60Gjiktug==
X-CSE-MsgGUID: ffDO7UpKQ9Wmu4DqtN282g==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="59892662"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="59892662"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 04:36:55 -0800
X-CSE-ConnectionGUID: oVw0Elo6TLuqgfT8r5k4VA==
X-CSE-MsgGUID: VH91t8JmTF6uSXDx6xcv7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="105534881"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:36:54 -0800
Date: Thu, 16 Jan 2025 13:36:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
Subject: Re: [PATCH i-g-t v2 3/5] runner/settings: Add function to set
 IGT_RUNNER_DATA environment variable
Message-ID: <20250116123651.3fuws24u5xxs6oij@kamilkon-desk.igk.intel.com>
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
> variable. This function uses absolute_path() to convert the relative
> path "../share/igt-gpu-tools" to an absolute path. 

> Update the
> runner/runner code to call set_runner_datadir() and handle errors
> appropriately.

Please do not translate code into words, is it there in a patch itself.
imho here the most important part is description why we need it and
what problem you try to resolve.

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

Why an error? You could check if './data' path is present
but this imho should be done in init_settings(), not here.

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

The only user of this function is in runner.c
so why do you need it here?

> +{
> +	const char *datapath = "../share/igt-gpu-tools";
> +	char *abpath;
> +
> +	abpath = absolute_path(datapath);
> +	return setenv("IGT_RUNNER_DATA", abpath, 1);

Why are you setting this var here? It could be set by a user
so why are you overwriting it in that case?

imho you do not need this function but maybe I am missing something?

Regards,
Kamil

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
