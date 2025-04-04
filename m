Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72D2C36014
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 14:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C82E10EBE0;
	Fri,  4 Apr 2025 14:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnMUOXwb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFF910EBE0
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743778796; x=1775314796;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FnUVQsakcIfA1y4nV6GaovbdiBZGYfBFoBCB8pyx/jk=;
 b=XnMUOXwbMZSjJuaqeprQWYkhnyajmmo4s0EnFwf104gEGe+iXmatj3aP
 7pye9NJVCfwKBlsh4Wvis7/1KulqGUApXYBxz4740EBP7G1aTiMyfkwKa
 1/tkfb48FhzOGKfs1E99RR27QtIoctLBDTvYirJ/EO6KgPBYPR30oIOF+
 rJAa1b5TzfEW3w6fNww5ghJM97p1f8lYm+qfVm1tFti8Ok6FymUJhE0zv
 6pnxBUuAA4BwLkqnWUxm7nhlz8om88vu8L/ggpHhEHfrgH613TTNbQTcZ
 rtoG1Ed+l/5CeWOzblYSilaC714CovwOTnjn8i29iXNfRB3y4O2Lq41Iz w==;
X-CSE-ConnectionGUID: EAfAoUvZQw2kZtudj1Tp1A==
X-CSE-MsgGUID: Bzk6sCJISV+CJMReYYgmBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45107685"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="45107685"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 07:59:53 -0700
X-CSE-ConnectionGUID: GLupLCdzRXy9bO+niuTUxQ==
X-CSE-MsgGUID: P2LoByVMSkObZWaQYEVr9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="132304450"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:59:51 -0700
Date: Fri, 4 Apr 2025 16:59:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
Subject: Re: [PATCH i-g-t v4 4/5] lib/igt_core: Enhance __igt_fopen_data to
 support additional directories
Message-ID: <20250404145949.i6w2jd5xjhetkusu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 swati2.sharma@intel.com
References: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
 <20250325210146.3338454-5-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325210146.3338454-5-ramanaidu.naladala@intel.com>
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
On 2025-03-26 at 02:31:45 +0530, Naladala Ramanaidu wrote:
> Add an additional parameter for the image directory. Refactor the
> function to use an array of directories to iterate through, reducing
> redundancy.
> 
> v2: Fix review comments.   (Santhosh, Kamil)
> v3: Update env variable name. (Kamil)
> v4: Fix review comments. (Kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_core.c | 36 ++++++++++++++++++++++++------------
>  lib/igt_core.h |  6 +++---
>  2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index dca26a8d3..520a3675f 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3309,21 +3309,33 @@ void igt_reset_timeout(void)
>  	igt_set_timeout(0, NULL);
>  }
>  
> -FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename)
> +/**
> + * __igt_fopen_data:
> + * @igt_srcdir:  Directory path for source files.
> + * @igt_datadir: Directory path for data files
> + * @igt_imgdir: Directory path for image files.
> + * @filename: Name of the file to be opened.
> + *
> + * This function attempts to open a data file from a list of specified
> + * directories. A file pointer to the opened file. If the file cannot
> + * be opened, it returns NULL and logs a critical error message.
> + *
> + */
> +FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
> +		       const char *igt_imgdir, const char *filename)
>  {
>  	char path[PATH_MAX];
>  	FILE *fp;
> -
> -	snprintf(path, sizeof(path), "%s/%s", igt_datadir, filename);
> -	fp = fopen(path, "r");
> -	if (!fp) {
> -		snprintf(path, sizeof(path), "%s/%s", igt_srcdir, filename);
> -		fp = fopen(path, "r");
> -	}
> -	if (!fp) {
> -		snprintf(path, sizeof(path), "./%s", filename);
> -		fp = fopen(path, "r");
> +	const char *dirs[] = {igt_datadir, igt_srcdir, igt_imgdir,
> +			      getenv("IGT_DATA_PATH"), "./data"};
> +
> +	for (int i = 0; i < ARRAY_SIZE(dirs); i++) {
> +		if (dirs[i]) {
> +			snprintf(path, sizeof(path), "%s/%s", dirs[i], filename);
> +			fp = fopen(path, "r");
> +			if (fp)
> +				break;
> +		}
>  	}
>  
>  	if (!fp)
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 0f2af950b..fbf6a90fa 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1456,8 +1456,8 @@ static inline uint32_t igt_seconds_elapsed(struct timespec *start)
>  
>  void igt_reset_timeout(void);
>  
> -FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename);
> +FILE *__igt_fopen_data(const char *igt_srcdir, const char *igt_datadir,
> +		       const char *igt_imgdir, const char *filename);
>  /**
>   * igt_fopen_data:
>   * @filename: filename to open.
> @@ -1466,7 +1466,7 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
>   * then from build directory, and finally from current directory.
>   */
>  #define igt_fopen_data(filename) \
> -	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, filename)
> +	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
>  
>  int igt_system(const char *command);
>  int igt_system_quiet(const char *command);
> -- 
> 2.43.0
> 
