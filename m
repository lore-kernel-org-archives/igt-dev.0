Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC6CE9A75C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 10:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908AB10E124;
	Tue, 24 Mar 2026 10:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfM2ygiz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734B510E5CA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774346572; x=1805882572;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z6QpSUh2rcsmVS/DQUJW9X4EmlgxmFqbBBW0vs/ozk4=;
 b=FfM2ygiznRgiCF6S2mEOg57yMj66v1YaGyhpgL+Amkicwm2mqmA3djrc
 Wvsd4kPPJVXA3FNPjS7S+hcN1PPkV8J/BYgZaIhp64BN9nyyfauQPYqtc
 6W7yEa0uBaq0H/rxfDF7hqupicMf/Qmt94Lo2qO9C2uiyDcRhgVHVh4vy
 yd9YMcOY7kaeBZ6l71mekSzpIbzVZ5VSWz5PTddBhs1mTEeFQDm9ju0Yu
 zForDi67nEgQynjCey4p2zDeEhNaEHCRpyzMHEn0MoRyebPVbPtWNjs5X
 RaaFSsO1t+WmqFGbBcYAO8WnMsRNrRhL3JF3i+u5j6Esm+TRkE7haT7Yn g==;
X-CSE-ConnectionGUID: siWqjgrKTk+e1R5BbvtyBQ==
X-CSE-MsgGUID: CauYCZeRRgKmIgxt+9SzLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79215178"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="79215178"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 03:02:47 -0700
X-CSE-ConnectionGUID: IOvxwT0ZRBGa37HRnkg2IQ==
X-CSE-MsgGUID: UqYJnnPGQH+iAxsZl5H5xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219415862"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:02:44 -0700
Date: Tue, 24 Mar 2026 11:02:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 07/49] lib/igt_kms: Add helper to get a pipe
 from a connector
Message-ID: <20260324100241.vbvthpame5uxnxo4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-7-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-unigraf-integration-v9-7-a01dffc3b0cb@bootlin.com>
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
On 2026-03-16 at 17:17:28 +0100, Louis Chauvet wrote:
> Currently there is no way to get a pipe from the connector. Add this tiny
> helper that will try to get the currently used pipe for a specific
> connector.
> 
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  3 +++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b220de419a70..1b34f5eb7ee7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8419,3 +8419,44 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
>  
>  	return newly_connected_count;
>  }
> +
> +/**
> + * igt_get_crtc_index_from_connector_id() - Get a pipe from the connector id
> + * @drm_fd: drm file descriptor to which the connector belongs
> + * @connector_id: connector to inspect
> + *
> + * Returns 0 if the connector is not connected to any pipe

Please also write that this function will assert on errors.
Can this be written without those asserts? +cc Swati, Karthik and J-P

Regards,
Kamil

> + */
> +int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
> +{
> +	drmModeObjectPropertiesPtr proplist;
> +	drmModePropertyPtr crtc_id_prop;
> +	drmModePropertyPtr prop;
> +	enum pipe crtc_index;
> +	uint32_t crtc_id;
> +	int i;
> +
> +	proplist = drmModeObjectGetProperties(drm_fd, connector_id, DRM_MODE_OBJECT_CONNECTOR);
> +	crtc_id_prop = NULL;
> +
> +	for (i = 0; i < proplist->count_props; i++) {
> +		prop = drmModeGetProperty(drm_fd, proplist->props[i]);
> +
> +		if (strcmp(prop->name, "CRTC_ID") == 0) {
> +			crtc_id_prop = prop;
> +			break;
> +		}
> +		drmModeFreeProperty(prop);
> +	}
> +
> +	igt_assert(crtc_id_prop);
> +	igt_assert((crtc_id_prop->flags & DRM_MODE_PROP_EXTENDED_TYPE) == DRM_MODE_PROP_OBJECT);
> +	crtc_id = proplist->prop_values[i];
> +	drmModeFreeProperty(crtc_id_prop);
> +	drmModeFreeObjectProperties(proplist);
> +	if (crtc_id != 0) {
> +		crtc_index = kmstest_get_crtc_index_from_id(drm_fd, crtc_id);
> +		return crtc_index;
> +	}
> +	return 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c6aae034b5b9..d346801e7915 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1314,4 +1314,7 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
>  int
>  get_array_diff(const uint32_t *array_a, int array_a_len, const uint32_t *array_b, int array_b_len,
>  	       uint32_t **diff);
> +
> +int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
> +
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.52.0
> 
