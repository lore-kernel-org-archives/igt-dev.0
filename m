Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1B8CDD1B8
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 14:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426B210EC67;
	Fri, 27 Sep 2024 14:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fESPgZ1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAAC10EC67
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 14:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727447285; x=1758983285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cq7XsEu9ympHNzYTehdRVNxyDYPa87u5QD4DyTFMQDQ=;
 b=fESPgZ1DSw03bqmzMtYGqsRg66+hdomBaXoq7tMwu8Tp9E6OuqYmL8dm
 9hY5iWHDr+kDvYpREf7j/yPl+fBw1Jyd3DhYSDB0GkmuUSg640lfEIadH
 g6AyuZjZBv53OjxE+4qI+HiG+N9rvbCDOlvB+2wIzoQ/IY3KEpI6V38S3
 +cXNTGJg3ird4UaxyG3AjgINzHhqDoVIfMnv1qbA4uzBNwAULcJ3B6FF2
 InrJeUPxwdGfBGO11wm9OGic/YRmqXvEbVWY3G38nek5jbriLRcSBPdOE
 6d3qqD8vbSZ/euvqCF+/ZbatFswCfMSquQYuSaGsj44sCeD/prIENdUX6 Q==;
X-CSE-ConnectionGUID: DkpbEKi9SeWrsFfiId1CCA==
X-CSE-MsgGUID: KiPIjIdAQGW9sNja7aQgRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26101441"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="26101441"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:28:05 -0700
X-CSE-ConnectionGUID: jvAOIZU5QvaKQeIAWi5nXA==
X-CSE-MsgGUID: Pd6igXVwS/KXmG+KHXOe4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72710408"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Sep 2024 07:28:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Sep 2024 17:28:01 +0300
Date: Fri, 27 Sep 2024 17:28:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH i-g-t] drm-uapi/xe: Move eudebug uapi to experimental
 directory
Message-ID: <ZvbA8VXtKDa42rx3@intel.com>
References: <20240927141319.52745-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927141319.52745-1-christoph.manszewski@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Sep 27, 2024 at 04:13:18PM +0200, Christoph Manszewski wrote:
> Currently eudebug support is not available in drm-next. IGT support for
> eudebug is experimental and disabled by default yet relevant uapi
> was added to include/drm-uapi. This results in it getting deleted after
> performing the documented uapi update procedure.
> 
> Since eudebug support is still experimental, create a separate
> 'drm-uapi-experimental' directory and move eudebug uapi there.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

wfm

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  include/{drm-uapi => drm-uapi-experimental}/xe_drm_eudebug.h | 0
>  meson.build                                                  | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename include/{drm-uapi => drm-uapi-experimental}/xe_drm_eudebug.h (100%)
> 
> diff --git a/include/drm-uapi/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
> similarity index 100%
> rename from include/drm-uapi/xe_drm_eudebug.h
> rename to include/drm-uapi-experimental/xe_drm_eudebug.h
> diff --git a/meson.build b/meson.build
> index 0d06721b4..64f57f232 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -96,7 +96,7 @@ with_libdrm = get_option('libdrm_drivers')
>  build_info = ['Build type: ' + get_option('buildtype')]
>  build_info += 'Build Xe EU debugger test framework: @0@'.format(build_xe_eudebug)
>  
> -inc = include_directories('include', 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
> +inc = include_directories('include', 'include/drm-uapi', 'include/drm-uapi-experimental', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
>  
>  inc_for_gtkdoc = include_directories('lib')
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
