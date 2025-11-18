Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310C5CEE338
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 16:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BEE10E054;
	Tue, 18 Nov 2025 16:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnDrbPxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C33410E054
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763482847; x=1795018847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cl7faCVGZnB4OIVgHu0EvK28fUqJtnu1ULq5KBjqHoY=;
 b=XnDrbPxsbTsrCTv8gRqbJotztigje32irJHuji4ek0m3cL0s794m7x32
 4NV6i/PoblGWKD3LcQm7YwbMvy/K8tQ2IAnlU9emvsoekP/hE37ofWi8J
 6aCVagg673E8+i2JNDB486luL+I2mjU2L5joaSsS0zIB/sskcFX2bqEED
 RS1no1A0mSDDybGnAHK9Ni3QIfHjR4xNG8ZBW7kTCoQphWihrHgXKFSs3
 J5DXdBPgcr60QcCDddFyg+0xisFV2tQglUYq99Y0kjiZLuXfASl3l7uRk
 145BHs81y8WM410sshHtX2WaPbQ7jGrRughMwrNAgTiN4bo02zz7Y+rh+ w==;
X-CSE-ConnectionGUID: NgW3ToyoTQCMMQSp0ehIMA==
X-CSE-MsgGUID: 2uxUZNUDQ2qbQe97kBfNiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76187758"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76187758"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:20:46 -0800
X-CSE-ConnectionGUID: ELuhYA9ISzuUTM/jg8YKRg==
X-CSE-MsgGUID: UPk8Hb/RSo2Qpole29SbiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="194911074"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 08:20:44 -0800
Date: Tue, 18 Nov 2025 17:20:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v3 3/8] lib/xe/xe_query: introduce helper for device query
Message-ID: <20251118162027.3l55vfthc5wdv35c@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
 <20251117-xe_query_helpers-v3-3-25d984ae58cb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-xe_query_helpers-v3-3-25d984ae58cb@intel.com>
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

Hi Andrzej,
On 2025-11-17 at 11:47:41 +0100, Andrzej Hajda wrote:
> The helper abstracts out common bits of DRM_XE_DEVICE_QUERY_HWCONFIG ioctl:
> - query data size,
> - alloc memory,
> - get data,
> - error checks,
> - valgrind annotations.
> 
> Since almost all users of DRM_XE_DEVICE_QUERY_HWCONFIG use asserts for
> error checking helper uses them as well.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/xe/xe_query.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_query.h |  1 +
>  2 files changed, 48 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index a3fab133e6c4d9f949564b47cc817383bee7a568..4d46b36fa9754fc48e50633dd79f06b935ce8300 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -25,6 +25,53 @@
>  #include "xe_query.h"
>  #include "xe_ioctl.h"
>  
> +/**
> + * xe_query_device:
> + * @fd: xe device fd
> + * @type: query type, one of DRM_XE_DEVICE_QUERY_* values
> + * @size: pointer to get size of returned data, can be NULL
> + * @can_fail: bool indicating if query can fail
> + *
> + * Calls DRM_IOCTL_XE_DEVICE_QUERY ioctl to query device information
> + * about specified @type. Returns pointer to malloc'ed data, which
> + * should be freed later by the user. @can_fail indicates if function
> + * should return NULL or assert if @query is not supported.
> + * On any other error it asserts.
> + */
> +void *xe_query_device(int fd, uint32_t type, uint32_t *size, bool can_fail)

Rather than a bool param for fail or success,
please make two functions, first one without any assert, in second
you could assert on any error.

Non-asserting one should be:

void *__xe_query_device(int fd, uint32_t type, uint32_t *size)

and return non-NULL on success or NULL on any error.

Regards,
Kamil

> +{
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = type,
> +		.size = 0,
> +		.data = 0,
> +	};
> +	void *data = NULL;
> +
> +	/* In case of unsupported query xe driver usually returns error,
> +	 * but in case of HWCONFIG it can also return query.size == 0
> +	 * on older platforms.
> +	 */
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) || !query.size)
> +		igt_assert(can_fail);
> +	if (!query.size)
> +		goto skip_query;
> +
> +	data = malloc(query.size);
> +	igt_assert(data);
> +
> +	query.data = to_user_pointer(data);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	VG(VALGRIND_MAKE_MEM_DEFINED(data, query.size));
> +
> +skip_query:
> +	if (size)
> +		*size = query.size;
> +
> +	return data;
> +}
> +
>  static struct drm_xe_query_config *xe_query_config_new(int fd)
>  {
>  	struct drm_xe_query_config *config;
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 4f1c0687133c03b81ba53f95457c55860e5ce194..b1483f5eb6ac330454e719423dee52013b4b6137 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -143,6 +143,7 @@ uint16_t xe_gt_get_tile_id(int fd, int gt);
>  uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
>  uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
>  uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value);
> +void *xe_query_device(int fd, uint32_t type, uint32_t *size, bool can_fail);
>  int xe_query_pxp_status(int fd);
>  int xe_wait_for_pxp_init(int fd);
>  
> 
> -- 
> 2.43.0
> 
