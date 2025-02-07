Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE7EC02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 12:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D049A10E372;
	Fri,  7 Feb 2025 12:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGl5NiMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE12A10E372
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933095; x=1770469095;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ELljPxNUe6ouOgH73Opy1rQcP9rO81OXorfAfOzMS6U=;
 b=QGl5NiMFBrfJ9MI6EBxmDb5+I6DlmgY9P5tG2siJWKBnnwICR3tuW3kQ
 xqPSqrwT32ZZp9Rz4LgchMwNA1OlPufMswvihBpmNhgriLZVFy6HwZcqK
 mSce/5a8wngQDJqfPpv+Z+cD0bj7cJT2BT5p/qS32gn3gxFGhcpPXClhL
 xPqu/bNblKdwYh5xfdDy4IPkycp6LKulHPBSE7nvQCJ9ftsC2oBDxV3zu
 sJ6RYYyL3ve+33+CYf1FLI8UNRAcU9dVcsjGe5MBmPuu2HXXX9QPxD+LQ
 RkqknLGGa2YO5jj4CnoyrKI7DlauwdcojwKncue4U9QpzstZrJWwJc26f w==;
X-CSE-ConnectionGUID: AmaxiXcrSDqu0PlD/uZ0ow==
X-CSE-MsgGUID: FT9OKXUNR56phYZOZeo52A==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39700877"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39700877"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:58:14 -0800
X-CSE-ConnectionGUID: lFz8kTEbRTuDgFOG9yglOA==
X-CSE-MsgGUID: NzxXdH9pSYSdKVRlzlcxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112032515"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.126])
 ([10.245.246.126])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:58:13 -0800
Message-ID: <4a20dd51-a139-49c4-9624-7e2f484d6ca7@intel.com>
Date: Fri, 7 Feb 2025 13:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] Revert "lib/xe_eudebug: Add support for exec
 queue placements events"
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
 <20250207114935.1996323-3-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250207114935.1996323-3-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On 7.02.2025 12:49, Mika Kuoppala wrote:
> Exec queue placements support was dropped as unused.
> 
> This reverts commit 8c550873064f46ccc17661572f1aeec70a533213.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   lib/xe/xe_eudebug.c | 89 ++-------------------------------------------
>   1 file changed, 3 insertions(+), 86 deletions(-)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 19bec2d25..1205d945b 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -78,8 +78,6 @@ static const char *type_to_str(unsigned int type)
>   		return "vm";
>   	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
>   		return "exec_queue";
> -	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS:
> -		return "exec_queue_placements";
>   	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
>   		return "attention";
>   	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
> @@ -150,27 +148,6 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
>   			ee->exec_queue_handle, ee->engine_class, ee->width);
>   		break;
>   	}
> -	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
> -		struct drm_xe_eudebug_event_exec_queue_placements *ee = igt_container_of(e, ee,
> -											 base);
> -		struct drm_xe_engine_class_instance *instances = (void *)(ee->instances);
> -		int i, l;
> -
> -		l = sprintf(buf, "client_handle=%llu, vm_handle=%llu, "
> -			    "exec_queue_handle=%llu, lrc_handle=%llu, "
> -			    "num_placements=%d, gt_id=%d, mask=[",
> -			    ee->client_handle, ee->vm_handle,
> -			    ee->exec_queue_handle, ee->lrc_handle,
> -			    ee->num_placements, instances[0].gt_id);
> -
> -		for (i = 0; i < ee->num_placements; i++)
> -			l += sprintf(buf + l, "%s%d pad%d, ",
> -				     xe_engine_class_short_string(instances[i].engine_class),
> -				     instances[i].engine_instance, instances[i].pad);
> -		buf[l - 2] = ']';
> -
> -		break;
> -	}
>   	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
>   		struct drm_xe_eudebug_event_eu_attention *ea = igt_container_of(e, ea, base);
>   
> @@ -458,19 +435,6 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
>   			ret = 1;
>   		break;
>   	}
> -	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
> -		struct drm_xe_eudebug_event_exec_queue_placements *ae = igt_container_of(a, ae,
> -											 base);
> -		struct drm_xe_eudebug_event_exec_queue_placements *be = igt_container_of(b, be,
> -											 base);
> -
> -		if (ae->num_placements == be->num_placements &&
> -		    memcmp(ae->instances, be->instances,
> -			   sizeof(uint64_t) * ae->num_placements) == 0)
> -			ret = 1;
> -
> -		break;
> -	}
>   	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>   		struct drm_xe_eudebug_event_vm_bind *ea = igt_container_of(a, ea, base);
>   		struct drm_xe_eudebug_event_vm_bind *eb = igt_container_of(b, eb, base);
> @@ -538,14 +502,6 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
>   			return 1;
>   		break;
>   	}
> -	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
> -		struct drm_xe_eudebug_event_exec_queue_placements *ee = igt_container_of(e, ee,
> -											 base);
> -
> -		if (ee->client_handle == h)
> -			return 1;
> -		break;
> -	}
>   	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
>   		struct drm_xe_eudebug_event_vm_bind *evmb = igt_container_of(e, evmb, base);
>   
> @@ -1044,11 +1000,10 @@ xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t fil
>   			if (XE_EUDEBUG_EVENT_IS_FILTERED(ev1->type, filter))
>   				continue;
>   
> -			/* No opposite matching for some events */
> +			/* No opposite matching for binds */
>   			if ((ev1->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
>   			     ev1->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE) ||
> -			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA ||
> -			    ev1->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
> +			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
>   				continue;
>   
>   			ev2 = opposite_event_match(l, ev1, ev1);
> @@ -1739,36 +1694,6 @@ static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
>   	xe_eudebug_event_log_write(c->log, (void *)&ee);
>   }
>   
> -static void exec_queue_placements_event(struct xe_eudebug_client *c,
> -					int client_fd, uint32_t vm_id,
> -					uint32_t exec_queue_handle,
> -					uint16_t width, uint16_t lrc_no,
> -					uint16_t num_placements,
> -					struct drm_xe_engine_class_instance *eci)
> -{
> -	struct drm_xe_eudebug_event_exec_queue_placements *ee;
> -	struct drm_xe_engine_class_instance *instances;
> -	size_t sz = sizeof(*ee) + num_placements * sizeof(uint64_t);
> -
> -	ee = calloc(1, sz);
> -	igt_assert(ee);
> -
> -	base_event(c, to_base(*ee), DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS,
> -		   DRM_XE_EUDEBUG_EVENT_CREATE, sz);
> -
> -	ee->client_handle = client_fd;
> -	ee->vm_handle = vm_id;
> -	ee->exec_queue_handle = exec_queue_handle;
> -	ee->num_placements = num_placements;
> -
> -	instances = (struct drm_xe_engine_class_instance *)(ee->instances);
> -	for (int j = 0; j < num_placements; j++)
> -		instances[j] = eci[j * width + lrc_no];
> -
> -	xe_eudebug_event_log_write(c->log, (void *)ee);
> -	free(ee);
> -}
> -
>   static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
>   			   int client_fd, uint32_t id, uint64_t type, uint64_t len)
>   {
> @@ -1963,18 +1888,10 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
>   		    ext->value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
>   			send = true;
>   
> -	if (send) {
> +	if (send)
>   		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create->vm_id,
>   				 create->exec_queue_id, class, create->width);
>   
> -		for (int i = 0; i < create->width; i++) {
> -			exec_queue_placements_event(c, fd, create->vm_id, create->exec_queue_id,
> -						    create->width, i,
> -						    create->num_placements,
> -						    instances);
> -		}
> -	}
> -
>   	return create->exec_queue_id;
>   }
>   
