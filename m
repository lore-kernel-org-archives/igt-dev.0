Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871CACFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 11:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEE510E20A;
	Mon, 24 Nov 2025 11:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/RYOMU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390F110E20A
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763983024; x=1795519024;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cSRbczjVQY85U+I7tL+UE4Mje0Z/2kOME+KqqA3jz+8=;
 b=G/RYOMU0c0KryDPAmI2axhTgAmuVcKoYGTTHQm+YlrKG/tMvVX2IBrxG
 TdF/vlxFS6xipIT5pQI4MbJF6tm/KhxmEqI3Kwl7FWmrdV0pd9tLv/NNl
 9Ub4VeJVcivjH6w/X9ojJsIiFfcKAfalIdb6Zb27TjLshm16jXO1D2iKe
 elBdtZmZVQ23fIROYnmBiGZJzSuIiyqcpqlrZcIhyCLsW4ok3gYb5sJ0P
 9/rxg5oKt04QoQims4rDAgzr+8iA8qQ0Bo+jGqqfe/5sL/zlARifTl6v0
 Hdv+Dv4GA6WjzSKYb8j0nvEINcxPlMef4MefR7PU8MgTtaLKYKPrvnzlQ Q==;
X-CSE-ConnectionGUID: 8shYCHDZTOii8HD3yVzmew==
X-CSE-MsgGUID: Z2g2Z4LAS/uuAcyEaVOhmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83367626"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="83367626"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 03:17:04 -0800
X-CSE-ConnectionGUID: 7gGkL4ZgRVq+kHFgI/0HWQ==
X-CSE-MsgGUID: firFhxJgRG+D4ggfSe0sMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="197430808"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 03:17:01 -0800
Date: Mon, 24 Nov 2025 12:16:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: Re: [PATCH v5 5/5] xe/treewide: use xe_query helpers for query GT
 topology
Message-ID: <20251124111641.m35rwb3ejptzjtqs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
 <20251121-xe_query_helpers-v5-5-d69c1c160e96@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121-xe_query_helpers-v5-5-d69c1c160e96@intel.com>
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
On 2025-11-21 at 11:59:04 +0100, Andrzej Hajda wrote:
> Using xe_query_device and xe_for_each_topology_mask simplifies the code.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/xe/xe_oa.c                  | 37 ++++++----------------
>  tests/intel/xe_eudebug_online.c | 30 +++---------------
>  tests/intel/xe_query.c          | 69 ++++++++++-------------------------------

Could you split this into separate commits?
One for lib change lib/xe/xe_oa: use helpers for topology
and rest for respective tests?

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

>  3 files changed, 30 insertions(+), 106 deletions(-)
> 
> diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
> index 428e7d0a2980dba1106d62a4bf20e56af5b9997a..229deafa7132fd7d4992d419146c3620314abe3e 100644
> --- a/lib/xe/xe_oa.c
> +++ b/lib/xe/xe_oa.c
> @@ -450,15 +450,9 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
>  	const struct intel_device_info *devinfo = intel_get_device_info(device_id);
>  	struct intel_xe_topology_info topinfo = {};
>  	struct intel_xe_topology_info *ptopo;
> -	struct drm_xe_query_topology_mask *xe_topo;
> -	int pos = 0;
> +	struct drm_xe_query_topology_mask *xe_topo, *topo;
> +	uint32_t size;
>  	u8 *ptr;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
> -		.size = 0,
> -		.data = 0,
> -	};
>  
>  	/* Only ADL-P, DG2 and newer ip support hwconfig, use hardcoded values for previous */
>  	if (intel_graphics_ver(device_id) >= IP_VER(12, 55) || devinfo->is_alderlake_p) {
> @@ -485,31 +479,21 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
>  	ptr = (u8 *)ptopo + sizeof(topinfo);
>  	*ptr++ = 0x1;					/* slice mask */
>  
> -	/* Get xe topology masks */
> -	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_assert_neq(query.size, 0);
> -
> -	xe_topo = malloc(query.size);
> -	igt_assert(xe_topo);
> +	xe_topo = xe_query_device(drm_fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
> +	igt_debug("Topology size: %d\n", size);
>  
> -	query.data = to_user_pointer(xe_topo);
> -	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_debug("Topology size: %d\n", query.size);
> -
> -	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
> -		struct drm_xe_query_topology_mask *topo =
> -			(struct drm_xe_query_topology_mask*)((unsigned char*)xe_topo + pos);
> -		int i, sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
> +	xe_for_each_topology_mask(xe_topo, size, topo) {
>  		u64 geom_mask, compute_mask;
>  
> -		igt_debug(" gt_id: %d type: %d n:%d [%d] ", topo->gt_id, topo->type, topo->num_bytes, sz);
> +		igt_debug(" gt_id: %d type: %d n:%d [%zd] ", topo->gt_id, topo->type, topo->num_bytes,
> +			  sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes);
>  		for (int j=0; j< topo->num_bytes; j++)
>  			igt_debug(" %02x", topo->mask[j]);
>  		igt_debug("\n");
>  
>  		/* i915 only returns topology for gt 0, do the same here */
>  		if (topo->gt_id)
> -			goto next;
> +			continue;
>  
>  		/* Follow the same order as in xe query_gt_topology() */
>  		switch (topo->type) {
> @@ -525,7 +509,7 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
>  			break;
>  		case DRM_XE_TOPO_EU_PER_DSS:
>  		case DRM_XE_TOPO_SIMD16_EU_PER_DSS:
> -			for (i = 0; i < ptopo->max_subslices; i++) {
> +			for (int i = 0; i < ptopo->max_subslices; i++) {
>  				memcpy(ptr, topo->mask, ptopo->eu_stride);
>  				ptr += ptopo->eu_stride;
>  			}
> @@ -535,9 +519,6 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
>  		default:
>  			igt_assert(0);
>  		}
> -next:
> -		query.size -= sz;
> -		pos += sz;
>  	}
>  
>  	free(xe_topo);
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index a5b2864a47a34b9051756174f73667bbc602e00b..1e160b0c3d8a3d616bfd99e2a99fb6b0d042f021 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1208,36 +1208,14 @@ static int query_attention_bitmask_size(int fd, int gt)
>  {
>  	uint32_t threads_per_eu = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
>  	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
> -	struct drm_xe_query_topology_mask *topology;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
> -		.size = 0,
> -		.data = 0,
> -	};
> +	struct drm_xe_query_topology_mask *topology, *topo;
>  	uint8_t dss_mask, last_dss;
> -	int pos = 0;
> +	uint32_t size;
>  	int i, last_dss_idx;
>  
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_assert_neq(query.size, 0);
> -
> -	topology = malloc(query.size);
> -	igt_assert(topology);
> -
> -	query.data = to_user_pointer(topology);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
> -		struct drm_xe_query_topology_mask *topo;
> -		int sz;
> -
> -		topo = (struct drm_xe_query_topology_mask *)((unsigned char *)topology + pos);
> -		sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
> -
> -		query.size -= sz;
> -		pos += sz;
> +	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
>  
> +	xe_for_each_topology_mask(topology, size, topo) {
>  		if (topo->gt_id != gt)
>  			continue;
>  
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 928daaf5875d8e62888f8b994e31d5d6315afe73..36f9d87002d50ff3f4973657def65e282e53c899 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -358,42 +358,25 @@ static void
>  test_query_gt_topology(int fd)
>  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
> -	struct drm_xe_query_topology_mask *topology;
> -	int pos = 0;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
> -		.size = 0,
> -		.data = 0,
> -	};
> -	uint32_t topo_types = 0;
> +	struct drm_xe_query_topology_mask *topology, *topo;
> +	uint32_t topo_types = 0, size;
>  
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_assert_neq(query.size, 0);
> -
> -	topology = malloc(query.size);
> -	igt_assert(topology);
> +	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
>  
> -	query.data = to_user_pointer(topology);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_info("size: %d\n", size);
>  
> -	igt_info("size: %d\n", query.size);
> -	dump_hex_debug(topology, query.size);
> +	dump_hex_debug(topology, size);
>  
> -	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
> -		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask*)((unsigned char*)topology + pos);
> -		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
> -
> -		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
> -			 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
> +	xe_for_each_topology_mask(topology, size, topo) {
> +		igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%zd] ", topo->gt_id,
> +			 get_topo_name(topo->type), topo->type, topo->num_bytes,
> +			 sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes);
>  
>  		for (int j=0; j< topo->num_bytes; j++)
>  			igt_info(" %02x", topo->mask[j]);
>  
>  		topo_types = 1 << topo->type;
>  		igt_info("\n");
> -		query.size -= sz;
> -		pos += sz;
>  	}
>  
>  	/* sanity check EU type */
> @@ -422,35 +405,20 @@ static void
>  test_query_gt_topology_l3_bank_mask(int fd)
>  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
> -	struct drm_xe_query_topology_mask *topology;
> -	int pos = 0;
> -	struct drm_xe_device_query query = {
> -		.extensions = 0,
> -		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
> -		.size = 0,
> -		.data = 0,
> -	};
> +	struct drm_xe_query_topology_mask *topology, *topo;
> +	uint32_t size;
>  
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_assert_neq(query.size, 0);
> +	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
>  
> -	topology = malloc(query.size);
> -	igt_assert(topology);
> -
> -	query.data = to_user_pointer(topology);
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -
> -	igt_info("size: %d\n", query.size);
> -
> -	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
> -		struct drm_xe_query_topology_mask *topo = (struct drm_xe_query_topology_mask *)((unsigned char *)topology + pos);
> -		int sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
> +	igt_info("size: %d\n", size);
>  
> +	xe_for_each_topology_mask(topology, size, topo) {
>  		if (topo->type == DRM_XE_TOPO_L3_BANK) {
>  			int count = 0;
>  
> -			igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%d] ", topo->gt_id,
> -				 get_topo_name(topo->type), topo->type, topo->num_bytes, sz);
> +			igt_info(" gt_id: %2d type: %-12s (%d) n:%d [%zd] ", topo->gt_id,
> +				 get_topo_name(topo->type), topo->type, topo->num_bytes,
> +				 sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes);
>  			for (int j = 0; j < topo->num_bytes; j++)
>  				igt_info(" %02x", topo->mask[j]);
>  
> @@ -471,9 +439,6 @@ test_query_gt_topology_l3_bank_mask(int fd)
>  			else if (IS_DG2(dev_id))
>  				igt_assert_eq((count % 8), 0);
>  		}
> -
> -		query.size -= sz;
> -		pos += sz;
>  	}
>  
>  	free(topology);
> 
> -- 
> 2.43.0
> 
