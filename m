Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36A4D41C36
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 11:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7112110E6CF;
	Wed, 13 Nov 2024 11:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RANRWSFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FE610E6CF
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731495648; x=1763031648;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6x5SFgPtbnXKJPwu7pHaRI93pQPjHpPJYJ6xcWR4iRs=;
 b=RANRWSFNINCzD0Zn1btfpt2yHjjSRMqdpaHH8MEdcAKdaV1N4JHnE8DY
 3mPgaTYoKkOjmlBgeyW2xW77Ne4vb0QgwYiygGa3iiZKwFyeiuf0oejKF
 PpFDLoP+KroQfxAitP8JewNGtI6cnaeSneF9af8KVCQm0rcx679iBvlqd
 x/oRx09QO6ITmzicVUuub6AslBBesNWOtXIXIGJYZyBBnjI1AUsb3/E87
 lM5uUseEfzOkA5IZgBV29iSU6aXMI164pfcJp9zq0f8yzHGu5tFd6OBUp
 YgnRIGQU51kWe25LL4VM28UUV+7dSncaAra/ghbE2c83hOS4idiy9PfL4 Q==;
X-CSE-ConnectionGUID: xlQwpfXjR2qkvd4bXI6JnA==
X-CSE-MsgGUID: 1BFAclUkTaKxmr7ZM3IAMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42788602"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="42788602"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 03:00:48 -0800
X-CSE-ConnectionGUID: F9IWYiBrTo2tSlD8+sPOpA==
X-CSE-MsgGUID: +Q0RrWcQQnSElxo6K1ralg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="92914847"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.102])
 ([10.245.245.102])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 03:00:47 -0800
Message-ID: <50cf3050-f8df-425c-b957-51bc9be75fd9@intel.com>
Date: Wed, 13 Nov 2024 12:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] drm-uapi-experimental/xe_drm_eudebug: Sync
 after exec_queue placement event addition.
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
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

Hi Dominik,

On 13.11.2024 09:51, Dominik Grzegorzek wrote:
> Exec queue placement event has been added in logical order, due to that
> there is a shift in event numbering. Sync uapi to match kernel changes.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

> ---
>   .../drm-uapi-experimental/xe_drm_eudebug.h    | 30 +++++++++++++++----
>   1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
> index 13c069e00..f50051e9a 100644
> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> @@ -147,12 +147,13 @@ struct drm_xe_eudebug_event {
>   #define DRM_XE_EUDEBUG_EVENT_OPEN		2
>   #define DRM_XE_EUDEBUG_EVENT_VM			3
>   #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
> -#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
> -#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
> -#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
> -#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
> -#define DRM_XE_EUDEBUG_EVENT_METADATA		9
> -#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
> +#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS 5
> +#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	6
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND		7
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		8
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	9
> +#define DRM_XE_EUDEBUG_EVENT_METADATA		10
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 11
>   
>   	__u16 flags;
>   #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
> @@ -188,6 +189,22 @@ struct drm_xe_eudebug_event_exec_queue {
>   	__u64 lrc_handle[];
>   };
>   
> +struct drm_xe_eudebug_event_exec_queue_placements {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 vm_handle;
> +	__u64 exec_queue_handle;
> +	__u64 lrc_handle;
> +	__u32 num_placements;
> +	__u32 pad;
> +	/**
> +	 * @instances: user pointer to num_placements sized array of struct
> +	 * drm_xe_engine_class_instance
> +	 */
> +	__u64 instances[];
> +};
> +
>   struct drm_xe_eudebug_event_eu_attention {
>   	struct drm_xe_eudebug_event base;
>   
> @@ -303,6 +320,7 @@ struct drm_xe_eudebug_vm_open {
>   	/** @flags: flags */
>   	__u64 flags;
>   
> +#define DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS (10ULL * NSEC_PER_SEC)
>   	/** @timeout_ns: Timeout value in nanoseconds operations (fsync) */
>   	__u64 timeout_ns;
>   };
