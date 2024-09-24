Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6336CF9C71
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 08:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8862210E67F;
	Tue, 24 Sep 2024 08:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kojm0dU/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5663310E67F
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727166184; x=1758702184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q7/CYyXMsNhR+qFui8TIuYMug6zmAnVzkZsJt171Qns=;
 b=Kojm0dU/RVa0kq/s7PM8l96jYApmuKq5s0XQW2fyfc2tmwqz6EguScXA
 +gawkia1v1xJLHEHKNWWbqehJ+frDKFE/hgSNCh8v4fTdGZxFCxxHCLH3
 JreG8BbTwt+Cm26Pz+oVRCUL73C2erAU6+5/lDypu0JUim3aRClllti8T
 +p9lF/dX7aEh92cozcWPInkhHv7OaT6AU8M57DAd+597tF7HLpKiwGFAA
 WUfRiDMJZ6FmzampWgObh/OpslGa1yTIhL+eGIAm9XGn1qyyp+3iY1GTx
 cgs1pzz6FWcKYJuj4HaenNYEtU7BkXnPTENEH2xSTU/Ck3bqAQ5DWnZqm g==;
X-CSE-ConnectionGUID: 0FD8S4CmSCiwTf4S+p29og==
X-CSE-MsgGUID: CeeNi2mXTaayFTxbwQ0fRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26264707"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="26264707"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:23:04 -0700
X-CSE-ConnectionGUID: GiLvWU0WT5KISGW8jPxljA==
X-CSE-MsgGUID: q4VMwUwsRwmFqQ36fRqM8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="71482883"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 24 Sep 2024 01:23:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Sep 2024 11:23:00 +0300
Date: Tue, 24 Sep 2024 11:23:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 3/5] lib/igt_gt: Add
 igt_open_forcewake_handle_for_pcidev()
Message-ID: <ZvJ25GixxWmW1iyJ@intel.com>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
 <20240923221146.125848-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923221146.125848-4-lucas.demarchi@intel.com>
X-Patchwork-Hint: comment
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

On Mon, Sep 23, 2024 at 05:11:44PM -0500, Lucas De Marchi wrote:
> In several places we are getting the pci_dev for an fd and then passing
> both the pci_dev and the fd to intel_register_access_init(). Add a
> helper so intel_register_access_init() can operate on pci_dev only.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/igt_gt.c | 37 +++++++++++++++++++++++++++++++++++++
>  lib/igt_gt.h |  3 +++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/lib/igt_gt.c b/lib/igt_gt.c
> index 0cc3ee131..c9fd9164f 100644
> --- a/lib/igt_gt.c
> +++ b/lib/igt_gt.c
> @@ -30,6 +30,7 @@
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
>  #include <fcntl.h>
> +#include <pciaccess.h>
>  
>  #include "drmtest.h"
>  #include "i915/gem.h"
> @@ -514,6 +515,42 @@ int igt_open_forcewake_handle(int fd)
>  	return igt_debugfs_open(fd, fn, O_RDONLY);
>  }
>  
> +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
> +{
> +	static const char *FORCEWAKE_FILES[] = {

static const char * const FORCEWAKE_FILES[] = {

for full constness.

> +		"forcewake_all", "i915_forcewake_user",
> +		NULL
> +	};
> +	const char *debugfs_root = igt_debugfs_mount(), **fn;
> +	char path[PATH_MAX];
> +	int dirlen, ret;
> +
> +	if (!debugfs_root)
> +		return -ENOENT;
> +
> +	ret = snprintf(path, sizeof(path), "%s/dri/%04u:%02u:%02u.%u",

The u vs. x issue probably would have flown by me had 
you not mentioned it already.

> +		       debugfs_root,
> +		       pci_dev->domain, pci_dev->bus, pci_dev->dev,
> +		       pci_dev->func);
> +	if (ret < 0 || ret >= sizeof(path))
> +		return -EINVAL;
> +
> +	dirlen = ret;
> +	for (fn = FORCEWAKE_FILES; *fn; fn++) {
> +		ret = snprintf(path + dirlen, sizeof(path) - dirlen,
> +			       "/%s", *fn);
> +		if (ret < 0 || ret >= sizeof(path) - dirlen)
> +			return -EINVAL;
> +
> +		ret = open(path, O_RDONLY);
> +		if (ret >= 0 || errno != ENOENT)
> +			return ret;

For other failure cases you return -errno, so the
-1+errno here seems a bit inconsistent.

Otherwise looks nice
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +	}
> +
> +	return -ENOENT;
> +
> +}
> +
>  #if defined(__x86_64__) || defined(__i386__)
>  static unsigned int clflush_size;
>  
> diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> index d0c5510b1..4a67cd9f0 100644
> --- a/lib/igt_gt.h
> +++ b/lib/igt_gt.h
> @@ -31,6 +31,8 @@
>  #include "i915/i915_drm_local.h"
>  #include "i915_drm.h"
>  
> +struct pci_device;
> +
>  void igt_require_hang_ring(int fd, uint32_t ctx, int ring);
>  
>  typedef struct igt_hang {
> @@ -63,6 +65,7 @@ void igt_fork_hang_helper(void);
>  void igt_stop_hang_helper(void);
>  
>  int igt_open_forcewake_handle(int fd);
> +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev);
>  
>  int igt_setup_clflush(void);
>  void igt_clflush_range(void *addr, int size);
> -- 
> 2.46.1

-- 
Ville Syrjälä
Intel
