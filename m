Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214DAC3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 06:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D9F10E255;
	Mon, 19 May 2025 06:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dy2pG1Ss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7129010E21E
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747637855; x=1779173855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GoAAHi7aTbwIjLRm/tmQLv57GJC9Oq0WXlM80MZb3JU=;
 b=dy2pG1Ss30YCJduZOONiubBXV4FCZxT9+u+KicX9Zwj1nQn7o+HbJhqC
 egkdq5Ej1pb5etG8aZMA1cl6owchwerqDYdYutJIP0Jk3pTE/1IbzmAlw
 VxFTcsw0vdTxy/1/LSLPXo8V/yC7bV+sK39Eq7KM5W79zFFRDoOOqqRZZ
 z7Ue57dD/QrkZIywspFG+Rq/PaCYK6VejYEZ+NVwEAu7L4yhsQjkG/IhC
 FgCQfhp/f/qOBdRvLHiVYN3rv93Yu8cC01P3rAEuxSWoOgHftqR5jHoeZ
 hjwruoTLcSRFhK3ipB69VYZPC11jDd+Lao0Mee8thQu2JV6vw+Tv4ad9U A==;
X-CSE-ConnectionGUID: bbUi6VCITrutkmKBDTPL/A==
X-CSE-MsgGUID: +arXvBDCQYK2LAJDvhQXdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="74924842"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="74924842"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 23:57:11 -0700
X-CSE-ConnectionGUID: 1akYzidlTki1Zte4KTmB8g==
X-CSE-MsgGUID: 2ZjMqdDYSaadfhB3Mn1PuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144398904"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 23:57:08 -0700
Date: Mon, 19 May 2025 08:57:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com, 
 sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v6 07/14] lib/igt_dummyload: Avoid pthread_cancel
 use by overriding timer value
Message-ID: <p35unxhkmxokjwnfiph6ncqfipdvetrxy4uxszzsjrvmz6gxlu@cxpjxhshjc66>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
 <20250516160551.58760-8-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516160551.58760-8-jeevaka.badrappan@intel.com>
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

On Fri, May 16, 2025 at 04:05:44PM +0000, Jeevaka Prabu Badrappan wrote:
> Android build fails due to pthread_cancel unavailability.
> Replace pthread_cancel by overriding the expiration time of the timer.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
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

Looks good to me. I haven't tested this on Android, but should work
similar to Linux:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		pthread_cancel(spin->timer_thread);
> +#endif
>  		igt_assert(pthread_join(spin->timer_thread, NULL) == 0);
>  		close(spin->timerfd);
>  	}
> -- 
> 2.49.0
> 
