Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424B3C982D9
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 09:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA2B10F28A;
	Fri, 18 Sep 2026 09:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdv1IwYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA1310F268
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789722019; x=1821258019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LpEX+rnY8MntojFXDjG9+nvm0HkJ9Z2vaxbUCaf21Cw=;
 b=jdv1IwYFTAanCbqESEsFp/Rh43aGLiajIQUvpe094e0r6wJghEQWu4nb
 DIOd1ZenzHW0UzurVdzEugs/R5c9wc8D7Li22gMppC4pW0/yl0WWrIqCT
 XwEgxoB01NZTDItrPUPSEYtqhD3TEbUyV50sRQIodnzkZa8UCgYCZgQNq
 xaQm3Uriq/LzjXw8eZwDvRacY4PteO9B/R6T9td4yzXsYeRbej8VNcIeC
 ENSc99JazfLGzV28ZO6qXhJ59hhHH/aeyYrWaaJQEC3ARTQyuGJpl+6d5
 oLxthMZyG6pfkGuxb4Ptdeg2yHrgjLBvkqwMi4z4bjFwsdsu8D7r7Hk9V A==;
X-CSE-ConnectionGUID: ImySrvAiRSaaNZgeEXUSWw==
X-CSE-MsgGUID: 52YK6MmSTpiN6e1kjy32Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100875464"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100875464"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 02:00:19 -0700
X-CSE-ConnectionGUID: +v+3PBUXQbGCVD8OwhSe9Q==
X-CSE-MsgGUID: auYDDRK1Qsuj5wEMi8fsLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270979023"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 02:00:18 -0700
Date: Fri, 18 Sep 2026 11:00:16 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v4 1/1] lib/igt_core: Create new way for finding
 PNG data files
Message-ID: <ldchtvh34oxbx62heyedz63jbsvbsplubaoaczjc2wv2wn5y73@lzf3ozkfkw7k>
References: <20260917170532.107916-1-kamil.konieczny@linux.intel.com>
 <20260917170532.107916-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917170532.107916-2-kamil.konieczny@linux.intel.com>
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

On Thu, Sep 17, 2026 at 07:05:32PM +0200, Kamil Konieczny wrote:
> Reference to build path break reproducibility, as a build could
> be done on different directories. Data paths are used only when
> loading a data file containing screen image. Remove build path
> from the function which use it.
> 
>   Create a new way for finding PNG data files, so a developer
> can run a test from a build dir and a test could find and load
> it.
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/190
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_core.c  | 63 ++++++++++++++++++++++++++++++++++++-------------
>  lib/igt_core.h  |  3 +--
>  lib/meson.build |  1 -
>  3 files changed, 47 insertions(+), 20 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 4efddb908..9937cb559 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -366,6 +366,8 @@ enum {
>  
>  static int igt_exitcode = IGT_EXIT_SUCCESS;
>  static const char *command_str;
> +static const char *command_full_path;
> +static char command_base_path[PATH_MAX];
>  
>  static char* igt_log_domain_filter;
>  static struct {
> @@ -1125,6 +1127,17 @@ static int common_init(int *argc, char **argv,
>  	IGT_INIT_LIST_HEAD(&subgroup_descriptions);
>  	igt_vec_init(&hook_strs, sizeof(char *));
>  
> +	command_full_path = argv[0];
> +	snprintf(command_base_path, ARRAY_SIZE(command_base_path), "%s", argv[0]);
> +	if (strrchr(command_base_path, '/')) {
> +		char *end = strrchr(command_base_path, '/');
> +
> +		*end = 0;
> +	}

Twice strrchr looks odd. Add *s in variables declarations and

▸       if ((s = strrchr(command_base_path, '/')))
▸       ▸       *s = 0;

looks cleaner.

> +
> +	if (!strlen(command_base_path))
> +		strcpy(command_base_path, ".");
> +
>  	command_str = argv[0];
>  	if (strrchr(command_str, '/'))
>  		command_str = strrchr(command_str, '/') + 1;
> @@ -3389,31 +3402,47 @@ void igt_reset_timeout(void)
>  }
>  
>  /**
> - * __igt_fopen_data:
> - * @igt_srcdir:  Directory path for source files.
> - * @igt_datadir: Directory path for data files
> - * @igt_imgdir: Directory path for image files.
> + * __igt_fopen_data_file:
> + * @dir:  Directory path for source files.
> + * @rel:  Relative path.
>   * @filename: Name of the file to be opened.
>   *
> - * This function attempts to open a data file from a list of specified
> - * directories. A file pointer to the opened file. If the file cannot
> - * be opened, it returns NULL and logs a critical error message.
> - *
> + * This function attempts to open a data file from a specified directory dir/dir2/.
> + * Returns a file pointer to the opened file or NULL.
>   */
> -FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
> -		       const char *igt_imgdir, const char *filename)
> +static FILE *__igt_fopen_data_file(const char *dir, const char *rel, const char *filename)
>  {
>  	char path[PATH_MAX];
>  	FILE *fp;

This variable is not necessary,

> -	const char *dirs[] = {igt_datadir, igt_srcdir, igt_imgdir,
> -			      getenv("IGT_DATA_PATH"), "./data"};
>  
> -	for (int i = 0; i < ARRAY_SIZE(dirs); i++) {
> +	snprintf(path, ARRAY_SIZE(path), "%s/%s/%s", dir, rel, filename);
> +	fp = fopen(path, "r");

just return fopen(...);

> +
> +	return fp;
> +}
> +
> +/**
> + * igt_fopen_data:
> + * @filename: Name of the file to be opened.
> + *
> + * This function attempts to open a data file from a list of known directories.
> + *
> + * Returns a file pointer to the opened file. If the file cannot be opened, it
> + * returns NULL and logs a critical error message.
> + */
> +FILE *igt_fopen_data(const char *filename)
> +{
> +	static const char *igt_datadir = IGT_DATADIR;
> +	static const char *igt_srcdir = IGT_SRCDIR;
> +	static const char *reldirs[] = {".", "..", "./data", "../data", "../../data" };
> +	const char *dirs[] = {igt_datadir, igt_srcdir, command_base_path,
> +			      getenv("IGT_DATA_PATH"), "."};

IMO env['IGT_DATA_PATH'] should be first on the list to allow
overwriting the data path.

--
Zbigniew

> +	FILE *fp = NULL;
> +
> +	for (int i = 0; i < ARRAY_SIZE(dirs) && !fp; i++) {
>  		if (dirs[i]) {
> -			snprintf(path, sizeof(path), "%s/%s", dirs[i], filename);
> -			fp = fopen(path, "r");
> -			if (fp)
> -				break;
> +			for (int j = 0; j < ARRAY_SIZE(reldirs) && !fp; j++)
> +				fp = __igt_fopen_data_file(dirs[i], reldirs[j], filename);
>  		}
>  	}
>  
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index afaf35aa8..c0908a8ed 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1532,8 +1532,7 @@ FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
>   * Open a datafile for test, first try from installation directory,
>   * then from build directory, and finally from current directory.
>   */
> -#define igt_fopen_data(filename) \
> -	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
> +FILE *igt_fopen_data(const char *filename);
>  
>  int igt_system(const char *command);
>  int igt_system_quiet(const char *command);
> diff --git a/lib/meson.build b/lib/meson.build
> index d1a770b6d..2ac632758 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -371,7 +371,6 @@ foreach f: lib_sources
>  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
> -            '-DIGT_IMGDIR="@0@"'.format(imgdir),
>  	])
>  
>      lib_intermediates += lib
> -- 
> 2.55.0
> 
