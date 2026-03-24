Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AAEE9A75C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 10:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98B710E5CA;
	Tue, 24 Mar 2026 10:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiST4RCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AF410E5CA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774347076; x=1805883076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9qZ7agN4f/gTKuDRZeJ05p2w01W9sDhHiEsg6UWuE+I=;
 b=RiST4RCCXbaN042VTlsrX4+jM133C/OLz+p1SkHqG9JgISmmZ9ZiIWb7
 SUOpTib5W4gL94lcvBD2c7N4ApbH6GDw94kyYuTVPved/EoTJ1T6Lmv2m
 aAKMsOIsBZpCMfb59UJ8YDa2Rcj0PpTvaAUXFmo7HO3zdjor/1IXsm156
 Z3HdhrTUCIG9RP8O/59Y1UCfCw6Q0UfZBCaIDxtU33VMPOKFLOLP5jow1
 XH8lGRHBvCoFGiIHey11vMB6jVoi8GxEiezyb1/90nazZcZGN4fW1XfHM
 CI+evboX5CdqAMplpPcUEaYR/PYoIN+b+8gqwoq3/5tnuG1vihG16/3eq Q==;
X-CSE-ConnectionGUID: 8xf8TUNvQsS8o4So33ujzg==
X-CSE-MsgGUID: mwpNhlJyRSKR0T++EhAHmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="62910182"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="62910182"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 03:11:15 -0700
X-CSE-ConnectionGUID: 6QXY9QuqTj+Gj17pNzdX4w==
X-CSE-MsgGUID: 2anuR6SRQaqSPtWFnRokmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="262231501"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 03:11:14 -0700
Date: Tue, 24 Mar 2026 11:11:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 05/49] lib/igt_kms: Add helper to wait for new
 connectors
Message-ID: <20260324101111.62xsmn5hb7hkcbfq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-5-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-unigraf-integration-v9-5-a01dffc3b0cb@bootlin.com>
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
On 2026-03-16 at 17:17:26 +0100, Louis Chauvet wrote:
> Add list comparison utilities and a new function to wait for new
> connectors to appear on the system.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/igt_kms.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  6 ++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f0f27ccda9d8..b220de419a70 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8322,3 +8322,100 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
>  
>  	return 0;
>  }
> +
> +/**
> + * array_contains() - Search an element in the array
> + *
> + * @array: Pointer to the array to search into
> + * @array_len: Length of the array
> + * @value: Value to search in the array
> + *
> + * Returns true if @array contains @value
> + */
> +static bool array_contains(const uint32_t *array, int array_len, uint32_t value)
> +{
> +	igt_assert(array_len == 0 || array);
> +
> +	for (int i = 0; i < array_len; i++)
> +		if (array[i] == value)
> +			return true;
> +
> +	return false;
> +}
> +
> +/**
> + * get_array_diff() - Compute and return the set difference between two arrays
> + *
> + * @array_a: Pointer to the first array to compare
> + * @array_a_len: Length of the first array
> + * @array_b: Pointer to the second array to compare
> + * @array_b_len: Length of the second array
> + * @diff: Out pointer returning a array of items in @array_a but not
> + *        in @array_b. Can be NULL to only count the elements.
> + *
> + * Returns the number of element which are in @array_a but not in @array_b.
> + */
> +int
> +get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
> +	       uint32_t **diff)
> +{
> +	int diff_len = 0;
> +
> +	igt_assert(array_a_len == 0 || array_a);
> +	igt_assert(array_b_len == 0 || array_b);
> +
> +	if (diff)
> +		*diff = NULL;
> +
> +	for (int i = 0; i < array_a_len; i++) {
> +		if (!array_contains(array_b, array_b_len, array_a[i])) {
> +			if (diff) {
> +				*diff = reallocarray(*diff, diff_len + 1, sizeof(**diff));
> +				igt_assert(*diff);
> +				(*diff)[diff_len] = array_a[i];
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
> + * @newly_connected: Out pointer returning the array of connectors currently
> + *                   found connected
> + * @already_connected: Input pointer to array of connectors previously
> + *                     connected
> + * @already_connected_count: Length of @already_connected
> + * @drm_fd: DRM file descriptor
> + *
> + * Returns the number of connectors not in @already_connected and currently
> + * found connected.

Document when this function will assert.

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

This will fail only for 0, but invalid drm_fd could be -1.
There is a separate assert macro for fd.

> +
> +	igt_assert_eq(igt_gettime(&start), 0);
> +	igt_assert_eq(igt_gettime(&end), 0);

You do not need it here, it will be filled just before 'while'.

> +	do {
> +		if (*newly_connected)
> +			free(*newly_connected);

Also document that it will free anything passed to it in newly_connected
and refill it.

Regards,
Kamil

> +		newly_connected_count = igt_get_connected_connectors(drm_fd, newly_connected);
> +		igt_assert_eq(igt_gettime(&end), 0);
> +	} while (!get_array_diff(*newly_connected, newly_connected_count,
> +			       already_connected, already_connected_count,
> +			       NULL) &&
> +		 igt_time_elapsed(&start, &end) <= igt_default_display_detect_timeout());
> +
> +	return newly_connected_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0095d9610e42..c6aae034b5b9 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1308,4 +1308,10 @@ drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_nam
>  uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
>  uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
>  
> +int kms_wait_for_new_connectors(uint32_t **newly_connected,
> +				const uint32_t *already_connected,
> +				int already_connected_count, int drm_fd);
> +int
> +get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
> +	       uint32_t **diff);
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.52.0
> 
