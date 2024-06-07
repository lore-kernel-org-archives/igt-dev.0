Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249B3C27C6E
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 14:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96B610E010;
	Fri,  7 Jun 2024 14:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOBCdMB6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52E310E010
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717771280; x=1749307280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hK2TveER/Bsp9GNQzA9l+9YwI79s0YGHf9NlQs2YPpY=;
 b=MOBCdMB6GQNXPk7vcCws4XXFB1nFWr1uwuuissSiIQFue61V9dNR3xUs
 MkPzIHjKEhQvE91XNw/NtTHK91k2dEkkU2uQNls936IjZbbd/3eugvvZZ
 Ir3pl8nYlxmwS+N8yj1eRpRVFcQcz/0BrkXXjyyzIRo/oTcapzTGLiNhi
 zYj5IadPP8EKGXtlpi9d2PZWLnCBfF86PX2AI9iyaVJQauJcRJH+6XcBP
 jC8rfPlOmOufcY4Ldb2yYtTBOFqSDmiJsO/wpgAISQomoMumTPkMMMDON
 lZJmvdXbyuuDxikXSpvb9cyJ/BjGr687PkyUKS9r5oyHAmyHx1p35BPM1 Q==;
X-CSE-ConnectionGUID: R/odJGu/Q6uLPkllDG2Wxw==
X-CSE-MsgGUID: UBcoVG+FTGiGW6C1FicsGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="32040683"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="32040683"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:41:19 -0700
X-CSE-ConnectionGUID: 8ianXXDjTTSjSkmh3kQm2Q==
X-CSE-MsgGUID: suJrwTlYT9CjhlP9Uy3nmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38337343"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:41:18 -0700
Date: Fri, 7 Jun 2024 16:41:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_chamelium: check
 drmModeGetConnector() before using
Message-ID: <20240607144115.mkje57af76sg2fy2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
References: <20240530085908.564733-1-luciano.coelho@intel.com>
 <20240530085908.564733-2-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240530085908.564733-2-luciano.coelho@intel.com>
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
On 2024-05-30 at 11:59:07 +0300, Luca Coelho wrote:
> The drmModeGetConnector() function can return NULL in some cases, so
> we need to check the return value before accessing it.  This is not
> being checked in wait_for_connected_state(), so fix that.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Manasi Navare <navaremanasi@chromium.org>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_chamelium.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 016d5356630c..620fbbf7d94f 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -524,6 +524,11 @@ static bool wait_for_connected_state(int drm_fd,
>  			drmModeConnector *connector =
>  				drmModeGetConnector(drm_fd, connectors[i]);
>  
> +			if (!connector) {
> +				connected = false;
> +				break;
> +			}
> +
>  			connected = connector->connection == DRM_MODE_CONNECTED;
>  
>  			drmModeFreeConnector(connector);
> -- 
> 2.39.2
> 
