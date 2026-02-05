Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F479ECD998
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 19:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB2810E07D;
	Thu,  5 Feb 2026 19:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8+Y2qBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE43910E07D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770318865; x=1801854865;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kOc0VeVh7yNDt5hdqLYGdmE70T4yE/Kw1ofOB1cKAxk=;
 b=m8+Y2qBswdeDXVL7jz/2x5x9xyjFpdPuhKCjavFqEkwUiZfiGNLhUsFa
 wEtbqAIHHT09Zs35thYjCri4rQ0SjlmtqUShFIERmZh/x+wr6xq0Y829/
 c0eGg/yHH3N8ZLVM36Hf0quXhdItdwHZdSLmUjEk1OxbzLQZr+ozjJ8mo
 Zjce2cLUJuGu5IhUa+10do2DG9IRjprfIcz6IoqgdLFXRWRlkRJnS/z87
 K4vOur8SrKR2UcVdFO484oznmssbx5zLQUPJ2JExU+CtgJ7P94v5Rc6AC
 x1mS6p+G9jwrf3c8mMHqMs61oOHDccGo5X5YPXyWl143lBMwBSKgO80i6 Q==;
X-CSE-ConnectionGUID: +JmdbOXURAKJ4OuQ/Tz0nw==
X-CSE-MsgGUID: /CzEVtDuQDOLkkqYMC9khQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75380613"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="75380613"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 11:14:24 -0800
X-CSE-ConnectionGUID: OQ9mrJTRQvag1zFewtAO+A==
X-CSE-MsgGUID: /kGX3IuWSb6gCCl1QXJjtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210534081"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 11:14:23 -0800
Date: Thu, 5 Feb 2026 20:13:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t] tests/core_hotunplug: Skip unplug when sysfs
 'remove' is missing
Message-ID: <20260205191344.7yuq32w36dpvspcw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20260203104629.56005-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260203104629.56005-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2026-02-03 at 11:46:29 +0100, Marcin Bernatowicz wrote:
> Some PCI devices don't expose the sysfs remove attribute. The unplug/rescan
> paths in core_hotunplug rely on writing 1 to remove, so attempting those
> subtests would fail, skip the test early when remove is not present.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/core_hotunplug.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index e23b5b89f..7c9dae1bf 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -245,6 +245,17 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
>  {
>  	igt_require(priv->fd.sysfs_dev == -1);
>  
> +	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
> +				    O_DIRECTORY);
> +	igt_assert_fd(priv->fd.sysfs_dev);
> +
> +	if (!igt_sysfs_has_attr(priv->fd.sysfs_dev, "remove")) {
> +		priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
> +		igt_assert_eq(priv->fd.sysfs_dev, -1);
> +		igt_skip("PCI %s has no sysfs 'remove' attribute, skipping test\n",
> +			 priv->dev_bus_addr);
> +	}
> +
>  	/*
>  	 * FIXME: on some devices, the audio driver (snd_hda_intel)
>  	 * binds into the i915 driver. On such hardware, kernel warnings
> @@ -254,16 +265,14 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
>  	 * unbind i915 driver, reloading it when binding again.
>  	 */
>  	if (igt_audio_driver_unload(&priv->snd_driver)) {
> +		priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
> +		igt_assert_eq(priv->fd.sysfs_dev, -1);
>  		igt_skip("Audio driver %s in use, skipping test\n",
>  			 priv->snd_driver);
>  	} else if (priv->snd_driver) {
>  		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
>  	}
>  
> -	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
> -				    O_DIRECTORY);
> -	igt_assert_fd(priv->fd.sysfs_dev);
> -
>  	local_debug("%sunplugging the device\n", prefix);
>  	priv->failure = "Device unplug failure!";
>  
> -- 
> 2.43.0
> 
