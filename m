Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16017C25B79
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 14:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0AE10F452;
	Mon, 27 May 2024 14:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7UlsdGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C487A10EEA4
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716819499; x=1748355499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JH5rc03647L7pgOFWh8mk4vKIJzbRLeihMDh4bCB26o=;
 b=E7UlsdGcecq1ZGbZ7jquSElypHu3rnx4ZFRf9LJz5k5PLPISjV/RQIRz
 nOSPT/p0VLXU6HPD7jNINItO/kxS/z6YkmYVbEoU59pjpDiUKfVbFhxGz
 AVcvmL0Q+6o7Iw2q0gM5fvdxKSBBXLmpZVZ+Bbnj6ZiZkrQIpFRaNzwDM
 uDfgYuWJJjbs1u4cl55ACut8qiSuDgF+M46hGoCDydsUXb/FedFNpbeiL
 5/2hK6bs1Z5cSOVwzKYa/Br8wTjkM4ncI0JJB0CiAEwdTJktLphu862wx
 IbSEKEShuouK/js43zd0e92+/9VDxh7/EneUf1d3P9UZLDqYKlKfn7/YH Q==;
X-CSE-ConnectionGUID: cqIjzaxCRE6wiYTpk9FS8w==
X-CSE-MsgGUID: zJmIqDMBSBy8LX/ShdqWkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="35660139"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="35660139"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 07:18:18 -0700
X-CSE-ConnectionGUID: nBP486D5RVCBuFecXquwuA==
X-CSE-MsgGUID: aayibG5hT+KNxDl5KnMd2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="39770799"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:18:17 -0700
Date: Mon, 27 May 2024 16:18:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_chamelium: check drmModeGetConnector()
 return value in wait_for_connected_state()
Message-ID: <20240527141814.vgcpvwerqp4yapp3@kamilkon-DESK.igk.intel.com>
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
> +

You could have first connector connected, second not connected,
so this should be:
			if (!connector) {
                connected = false;
			    break;
            }

Regards,
Kamil

>  			connected = connector->connection == DRM_MODE_CONNECTED;
>  
>  			drmModeFreeConnector(connector);
> -- 
> 2.39.2
> 
