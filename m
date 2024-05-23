Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BEAC25B79
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 10:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A426B897D4;
	Thu, 23 May 2024 10:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMqNk3iu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E431897D4
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716459639; x=1747995639;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iGY1YShhxRIpQPw793pWW34N0enfthAqK+/B8s2hPi0=;
 b=BMqNk3iuMFEc0mLFTPFjTm37wuYFbc/98C2r9vhUzV2I1VIbPpZTyaf8
 GZNmZYNaHB1+nFSLSP2L1v4Z/y6b7J2n9v7fi/Lz5j0yffJx0tTBIpgKr
 OZ0UJF974KOyKxc7k1fYvq/ziXxDmCbA0KJIEw3M+vvrXwNciD90rp28B
 rHBKBRwzH9R60q4ttGiEJ1VI1vylbfXcyz+WYfsHGeLL3nVqTRtBtSgWK
 BWe9R7lehULakJnB1LyUydJ2zYR8wRwpGYb3cIHAX+rUKeVRCp1mxzUPh
 2mCU5VUM8/POFJ3YZ00VwtFeh1F9KeDoJ4YLIs2r58Zq1vh01vNyvDVYd A==;
X-CSE-ConnectionGUID: 5qtFRMEWRlGLccq2tND0+A==
X-CSE-MsgGUID: 6Gg9tL/DTfSrT8yKUiGeVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23899536"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="23899536"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 03:20:39 -0700
X-CSE-ConnectionGUID: 6Y5XwECzQWWg8Qlsi3ZuqA==
X-CSE-MsgGUID: TojsY35JQ5O7AgHSCWq9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="38013382"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 03:20:38 -0700
Date: Thu, 23 May 2024 12:20:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector()
 return value in wait_for_connected_state()
Message-ID: <20240523102019.6vqmsj4owuxm52oh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
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
> The drmModeGetConnector() function can return NULL in some cases, so
> we need to check the return value before accessing it.  This is not
> being checked in wait_for_connected_state(), so fix that.
> 
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
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

Why break? btw please document what is that function
tring to do, it looks strange.

Is it:
wait for one connector to enter connected state
or
wait for all connectors to be connected?

See below.

> +
>  			connected = connector->connection == DRM_MODE_CONNECTED;
>  
>  			drmModeFreeConnector(connector);
> -- 
> 2.39.2
> 

Some comments on this function code:

igt_until_timeout(CHAMELIUM_HOTPLUG_DETECTION_DELAY) {
    bool connected;

    for (int i = 0; i < connector_count; i++) {
        drmModeConnector *connector = drmModeGetConnector(drm_fd, connectors[i]);

		if (!connector)
				continue;

        connected = connector->connection == DRM_MODE_CONNECTED;
        drmModeFreeConnector(connector);

        if (!connected)
------------^
            break;
------------^
Why break here? imho this should be:

        if (connected)
            return true;

        }

    if (connected)
------------^
        return true;

This if(..)... could be then deleted.

    usleep(50000);
}

Regards,
Kamil


