Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E248C021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BD210EAFB;
	Fri, 21 Feb 2025 16:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgNnMWUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B5A10EAB7
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740155758; x=1771691758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jWMnAvRG9lyuOVibZuP/NMSbCQltoNqE398+cjEg2R0=;
 b=hgNnMWULyZp88aF0xOcbLOeH3y3ywonSUJoOqkOv+MpGtVi+BdClQ9HV
 WP723OkTNEV2RSZpRGZC7W7wfXw9EosN41T5O1m3MdL0S2A5NYl4zUdkS
 GXQMcIb6lkqiHTXzMNB1FD6kKe9xBWz+KFJ2yui+fnW1OOV3MXUgZ0eJr
 s2AsZvdaBjV+huHOumhSaeHxHuG2xuwseAuFT5HwNEyyTvnvZdEgD6kz/
 cvLmpVJslgtQHewZYNpXGQruuMcF9egu9i2C9CY0u3SRYCDwNnoR9yknI
 yuXHwy9x3t3hg/7t+soYxxttAZ5Wifx7f1kL7XXHREr/6hkxp2SuQ1VlQ Q==;
X-CSE-ConnectionGUID: GhSz7S63Q4C7uYQ6DQze6w==
X-CSE-MsgGUID: 0JTJufDbR5eIeYaJ0xkFMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51970064"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51970064"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:35:58 -0800
X-CSE-ConnectionGUID: ItM+QaGkQUC2r2QtdCigNw==
X-CSE-MsgGUID: zOQ0S/zbQoW+bTM7i9JLAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120649983"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 08:35:56 -0800
Date: Fri, 21 Feb 2025 17:35:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
Subject: Re: [PATCH i-g-t v3 4/5] lib/igt_core: Enhance __igt_fopen_data to
 support additional directories
Message-ID: <20250221163554.ofcxk27okvei6vat@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com
References: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
 <20250218215349.1063788-5-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250218215349.1063788-5-ramanaidu.naladala@intel.com>
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
On 2025-02-19 at 03:23:48 +0530, Naladala Ramanaidu wrote:
> Add an additional parameter for the image directory. Refactor the
> function to use an array of directories to iterate through, reducing
> redundancy.
> 
> v2: Fix review comments.   (Santhosh, Kamil)
> v3: Update env variable name. (Kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_core.c | 31 +++++++++++++++----------------
>  lib/igt_core.h |  6 +++---
>  2 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 407f7b551..20162ff55 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3305,27 +3305,26 @@ void igt_reset_timeout(void)
>  	igt_set_timeout(0, NULL);
>  }
>  

You touch lib function so while you are at this please
add description.

> -FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename)
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
> +	size_t i;

Remove this var.

> +	const char *dirs[] = {igt_datadir, igt_srcdir, igt_imgdir,
> +			      getenv("IGT_DATA_PATH"), "./data"};
> +
> +	for (i = 0; i < ARRAY_SIZE(dirs); i++) {

Use: for (int i = 0; ...) {

> +		if (dirs[i]) {
> +			snprintf(path, sizeof(path), "%s/%s", dirs[i], filename);
> +			fp = fopen(path, "r");
> +			if (fp)
> +				return fp;

Use 'break;' instead, so no changes below around igt_critical

Rest looks good,

Regards,
Kamil

> +		}
>  	}
>  
> -	if (!fp)
> -		igt_critical("Could not open data file \"%s\": %m\n", filename);
> -
> -	return fp;
> +	igt_critical("Could not open data file \"%s\": %m\n", filename);
> +	return NULL;
>  }
>  
>  static void log_output(int *fd, enum igt_log_level level)
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index f0ba1a381..05134a104 100644
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
