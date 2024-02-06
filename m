Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119AAC4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 17:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96A5112D0B;
	Tue,  6 Feb 2024 17:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9iMtipn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B44112D08
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 17:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707240579; x=1738776579;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TlhzlxVIg+EwZLdyKt9FJtNQtszlgPXTS74598MiOjM=;
 b=h9iMtipnuTWVcEATQ8uffLWic807MJEI1V5qlTZJZfCRuNB3ckU+nriR
 2264WLWXEo2PXHe310bKD6z/YMsGBIpZ4g95R29KM+xIgUiDBSDiVYyJb
 NK1tt5lUbKYiEyAjd0eXRNQRpK+UFqtTlMfpfZ/q59dGGLAAPxqLCy+gm
 LZFrHJLPQcBSsSJqZInK5Vnwh6DwwxgneyQD9xGCkAfaGi//DQQ6pFVDW
 HZ4/eibDeTJQBk/Y8xj+oi1PDooI2a0IfiNIW5htLLs1gUJezxYSJek/X
 Ql8g7AsgPSuACzUVzyBqtHmaORLN7SrZOa7TgDI7pFcs65GmIJ7FzG/YB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1071826"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1071826"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 09:29:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="933532660"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="933532660"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 09:29:36 -0800
Date: Tue, 6 Feb 2024 18:29:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Mohammed Anas <triallax@tutanota.com>
Subject: Re: [igt-dev] [PATCH v3 5/7] benchmarks/gem_exec_tracer.c: Fix musl
 build
Message-ID: <20240206172932.prneoxbgnjchqtmb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Bernd Kuhls <bernd@kuhls.net>,
 Mohammed Anas <triallax@tutanota.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <20231030195809.3527410-5-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030195809.3527410-5-bernd@kuhls.net>
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

Hi Bernd,
On 2023-10-30 at 20:58:07 +0100, Bernd Kuhls wrote:
> From: Mohammed Anas <triallax@tutanota.com>
> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/111918317d06598fe1459dbe139923404f3f4b9d
> 
> Fixes build error:
> ../benchmarks/gem_exec_tracer.c:274:1: error: conflicting types for ‘ioctl’; have ‘int(int,  long unsigned int, ...)’
>   274 | ioctl(int fd, unsigned long request, ...)
> 
> Bug report with request to split the original patch into some
> functional changes:
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> 
> Signed-off-by: Mohammed Anas <triallax@tutanota.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

If you didn't find any better solution we can go with this,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v3: no changes
> 
>  benchmarks/gem_exec_tracer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c
> index 7e86473e4..3156dfc23 100644
> --- a/benchmarks/gem_exec_tracer.c
> +++ b/benchmarks/gem_exec_tracer.c
> @@ -271,7 +271,11 @@ static int is_i915(int fd)
>  }
>  
>  int
> +#ifdef __GLIBC__
>  ioctl(int fd, unsigned long request, ...)
> +#else
> +ioctl(int fd, int request, ...)
> +#endif
>  {
>  	struct trace *t, **p;
>  	va_list args;
> -- 
> 2.39.2
> 
