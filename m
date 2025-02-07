Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD10AC02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 12:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC6710EAF9;
	Fri,  7 Feb 2025 12:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsUEQJl1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A41010EAF0
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933130; x=1770469130;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NUypY/PnyNhuTbIEOehM2rw0X8anmYPY8VTJrsmRyOU=;
 b=gsUEQJl1c06lHoHeW+Lk+NRnjoN4CfUR05/oO0Fyd8pdNz9w0YAhGZr5
 Wbja3gh7sjCa+PGw3QzzPGw7n31si1unPQULdHZXZoKOJCqUQBw53seDn
 qCpAAPiMoEZp4+xZhfgSO45mgMJosxlsjgOqYI8VohT4QlXxNeGvVl8Xw
 /bNemLqwryIhAvPFfCSvi81kb0VXgbAagUgN02j001Kz/I30gxWxgHQ9u
 zxOAhJE+oDDQkIsbXECe+8Hi8uXY6jJa2/pzehDELVU8cMa56GXrRDJrL
 G7DAUCkCw4yeOAKF/I0rmpAZqAOG5Qeykgg5KHqFWqFjqLzFEEDuWOngY g==;
X-CSE-ConnectionGUID: XkXDJdxPSSu9MD8CjJE0WQ==
X-CSE-MsgGUID: voiE1uTvTwGsS4lfXvmEcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39701016"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39701016"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:58:48 -0800
X-CSE-ConnectionGUID: YDSoz+ofRhO0X3yw+vomFg==
X-CSE-MsgGUID: He0zKrXPS3q3wqwOVOThtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112032557"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.126])
 ([10.245.246.126])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:58:46 -0800
Message-ID: <54cc73da-1077-4726-81aa-b644cc4bb9c0@intel.com>
Date: Fri, 7 Feb 2025 13:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] Revert "drm-uapi-experimental/xe_drm_eudebug:
 Sync after exec_queue placement event addition"
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
 <20250207114935.1996323-4-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250207114935.1996323-4-mika.kuoppala@linux.intel.com>
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
> This reverts commit 722494e73a3117c0de1708a2ff2a326446b043b6.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph
> ---
>   .../drm-uapi-experimental/xe_drm_eudebug.h    | 31 +++++--------------
>   1 file changed, 7 insertions(+), 24 deletions(-)
> 
> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
> index ed2e728c2..714bb93c7 100644
> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> @@ -147,14 +147,13 @@ struct drm_xe_eudebug_event {
>   #define DRM_XE_EUDEBUG_EVENT_OPEN		2
>   #define DRM_XE_EUDEBUG_EVENT_VM			3
>   #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
> -#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS 5
> -#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	6
> -#define DRM_XE_EUDEBUG_EVENT_VM_BIND		7
> -#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		8
> -#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	9
> -#define DRM_XE_EUDEBUG_EVENT_METADATA		10
> -#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 11
> -#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		12
> +#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
> +#define DRM_XE_EUDEBUG_EVENT_METADATA		9
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
> +#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		11
>   
>   	__u16 flags;
>   #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
> @@ -190,22 +189,6 @@ struct drm_xe_eudebug_event_exec_queue {
>   	__u64 lrc_handle[];
>   };
>   
> -struct drm_xe_eudebug_event_exec_queue_placements {
> -	struct drm_xe_eudebug_event base;
> -
> -	__u64 client_handle;
> -	__u64 vm_handle;
> -	__u64 exec_queue_handle;
> -	__u64 lrc_handle;
> -	__u32 num_placements;
> -	__u32 pad;
> -	/**
> -	 * @instances: user pointer to num_placements sized array of struct
> -	 * drm_xe_engine_class_instance
> -	 */
> -	__u64 instances[];
> -};
> -
>   struct drm_xe_eudebug_event_eu_attention {
>   	struct drm_xe_eudebug_event base;
>   
