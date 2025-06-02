Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3807C54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 15:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AB010E2A9;
	Mon,  2 Jun 2025 15:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtznAKRA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F50C10E2A9
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748876873; x=1780412873;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RW/Czv8mQTfS9bq/O92snN4B7DuAoCk9MPQ17g18NTY=;
 b=TtznAKRAfULrPyJ3PrbLLWC++WJadtJQH4eByaNk3zndgFcdTo6pTODD
 peP7s+GS0TD0BLg0yp8DhQV+TyGoP6uUWmuK4JqXKVfAvuOPiffdoVv2+
 nRm7oBIwaeKY88YVQCIc4IZCNBx/7XQY3qhX8zIczbai7cKzXCEakm762
 36duRkxDiYGw9QFxZA7v8KNKbch8uT/DBFiS609gFDPn0iA0HFWMt1bxP
 zIDHF4TdqUGzq45ooIaGNhp7AeZHytyI6FihpUtV/LuHrhNtiUwSzgZuS
 l04UNIe5r1wS9k+gjaioj5hZoDyTTX52ssWgnEHs6Io+ETZK9eM56iD+K A==;
X-CSE-ConnectionGUID: egH2CF3vTVy4a+v/wADIxw==
X-CSE-MsgGUID: jLc/IGreRl2oVJ2mIk8JTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50587247"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="50587247"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:07:52 -0700
X-CSE-ConnectionGUID: aqRgBkTLRIyx/7ycKsAJ/A==
X-CSE-MsgGUID: ynAnUQywQYKExplcb5a5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="145511092"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:07:51 -0700
Date: Mon, 2 Jun 2025 17:07:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 1/3] lib/xe_gt: Move reset related function to
 xe_gt.c
Message-ID: <20250602150748.etrtjvepvcpjxzqt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250528212618.373-2-michal.wajdeczko@intel.com>
 <20250529131127.417-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250529131127.417-1-michal.wajdeczko@intel.com>
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

Hi Michal,
On 2025-05-29 at 15:11:27 +0200, Michal Wajdeczko wrote:
> Those helper functions are per GT and related query function is
> already there. While around add simple documentation.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v2: update also tests/intel/xe_eudebug_online.c (CI)
> ---
>  lib/xe/xe_gt.c                  | 39 +++++++++++++++++++++++++++++++++
>  lib/xe/xe_gt.h                  |  3 +++
>  lib/xe/xe_ioctl.c               | 23 -------------------
>  lib/xe/xe_ioctl.h               |  2 --
>  lib/xe/xe_legacy.c              |  1 +
>  tests/intel/xe_eudebug_online.c |  1 +
>  tests/intel/xe_wedged.c         |  1 +
>  7 files changed, 45 insertions(+), 25 deletions(-)
> 
> diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> index a1e080b88..8bceca10d 100644
> --- a/lib/xe/xe_gt.c
> +++ b/lib/xe/xe_gt.c
> @@ -57,6 +57,45 @@ bool has_xe_gt_reset(int fd)
>  	return 1;
>  }
>  
> +static void xe_force_gt_reset(int fd, int gt, bool sync)
> +{
> +	char reset_string[128];
> +	struct stat st;
> +
> +	igt_assert_eq(fstat(fd, &st), 0);
> +
> +	snprintf(reset_string, sizeof(reset_string),
> +		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
> +		 minor(st.st_rdev), gt, sync ? "_sync" : "");
> +	system(reset_string);
> +}
> +
> +/**
> + * xe_force_gt_reset_async:
> + * @fd: the Xe DRM file descriptor
> + * @gt: the GT identifier
> + *
> + * This function forces a reset on the selected GT.
> + * It does not wait for the reset completion.
> + */
> +void xe_force_gt_reset_async(int fd, int gt)
> +{
> +	xe_force_gt_reset(fd, gt, false);
> +}
> +
> +/**
> + * xe_force_gt_reset_async:
> + * @fd: the Xe DRM file descriptor
> + * @gt: the GT identifier
> + *
> + * This function forces a reset on the selected GT.
> + * It will wait until the reset completes.
> + */
> +void xe_force_gt_reset_sync(int fd, int gt)
> +{
> +	xe_force_gt_reset(fd, gt, true);
> +}
> +
>  /**
>   * xe_force_gt_reset_all:
>   *
> diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
> index 06a59281c..93525ea35 100644
> --- a/lib/xe/xe_gt.h
> +++ b/lib/xe/xe_gt.h
> @@ -12,6 +12,9 @@
>  
>  bool has_xe_gt_reset(int fd);
>  void xe_force_gt_reset_all(int fd);
> +void xe_force_gt_reset_async(int fd, int gt);
> +void xe_force_gt_reset_sync(int fd, int gt);
> +
>  igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
>  				unsigned int flags);
>  void xe_post_hang_ring(int fd, igt_hang_t arg);
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 53a53cd0d..1e95af409 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -585,26 +585,3 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue, &timeout), 0);
>  	return timeout;
>  }
> -
> -static void xe_force_gt_reset(int fd, int gt, bool sync)
> -{
> -	char reset_string[128];
> -	struct stat st;
> -
> -	igt_assert_eq(fstat(fd, &st), 0);
> -
> -	snprintf(reset_string, sizeof(reset_string),
> -		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset%s",
> -		 minor(st.st_rdev), gt, sync ? "_sync" : "");
> -	system(reset_string);
> -}
> -
> -void xe_force_gt_reset_async(int fd, int gt)
> -{
> -	xe_force_gt_reset(fd, gt, false);
> -}
> -
> -void xe_force_gt_reset_sync(int fd, int gt)
> -{
> -	xe_force_gt_reset(fd, gt, true);
> -}
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 522094ae2..6302d1a7d 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -99,7 +99,5 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		     uint32_t exec_queue, int64_t *timeout);
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -void xe_force_gt_reset_async(int fd, int gt);
> -void xe_force_gt_reset_sync(int fd, int gt);
>  
>  #endif /* XE_IOCTL_H */
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index a3ff5da03..6570cf1e6 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -5,6 +5,7 @@
>  
>  #include "lib/igt_syncobj.h"
>  #include "linux_scaffold.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_legacy.h"
>  #include "xe/xe_spin.h"
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 1f72e3e44..535f00818 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -13,6 +13,7 @@
>   */
>  
>  #include "xe/xe_eudebug.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "igt.h"
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 1d2c510b7..7fc7ca9eb 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -22,6 +22,7 @@
>  #include "igt_sysfs.h"
>  
>  #include "xe_drm.h"
> +#include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> -- 
> 2.47.1
> 
