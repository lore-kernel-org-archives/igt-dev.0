Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE9BE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 09:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9510E037;
	Wed, 11 Dec 2024 09:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeYYZsM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAD610E037
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733908525; x=1765444525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+V/Qq9iM+iTBn86MxYowTMz1V230xPh77JPxNkawr6Q=;
 b=DeYYZsM6HVKvgldaIqUwl4nXm6lFNhMX3BPJG6Xtftlf5EXpuKx9ujFM
 TCudycRvlFlt4SM/qlnCCinMys8HS2+g/eNqDYDD9uJxYa3SuB3iFsllo
 iM3wr7prqaQ6w6r0loTEZy4LWHz24XrQQRE9rc514HaTM36EnhiIuY3+3
 itzagDZeDL1UyfzPxRP8Mfx2ehSgu63N76zQuz5Go6dWw+n0M8kMA/DaM
 5laLGIBzxFdvOmdxqrEKWuCUpcnJ0+zut7/D60WSkm3Oxc/CVLJgv1KpS
 bOj20P5VOxjkxqZGO5pUl7//k6Kng2e6brLH+xR4q1jqg2jpoIfIkPr/E g==;
X-CSE-ConnectionGUID: Q3SBqr8XQYWh3zsYnoX6cA==
X-CSE-MsgGUID: tqBjJndRSnuZHd/ZufUTlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33613911"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="33613911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 01:15:24 -0800
X-CSE-ConnectionGUID: w9wvYTVxTtOiLdJjZIRh6g==
X-CSE-MsgGUID: OqhnGXp9TOC4vctrtlAt6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="95590161"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 01:15:04 -0800
Date: Wed, 11 Dec 2024 10:14:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH 3/5] runner/settings: Add function to set IMGDIR
 environment variable
Message-ID: <20241211091447.js7h3rukaido7utt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
References: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
 <20241119075259.3048734-4-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241119075259.3048734-4-ramanaidu.naladala@intel.com>
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
On 2024-11-19 at 13:22:57 +0530, Naladala Ramanaidu wrote:
> Introduced set_imgdir() function in settings.c to set the IMGDIR

imho better name is IGT_DATA or IGT_IMAGES, also you do not
need to write about which file you changed, it is already in patch
itself.

Swati, do you have suggestions here for this env var?

> environment variable. The function uses absolute_path() to convert
> the relative path "../share/igt-gpu-tools" to an absolute path.
> Added the declaration of set_imgdir() in settings.h with a brief
> description.

Drop this "C to description", it is in patch.

> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  runner/runner.c   |  2 ++
>  runner/settings.c | 13 +++++++++++++
>  runner/settings.h |  8 ++++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/runner/runner.c b/runner/runner.c
> index 4855ad641..a52834197 100644
> --- a/runner/runner.c
> +++ b/runner/runner.c
> @@ -49,6 +49,8 @@ int main(int argc, char **argv)
>  		exitcode = 1;
>  	}
>  
> +	unsetenv("IMGDIR");

imho you should have a flag and do not unset this
if user sets this before runner starts, e.g. honor
user environment.

> +

Remove this empty line.

>  	printf("Done.\n");

Why this print is here?

While at this, could you add newline here?

>  	return exitcode;
>  }
> diff --git a/runner/settings.c b/runner/settings.c
> index dd4b08dd7..d42f3a68a 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -587,6 +587,15 @@ char *absolute_path(const char *path)
>  	return result;
>  }
>  
> +int set_imgdir(void)
> +{
> +	const char *path = "../share/igt-gpu-tools";
> +	char *abpath;
> +
> +	abpath = absolute_path(path);
> +	return setenv("IMGDIR", abpath, 1);

Repeated string here shows we need a global const char for it.

> +}
> +
>  static char *bin_path(char *fname)
>  {
>  	char *path, *p;
> @@ -863,6 +872,10 @@ bool parse_options(int argc, char **argv,
>  		settings->test_root = absolute_path(env_test_root);
>  	}
>  
> +	if (set_imgdir() != 0) {
> +		usage(stderr, "img dir not set");
> +	}
> +
>  	if (!settings->test_root) {
>  		usage(stderr, "Test root not set");
>  		goto error;
> diff --git a/runner/settings.h b/runner/settings.h
> index 6246d0c3d..a7abe19fd 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -150,4 +150,12 @@ bool serialize_settings(struct settings *settings);
>  bool read_settings_from_file(struct settings *settings, FILE* f);
>  bool read_settings_from_dir(struct settings *settings, int dirfd);
>  
> +/**
> + * set_imgdir:
> + *
> + * The function will set the environment variable.
> + *
> + */

Description is needed in C source, not in header.

Regards,
Kamil

> +int set_imgdir(void);
> +
>  #endif
> -- 
> 2.43.0
> 
