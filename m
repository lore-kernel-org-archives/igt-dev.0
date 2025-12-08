Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B99AD3B7F3
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 14:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E219710E45C;
	Mon,  8 Dec 2025 14:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INvQ1Gvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99C310E452
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765203259; x=1796739259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jnbXOPm9Ba37CtSzRtp9Mm/K2VBu0/3PohWddBOzefw=;
 b=INvQ1GvbspQrgrOq0oQ4ZBf9id3isRu+NLvnuwLnPzAuubMgI7nTtJBM
 6Hx97Qkq6vv606cYAtlEKEaOxyN0fSjqc4ZuaMj5W8eNCDWSs8CurbVQN
 S8lGIoqK6rrgBUNOyeBZs81xO+m7FpltbRQSR1lh4GbjDLYUrioUx/o8M
 egZNXyecF7m0Raiga6gR+44BvR4P178CCSYAhBLVBw7NkNRC0AfCoQI4B
 TscS/JBNdfVgwSWxx+ETgFZWDUFG1eh7PS85nsZqg+PoCVZtQlQrmycv5
 JBghCv7uZyzIN/Wo81x2p047LXsOYey3xBMP7fX2Yr8QVCLUUiNOZSUN6 g==;
X-CSE-ConnectionGUID: lv+QJz+NQc2D6maW1UFbBA==
X-CSE-MsgGUID: OkvDN8MgSoS25jwlCrU6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="92620378"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="92620378"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 06:14:19 -0800
X-CSE-ConnectionGUID: yHrrvc61R1qBf4eFQr+RvQ==
X-CSE-MsgGUID: I6ObdGdpR2ST7rL7KVUxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="196709415"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 06:14:17 -0800
Date: Mon, 8 Dec 2025 15:14:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v2 1/3] lib/xe/xe_spin: Introduce xe_spin_reset
Message-ID: <20251208141415.k2w3nfe6bgppnamv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, kamil.konieczny@intel.com
References: <20251205154417.3963533-1-soham.purkait@intel.com>
 <20251205154417.3963533-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205154417.3963533-2-soham.purkait@intel.com>
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

Hi Soham,
On 2025-12-05 at 21:14:15 +0530, Soham Purkait wrote:
> Create new function xe_spin_reset()
> This function resets the state of spin, allowing
> its reuse for engine activity accuracy test.
> 
> v1:
>  - Add simple commit message and mention test where it is going to be
>    used. (kamil)
> v2:
>  - Add fd description for xe_spin_reset. (Kamil)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> ---
>  lib/xe/xe_spin.c | 29 +++++++++++++++++++++++++++++
>  lib/xe/xe_spin.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 72b13ef42..f3866cca1 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -179,6 +179,35 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	igt_assert(b <= ARRAY_SIZE(spin->batch));
>  }
>  
> +/**
> + * xe_spin_reset:
> + * @fd: xe device file descriptor
> + * @spin: spin state from xe_spin_new()
> + *
> + * Reset the state of spin, allowing its reuse.
> + */
> +void xe_spin_reset(int fd, igt_spin_t *spin)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.handle = spin->syncobj,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +		.exec_queue_id = spin->engine,
> +		.address = spin->address,
> +	};
> +
> +	xe_spin_init_opts((struct xe_spin *)spin->xe_spin,
> +			  .addr = spin->address,
> +			  .preempt = !(spin->opts.flags & IGT_SPIN_NO_PREEMPTION));
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +	xe_spin_wait_started((struct xe_spin *)spin->xe_spin);
> +}
> +
>  /**
>   * xe_spin_started:
>   * @spin: pointer to spinner mapped bo
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index c2199d0aa..af32ab563 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -73,6 +73,7 @@ uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
>  void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
>  #define xe_spin_init_opts(fd, ...) \
>  	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
> +void xe_spin_reset(int fd, igt_spin_t *spin);
>  bool xe_spin_started(struct xe_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
>  void xe_spin_end(struct xe_spin *spin);
> -- 
> 2.34.1
> 
