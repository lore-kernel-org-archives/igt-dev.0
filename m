Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E7DC531DC
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 16:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A012910E434;
	Tue, 20 Aug 2024 16:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7fkY+Kt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FFA10E434
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724170093; x=1755706093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lk/TTx8iGetqN44a4Jz3mtG/79pjZBRlFHPCW2Jdke4=;
 b=l7fkY+KtTjHxc6PQNcvWS8WtAsbX1pR4asy/ui4IHl1HgWT9kan+Qrq3
 6R1VM7CQvy37Soyyb1C3FY51/jL1LTnu+YAwW46rBwFCqqmGHLNHQXu0X
 8d4l+++xkCwuRKTxXbNSsqiSd7VKt6UcuMGq9kjADVCZmH6D2FJxAUVI1
 ImmI5sEo9A4MWwK+VT9shyqrsafvpWWjATJmbCSdCBuuk222fplFBATrJ
 6PT8bq6CdUa8N8+49Mym8flFAL8vucGlTHTaN5vFEBay1im42xObaOWr9
 xKFvTLuEu3oLWf3HoFyCO4wgnTbynXV0SIIj9JfaokYPbBFIfUO8x+NmE A==;
X-CSE-ConnectionGUID: rCD27pIaRhGnIqkyXGpWPw==
X-CSE-MsgGUID: KwsdcWwlRJ2mD395N2lNTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26283276"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26283276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:08:13 -0700
X-CSE-ConnectionGUID: h1gbrgy5TV2abGZV9zMedg==
X-CSE-MsgGUID: 0S26WsIURH23PfJXAuwJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="83979744"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 09:08:12 -0700
Date: Tue, 20 Aug 2024 18:07:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH] tests/device_reset: Require a PCI device
Message-ID: <20240820160755.grgq65vzwgeq5tg4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240820144303.140707-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820144303.140707-1-robdclark@gmail.com>
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

Hi Rob,
On 2024-08-20 at 07:43:02 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Too much baked in assumptions that the drm device is a PCI device.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/device_reset.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 8ed3ef5220fc..40681931c251 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -200,6 +200,17 @@ static void init_device_fds(struct device_fds *dev)
>  		igt_require_gem(dev->fds.dev);
>  
>  	igt_assert(device_sysfs_path(dev->fds.dev, dev_path));
> +
> +	/*
> +	 * Platform devices do not support reset at the bus level, as
> +	 * there is no actual bus.
> +	 *
> +	 * For other bus types, other than PCI, whether and how bus
> +	 * level reset is supported is left as an exercise for the
> +	 * reader.
> +	 */
> +	igt_require(strstr(dev_path, "/sys/devices/pci") == dev_path);
> +
>  	addr_pos = strrchr(dev_path, '/');
>  	igt_assert(addr_pos);
>  	igt_assert_eq(sizeof(dev->dev_bus_addr) - 1,
> -- 
> 2.46.0
> 
