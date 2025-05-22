Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB31CC54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C320F10E29B;
	Thu, 22 May 2025 11:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDb3MgZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23AF10E29B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747914798; x=1779450798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nMJJgMCxXLFJajCHFWzkPA93qdhVUJmh1kO2TG7W84I=;
 b=aDb3MgZ/ljLF8NQUMKaZhb23K7gPm/FrQtrdXbamBBg6d6rIMVtUfbLS
 yBMd3eWhwnrku+zSmVCqOhk9OI6YGAJuV0DlvzA9HcWDvlyV09LF5t8SH
 LyXonkiPpNxcf9hHmM2vWoYHmSsn0HJTPiS3+qbd8Z7sUeWPTZaJ4niyB
 FabXydUc2aNIulQ16Mg9gpHjUSn88y6Xp7YoZxQubkdZKtITUNuSltyjj
 9i4gb8b2zvGttjoQk0JCRM7EbhGgQEQx9dhLq5J4PfIAG/kvHnJWtH2VZ
 nrn5N/l34xhVDmR3tfAhCGS2gRKC2zF4TE9Vvi4sUi+5fl8DTIkxIkf1L g==;
X-CSE-ConnectionGUID: NICn8oSUTASJ3pKhpYBWjQ==
X-CSE-MsgGUID: KGFTN/IyS8+pD8Yrg16lTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49643374"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49643374"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:53:18 -0700
X-CSE-ConnectionGUID: tnXpznXNSdKV8b1DjYqJ+Q==
X-CSE-MsgGUID: Zl17E4CtT6+wHLfFKRAnJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="171558307"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:53:17 -0700
Date: Thu, 22 May 2025 13:53:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v9 07/14] lib/igt_dummyload: Avoid pthread_cancel
 use by overriding timer value
Message-ID: <20250522115314.owttyyyp7f3ewdj4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
 <20250519151135.43874-8-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519151135.43874-8-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-05-19 at 15:11:28 +0000, Jeevaka Prabu Badrappan wrote:
> Android build fails due to pthread_cancel unavailability.
> Replace pthread_cancel by overriding the expiration time of the timer.

s/Replace pthread_cancel/Replace it/
It could be done at merge.

> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

I merged this and next patch. Thank you!

Regards,
Kamil

> ---
>  lib/igt_dummyload.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 3cf80b762..cc0b4ac3b 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -631,7 +631,16 @@ void igt_spin_end(igt_spin_t *spin)
>  static void __igt_spin_free(int fd, igt_spin_t *spin)
>  {
>  	if (spin->timerfd >= 0) {
> +#ifdef ANDROID
> +		struct itimerspec its;
> +
> +		memset(&its, 0, sizeof(its));
> +		its.it_value.tv_sec = 0;
> +		its.it_value.tv_nsec = 1;
> +		timerfd_settime(spin->timerfd, 0, &its, NULL);
> +#else
>  		pthread_cancel(spin->timer_thread);
> +#endif
>  		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
>  		close(spin->timerfd);
>  	}
> -- 
> 2.49.0
> 
