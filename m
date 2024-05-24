Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF9BC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 16:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4453010EF18;
	Fri, 24 May 2024 16:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+m45vcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284E610F003
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716569921; x=1748105921;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=poW1GfBvShBIZAFfii5NFx0XaclqDjcsjXxQXn4jwuQ=;
 b=R+m45vcflYeXnWLaHUfkUhtteQHkSznX4i64dcaHSR0W8IfW8sQK84vp
 rsCHE3toNO7CUXJIS4bV2uNb5z28PAojG5zu342tIq4Lb4p1cShlOGA3d
 Zwlpi8ETVTEJkhBlI0j/nRDeN1KusrgH5Fc7UsC4PNuJct9gAwLEkRiFu
 3/DxLjxTX8LebInMiTVWGan+tDFBzgBiVUl0gxJmRWjcIlOvrGmri0466
 n8QQ0l3zFjwouWaEyGn3oV0HaqId7yacu46+dlioYn46Oxzvl7ZdUaVJt
 lkaCmP//PlvQS5jX4EBWD9e1PBeCER13+gT+CoC/wV9ThHFBfkCWgRQCB A==;
X-CSE-ConnectionGUID: JedAQJeyTY6Fthi9tEkVBQ==
X-CSE-MsgGUID: fiW7UfvtTICItWKtk7PuYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13132042"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="13132042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 09:58:40 -0700
X-CSE-ConnectionGUID: 83GmIWQLQjatVnHy/nNupw==
X-CSE-MsgGUID: Zrw1Rmu8QQiwkMn0Fkuy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38495570"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 09:58:38 -0700
Date: Fri, 24 May 2024 18:58:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector()
 return value in wait_for_connected_state()
Message-ID: <20240524165835.txbj66ww34vrjm2q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <20240523084426.284894-2-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240523084426.284894-2-luciano.coelho@intel.com>
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

Hi Luca,
On 2024-05-23 at 11:44:25 +0300, Luca Coelho wrote:

I have two nits, one about too long subject:

[PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector() return value in wait_for_connected_state()

imho better:

[PATCH i-g-t 1/2] lib/igt_chamelium: avoid NULL dereference in wait_for_connected_state()

or even shorter:

[PATCH i-g-t 1/2] lib/igt_chamelium: fix wait_for_connected_state()

Maybe that should be changed to something else? See my other
response.

> The drmModeGetConnector() function can return NULL in some cases, so
> we need to check the return value before accessing it.  This is not
> being checked in wait_for_connected_state(), so fix that.
> 

Also please add to Cc chromium devs, for example:

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Manasi Navare <navaremanasi@chromium.org>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Regards,
Kamil

> ---
>  lib/igt_chamelium.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 016d5356630c..b1478654d02a 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -524,6 +524,9 @@ static bool wait_for_connected_state(int drm_fd,
>  			drmModeConnector *connector =
>  				drmModeGetConnector(drm_fd, connectors[i]);
>  
> +			if (!connector)
> +				break;
> +
>  			connected = connector->connection == DRM_MODE_CONNECTED;
>  
>  			drmModeFreeConnector(connector);
> -- 
> 2.39.2
> 
