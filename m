Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA72AC369C9
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 16:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1A110E322;
	Thu, 17 Apr 2025 16:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUvjyDSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E05A10E332
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744907851; x=1776443851;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KmX0jrv2V0bla2x+sg3ZRnK9/VvLlvS8ukXEHnpcVbA=;
 b=cUvjyDSWw343wai74Pdg4GEcBchfsyXUWXcLWuvyCbxv/Vvc/UerbhaQ
 MQ54/fRdJbBh3ZAPalQDMZfEsYf2iClLtUNiHCOCABr5M7F4tW3+MHrwa
 0gEHRdldg203ZkcYT3M9Jh4XqzpxR1mUj7lX+hH90IngCiDOfa6rSrM+c
 uEOPlALRTz8zzUriu6KgFpQQw+Hkyyd8Lmyllku9YTzp4wd4+2YXGnIkI
 bzkmJ2T72jWVG5+6/tQKEIeYD8Q4IriBCP43fXd+tTP1J/Pz7JpTWqwhZ
 XcvJqocdYPTIgXNs/yqyGOQE1quh+xa7dQ2Exhort78/dJyyWJ7RdoqVV Q==;
X-CSE-ConnectionGUID: toJxqf69To+VO18JDF+gUQ==
X-CSE-MsgGUID: JtNLPPMiR3Oa75NiqUrdug==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46222244"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="46222244"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 09:37:30 -0700
X-CSE-ConnectionGUID: J3JQR1SPQuKRLeWZCZb0Vg==
X-CSE-MsgGUID: 4aSvQ4WKS0CkBqtB/mt0Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="134946912"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:37:27 -0700
Date: Thu, 17 Apr 2025 18:37:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, sukhatri@amd.com
Subject: Re: [PATCH i-g-t v2 1/2] drm-uapi/amdgpu: Add queue priority and
 secure flags definitions
Message-ID: <20250417163710.rr3j4dc7fin5ikfo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>,
 igt-dev@lists.freedesktop.org,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, sukhatri@amd.com
References: <20250417085247.592557-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417085247.592557-1-jesse.zhang@amd.com>
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

Hi Jesse.zhang,
On 2025-04-17 at 16:52:46 +0800, Jesse.zhang@amd.com wrote:
> Add UAPI definitions for queue priority levels (NORMAL_LOW, LOW, etc.)
> and secure queue flag in amdgpu_drm.h. This matches the libdrm changes
> in commit fdf384d4b546 ("amdgpu: add priority and secure flags for user queues").

Please write from what tree comes this commit or
give lore.kernel.org link.

I tried to find out this on current drm-tip and failed,
am I missing something?

Regards,
Kamil

> 
> v2: In general, UAPI changes should be part of a different change and only uapi should be part of it (Sunil)
> 
> Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index 8191d0bd0..3f4813879 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -329,6 +329,16 @@ union drm_amdgpu_ctx {
>  #define AMDGPU_USERQ_OP_CREATE	1
>  #define AMDGPU_USERQ_OP_FREE	2
>  
> +/* queue priority levels */
> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3
> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0
> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0
> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_LOW 1
> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_HIGH 2
> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_HIGH 3 /* admin only */
> +/* for queues that need access to protected content */
> +#define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE  (1 << 2)
> +
>  /*
>   * This structure is a container to pass input configuration
>   * info for all supported userqueue related operations.
> @@ -355,7 +365,7 @@ struct drm_amdgpu_userq_in {
>  	 * and doorbell_offset in the doorbell bo.
>  	 */
>  	__u32   doorbell_offset;
> -	__u32 _pad;
> +	__u32 flags;
>  	/**
>  	 * @queue_va: Virtual address of the GPU memory which holds the queue
>  	 * object. The queue holds the workload packets.
> -- 
> 2.25.1
> 
