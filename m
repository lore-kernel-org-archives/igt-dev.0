Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F20FD41C33
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 11:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D16610E6D0;
	Wed, 13 Nov 2024 11:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Es0boHY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3577C10E6D0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731495737; x=1763031737;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2Yu0DQZMwWj2PQ9S2LGj0kaO6SoTVPX1C2solJ6GYOY=;
 b=Es0boHY4Hm/4uRipJOUYBr6XhE1Q4OiiqyLTKYft716zub89s2/otDR3
 oghK9iTlwmnBCrszO1HpCczhm75TdEI3VhKRkIUX97+W+Vp2jgmTdQ+dF
 zlzfqvQF3XwbQwoqvp/VFNk/j4zpTP8nenxWJ0iicEdx6uWjShaffuuSm
 3L6jZbTwIGgHqchJgrCBh+hHvXjf+sXQxWbAPQ7Q52ya3T6n1Juxp+m/4
 puajaatNFIa+b5Pk1ku8NP5tmIm/L5wv/cwLgpVrQhh0aA/GP7KKJ+yr5
 Cx8XvWuPAvGYI5EMgOFb3RcoAlRnKgMTKDaxSnp1A6QeHXukeE7kwvNKk g==;
X-CSE-ConnectionGUID: fV9l6BTxQrePnZnozqMWhw==
X-CSE-MsgGUID: AhXZlKvwQL+N8dnrVl2agg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42788764"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="42788764"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 03:02:17 -0800
X-CSE-ConnectionGUID: KL89AyADRlmDXlrP7Ab9Lw==
X-CSE-MsgGUID: ug//DpcMSXW7CfrZu212JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="92915432"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.102])
 ([10.245.245.102])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 03:02:16 -0800
Message-ID: <590f5b41-bf77-4485-aa84-4802c6a82d13@intel.com>
Date: Wed, 13 Nov 2024 12:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/xe_eudebug: Add support for exec queue
 placements events.
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
 <20241113085155.209198-2-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241113085155.209198-2-dominik.grzegorzek@intel.com>
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

On 13.11.2024 09:51, Dominik Grzegorzek wrote:
> Adds definition and support for DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS,
> which is sent during exec_queue creation/discovery.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

> ---
>   lib/xe/xe_eudebug.c | 101 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 97 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 74aa26024..c5814421b 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -77,6 +77,8 @@ static const char *type_to_str(unsigned int type)
>   		return "vm";
>   	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
>   		return "exec_queue";
> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS:
> +		return "exec_queue_placements";
>   	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
>   		return "attention";
>   	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
> @@ -120,6 +122,18 @@ static const char *flags_to_str(unsigned int flags)
>   	return "flags unknown";
>   }
>   
> +static const char *eu_engine_class_to_str(uint16_t engine_class)
> +{
> +	switch (engine_class) {
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "ccs";
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "rcs";
> +	default:
> +		return "unsupported class";
> +	}
> +}
> +
>   static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *buf)
>   {
>   	switch (e->type) {
> @@ -145,6 +159,26 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
>   			ee->exec_queue_handle, ee->engine_class, ee->width);
>   		break;
>   	}
> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
> +		struct drm_xe_eudebug_event_exec_queue_placements *ee = (void *)e;
> +		struct drm_xe_engine_class_instance *instances = (void *)(ee->instances);
> +		int i, l;
> +
> +		l = sprintf(buf, "client_handle=%llu, vm_handle=%llu, "
> +			    "exec_queue_handle=%llu, lrc_handle=%llu, "
> +			    "num_placements=%d, gt_id=%d, mask=[",
> +			    ee->client_handle, ee->vm_handle,
> +			    ee->exec_queue_handle, ee->lrc_handle,
> +			    ee->num_placements, instances[0].gt_id);
> +
> +		for (i = 0; i < ee->num_placements; i++)
> +			l += sprintf(buf + l, "%s%d pad%d, ",
> +				     eu_engine_class_to_str(instances[i].engine_class),
> +				     instances[i].engine_instance, instances[i].pad);
> +		buf[l - 2] = ']';
> +
> +		break;
> +	}
>   	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
>   		struct drm_xe_eudebug_event_eu_attention *ea = (void *)e;
>   
> @@ -423,6 +457,17 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
>   			ret = 1;
>   		break;
>   	}
> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
> +		struct drm_xe_eudebug_event_exec_queue_placements *ae = (void *)a;
> +		struct drm_xe_eudebug_event_exec_queue_placements *be = (void *)b;
> +
> +		if (ae->num_placements == be->num_placements &&
> +		    memcmp(ae->instances, be->instances,
> +			   sizeof(uint64_t) * ae->num_placements) == 0)
> +			ret = 1;
> +
> +		break;
> +	}
>   	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>   		struct drm_xe_eudebug_event_vm_bind *ea = (void *)a;
>   		struct drm_xe_eudebug_event_vm_bind *eb = (void *)b;
> @@ -490,6 +535,13 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
>   			return 1;
>   		break;
>   	}
> +	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
> +		struct drm_xe_eudebug_event_exec_queue_placements *ee = (void *)e;
> +
> +		if (ee->client_handle == h)
> +			return 1;
> +		break;
> +	}
>   	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>   		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
>   
> @@ -986,10 +1038,11 @@ xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t fil
>   			if (XE_EUDEBUG_EVENT_IS_FILTERED(ev1->type, filter))
>   				continue;
>   
> -			/* No opposite matching for binds */
> +			/* No opposite matching for some events */
>   			if ((ev1->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
>   			     ev1->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE) ||
> -			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
> +			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA ||
> +			    ev1->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
>   				continue;
>   
>   			ev2 = opposite_event_match(l, ev1, ev1);
> @@ -1679,6 +1732,36 @@ static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
>   	xe_eudebug_event_log_write(c->log, (void *)&ee);
>   }
>   
> +static void exec_queue_placements_event(struct xe_eudebug_client *c,
> +					int client_fd, uint32_t vm_id,
> +					uint32_t exec_queue_handle,
> +					uint16_t width, uint16_t lrc_no,
> +					uint16_t num_placements,
> +					struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_eudebug_event_exec_queue_placements *ee;
> +	struct drm_xe_engine_class_instance *instances;
> +	size_t sz = sizeof(*ee) + num_placements * sizeof(uint64_t);
> +
> +	ee = calloc(1, sz);
> +	igt_assert(ee);
> +
> +	base_event(c, to_base(*ee), DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS,
> +		   DRM_XE_EUDEBUG_EVENT_CREATE, sz);
> +
> +	ee->client_handle = client_fd;
> +	ee->vm_handle = vm_id;
> +	ee->exec_queue_handle = exec_queue_handle;
> +	ee->num_placements = num_placements;
> +
> +	instances = (struct drm_xe_engine_class_instance *)(ee->instances);
> +	for (int j = 0; j < num_placements; j++)
> +		instances[j] = eci[j * width + lrc_no];
> +
> +	xe_eudebug_event_log_write(c->log, (void *)ee);
> +	free(ee);
> +}
> +
>   static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
>   			   int client_fd, uint32_t id, uint64_t type, uint64_t len)
>   {
> @@ -1853,6 +1936,7 @@ void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t
>   uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
>   					     struct drm_xe_exec_queue_create *create)
>   {
> +	struct drm_xe_engine_class_instance *instances;
>   	struct drm_xe_ext_set_property *ext;
>   	bool send = false;
>   	uint16_t class;
> @@ -1860,7 +1944,8 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
>   	igt_assert(c);
>   	igt_assert(create);
>   
> -	class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
> +	instances = (struct drm_xe_engine_class_instance *)(create->instances);
> +	class = instances[0].engine_class;
>   
>   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, create), 0);
>   
> @@ -1871,10 +1956,18 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
>   		    ext->value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
>   			send = true;
>   
> -	if (send)
> +	if (send) {
>   		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create->vm_id,
>   				 create->exec_queue_id, class, create->width);
>   
> +		for (int i = 0; i < create->width; i++) {
> +			exec_queue_placements_event(c, fd, create->vm_id, create->exec_queue_id,
> +						    create->width, i,
> +						    create->num_placements,
> +						    instances);
> +		}
> +	}
> +
>   	return create->exec_queue_id;
>   }
>   
