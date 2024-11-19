Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF67ED44148
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 12:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9150010E2A9;
	Tue, 19 Nov 2024 12:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijVb4NLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5C10E128
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732019221; x=1763555221;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pIuKxIPLMqiHPx9xnBhxZjf2DqdLaHh3e0X8YArDYAA=;
 b=ijVb4NLkBrlTZWNNn19ZuXVTRlIz7OqdYxdhCeTZ7yhrt0HqdHzJerZs
 0bTelPTmz4cHt1OBtbLA44qRSNKV2TQTnTWckZqsS/0aM+oxjVmcPzGa2
 yM8Rxvyyheilg4rvMBzCmgZ5+4gtU2XT+vGXteXHRMYPDjklts+6lMJ9n
 6Nalu3ctrpXIKqjpmKWFzeWF16vQUI0N9q8MvBM5Ge95gi8COf3T6+avA
 Uh1FZ366tfHmqM3tZQnLA9Vt6U2vefeTFQM05RMdXjBAFShSCQiHl67+4
 P9mTP1+Gm98cGfa13Y0H01BWviOCxdQpiZD2mf0uRbpqZNR5AKs3xNpvV A==;
X-CSE-ConnectionGUID: COa1RtDgQrKIRsU+tn8PPw==
X-CSE-MsgGUID: LeYkgUmLRS2WP2kRnOnewA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43396539"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="43396539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:27:01 -0800
X-CSE-ConnectionGUID: Or715aXiRZmyTO/3xLG9GA==
X-CSE-MsgGUID: 0lzs2W/FRpmZGyCsZFyUYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89478521"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.74])
 ([10.245.244.74])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:26:59 -0800
Message-ID: <6249e681-808b-4212-818b-81204a4dc0e9@intel.com>
Date: Tue, 19 Nov 2024 13:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] eudebug: Add eudebug pagefault event
 declarations
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-4-gwan-gyeong.mun@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241115141132.866838-4-gwan-gyeong.mun@intel.com>
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

Hi Gwan-gyeong,

On 15.11.2024 15:11, Gwan-gyeong Mun wrote:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> Update the xe_eudebug drm to include pagefault events.
> 
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Acked-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph
> ---
>   include/drm-uapi-experimental/xe_drm_eudebug.h | 13 +++++++++++++
>   lib/xe/xe_eudebug.c                            | 11 +++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
> index f50051e9a..ed2e728c2 100644
> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> @@ -154,6 +154,7 @@ struct drm_xe_eudebug_event {
>   #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	9
>   #define DRM_XE_EUDEBUG_EVENT_METADATA		10
>   #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 11
> +#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		12
>   
>   	__u16 flags;
>   #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
> @@ -352,6 +353,18 @@ struct drm_xe_eudebug_event_vm_bind_op_metadata {
>   	__u64 metadata_cookie;
>   };
>   
> +struct drm_xe_eudebug_event_pagefault {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 exec_queue_handle;
> +	__u64 lrc_handle;
> +	__u32 flags;
> +	__u32 bitmask_size;
> +	__u64 pagefault_address;
> +	__u8 bitmask[];
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index c5814421b..de01e6b49 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -91,6 +91,8 @@ static const char *type_to_str(unsigned int type)
>   		return "metadata";
>   	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA:
>   		return "vm_bind_op_metadata";
> +	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT:
> +		return "pagefault";
>   	}
>   
>   	return "UNKNOWN";
> @@ -222,6 +224,15 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
>   			op->vm_bind_op_ref_seqno, op->metadata_handle, op->metadata_cookie);
>   		break;
>   	}
> +	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT: {
> +		struct drm_xe_eudebug_event_pagefault *pf = (void *)e;
> +
> +		sprintf(buf, "client_handle=%llu, exec_queue_handle=%llu, "
> +			"lrc_handle=%llu, bitmask_size=%d, pagefault_address=0x%llx",
> +			pf->client_handle, pf->exec_queue_handle, pf->lrc_handle,
> +			pf->bitmask_size, pf->pagefault_address);
> +		break;
> +	}
>   	default:
>   		strcpy(buf, "<...>");
>   	}
