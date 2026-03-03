Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C2FEDA6BE
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 18:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D456310E084;
	Tue,  3 Mar 2026 18:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brN4MR+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338E410E084
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 18:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772560841; x=1804096841;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yK8z+gvZZZRtAC3zov8gQVbEsp5sUQ8R1SdjccyY18I=;
 b=brN4MR+nug19cyAgF6FLN0Nf1+z/Row0pmZUtYqqFe0+AUIqXjGJnSt2
 MglHpkAu/uNydVkI9mJXFFYcX942kSYchwVY+/VRiUjFXXeUYRDWTxVh3
 ChtyGGqWn2oRQybD/a1ngFaCv8qsWdUT0qQUCWsjhJysa4Wp9j4MXF44o
 nvBk6nWrf4P78kadrbukG/iE1O38hfwn95/+amIoqv0/lj0KdGnKKY7bv
 6PJixC9Fmvjrwii1Ye5qlduSPZH7D+01ZfuFMWiVlqmnNvYZVymYcm/aY
 KlqAqUQKXyPWPPxByJrP6OQXkkMm4VJYA32+rv1cSyxevuymiFJNCD8l0 Q==;
X-CSE-ConnectionGUID: 27N2gTZ2TBudOXCDQuQJCg==
X-CSE-MsgGUID: oaPT7SWVQFm/JH5JoSPlYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="72809035"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="72809035"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:00:23 -0800
X-CSE-ConnectionGUID: EgNLOFs5QyyegUcNmLI+Aw==
X-CSE-MsgGUID: CS+Ql4DBTGqtOYz2+WZqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="248563319"
Received: from prakharp-mobl2.gar.corp.intel.com (HELO [10.247.190.213])
 ([10.247.190.213])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:00:17 -0800
Message-ID: <a1907d28-120b-4633-b443-97570d5c4c4b@intel.com>
Date: Tue, 3 Mar 2026 23:30:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v7,06/48] lib/igt_kms: Add helper to get a pipe from a
 connector
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com,
 kory.maincent@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260223-unigraf-integration-v7-6-73dc9143c8c1@bootlin.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260223-unigraf-integration-v7-6-73dc9143c8c1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello Louis,

On 23-02-2026 17:39, Louis Chauvet wrote:
> Currently there is no way to get a pipe from the connector. Add this tiny
> helper that will try to get the currently used pipe for a specific
> connector.
>
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  3 +++
>   2 files changed, 44 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 514d905fe1fe..1c03542c87d7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8266,3 +8266,44 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
>   
>   	return newly_connected_count;
>   }
> +
> +/**
> + * igt_get_crtc_index_from_connector_id() - Get a pipe from the connector id
> + * @drm_fd: drm file descriptor to which the connector belongs
> + * @connector_id: connector to inspect
> + *
> + * Returns 0 if the connector is not connected to any pipe
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
Isn't 0 a valid crtc_index?

Thanks and Regards
Kunal Joshi
> +	}
> +	return 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a0b36efd8ebb..86bdb4d5031c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1332,4 +1332,7 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
>   int
>   get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
>   	      uint32_t **diff);
> +
> +int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id);
> +
>   #endif /* __IGT_KMS_H__ */
