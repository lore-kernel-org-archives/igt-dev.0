Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21A6CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 18:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F33810E275;
	Wed,  6 May 2026 18:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIdCO4AH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5017E10E55E
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778092321; x=1809628321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gYRnIWvGU8Y++cG5Sh4/93reKFu5l3rlIACacp8pTU8=;
 b=MIdCO4AHwYmGFM/PpsHN1W7az60ybuA+f1fkyFAYywsouPqt09ekimWF
 NGkyE+AG4ypOoy0jmFLbYWjRjSYHy0p+MjejOdYb4r/RYnN/eHldC/Bxx
 MnrUbN17Nw1Siy9XTEtuJDKXf6CsBrTzEGyB6AsT8mi3OC/6B/QSosHx1
 NGFtfdeEKYhb2dDYJdBLm9D0k9lQ/01JxeV6CzkOwkmefVPJBh4CNgRu1
 05ikbHMYKsORTnXgPs4J9l7IVxr4YAIeGpfpeeenrDqzCV1Gb6plOWFMk
 uUX1OkPr+YhOxjW1BW/ecfyJaPz4tLfcZ5rg2IOT8ePyFKJDP1jn/3vak Q==;
X-CSE-ConnectionGUID: zzXYwmlzSjuDqL2aU5rs8w==
X-CSE-MsgGUID: 7w2Pve4qR5Gmlr3DPEp+hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78060666"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78060666"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 11:32:01 -0700
X-CSE-ConnectionGUID: XGt2wE7wRoObSm9F0cBeKg==
X-CSE-MsgGUID: GRYEUn1fSOSiMkxrpsP9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="233566010"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.11])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 11:32:00 -0700
Date: Wed, 6 May 2026 20:31:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v5] lib/drmtest: Create proper error report when
 open driver fails
Message-ID: <zww3bdvbw6olhs2ck7eoqfb3riepzwqsgqoc53wthfetyzwwc2@dhtl3zbliilz>
References: <20260506160952.202178-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506160952.202178-1-kamil.konieczny@linux.intel.com>
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

On Wed, May 06, 2026 at 06:09:52PM +0200, Kamil Konieczny wrote:
> When first try for opening driver fails then opening function is
> searching for next available device. When that also fails
> reporting is printing last errno which could mislead developer:
> 
> $ build/tests/kms_dp_aux_dev
> IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
> Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:754:
> Test requirement: !(fd<0)
> No known gpu found for chipset flags 0x4294965755 (any)
> Last errno: 2, No such file or directory
> SKIP (0.006s)
> 
> ls /dev/dri
> by-path  card1  renderD128
> 
> The real problem here is lack of permissions as there was a card
> but program could not open it. Break looking for a card as soon
> as an error is different from ENOENT. It will create a proper
> error report which will print:
> 
> Last errno: 13, Permission denied
> 
> v3: break only when errno actually happens in open() (Kamil)
> v4: removed 'else', removed errno printing (Zbigniew)
> v5: use explicit strerror() (Kamil)
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c          | 26 +++++++++++++++++++++-----
>  lib/drmtest.h          |  2 +-
>  lib/igt_sriov_device.c |  2 +-
>  3 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..084737edf 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -323,6 +323,7 @@ static void log_opened_device_path(const char *device_path)
>   * __drm_open_device:
>   * @name: DRM node name
>   * @chipset: OR'd flags for chipset to be opened
> + * @error: pointer for saving errno when open() fails
>   *
>   * Open a drm legacy device node with given @name and compatible with given
>   * @chipset flag.
> @@ -334,8 +335,10 @@ static void log_opened_device_path(const char *device_path)
>   * name, even when driver was excluded by ANY or is not listed in known drivers.
>   *
>   * Returns: DRM file descriptor or -1 on error
> + *
> + * When open() succeeds, sets @error to zero otherwise to errno
>   */
> -int __drm_open_device(const char *name, unsigned int chipset)
> +int __drm_open_device(const char *name, unsigned int chipset, int *error)
>  {
>  	const char *forced;
>  	char dev_name[16] = "";
> @@ -343,8 +346,15 @@ int __drm_open_device(const char *name, unsigned int chipset)
>  	int fd;
>  
>  	fd = open(name, O_RDWR);
> -	if (fd == -1)
> +	if (fd == -1) {
> +		if (error)
> +			*error = errno;
> +
>  		return -1;
> +	}
> +
> +	if (error)
> +		*error = 0;
>  
>  	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) == -1)
>  		goto err;
> @@ -426,6 +436,7 @@ static bool _is_already_opened(const char *path, int as_idx)
>  static int __search_and_open(const char *base, int offset, unsigned int chipset, int as_idx)
>  {
>  	const char *forced;
> +	int err;
>  
>  	forced = forced_driver();
>  	if (forced)
> @@ -440,9 +451,14 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
>  		if (_is_already_opened(name, as_idx))
>  			continue;
>  
> -		fd = __drm_open_device(name, chipset);
> +		fd = __drm_open_device(name, chipset, &err);
>  		if (fd != -1)
>  			return fd;
> +
> +		if (err) {
> +			igt_debug("Error at open %s %s\n", name, strerror(err));

Now it looks good to me.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +			break;
> +		}
>  	}
>  
>  	return -1;
> @@ -500,13 +516,13 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
>  {
>  	int fd;
>  
> -	fd = __drm_open_device(name, chipset);
> +	fd = __drm_open_device(name, chipset, NULL);
>  	if (fd != -1)
>  		return fd;
>  
>  	drm_load_module(chipset);
>  
> -	return __drm_open_device(name, chipset);
> +	return __drm_open_device(name, chipset, NULL);
>  }
>  
>  /*
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 37874d729..126feffda 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -117,7 +117,7 @@ unsigned int drm_get_chipset(int fd);
>   */
>  #define IS_ALIGNED(v, a)	(((v) & ((typeof(v))(a) - 1)) == 0)
>  
> -int __drm_open_device(const char *name, unsigned int chipset);
> +int __drm_open_device(const char *name, unsigned int chipset, int *error);
>  void drm_load_module(unsigned int chipset);
>  int drm_open_driver_another(int idx, int chipset);
>  int drm_open_driver(int chipset);
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 1f4c3ac04..21d23298b 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -284,7 +284,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
>  	if (!found)
>  		return -1;
>  
> -	fd = __drm_open_device(dev_name, DRIVER_ANY);
> +	fd = __drm_open_device(dev_name, DRIVER_ANY, NULL);
>  	if (fd >= 0 && is_xe_device(fd))
>  		xe_device_get(fd);
>  
> -- 
> 2.54.0
> 
