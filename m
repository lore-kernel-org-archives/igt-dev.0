Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6F6EFB810
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 07:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4BA10E4D0;
	Tue, 24 Feb 2026 07:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhuJd3La";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD6010E4D1
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771919077; x=1803455077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8C9IDfuuOs73JeoH4kEHxqzI1PAKRewTT9oGN15xdhU=;
 b=lhuJd3LaFziV5/Exn3crr8osD/qO+AZBCiyf+QUxabPlMBrLftU0TD6i
 eUgBkDQ0cZnS2tIsVa6yCzmEwhnlBrBMh4CC3LB41j6UxVmsSqshkQPdv
 fEL5C/rFIj3Sjs1FT1md+PB2CvsElZFXRGenM+yYjtBFRTCumCzlnAeok
 MSR2an/5AVkExxu0swcKV05mor77UBAyJ6qd7Gnl/Epk/dWJ6ywSsZWLA
 7jRGznxwR7OMUbh1Z6/AARF/bV6cizNGUPpX/6REiGEvTMeFCE14Rq5ok
 AOZmQSw8m0PK7whGNMsx6CcR1iK/Qg7qEx2YAFoO8DL4VhZsuTD2WIAVW w==;
X-CSE-ConnectionGUID: jx1qwTqfTZG5g2/EoQG86w==
X-CSE-MsgGUID: 9u9kvNjLSiytxxIFIwK/Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75535417"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="75535417"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:44:37 -0800
X-CSE-ConnectionGUID: c7FMks18TZC+qFE9CEaAeg==
X-CSE-MsgGUID: 70jsJRhWRpqwMRd4xho1+w==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 23:44:36 -0800
Date: Tue, 24 Feb 2026 08:44:33 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/igt_device_scan: Fix attributes fetching
Message-ID: <cd3xk4leq4chev55uhlm2lvcqtjkeduz4abusromjj6gor75vu@tzjh632x6l2c>
References: <20260223185906.16168-1-lukasz.laguna@intel.com>
 <20260223185906.16168-2-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223185906.16168-2-lukasz.laguna@intel.com>
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

On Mon, Feb 23, 2026 at 07:59:06PM +0100, Lukasz Laguna wrote:
> Don't skip NULL attribute values too early, as some symlinks are not
> resolved by udev and are handled later in igt_device_add_attr().
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  lib/igt_device_scan.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index fc01fc375b..7c7995224b 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -593,8 +593,6 @@ static void get_attrs_limited(struct udev_device *dev, struct igt_device *idev)
>  
>  	for (int i = 0; i < ARRAY_SIZE(attrs); i++) {
>  		value = udev_device_get_sysattr_value(dev, attrs[i]);
> -		if (!value)
> -			continue;

LGTM. You're right, we should accept NULL value similar as get_attrs_all().

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		igt_device_add_attr(idev, attrs[i], value);
>  		DBG("attr: %s, val: %s\n", attrs[i], value);
>  	}
> -- 
> 2.40.0
> 
