Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AE3CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 11:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2618610E194;
	Tue, 26 May 2026 11:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chUXNxaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F124D10E194
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779796332; x=1811332332;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gspZktAhuejPOVL9QAQSOe86EeOuN1Rw3qL0B2WVPv4=;
 b=chUXNxaTpFYQw7HBIcsNDiGGRaHk5k+276l/+cdvFq7rWWJkf7fFaIQe
 3jzDuJJsb6wIabs5lYi46VFCRc2pz0WXiiwIe6jnJEcyiESeOnYHCK4fz
 0Oa/5O90ZBoypEuCjnio20f5vb0iXO5Zns18+v6/mJ2do3Bhbpe2ruaWP
 BimBRcbWoC7byDZduAM6I/O7xJQ2tIHg6EU86SzvDNmn7HLM4WtrQdq4j
 fyR1rZgK9cJDCM3b4HJQgZr6uS1xBHf1psZC4DUjEOezsJMBvQRMxnYcd
 bKu7CFiIskY2ZaGqpQ235DMhDeAqHOQKqeGnsvJ5pL8vwZawPveW7NmXc Q==;
X-CSE-ConnectionGUID: G9XgyfzCQTi+D3kl+/vEgg==
X-CSE-MsgGUID: eHj7byajRB+ZIExVlC95KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91994381"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91994381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:51:43 -0700
X-CSE-ConnectionGUID: odqB+k/KTKKTNoS3vKrCkA==
X-CSE-MsgGUID: /afRaAlwQ/2WUqxjTb35Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="238877312"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:51:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 kamil.konieczny@linux.intel.com, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH v4 1/2] lib/drmtest: add __drm_open_driver_path()
In-Reply-To: <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1779793438.git.sebastian.brzezinka@intel.com>
 <ce36517d762c8e1f7e8988df446f12853f2fdda6.1779793676.git.sebastian.brzezinka@intel.com>
Date: Tue, 26 May 2026 14:51:38 +0300
Message-ID: <c7f64283b82bdbf091007180335a3eed6a56c4ba@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 26 May 2026, Sebastian Brzezinka <sebastian.brzezinka@intel.com> wrote:
> Add __drm_open_driver_path() as a path-based DRM open helper. It opens
> the given path with O_RDWR, verifies the resulting fd is a DRM device by
> issuing DRM_IOCTL_VERSION via __get_drm_device_name() before proceeding
> (returning -1 and closing on failure), logs the opened device path, and
> populates the xe_device cache when the device is Xe.
>
> The __ prefix signals that the function does not throw assertions or
> igt_require() calls, consistent with the existing __drm_open_driver*
> family.

FWIW, I think the __ prefix should indicate "implementation detail,
don't call directly" or something along those lines.

I think it's problematic to encourage tests to call __ prefixed
functions.


BR,
Jani.


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

-- 
Jani Nikula, Intel
