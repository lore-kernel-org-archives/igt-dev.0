Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00081C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 15:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A4C10E84F;
	Wed,  7 May 2025 15:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9f3NDui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32510E84F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633507; x=1778169507;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0J/2BzW1NpXMIpJtVU79tmZON07qw3vkwYhj4DO0/Tk=;
 b=L9f3NDui7GajGpR9aT6EWTNA1R4F9XdvEFuTbNriFOYTH06pVr2g9gLd
 vEAstMpy46jcyWOxVwKIvxoB3CcjHUDISJKfYu/wlXmG5KuP979j9KC0P
 eNZwQJ3fWG7//2gq75kjkHH51osacDs/Do1hnstAQ/hVNlMLJ10xQUeJ4
 Xj/shYj5if4yBsApak4WOdbY9m6BD69lm6tIZPhaYJHPdieVospTJx9o4
 MOfF9yRVg4DlWOrqYXiBD3uFwD1A30tsez8/Xedo1I524/koY2YIVEpxt
 4WGOtzBpnZqOJsaC17PxLmlD54pDhBIthMm5z9s3rYoEWqMAAZeILzN3U A==;
X-CSE-ConnectionGUID: XIgbwA2NSgSinza0HNOrig==
X-CSE-MsgGUID: mOSVbYSXREqs1wkvD24dOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48081118"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48081118"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:58:22 -0700
X-CSE-ConnectionGUID: zQAmgQ47QCiljoIYdmly+g==
X-CSE-MsgGUID: qaVXWTZDTTephzIfs4lnFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="140749629"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:58:20 -0700
Date: Wed, 7 May 2025 17:58:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH i-g-t 3/5] lib/igt_fs: Rename igt_io to igt_fs to add
 additional helpers
Message-ID: <20250507155818.f4uus7k3h4js3mku@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 louis.chauvet@bootlin.com,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-4-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422095602.55041-4-riana.tauro@intel.com>
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

Hi Riana,
On 2025-04-22 at 15:25:59 +0530, Riana Tauro wrote:
> Rename igt_io to igt_fs to add additional helper functions
> to create and remove directories
> 
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  lib/{igt_io.c => igt_fs.c} | 12 ++++++------
>  lib/{igt_io.h => igt_fs.h} |  6 +++---
>  lib/igt_sysfs.c            |  2 +-
>  lib/meson.build            |  2 +-
>  tests/msm/msm_mapping.c    |  2 +-
>  tests/msm/msm_recovery.c   |  2 +-
>  6 files changed, 13 insertions(+), 13 deletions(-)
>  rename lib/{igt_io.c => igt_fs.c} (93%)
>  rename lib/{igt_io.h => igt_fs.h} (94%)
> 
> diff --git a/lib/igt_io.c b/lib/igt_fs.c
> similarity index 93%
> rename from lib/igt_io.c
> rename to lib/igt_fs.c
> index b5143184f..f6a2530cd 100644
> --- a/lib/igt_io.c
> +++ b/lib/igt_fs.c
> @@ -26,15 +26,15 @@
>  #include <stdlib.h>
>  #include <unistd.h>
>  
> -#include "igt_io.h"
> +#include "igt_fs.h"
>  
>  /**
> - * SECTION:igt_io
> - * @short_description: Helpers for file I/O
> - * @title: io
> - * @include: igt_io.h
> + * SECTION:igt_fs
> + * @short_description: Helpers for file
> + * @title: fs
> + * @include: igt_fs.h
>   *
> - * This library provides helpers for file I/O
> + * This library provides helpers for file systems
>   */
>  
>  /**
> diff --git a/lib/igt_io.h b/lib/igt_fs.h
> similarity index 94%
> rename from lib/igt_io.h
> rename to lib/igt_fs.h
> index eb9ffee1b..84c3fed62 100644
> --- a/lib/igt_io.h
> +++ b/lib/igt_fs.h
> @@ -22,12 +22,12 @@
>   *
>   */
>  
> -#ifndef __IGT_IO_H__
> -#define __IGT_IO_H__
> +#ifndef __IGT_FS_H__
> +#define __IGT_FS_H__
>  
>  #include <stdio.h>
>  
>  ssize_t igt_readn(int fd, char *buf, size_t len);
>  ssize_t igt_writen(int fd, const char *buf, size_t len);
>  
> -#endif /* __IGT_IO_H__ */
> +#endif /* __IGT_FS_H__ */
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index a76af54eb..acb2f7927 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -46,7 +46,7 @@
>  #include "igt_core.h"
>  #include "igt_sysfs.h"
>  #include "igt_device.h"
> -#include "igt_io.h"
> +#include "igt_fs.h"
>  #include "intel_chipset.h"
>  #include "xe/xe_query.h"
>  
> diff --git a/lib/meson.build b/lib/meson.build
> index 59072d8ce..34f7d7baa 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -20,6 +20,7 @@ lib_sources = [
>  	'igt_color_encoding.c',
>  	'igt_configfs.c',
>  	'igt_facts.c',
> +        'igt_fs.c',
>  	'igt_crc.c',
>  	'igt_debugfs.c',
>  	'igt_device.c',
> @@ -30,7 +31,6 @@ lib_sources = [
>  	'igt_gt.c',
>  	'igt_halffloat.c',
>  	'igt_hwmon.c',
> -	'igt_io.c',
>  	'igt_matrix.c',
>  	'igt_os.c',
>  	'igt_params.c',
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index e24618607..02ad2f08a 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -29,7 +29,7 @@
>  
>  #include "igt.h"
>  #include "igt_msm.h"
> -#include "igt_io.h"
> +#include "igt_fs.h"
>  
>  /*
>   * Tests to ensure various kernel controlled buffers are mapped with the
> diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> index 608836866..53c49ecd4 100644
> --- a/tests/msm/msm_recovery.c
> +++ b/tests/msm/msm_recovery.c
> @@ -26,7 +26,7 @@
>  
>  #include "igt.h"
>  #include "igt_msm.h"
> -#include "igt_io.h"
> +#include "igt_fs.h"

Should be before igt_msm.h

Regards,
Kamil

>  
>  static struct msm_device *dev;
>  static struct msm_bo *scratch_bo;
> -- 
> 2.47.1
> 
