Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C87CD5BAF
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 16:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB92D10E537;
	Thu, 21 May 2026 16:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEOXv+lJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A284910F3BB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779382672; x=1810918672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5TYpckGhuedh6CifktFG4Yi13Fl41ePNfGMcEUFLFYo=;
 b=SEOXv+lJIJ9H79UlBUk+j1jthTqCj/nIBKJ4M9EKAlleNYqN9bAOdoGM
 vz0jhh8PI64bLVnybxrX6lj/BrlA+xaoz6sym7NtyBYPIdmVkv5uyZLcz
 47y0p5K33PBwupWS3InIHcOqmNJiNo0kkLn5ahROs5USfXyU6WlYE8Xwl
 9RIRVQxEVvtpEI6CR3W89Hy7u52gySx7FQ5AsIL75WTWgVbICsjlt945K
 BmD6iYd7Opu+0LpdNvYfsxPciF92OB4jEWToIuBZyVXaT20vOsRKfKWRg
 ercdfhS0oq2tRL174m4Hza/rvAsUmBDGxsORB3MWuCrkVclk5SJsP1EnT g==;
X-CSE-ConnectionGUID: X6BFVJXuRp+VvDVQTQxetg==
X-CSE-MsgGUID: YJtdau/xTqqcRDXgv/PqhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91416884"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="91416884"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 09:57:52 -0700
X-CSE-ConnectionGUID: iqlPV3GwQ6ugYCiDeS+dhg==
X-CSE-MsgGUID: ZrgreCyvRZSYgxndGwKwrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="236334835"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 09:57:51 -0700
Date: Thu, 21 May 2026 18:57:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] include/android: Add g_key_file_get_double stub
Message-ID: <20260521165749.k7ypvjmjmdv6uuwq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org
References: <20260521164353.1111422-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521164353.1111422-1-markyacoub@google.com>
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

Hi Mark,
On 2026-05-21 at 12:43:53 -0400, Mark Yacoub wrote:
> Add a stub for g_key_file_get_double to include/android/glib.h to
> fix build failures in the Android environment where glib is not
> available.
> 

Please add Fixes: tag here, with this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Signed-off-by: Mark Yacoub <markyacoub@google.com>
> ---
>  include/android/glib.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> index 660386ca4..0b6658287 100644
> --- a/include/android/glib.h
> +++ b/include/android/glib.h
> @@ -51,6 +51,8 @@ static inline int g_key_file_get_integer(GKeyFile *key_file,
>  	const char *group_name, const char *key, GError **error) { return 0; }
>  static inline char *g_key_file_get_string(GKeyFile *key_file,
>  	const char *group_name, const char *key, GError **error) { return NULL; }
> +static inline double g_key_file_get_double(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) { return 0.0; }
>  static inline bool g_key_file_load_from_file(GKeyFile *key_file,
>  	const char *file, int flags, GError **error) { return false; }
>  
> -- 
> 2.54.0.746.g67dd491aae-goog
> 
