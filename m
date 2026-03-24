Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1736CF532E9
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 07:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC5E10E5F9;
	Tue, 24 Mar 2026 07:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LzNRN03c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABFE10E5F9
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774339128; x=1805875128;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gGBQKibqRFA6ma9stcNpP0wXN9WvRyhQuFSYGFsW7kM=;
 b=LzNRN03c5a/gKThdKbtoFaw3SstcgbMS41DHm+D/ILNY2tYqd/VS+Q2I
 /u3HX/uPDVx7oXTcem3Lwyhzhbua88WCKJjk4Q9zt71dF2rgCthdCo9rF
 wV9zzYcc3FZEzBXPrj/1p5kguBAXEjU1H4WfmiiK2OAvUGzueSlHAYaYR
 crADU23DYZ7ilFrrhtExMwvLFGZ2J9JwJmGIdlxtEjqmcFxIqsXDNpN3Z
 +/68KE7cXTRcWAu7Jc0Mq2s8WvdQOZ5W4JZC//rwU3odH7+f1VKhyCBMZ
 47YQ4rk4XXnJ+SbuwVs//QfFLd0g1w0BqNjvGAWFk+aEcVe5E/vAptUJE g==;
X-CSE-ConnectionGUID: AUnBLSc2R8SraacMgpZIaA==
X-CSE-MsgGUID: l/HJQ3keS6SY+l23t7s3yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75465601"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75465601"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 00:58:48 -0700
X-CSE-ConnectionGUID: SG1mly78RGeX0ukvPWCjpw==
X-CSE-MsgGUID: peRuHFCJQ3WtF7bjQjqSkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229211993"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 00:58:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com,
 kory.maincent@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v9 07/49] lib/igt_kms: Add helper to get a pipe
 from a connector
In-Reply-To: <20260316-unigraf-integration-v9-7-a01dffc3b0cb@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-7-a01dffc3b0cb@bootlin.com>
Date: Tue, 24 Mar 2026 09:58:41 +0200
Message-ID: <3997f67885d5753c56d5b32aa4f2881ff699af36@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 16 Mar 2026, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
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
> + */
> +int igt_get_crtc_index_from_connector_id(int drm_fd, int connector_id)
> +{
> +	drmModeObjectPropertiesPtr proplist;
> +	drmModePropertyPtr crtc_id_prop;
> +	drmModePropertyPtr prop;
> +	enum pipe crtc_index;

Pipes are pipes, CRTC indexes are indexes, and should not be conflated.

The CRTC index should just be an int.

BR,
Jani.

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

-- 
Jani Nikula, Intel
