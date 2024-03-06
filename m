Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4F2C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 14:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBF51131FD;
	Wed,  6 Mar 2024 14:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llIe5SS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B781131FB
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 14:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709734275; x=1741270275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LWO5p9Fnat3J1rv5zK9+7g1gHTkFYZwj9kN4uaAKDyw=;
 b=llIe5SS+ziygHrH7DJlqVWLC5zyTrPU9a8we6tsZ+6ztqBvxv784OsX3
 PPddXpkAWtXVXlgqQ1CY6UL3bTOORsbYQPzKOAyff2JvDq/RA+948qLo6
 74vK6TVDIu/lZi1MTWx+wdGiqC9VSpMIjV9oOQuNOl1YbeIc6NV7dj0yk
 7NH6wFCsU1GAn4sQkBLf5po9RM/N9OaPy2g93DYn1PPuXx0bh1lOZCvOs
 lcCvKypOqrErQwTuO7yBY7DnrpIBimzMpMx8oeTdLBtfU12OblMO8NmhS
 YZl61qf7n628J5Ajvo9wTUOHHqny4TjwnrUPtoQtynmI5eYl+UKmyvwYd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4211086"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4211086"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="40656775"
Received: from unknown (HELO localhost) ([10.245.244.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:11:13 -0800
Date: Wed, 6 Mar 2024 15:11:09 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 5/6] lib/intel_mocs: add defer-to-pat-index
Message-ID: <20240306141046.4dl35w4jkz4dddy7@zkempczy-mobl2>
References: <20240305121754.182425-1-matthew.auld@intel.com>
 <20240305121754.182425-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305121754.182425-5-matthew.auld@intel.com>
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

On Tue, Mar 05, 2024 at 12:17:53PM +0000, Matthew Auld wrote:
> At least on Xe2 it looks like we can just use MOCS index zero to defer
> the selected caching mode to that of the PAT index. This will be useful
> in an upcoming patch.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_mocs.c | 14 ++++++++++++++
>  lib/intel_mocs.h |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index 4a9c305dc..bf6ee1958 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -9,6 +9,7 @@
>  struct drm_intel_mocs_index {
>  	uint8_t uc_index;
>  	uint8_t wb_index;
> +	uint8_t deferred_index;

I wonder shouldn't it be called 'prefer_pat' or similar.

Anyway, code is correct what I've seen in xe_mocs.c xe2 defs.
Regarless decision to rename the above:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew

>  };
>  
>  static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
> @@ -25,6 +26,7 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>  	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
>  		mocs->uc_index = 3;
>  		mocs->wb_index = 4;
> +		mocs->deferred_index = 0;
>  	} else if (IS_METEORLAKE(devid)) {
>  		mocs->uc_index = 5;
>  		mocs->wb_index = 10;
> @@ -60,3 +62,15 @@ uint8_t intel_get_uc_mocs_index(int fd)
>  
>  	return mocs.uc_index;
>  }
> +
> +uint8_t intel_get_deferred_mocs_index(int fd)
> +{
> +	struct drm_intel_mocs_index mocs;
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +
> +	igt_assert(AT_LEAST_GEN(dev_id, 20));
> +
> +	get_mocs_index(fd, &mocs);
> +
> +	return mocs.deferred_index;
> +}
> diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
> index b5c79b0e1..bfdc23210 100644
> --- a/lib/intel_mocs.h
> +++ b/lib/intel_mocs.h
> @@ -12,5 +12,6 @@
>  
>  uint8_t intel_get_wb_mocs_index(int fd);
>  uint8_t intel_get_uc_mocs_index(int fd);
> +uint8_t intel_get_deferred_mocs_index(int fd);
>  
>  #endif /* _INTEL_MOCS_H */
> -- 
> 2.43.2
> 
