Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D5BCD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DC110F337;
	Thu, 21 May 2026 14:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLbgaqNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C09010F335
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779372093; x=1810908093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FOBbLbn0GP8XKpLksX8blenb3z04miJbS2JdwYpQaTo=;
 b=KLbgaqNgN6jEf2fcNymZVFNrHjQVILX3wTANpFJuHLLNL+12p63bt75x
 hKALnPLiaeK24dIFYGGaZxIs7tkaUPe/ffn4cWcKwR7B1ZfxgnSaHx6aP
 qRGSiF4f6Zl3ee8KOMecUZrttZBl9o6jq5nDrDxqiKQLaqJ1aC5/bgaW1
 EdD+/z+PwQz/6JY3bblvdaZwZmSHizX0aIZmWZhd7eS88f/qqxg5bF0T0
 ayTffKU3LG+Q5L9dyFqvT3MFxPoYu2XtDC8df8s6bsSsmz0VS6BN/nDkq
 URAd2/9+jqg3JJQNxqiyjtAhWQVXoaW+A2Zq59w+nXNIcoi4S1V9iVmJk w==;
X-CSE-ConnectionGUID: oLqEYdibSci7rxYrSzZOew==
X-CSE-MsgGUID: mQzs/eJ5TiSkhof752gDJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91760928"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="91760928"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:01:33 -0700
X-CSE-ConnectionGUID: tsyjhwCaQNqAnyejZ11UJA==
X-CSE-MsgGUID: AOM2e3ZKTxSxuTUItJ4MXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="240555303"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.106])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:01:31 -0700
Date: Thu, 21 May 2026 16:01:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/xe_exec_mix_modes: Simplify
 xe_supports_faults requirement check
Message-ID: <5fx4qypqqwvno6byw5beafchdw2u573bzlia7oucb6bj75gsfn@b32e4b2mqzcd>
References: <20260521103428.140839-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, May 21, 2026 at 12:34:28PM +0200, Francois Dugast wrote:
> Simplify and align on uses in other tests, to make it clear that the
> intention is the same.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
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

LGTM

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	}
>  
>  	for (const struct section *s = sections; s->name; s++) {
> -- 
> 2.43.0
> 
