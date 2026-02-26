Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C830FD8FCF
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 16:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA5310E99D;
	Thu, 26 Feb 2026 16:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJPnaBVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E3810E99D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772122667; x=1803658667;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZV1JYPhEsgiy3i6QSf5Cgu9xN7206KkIUTXBBYuI1ug=;
 b=oJPnaBVeBQ4Hn0Aw1af/92/g0Szc+oPJZy3K+szMDyhYO3Lr0LlpMH5n
 M52XAJU40YNmpbfvO3Y/eQApowhIQUcUbMhKJD8WvezzcOjpcA/z0KpkB
 +dh6zEJcqzqYiOHfkmyhgz5R1pFbT4z0HGAGgyBkkL5YZfd8UQ7qw3aCD
 nNUvUndpFe9QTneCMMliYeX8OO5AzctdikK5gBxLnbDFS0s0EgKs/TH+H
 oTJ0er9lMLOTAM4yfJ+AuzPNdRRW9nyknVmaLxMPN4VoKdZ03Jz5K4ove
 N1X3EGbWeXr6m521wcdrJw+UX5sAxqQCNEs7nkXy0rrU1QwzkwJiFFY1z g==;
X-CSE-ConnectionGUID: nA0bCvXARWe/7CTJPsID0A==
X-CSE-MsgGUID: PxIJJLZxS5WPfZnj+ceuJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75790081"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="75790081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:17:46 -0800
X-CSE-ConnectionGUID: h3pyGvHMTzqzrG0hT/K0Ug==
X-CSE-MsgGUID: rIo7GO5RT1aM+WhX3+8SeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214570576"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 08:17:45 -0800
Date: Thu, 26 Feb 2026 17:17:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 05/48] lib/igt_kms: Add helper to wait for new
 connectors
Message-ID: <20260226161742.r4p6dk3dxs7brdwt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-5-73dc9143c8c1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-unigraf-integration-v7-5-73dc9143c8c1@bootlin.com>
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

Hi Louis,
On 2026-02-23 at 13:09:12 +0100, Louis Chauvet wrote:
> Add list comparison utilities and a new function to wait for new
> connectors to appear on the system.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/igt_kms.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  6 ++++
>  2 files changed, 102 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8876ee8a11f7..514d905fe1fe 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8170,3 +8170,99 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
>  
>  	return 0;
>  }
> +
> +/**
> + * list_contains() - Search an element in the list
> + *
> + * @list: Pointer to the list to search into
> + * @list_len: Length of the list
> + * @value: Value to search in the list
> + *
> + * Returns true if @list contains @value
> + */
> +static bool list_contains(const uint32_t *list, int list_len, uint32_t value)

Why do you name it a list? It is an array. Do we need abstract data types
in igt, like igt_array? Also, you keep only uint32 as values.

There is already a list ADT in igt, maybe you could reuse and extend it?

Regards,
Kamil

> +{
> +	igt_assert((!list && list_len == 0) || list);
> +	for (int i = 0; i < list_len; i++) {
> +		if (list[i] == value)
> +			return true;
> +	}
> +	return false;
> +}
> +
> +/**
> + * get_list_diff() - Compute and return the set difference between two lists
> + *
> + * @list_a: Pointer to the first list to compare
> + * @list_a_len: Length of the first list
> + * @list_b: Pointer to the second list to compare
> + * @list_b_len: Length of the second list
> + * @diff: Out pointer returning a list of items in list_a but not
> + *        in list_b. Can be NULL to only count the elements.
> + *
> + * Returns the number of element which are in @list_a but not in @list_b.
> + */
> +int
> +get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
> +	      uint32_t **diff)
> +{
> +	int diff_len = 0;
> +
> +	igt_assert((!list_a && list_a_len == 0) || list_a);
> +	igt_assert((!list_b && list_b_len == 0) || list_b);
> +
> +	if (diff)
> +		*diff = malloc(sizeof(**diff));
> +
> +	for (int i = 0; i < list_a_len; i++) {
> +		if (!list_contains(list_b, list_b_len, list_a[i])) {
> +			if (diff) {
> +				*diff = reallocarray(*diff, diff_len + 1, sizeof(**diff));
> +				igt_assert(*diff);
> +				(*diff)[diff_len] = list_a[i];
> +			}
> +
> +			diff_len++;
> +		}
> +	}
> +
> +	return diff_len;
> +}
> +
> +/**
> + * kms_wait_for_new_connectors() - Wait for new connector to appear
> + *
> + * @newly_connected: Out pointer returning the list of connectors currently
> + *                   found connected
> + * @already_connected: Input pointer to list of connectors previously
> + *                     connected
> + * @already_connected_count: Length of @already_connected
> + * @drm_fd: DRM file descriptor
> + *
> + * Returns the number of connectors not in @already_connected and currently
> + * found connected.
> + */
> +int kms_wait_for_new_connectors(uint32_t **newly_connected,
> +				const uint32_t *already_connected,
> +				int already_connected_count, int drm_fd)
> +{
> +	int newly_connected_count;
> +	struct timespec start, end;
> +
> +	igt_assert(newly_connected);
> +	igt_assert(drm_fd);
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	clock_gettime(CLOCK_MONOTONIC, &end);
> +	do {
> +		if (*newly_connected)
> +			free(*newly_connected);
> +		newly_connected_count = igt_get_connected_connectors(drm_fd, newly_connected);
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +	} while (get_list_diff(*newly_connected, newly_connected_count,
> +			       already_connected, already_connected_count,
> +			       NULL) == 0 &&
> +		 igt_time_elapsed(&start, &end) <= igt_default_display_detect_timeout());
> +
> +	return newly_connected_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 52b62252683b..a0b36efd8ebb 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1326,4 +1326,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
>  uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
>  uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
>  
> +int kms_wait_for_new_connectors(uint32_t **newly_connected,
> +				const uint32_t *already_connected,
> +				int already_connected_count, int drm_fd);
> +int
> +get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
> +	      uint32_t **diff);
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.52.0
> 
