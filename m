Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBDDD60074
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 08:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC12D10E5F5;
	Tue, 19 Nov 2024 08:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1gWSb+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB8710E5FA
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732006261; x=1763542261;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=japYxkD+AmwGBvXLEmVG71JvCufS4Io6VplDFW8VTf8=;
 b=g1gWSb+EvEqLrne876DSqvTLPUqdw+Agu1o4vXOuJzPaPKsDG2AOii/Z
 M8X0OQTqvIANjygpfQii9REmfVGSs18A/jII72GAgAcEtNu5UBbyO6Vyw
 F6b2MdInKz7/eEdo0RI752zvPlrOUtVqgQZCtz54BVDeARINpTmmC6gK9
 mBVMTkkHoUj/hEqCN2JZHLxKPkjGpCMbb5DQaIoqamS6JrHDma2WGYlZl
 4HqV1UiufLXmfdnpvUjVVVPk2NuDfkOQ/SITKJySDT0jFNftp1FYk9v5U
 5MHZNv+GJa8avUkXQi/VEQqmCPhYa9GZzFdbRielLMvmaXTYRSDBCy9mA w==;
X-CSE-ConnectionGUID: dsUm+3MpQBa1W2M+mcHuLg==
X-CSE-MsgGUID: /U+D6BWYT4mXd0djGdPHtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43392592"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43392592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 00:51:00 -0800
X-CSE-ConnectionGUID: 5XWT2Z5yRDu9KNJJIQVOHg==
X-CSE-MsgGUID: 39w/AqLVQoWA33GnFQEzFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89417662"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.74])
 ([10.245.244.74])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 00:50:58 -0800
Message-ID: <48f96974-cbe2-40d3-bfbc-5e9f6a5543fc@intel.com>
Date: Tue, 19 Nov 2024 09:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] eudebug: Add eudebug pagefault event
 declarations
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-4-gwan-gyeong.mun@intel.com>
 <f946b1fe-e572-4aad-885c-7b7ce0cdcec7@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <f946b1fe-e572-4aad-885c-7b7ce0cdcec7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 18.11.2024 17:52, Hajda, Andrzej wrote:
> W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
>> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>
>> Update the xe_eudebug drm to include pagefault events.
>>
>> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> ---
>>   include/drm-uapi-experimental/xe_drm_eudebug.h | 13 +++++++++++++
> 
> I am lost between prelim/eudebug/experimental header placements. So just 
> out of curiosity what is the role of drm-uapi-experimental comparing to 
> prelim or just drm-uapi?

The experimental placement is there to ensure that the eudebug api won't 
get removed by a uapi update procedure documented by igt docs. It was 
reported by and requested by:

	Ville Syrjälä <ville.syrjala@linux.intel.com>

Apart from the placement, this is also a single file (compared to two 
files in the public kernel eudebug branch IIRC) which was requested 
during upstream review. But the api itself should be identical to the 
one found in the public eudebug-dev kernel branch.

Thanks,
Christoph

> 
> 
>>   lib/xe/xe_eudebug.c                            | 11 +++++++++++
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h 
>> b/include/drm-uapi-experimental/xe_drm_eudebug.h
>> index f50051e9a..ed2e728c2 100644
>> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
>> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
>> @@ -154,6 +154,7 @@ struct drm_xe_eudebug_event {
>>   #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE    9
>>   #define DRM_XE_EUDEBUG_EVENT_METADATA        10
>>   #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 11
>> +#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT        12
>>       __u16 flags;
>>   #define DRM_XE_EUDEBUG_EVENT_CREATE        (1 << 0)
>> @@ -352,6 +353,18 @@ struct drm_xe_eudebug_event_vm_bind_op_metadata {
>>       __u64 metadata_cookie;
>>   };
>> +struct drm_xe_eudebug_event_pagefault {
>> +    struct drm_xe_eudebug_event base;
>> +
>> +    __u64 client_handle;
>> +    __u64 exec_queue_handle;
>> +    __u64 lrc_handle;
>> +    __u32 flags;
>> +    __u32 bitmask_size;
>> +    __u64 pagefault_address;
>> +    __u8 bitmask[];
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
>> index c5814421b..de01e6b49 100644
>> --- a/lib/xe/xe_eudebug.c
>> +++ b/lib/xe/xe_eudebug.c
>> @@ -91,6 +91,8 @@ static const char *type_to_str(unsigned int type)
>>           return "metadata";
>>       case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA:
>>           return "vm_bind_op_metadata";
>> +    case DRM_XE_EUDEBUG_EVENT_PAGEFAULT:
>> +        return "pagefault";
>>       }
>>       return "UNKNOWN";
>> @@ -222,6 +224,15 @@ static const char *event_members_to_str(struct 
>> drm_xe_eudebug_event *e, char *bu
>>               op->vm_bind_op_ref_seqno, op->metadata_handle, 
>> op->metadata_cookie);
>>           break;
>>       }
>> +    case DRM_XE_EUDEBUG_EVENT_PAGEFAULT: {
>> +        struct drm_xe_eudebug_event_pagefault *pf = (void *)e;
> 
> maybe better: pf = container_of(e, pf, base);
> 
> Beside this:
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> 
> Regards
> Andrzej
> 
>> +
>> +        sprintf(buf, "client_handle=%llu, exec_queue_handle=%llu, "
>> +            "lrc_handle=%llu, bitmask_size=%d, 
>> pagefault_address=0x%llx",
>> +            pf->client_handle, pf->exec_queue_handle, pf->lrc_handle,
>> +            pf->bitmask_size, pf->pagefault_address);
>> +        break;
>> +    }
>>       default:
>>           strcpy(buf, "<...>");
>>       }
> 
