Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4FCCD5BB4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 13:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DF810E528;
	Thu, 21 May 2026 13:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntMRU1KG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8B610E528
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779371892; x=1810907892;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+yxXVfI3lEoMFOJcLKn43tJ5lpoH8QIuFgx+cZ8mMCw=;
 b=ntMRU1KGRsmv6cZB5Wwp4PdKNAb19HXrV2/XdKtFdFQ93zjurLKpXq1w
 YtmxOLRI9CkKmgTuVEYyM05d/6Y2M6nip34PixZci5YKVcCcz8Y+w1utx
 OiPXB4Ci6OpcmENR1vy81JUK8LGlOhJXJMuPgpgfN3hlVojrjfNgtm+pm
 91o4RtUEZdBZOt+PoSVM5K/wThvJqbTwTX1WTFJ2FhJGAR4ZEcK++e3Ii
 3/xw7RkXpOFx6mBlttF6X6XXwjuKHdQ50SZTeSSrgr0hMl8p+HM67nl9l
 +5aHydaL4rJor9tPH+fPhx5+keLLzWvVwxxjQx1B1ojxwSzaweFU/2/21 w==;
X-CSE-ConnectionGUID: Xv5O5qU2Qh22ovy8swhVwA==
X-CSE-MsgGUID: akCbHxn3SXSvg9GWRu7SOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84173026"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="84173026"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 06:58:11 -0700
X-CSE-ConnectionGUID: S+mXiLBATkiUC5ZFYL0REA==
X-CSE-MsgGUID: AR2bUY/TTsWKxI+Ix/2qtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236284286"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:58:09 -0700
Date: Thu, 21 May 2026 15:58:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/xe_exec_mix_modes: Simplify
 xe_supports_faults requirement check
Message-ID: <20260521135807.dsxyk46ji27h5lpg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260521103428.140839-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521103428.140839-1-francois.dugast@intel.com>
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

Hi Francois,
On 2026-05-21 at 12:34:28 +0200, Francois Dugast wrote:
> Simplify and align on uses in other tests, to make it clear that the
> intention is the same.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_mix_modes.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> index 9594e56e5..209825f58 100644
> --- a/tests/intel/xe_exec_mix_modes.c
> +++ b/tests/intel/xe_exec_mix_modes.c
> @@ -272,13 +272,8 @@ int igt_main()
>  	int fd;
>  
>  	igt_fixture() {
> -		bool supports_faults;
> -		int ret = 0;
> -
>  		fd = drm_open_driver(DRIVER_XE);
> -		ret = xe_supports_faults(fd);
> -		supports_faults = !ret;
> -		igt_require(supports_faults);
> +		igt_require(!xe_supports_faults(fd));
>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -- 
> 2.43.0
> 
