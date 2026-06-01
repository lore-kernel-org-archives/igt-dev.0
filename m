Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB83CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 16:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D520113561;
	Mon,  1 Jun 2026 16:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WArfj36f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC0811355F
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780330301; x=1811866301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oTnwHNcmZMYcVP7JSrWUcE2x4FWWJoVJnZWm1DEKpOc=;
 b=WArfj36fUXpBHgs1SerzcRDJmdGUwjpgJi0I1a7M84LWEYh4flm+6X8u
 6/dknlO/TbciNTHJKB3NVVhflIki9Ye349OgmLXU9/M/JH9BZXUg9xNYx
 VpIHwkN9f80NnzHRi6nHa07BX8GpCUMsGfsL8t3B08/8Zgl20y3LGiV3A
 TUI8SSwTISej6AiPEM0zYj62enqPx6r5OU/1s8wTlKCrSb9zZEwVySlEk
 179+njucGAeT1JZ5INIaik/2Kvefftj8OvXtq+6n99anrKd4EaovYfdWw
 NeyM4qcK9UmvWqPiIVjVgFxkHbzybPE4D5maoS7IeS103j+iHtddY7bo+ g==;
X-CSE-ConnectionGUID: ZfBFA+g4Rs+6zOiiMSVWVw==
X-CSE-MsgGUID: ZxavJGhtT0ORFcjyQhnOgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80824345"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80824345"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 09:11:40 -0700
X-CSE-ConnectionGUID: +Unav2clSMOJTCWWR3Tz6Q==
X-CSE-MsgGUID: 5xjD49QDQpi2qANmDBEgAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="248531343"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:11:39 -0700
Date: Mon, 1 Jun 2026 18:11:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH i-g-t v5 1/2] lib/drmtest: add drm_open_driver_path()
Message-ID: <20260601161119.sclzsgm3pyxlh32o@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
References: <cover.1780317251.git.sebastian.brzezinka@intel.com>
 <74d549e21790c747367197e5d6e90f2e58c66bf8.1780317251.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <74d549e21790c747367197e5d6e90f2e58c66bf8.1780317251.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-06-01 at 14:46:19 +0200, Sebastian Brzezinka wrote:
> Add drm_open_driver_path() as a path-based DRM open helper. It opens
> the given path with O_RDWR, verifies the resulting fd is a DRM device by
> issuing DRM_IOCTL_VERSION via __get_drm_device_name() and checking that
> the returned name is non-empty before proceeding (returning -1 and
> closing on failure), logs the opened device path, and populates the
> xe_device cache when the device is Xe.

Please make a short description here, there is no need for
translating C into english.

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/drmtest.c | 30 ++++++++++++++++++++++++++++++
>  lib/drmtest.h |  1 +
>  2 files changed, 31 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..3d1d331f7 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -379,6 +379,36 @@ err:
>  	return -1;
>  }
>  
> +/**
> + * drm_open_driver_path:
> + * @path: DRM device node path
> + *
> + * Opens @path with O_RDWR and populates the xe_device cache for Xe fds.

Rather than that write about one check for DRM ioctl,
so it is realy a DRM device.

> + *
> + * Returns: DRM file descriptor or -1 on error
> + */
> +int drm_open_driver_path(const char *path)
> +{
> +	char name[12] = "";
> +	int fd;
> +
> +	fd = open(path, O_RDWR);
> +	if (fd < 0)
> +		return -1;
> +
> +	if (__get_drm_device_name(fd, name, sizeof(name) - 1) || !name[0]) {

I would prefer separate checks, even at cost of code duplication
or using goto.

Regards,
Kamil

> +		close(fd);
> +		return -1;
> +	}
> +
> +	log_opened_device_path(path);
> +
> +	if (is_xe_device(fd))
> +		xe_device_get(fd);
> +
> +	return fd;
> +}
> +
>  static struct {
>  	int fd;
>  	struct stat stat;
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 37874d729..19d3d1e76 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -123,6 +123,7 @@ int drm_open_driver_another(int idx, int chipset);
>  int drm_open_driver(int chipset);
>  int drm_open_driver_master(int chipset);
>  int drm_open_driver_render(int chipset);
> +int drm_open_driver_path(const char *path);
>  int __drm_open_driver_another(int idx, int chipset);
>  int __drm_open_driver(int chipset);
>  int __drm_open_driver_render(int chipset);
> -- 
> 2.53.0
> 
