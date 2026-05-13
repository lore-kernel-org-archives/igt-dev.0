Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEFBCD4F21
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 14:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A5F10E32F;
	Wed, 13 May 2026 14:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0Wx0R4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9CD10E32F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778682162; x=1810218162;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cE9PldjB1o1eICkzQhoNTt27bRa2ZFahkWBBclQx2eA=;
 b=a0Wx0R4DGuy596/q35KyxiExsieDZVmlvsrLSiYLKX5rPOX/D2ngcL7r
 Pj4OUkL+HR2sxQ2HEIGFKrpYU3R7M4UpeeYFhRbxnBp3eRZO4s3bKzVCd
 ZctML9UI+MOc+hYgtg6Icjix6rjw03sgaN7VlP8GYIqq/qW+WWKgBId/i
 7MmLF4VkAgKY5q9HYndDRT3QR32/EQm8tGmgb4sgWDh8bXXbbRb8JnWal
 OIYopQTCGCss3zlLYwcTYwjxqNf1cChKZmRo91WYifdTTsGfdLWcwQHn/
 w+29T+k3zCTX1iL0FCP+anPbPp/z9q3rF8pL/dX8rvZDXbvkBkOXsqBLM w==;
X-CSE-ConnectionGUID: z54GtI9+SmGk/BAnMR7dhQ==
X-CSE-MsgGUID: hmjxZKnJRe2aWSe08eXG7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82177418"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="82177418"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 07:22:42 -0700
X-CSE-ConnectionGUID: jRnZsDKxTvWvzyJFSRRZCg==
X-CSE-MsgGUID: YFJA+5KzTmyIzRgeyLUt2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="242110275"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:22:40 -0700
Date: Wed, 13 May 2026 16:22:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t v2 2/5] drm-uapi/v3d: Sync v3d UAPI
Message-ID: <20260513142237.d353oz5ccy542wnc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20260512123408.1115589-2-mcanal@igalia.com>
 <20260512123408.1115589-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512123408.1115589-4-mcanal@igalia.com>
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

Hi Maíra,
On 2026-05-12 at 09:29:47 -0300, Maíra Canal wrote:
> Update the UAPI header to expose support to a new ioctl:
> DRM_IOCTL_V3D_PERFMON_SET_GLOBAL. Sync the v3d UAPI with Linux 7.0.
> 
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Can you write in commit description in what kernel commit
from drm-next you synced? Something like seen in panthor
https://patchwork.freedesktop.org/patch/723725/?series=166234&rev=1
drm-uapi/panthor: sync with kernel 5731bca6a656

Sync Panthor drm uapi with drm-next up to commit 5731bca6a656, this
will bring following changes:

commit 5731bca6a656 ("drm/panthor: Support sparse mappings")
commit a07a79ff4b51 ("drm/panthor: Delete spurious whitespace from uAPI header")
...
last commit with which it was synced.


So here:

Sync v3d upai with drm-next up to commit 769c153cfc3c, this
will bring following changes:

769c153cfc3c ("drm/v3d: Add parameter to retrieve the number of GPU resets per-fd")
5774b3cfdedb ("drm/v3d: Add parameter to retrieve the global number of GPU resets")
c6eabbab359c ("drm/v3d: Add DRM_IOCTL_V3D_PERFMON_SET_GLOBAL")
...
the only challange here is which is a last one to cite.

With this LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  include/drm-uapi/v3d_drm.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/include/drm-uapi/v3d_drm.h b/include/drm-uapi/v3d_drm.h
> index 87fc5bb0a..d9b01f4c3 100644
> --- a/include/drm-uapi/v3d_drm.h
> +++ b/include/drm-uapi/v3d_drm.h
> @@ -43,6 +43,7 @@ extern "C" {
>  #define DRM_V3D_PERFMON_GET_VALUES                0x0a
>  #define DRM_V3D_SUBMIT_CPU                        0x0b
>  #define DRM_V3D_PERFMON_GET_COUNTER               0x0c
> +#define DRM_V3D_PERFMON_SET_GLOBAL                0x0d
>  
>  #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
>  #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
> @@ -61,6 +62,8 @@ extern "C" {
>  #define DRM_IOCTL_V3D_SUBMIT_CPU          DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_SUBMIT_CPU, struct drm_v3d_submit_cpu)
>  #define DRM_IOCTL_V3D_PERFMON_GET_COUNTER DRM_IOWR(DRM_COMMAND_BASE + DRM_V3D_PERFMON_GET_COUNTER, \
>  						   struct drm_v3d_perfmon_get_counter)
> +#define DRM_IOCTL_V3D_PERFMON_SET_GLOBAL  DRM_IOW(DRM_COMMAND_BASE + DRM_V3D_PERFMON_SET_GLOBAL, \
> +						   struct drm_v3d_perfmon_set_global)
>  
>  #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
>  #define DRM_V3D_SUBMIT_EXTENSION		  0x02
> @@ -290,6 +293,9 @@ enum drm_v3d_param {
>  	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
>  	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
>  	DRM_V3D_PARAM_MAX_PERF_COUNTERS,
> +	DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES,
> +	DRM_V3D_PARAM_GLOBAL_RESET_COUNTER,
> +	DRM_V3D_PARAM_CONTEXT_RESET_COUNTER,
>  };
>  
>  struct drm_v3d_get_param {
> @@ -765,6 +771,21 @@ struct drm_v3d_perfmon_get_counter {
>  	__u8 reserved[7];
>  };
>  
> +#define DRM_V3D_PERFMON_CLEAR_GLOBAL    0x0001
> +
> +/**
> + * struct drm_v3d_perfmon_set_global - ioctl to define a global performance
> + * monitor
> + *
> + * The global performance monitor will be used for all jobs. If a global
> + * performance monitor is defined, jobs with a self-defined performance
> + * monitor won't be allowed.
> + */
> +struct drm_v3d_perfmon_set_global {
> +	__u32 flags;
> +	__u32 id;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.54.0
> 
