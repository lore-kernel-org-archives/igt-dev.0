Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08627CD5BD1
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BC510F17F;
	Tue,  2 Jun 2026 14:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f439Cplb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBF710F17F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780408823; x=1811944823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=05Ydlq5tTYE8A0wGJ16wGCllD7FX0ZIZEFvk82rk94I=;
 b=f439CplbjYkSVXxcJ3lgM/3G3khssEanUpjFOwDBLnAHs2iiu/v9s41v
 +ECh+0axciPWW4PCXX4Z4XvvrVl/eRA9L/X3lzZ4k/irco3uXvCCOIRXg
 gHcmNlROscok6QK3CCN/jS8PfHHcph/lrdfBA1ypsF0FUEXgVt0hQrm8l
 /IJbBMEqTLPUsc5x4QZEUlxURKffv26XSpURqleejxwFRrDWAitSTzBwN
 UMeXJGQNPYAXFWR4uv+jTEMOemZBvYOIKE773dtaXlzfgCoKU05BZrMfQ
 ZGStdD1BzXOTOgG67JtEHC4XqEm/i5FLWYY194Lk0HH9B/ffCNcwa8gi8 A==;
X-CSE-ConnectionGUID: fqvJ0kaZTriwVCoDGCO90w==
X-CSE-MsgGUID: hPOncAz+T/G9ofpFytKl9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80929426"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="80929426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:00:23 -0700
X-CSE-ConnectionGUID: XvbN0uhNTcqoV/rEwcpsIg==
X-CSE-MsgGUID: RkcBbyb2S66u44VuKPsRrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="239477815"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 07:00:22 -0700
Date: Tue, 2 Jun 2026 16:00:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH v6 1/2] lib/drmtest: add drm_open_driver_path()
Message-ID: <20260602140006.kwlvakyeldyxwmtl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
References: <cover.1780397630.git.sebastian.brzezinka@intel.com>
 <3636f67c531c0e99743682c5f69ede74f5e0487f.1780397630.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3636f67c531c0e99743682c5f69ede74f5e0487f.1780397630.git.sebastian.brzezinka@intel.com>
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
On 2026-06-02 at 13:50:57 +0200, Sebastian Brzezinka wrote:
> Some callers already have a device node path and don't need the
> chipset-based selection of drm_open_driver(). This helper opens a
> device by path, checks it is a real DRM device via DRM_IOCTL_VERSION,
> and sets up the Xe device cache when needed.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/drmtest.c | 35 +++++++++++++++++++++++++++++++++++
>  lib/drmtest.h |  1 +
>  2 files changed, 36 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..40ef2bdee 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -379,6 +379,41 @@ err:
>  	return -1;
>  }
>  
> +/**
> + * drm_open_driver_path:
> + * @path: DRM device node path
> + *
> + * Opens @path with O_RDWR and verifies the fd is a DRM device via
> + * DRM_IOCTL_VERSION before returning it.
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
> +	if (__get_drm_device_name(fd, name, sizeof(name) - 1))
> +		goto err;
> +
> +	if (!name[0])
> +		goto err;
> +
> +	log_opened_device_path(path);
> +
> +	if (is_xe_device(fd))
> +		xe_device_get(fd);
> +
> +	return fd;
> +err:
> +	close(fd);
> +	return -1;
> +}

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

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
