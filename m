Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D0ECA1005
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 11:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A8310E421;
	Mon,  1 Sep 2025 11:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxihAaug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4E910E421
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756725163; x=1788261163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9FkQKcmAjxeYy8Hh6R+x0Zr7LvA6KQIRlbemoKbMqtQ=;
 b=bxihAaug0Z67QWfEFOxtZq6IutJAL5lw8Y4wY0KR3viWmKWAKbneW6im
 k2iIxc9yVl6dfjbExiYU3UhhstjtAGxmYUOc7G7Zd8/jcX8onrE3/vu1K
 oC3c5aL9htf8Vq42kcAQW9WVDsz6cFzwo3F4Vac1IDaHmXhpFsD3HEdzV
 7kgu9WXcwJsrF9nSKluOZgRJhZV7P2JrOTBzeUDoVFPwK0Q34ojyVAhLD
 ajGjemmUF++B6L7c/7wcFPLSTbPQ/4FBPo4G6A/YMXtv+DA0ngtshAgO1
 m28V0nil4RtmXD54u9YOaJIgvAe+l3GSBgkPpEoEiBak+MCUK3uIxIXMm w==;
X-CSE-ConnectionGUID: tQkg9hc/Rn26Hk6rxsti3A==
X-CSE-MsgGUID: w1N1aRA7RlW00xfZCCX2Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="70357424"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="70357424"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 04:12:40 -0700
X-CSE-ConnectionGUID: T98QBEm+QUOViN6ZRaw2HA==
X-CSE-MsgGUID: 3RNsKaLfQgeWXlXLrXkFdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="194647057"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 04:12:38 -0700
Date: Mon, 1 Sep 2025 13:12:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_query: Add xe_gt_type() and
 xe_is_main_gt() helpers
Message-ID: <20250901111236.tyn7rohfhkrjya2w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
 <20250829104037.649426-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829104037.649426-2-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-08-29 at 12:40:36 +0200, Marcin Bernatowicz wrote:
> Introduce xe_gt_type() to return the GT type from query data. This
> replaces open-coded access in xe_is_media_gt() and makes it easy to
> add new GT-specific helpers. Add xe_is_main_gt() for MAIN GT checks.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/xe/xe_query.c | 40 +++++++++++++++++++++++++++++++---------
>  lib/xe/xe_query.h |  2 ++
>  2 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 3b8a682f8..9b88cce8d 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -917,24 +917,46 @@ bool xe_has_media_gt(int fd)
>  }
>  
>  /**
> - * xe_is_media_gt:
> + * xe_gt_type:
>   * @fd: xe device fd
>   * @gt: gt id
>   *
> - * Returns true if @gt for device @fd is media GT, otherwise false.
> + * Returns the type of @gt for device @fd (e.g.,
> + * DRM_XE_QUERY_GT_TYPE_MAIN, DRM_XE_QUERY_GT_TYPE_MEDIA).
>   */
> -bool xe_is_media_gt(int fd, int gt)
> +uint16_t xe_gt_type(int fd, int gt)
>  {
> -	struct xe_device *xe_dev;
> +	struct xe_device *xe_dev = find_in_cache(fd);
>  
> -	xe_dev = find_in_cache(fd);
>  	igt_assert(xe_dev);
> -	igt_assert(gt < xe_number_gt(fd));
> +	igt_assert_f(gt >= 0 && gt < xe_number_gt(fd),
> +		     "gt %d out of range [0..%d)\n", gt, xe_number_gt(fd));
>  
> -	if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
> -		return true;
> +	return xe_dev->gt_list->gt_list[gt].type;
> +}
>  
> -	return false;
> +/**
> + * xe_is_media_gt:
> + * @fd: xe device fd
> + * @gt: gt id
> + *
> + * Returns true if @gt for device @fd is MEDIA GT, otherwise false.
> + */
> +bool xe_is_media_gt(int fd, int gt)
> +{
> +	return xe_gt_type(fd, gt) == DRM_XE_QUERY_GT_TYPE_MEDIA;
> +}
> +
> +/**
> + * xe_is_main_gt:
> + * @fd: xe device fd
> + * @gt: gt id
> + *
> + * Returns true if @gt for device @fd is MAIN GT, otherwise false.
> + */
> +bool xe_is_main_gt(int fd, int gt)
> +{
> +	return xe_gt_type(fd, gt) == DRM_XE_QUERY_GT_TYPE_MAIN;
>  }
>  
>  /**
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index cc54ec956..4b8a6ee77 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -127,7 +127,9 @@ const char *xe_engine_class_short_string(uint32_t engine_class);
>  bool xe_has_engine_class(int fd, uint16_t engine_class);
>  struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
>  bool xe_has_media_gt(int fd);
> +uint16_t xe_gt_type(int fd, int gt);
>  bool xe_is_media_gt(int fd, int gt);
> +bool xe_is_main_gt(int fd, int gt);
>  uint16_t xe_gt_get_tile_id(int fd, int gt);
>  uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
>  
> -- 
> 2.31.1
> 
