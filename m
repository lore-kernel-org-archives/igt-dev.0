Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C0C369C2
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 05:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD8B10E2C0;
	Mon,  5 May 2025 05:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/gSj1o/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5DB10E2C0
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 05:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746423322; x=1777959322;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l33CCgX4b/vs9uSJ73zKZzV/EdSY904UT+G0sVgOB8Q=;
 b=P/gSj1o/nSjwzQCjjG/zr4mr+0vb/1MLfo30uuOWlVBDBKhQuIP5ac0M
 Uu7SQ24ySe+f2OulKl1SO9CLHdr5ZeqzsrfccmKw1ChEoSUMInqa+lOYN
 EqLqciyhLorN863Tl9hBM1ea8rd8cHFYB6a7t+4cHeV+gDv8Ik8BShAQM
 pOgdncMABAeKKG4Y8kSrZxijUyztZDNXv1rjgIujGIZwLmYmal5IxcUe/
 SUnadiwm5498DtpIYWQiktOKCe79Cvk2P5hmks4Db7cxJqvFZWkQ9hEcV
 MWt4xD0PvBFg9RH09Sbbr/Etat9zb79VARIDVvjuchXd1lUmcIepnJomq g==;
X-CSE-ConnectionGUID: JOyAloTFRpqjnuEMOwenKQ==
X-CSE-MsgGUID: E8i6dYdkS/u1Bkoi7rykvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="58676039"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="58676039"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 22:35:21 -0700
X-CSE-ConnectionGUID: nJMPWuUkRy2WRNXc040LkA==
X-CSE-MsgGUID: in3HBmQJQA+1eh8fuwhseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135483160"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.235.34])
 ([10.247.235.34])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 22:35:18 -0700
Message-ID: <cad63dec-dd6f-4a97-a656-269674ad3550@linux.intel.com>
Date: Mon, 5 May 2025 11:05:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] lib/igt_fs: Rename igt_io to igt_fs to add
 additional helpers
To: Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 louis.chauvet@bootlin.com, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-4-riana.tauro@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20250422095602.55041-4-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 22-04-2025 15:25, Riana Tauro wrote:
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
the statement looks incomplete, also it is better mentioned as

"This library provides helpers for file operations"

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
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
>  
>  static struct msm_device *dev;
>  static struct msm_bo *scratch_bo;
