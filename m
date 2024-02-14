Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A39AC48BC1
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 13:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFB010E0C7;
	Wed, 14 Feb 2024 13:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/ECMuLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B710E0C7
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707917910; x=1739453910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=L4Z+uzw9Sj6+IWkbJT3/04ANv6kdLdNa5JORb7rg51U=;
 b=E/ECMuLWWUzLgt64iubayqr8MHARBtzLOs0crsehyh9LppevIic7T0WM
 TL08Tmfncyf2pmQDcHV3rICBnW7vS1BjHjlZwjfnjApbSkOdc6MCnkSTY
 8+j9x6gE++HuvjNHM2UKUejfTW8k+dcnt4uzlnxVXD+xE+N4Bq1cbvx8O
 rc4YXbWkWjkk+dvbNarXWVcrSiQO2zscIQaJ1Ckd2t4SCPJBg4MxGddKP
 47QCS1DN86Du/ycjca6o5nwnbpZcKT3KauKAQLp2s2qmpVlLvj7GZ5o10
 XYEpuIVx3TMAGPjZLEEDuOALUhbNvWGaaE0+LYlDb453xGdlMUjcGIor/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13350948"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="13350948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7823552"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 05:38:28 -0800
Date: Wed, 14 Feb 2024 14:38:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: igt-dev@lists.freedesktop.org, Stefano Ragni <st3r4g@protonmail.com>
Subject: Re: [igt-dev] [PATCH v3 4/7] lib/igt_halffloat.c: Fix musl/uclibc
 build
Message-ID: <20240214133825.gxcb7sbqgrztpj4e@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bernd Kuhls <bernd@kuhls.net>, igt-dev@lists.freedesktop.org,
 Stefano Ragni <st3r4g@protonmail.com>
References: <20231030195809.3527410-1-bernd@kuhls.net>
 <20231030195809.3527410-4-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030195809.3527410-4-bernd@kuhls.net>
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
On 2023-10-30 at 20:58:06 +0100, Bernd Kuhls wrote:
> From: Stefano Ragni <st3r4g@protonmail.com>
> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7
> 
> Fixes build error:
> ../lib/igt_halffloat.c:205:6: error: ‘ifunc’ is not supported on this target
>   205 | void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
> 
> ../lib/igt_halffloat.c:216:6: error: ‘ifunc’ is not supported on this target
>   216 | void igt_half_to_float(const uint16_t *h, float *f, unsigned int num)
> 
> Bug report with request to split the original patch into some
> functional changes:
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> 
> Signed-off-by: Stefano Ragni <st3r4g@protonmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v3: no changes
> 
>  lib/igt_halffloat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c
> index 08ab05fce..5dbe08e01 100644
> --- a/lib/igt_halffloat.c
> +++ b/lib/igt_halffloat.c
> @@ -162,7 +162,7 @@ static inline float _half_to_float(uint16_t val)
>  	return fi.f;
>  }
>  
> -#if defined(__x86_64__) && !defined(__clang__)
> +#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
>  #pragma GCC push_options
>  #pragma GCC target("f16c")
>  
> -- 
> 2.39.2
> 
