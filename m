Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99472C3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 07:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7C110E048;
	Mon,  8 Jul 2024 07:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjE3LXqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6389110E048
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 07:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720422036; x=1751958036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6IpBwJM/YURcpKz1VYL3oeii0qwehJ6MdyPaEBTiMXE=;
 b=KjE3LXqwBakxZchYaqnDY1uiVx9K1z8mHIy59xWzDgWRQvNaPSonOz8x
 nx2p58xd+7w5kqBeGjIy/TzlFgoDNylgQZ+V72YC5Lc80gpbnMeHH2oes
 HEJtlvxIkXAaML0y/615sdEN1Xl1n1cgJYmuZodPz0wroAAVgx6m9lz5S
 FXxHzgp0+r2w5i0YWz7JuU2HlEhvWcFm+NwKpEVxYhuYceTL6JERvMsfq
 w/yV7shluX63ZYwvS0wyjO0Jso1vM2stqhe8XAFc7R61m50DRHlRXqxDd
 BoYjizvCyv5EPbFRq3jLHO2MTc2bl+zhIcZUb0xnsxxin1j92j9TMH71C A==;
X-CSE-ConnectionGUID: BN2mUyuBSA6ZSaMrDWQbOA==
X-CSE-MsgGUID: uCdCEwx8QKqqhTe4CRampw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17320008"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17320008"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 00:00:35 -0700
X-CSE-ConnectionGUID: U9PfpqzZS1uXnGzVKLZi+g==
X-CSE-MsgGUID: zNJr9Vv4TyOMjCyiajsdOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47372686"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.237])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 00:00:29 -0700
Date: Mon, 8 Jul 2024 09:00:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 michal.wajdeczko@intel.com
Subject: Re: [PATCH i-g-t] lib/igt_device_scan: Skip attributes in
 subdirectories
Message-ID: <20240708070026.h5jtg3gnk3rewpt7@zkempczy-mobl2>
References: <20240705141044.115059-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705141044.115059-1-marcin.bernatowicz@linux.intel.com>
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

On Fri, Jul 05, 2024 at 04:10:44PM +0200, Marcin Bernatowicz wrote:
> Skip reading attributes in subdirectories as they are not used for
> filtering. This change improves speed and reduces the impact of
> non-DRM related component bugs on testing, such as the ASPM exposed
> link/l1_aspm attribute issue. After removing a Virtual Function (VF),
> accessing the link/l1_aspm attribute on the Physical Function (PF)
> leads to NPD.
> 
> v2: removed unrelated changes, improved description (Michal)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  lib/igt_device_scan.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 9a2da3d62..8e2297087 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -448,6 +448,10 @@ static bool is_on_blacklist(const char *what)
>  	if (what == NULL)
>  		return false;
>  
> +	/* Skip attributes in subdirectories */
> +	if (strchr(what, '/') != NULL)
> +		return true;
> +
>  	while ((key = keys[i++])) {
>  		if (strcmp(key, what) == 0)
>  			return true;
> -- 
> 2.31.1
> 

Already r-b'd in first version, so copy it here:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
