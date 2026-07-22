Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A48C44539
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 14:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF18810E45A;
	Wed, 22 Jul 2026 14:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3OraWhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDE510EDD5
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784730066; x=1816266066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dNDXfq+qzo9mJusmHkd28fFq9y21/+QU9VGfQER8LU0=;
 b=J3OraWhGJqkhewd7L3mMvj5eu0amNgu6F5MZ5mSDWVNEioQTeBNORqbh
 mPfTSMFp0qURPlXioH4GrDY/08LacMYzOnRPgiqntVuJsU87/eFgFLYxs
 omSiv3ojmHAUuH/Mu3/QjTiFXE1M+PARKqA4tg1C9xtzkw7YwsWXhbxIL
 b/qJcJ2Lx+YzvM92zo3jjlxzqCXpJop8fonSo1oHuH1GO1563OPW+xq6O
 wFI5BVUeEdMyHT0nX+xCDjUvm+AncIf/EpctJFOureh+fxXYK9aPynTGS
 QvVcDGUtVMyaMYUOfnxzg6w1IpnWrGz/Jl+lwwq9glbL59rbKgxCpTbfd A==;
X-CSE-ConnectionGUID: TKxSaXF8Q+yaPbt63ZbB7A==
X-CSE-MsgGUID: G8YibtiAQnWq5ZP55PXDwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="95955034"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="95955034"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:21:05 -0700
X-CSE-ConnectionGUID: xJTmrveFTDGsmeCDi+JpxA==
X-CSE-MsgGUID: /eUsjN48T5aEQWBTeK+UfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="261651127"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 07:21:04 -0700
Date: Wed, 22 Jul 2026 16:21:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
Subject: Re: [PATCH i-g-t v3 06/10] tests/imagination: Add DEV_QUERY static
 data area tests
Message-ID: <20260722142101.mol26r6rep2pgy2j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 igt-dev@lists.freedesktop.org,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
 <20260717-test-imagination-add-support-v3-6-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-test-imagination-add-support-v3-6-ce69f9ad330c@imgtec.com>
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

Hi Robert,
On 2026-07-17 at 16:21:38 +0200, Robert Mazur wrote:
> From: Donald Robson <donald.robson@imgtec.com>
> 
> Add subtest validating static data areas returned by DEV_QUERY.
> 
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
> Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_pvr.c                     | 29 +++++++++++++++++++++++++++++
>  lib/igt_pvr.h                     |  2 ++
>  tests/imagination/pvr_heap_info.c | 39 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
> 
> diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
> index a26b4edad..70fc71388 100644
> --- a/lib/igt_pvr.c
> +++ b/lib/igt_pvr.c
> @@ -135,3 +135,32 @@ igt_pvr_get_heap_info(int fd, uint32_t *array_len_out)
>  	return heaps;
>  }
>  
> +/**
> + * igt_pvr_get_static_data_areas:
> + * @fd: The file descriptor of the DRM device.
> + * @array_len_out: Pointer to store the number of static data areas.
> + *
> + * Function to get information about the device static data areas.
> + *
> + * Returns: An array of drm_pvr_static_data_area structures. The caller is responsible
> + * for freeing the array.
> + */
> +struct drm_pvr_static_data_area *
> +igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out)
> +{
> +	struct drm_pvr_static_data_area *sdas =
> +		calloc(DRM_PVR_STATIC_DATA_AREA_YUV_CSC + 1, sizeof(*sdas));
> +	struct drm_pvr_dev_query_static_data_areas sdas_get = {
> +		.static_data_areas =
> +			DRM_PVR_OBJ_ARRAY(DRM_PVR_STATIC_DATA_AREA_YUV_CSC + 1,
> +					  sdas),
> +	};
> +
> +	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
> +				sizeof(sdas_get), &sdas_get, 0);
> +
> +	if (array_len_out)
> +		*array_len_out = sdas_get.static_data_areas.count;
> +
> +	return sdas;
> +}
> diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
> index ca09f39e1..19909480b 100644
> --- a/lib/igt_pvr.h
> +++ b/lib/igt_pvr.h
> @@ -18,5 +18,7 @@ igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
>  			void *pointer, int expect_err);
>  struct drm_pvr_heap *
>  igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
> +struct drm_pvr_static_data_area *
> +igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out);
>  
>  #endif /* IGT_PVR_H */
> diff --git a/tests/imagination/pvr_heap_info.c b/tests/imagination/pvr_heap_info.c
> index 7d953044e..fa8591a97 100644
> --- a/tests/imagination/pvr_heap_info.c
> +++ b/tests/imagination/pvr_heap_info.c
> @@ -123,6 +123,45 @@ int igt_main()
>  		free(heaps);
>  	}
>  
> +	igt_describe("Test validity of static data areas");
> +	igt_subtest("heap-info-static-data-areas-valid")
> +	{
> +		uint32_t heaps_count = 0;
> +		struct drm_pvr_heap *heaps =
> +			igt_pvr_get_heap_info(fd, &heaps_count);
> +
> +		uint32_t sda_count = 0;
> +		struct drm_pvr_static_data_area *static_data_areas =
> +			igt_pvr_get_static_data_areas(fd, &sda_count);
> +
> +		igt_assert(heaps);
> +		igt_assert(static_data_areas);
> +
> +		for (uint32_t i = 0; i < sda_count; i++) {
> +			const uint64_t start_offset = static_data_areas[i].offset;
> +			const uint64_t end_offset =
> +				start_offset + static_data_areas[i].size;
> +			const struct drm_pvr_heap *const heap =
> +				&heaps[static_data_areas[i].location_heap_id];
> +
> +			igt_assert_lte(static_data_areas[i].area_usage,
> +				       DRM_PVR_STATIC_DATA_AREA_YUV_CSC);
> +			igt_assert_lt(static_data_areas[i].location_heap_id,
> +				      DRM_PVR_HEAP_COUNT);
> +
> +			if (!static_data_areas[i].size)
> +				/* Not present for device. */
> +				continue;
> +
> +			/* Ensure reported range is inside the heap. */
> +			igt_assert_lte_u64(start_offset, heap->size);
> +			igt_assert_lte_u64(end_offset, heap->size);
> +		}
> +
> +		free(heaps);
> +		free(static_data_areas);
> +	}
> +
>  	igt_fixture()
>  	{
>  		drm_close_driver(fd);
> 
> -- 
> 2.43.0
> 
