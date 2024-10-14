Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93526D16268
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 14:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7AD10E2A4;
	Mon, 14 Oct 2024 14:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUAzctrb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF24C10E45B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728915971; x=1760451971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dgDLpAo2I1UwZvMlPl2l6zbsSQdewqcVaujL+w+C1CI=;
 b=lUAzctrb5d290uUegQlz3qHdDjOjLlb6q+1O5ZYpqXg/SX9q3GNTVvV8
 DvcUUSKC+hJR4Z7R5OPe7jTuysfZ/iOhIOFmF6B6M7vuZEaFQjaQcLQ50
 QGx6ufae5QbDCfYP3rYiRUqRxjYJCFYG+jXgTdbqU09CWMgSjjz/9BiZH
 PN2hpkymqtOVUW/kYs5ULPqsEwo/0Ah3NNMixOglhV9UO8nPFZhtTpRiM
 WMypaD4O2Uw0tOVoZqU5DVJabMoVOB2fnHC45ai3FcFZeVyQb4+8kIlVn
 l7M1VVpFkiUXDqR4gtZjb5nwYE4UCSahWY2lMW37Hq5b6mH0qsxdKV+1k A==;
X-CSE-ConnectionGUID: PSYCIFu/S9O2Ovhd2g2xyg==
X-CSE-MsgGUID: L88Udn57SAuTIjLJca4dzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27722086"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="27722086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:26:10 -0700
X-CSE-ConnectionGUID: rO4grpZ2TLS+rGgRuzWzsQ==
X-CSE-MsgGUID: DdOMKbiQR4GoHCX2RLWjOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="108383939"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:26:09 -0700
Date: Mon, 14 Oct 2024 16:26:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t 2/6] lib: update fopen() to accomodate imgdir
Message-ID: <20241014142606.47l676e4jbrzyak5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>
References: <20240923071023.1170127-1-swati2.sharma@intel.com>
 <20240923071023.1170127-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923071023.1170127-3-swati2.sharma@intel.com>
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

Hi Swati,
On 2024-09-23 at 12:40:19 +0530, Swati Sharma wrote:
> From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
> 

Please correct e-mail above, it should be same as s-o-b below.

> Update fopen() to accomodate imgage directory path. Tests like kms_3d
s/imgage/image/

> use this function while creating fb from png image.
> 
> Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_core.c | 10 ++++++++--
>  lib/igt_core.h |  4 ++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 407f7b551..1a7798d92 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3306,7 +3306,7 @@ void igt_reset_timeout(void)
>  }
>  
>  FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename)
> +		       const char* igt_imgdir, const char* filename)
>  {
>  	char path[PATH_MAX];
>  	FILE *fp;
> @@ -3317,8 +3317,14 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
>  		snprintf(path, sizeof(path), "%s/%s", igt_srcdir, filename);
>  		fp = fopen(path, "r");
>  	}
> +
> +	if (!fp) {
> +		snprintf(path, sizeof(path), "%s/%s", igt_imgdir, filename);
> +		fp = fopen(path, "r");
> +        }
> +
>  	if (!fp) {
> -		snprintf(path, sizeof(path), "./%s", filename);
> +		snprintf(path, sizeof(path), "./data/%s", filename);
>  		fp = fopen(path, "r");
>  	}

Can we have a fallback here for "./%s" ?

Regards,
Kamil

>  
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 90f57402f..5b058a8d0 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1457,7 +1457,7 @@ static inline uint32_t igt_seconds_elapsed(struct timespec *start)
>  void igt_reset_timeout(void);
>  
>  FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename);
> +		       const char* igt_imgdir, const char* filename);
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
> 2.25.1
> 
