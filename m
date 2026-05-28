Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069ADCD6E44
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 15:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A768910F364;
	Thu, 28 May 2026 15:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyLrqeSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E71410F358
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779981468; x=1811517468;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JN7TZtOnzomlAiwXqiSks8r1fmiYOuFTzINhPiFRnpg=;
 b=NyLrqeSEnLZYTvynYTs/G9qMB+NGzqVHwejOdI/64Df3jvFhhjyv6efx
 at6lujMXa5mtq8ecpSQ4ISUts7ZVSQB2mpC0aCeoHoDdPo2KILrhMkLii
 7xS4VTEhILtwrolF8VFlCBg5CcOB8F9fyat9yJi/Ze0WUGfI86Xq3epvj
 T76rzPOULr5AYjzXnWdKM1mmKH11w6TwSm50i77zZp3M2NmV1/6uW/8B4
 qpnqi3I4Halk08ZLCs7zMcQGQss3Nw6AUIBmSlkPCwLvKa+BxBYwtZKU8
 fWSxDlpVk3NxjmRk5P7i/JskoTIy1qV1A7+qbeGSLIuS7s0yotuxOEPEh w==;
X-CSE-ConnectionGUID: tzBvQ2uYR7CKJ+Po/5Ngsw==
X-CSE-MsgGUID: 5coMRsZaRrOjYdkvzztpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80938818"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80938818"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 08:17:47 -0700
X-CSE-ConnectionGUID: sazg265tSBOvGmm/8Q7G2w==
X-CSE-MsgGUID: zyrrpbsJQkOADYjB6PFCQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="244398288"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 08:17:46 -0700
Date: Thu, 28 May 2026 17:17:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH v4 1/2] lib/drmtest: add __drm_open_driver_path()
Message-ID: <20260528151731.2g6ttnrvvqtqcgbt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
 <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
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
On 2026-05-26 at 13:39:53 +0200, Sebastian Brzezinka wrote:
> Add __drm_open_driver_path() as a path-based DRM open helper. It opens
> the given path with O_RDWR, verifies the resulting fd is a DRM device by
> issuing DRM_IOCTL_VERSION via __get_drm_device_name() before proceeding
> (returning -1 and closing on failure), logs the opened device path, and
> populates the xe_device cache when the device is Xe.
> 
> The __ prefix signals that the function does not throw assertions or
> igt_require() calls, consistent with the existing __drm_open_driver*
> family.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/drmtest.c | 30 ++++++++++++++++++++++++++++++
>  lib/drmtest.h |  1 +
>  2 files changed, 31 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..7007569d2 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -379,6 +379,36 @@ err:
>  	return -1;
>  }
>  
> +/**
> + * __drm_open_driver_path:
> + * @path: DRM device node path
> + *
> + * Opens @path with O_RDWR and populates the xe_device cache for Xe fds.
> + *
> + * Returns: DRM file descriptor or -1 on error
> + */
> +int __drm_open_driver_path(const char *path)

This should be

int drm_open_driver_path(const char *path)

see below.

> +{
> +	char name[12] = "";
> +	int fd;
> +
> +	fd = open(path, O_RDWR);
> +	if (fd < 0)
> +		return -1;
> +
> +	if (__get_drm_device_name(fd, name, sizeof(name) - 1)) {
> +		close(fd);
> +		return -1;
> +	}
> +

Please verify here that name[0] != 0.

> +	log_opened_device_path(path);
> +
> +	if (is_xe_device(fd))
> +		xe_device_get(fd);

xe_device_get() uses igt_assert() so use drm_open_driver_path()
as function name.

Regards,
Kamil

> +
> +	return fd;
> +}
> +
>  static struct {
>  	int fd;
>  	struct stat stat;
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 37874d729..305bbc86b 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -123,6 +123,7 @@ int drm_open_driver_another(int idx, int chipset);
>  int drm_open_driver(int chipset);
>  int drm_open_driver_master(int chipset);
>  int drm_open_driver_render(int chipset);
> +int __drm_open_driver_path(const char *path);
>  int __drm_open_driver_another(int idx, int chipset);
>  int __drm_open_driver(int chipset);
>  int __drm_open_driver_render(int chipset);
> -- 
> 2.53.0
> 
