Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C90CF8875
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 16:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FE910E782;
	Thu, 20 Nov 2025 16:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVU5BkNk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACCD10E77E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763655502; x=1795191502;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xx47w+hwrDJPwO33V2eFn2Yh078drJIvVoeY4lHbg3o=;
 b=VVU5BkNky4eHktFcqdMb8y9uimDXQ0UQyD1WUbl/7Tw3O2df3dJfOlDo
 ybmyC0Hb9D3GiALDAzUNuIoZqiD+GaMDINKuq8kPmJLl2J3WONnatQNFM
 9EWZBE4G+O210PhtpkZSHyVJunlUNN+HgEiU5dJtyg57ZrGnBQRCYOM5C
 VkOabPo8B4fICJ8llqixdsYVtQjtEBjInFBUsgvA2N4UroelvuNKzhXS7
 zJoRYR1XUXcL6j0mIuG3UQ6S6TuoRkRfcPMetkZzfDx53oACsBXwtNc/J
 mDEJDpKYSQkXt706+LCXVMsloIhA/Vwfbxk99ay3BhN8OG8DBdSFFmLo/ w==;
X-CSE-ConnectionGUID: VIInpTflSQKcfWFNdrVOcA==
X-CSE-MsgGUID: UOmhIFTYRhG/SR7N1ZUY1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77093165"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="77093165"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:18:21 -0800
X-CSE-ConnectionGUID: /HQaXS8kQ+Wqb8OmSLdLbQ==
X-CSE-MsgGUID: 8Wxsj8z9RaKoJpWrBRmzRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="222358535"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 08:18:20 -0800
Date: Thu, 20 Nov 2025 17:18:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v1 1/3] lib/xe/xe_spin: Introduce xe_spin_reset
Message-ID: <20251120161817.lyazb7fp2555fjns@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
References: <20251113124936.3878794-1-soham.purkait@intel.com>
 <20251113124936.3878794-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251113124936.3878794-2-soham.purkait@intel.com>
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
On 2025-11-13 at 18:19:34 +0530, Soham Purkait wrote:
> Create new function xe_spin_reset()
> This function resets the state of spin, allowing
> its reuse for engine activity accuracy test.
> 
> v1:
>  - Add simple commit message and mention test where it is going to be used. (kamil)

Fold line up to 75 chars in column.

> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/xe/xe_spin.c | 28 ++++++++++++++++++++++++++++
>  lib/xe/xe_spin.h |  1 +
>  2 files changed, 29 insertions(+)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 72b13ef42..9909f4e03 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -179,6 +179,34 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	igt_assert(b <= ARRAY_SIZE(spin->batch));
>  }
>  
> +/**
> + * xe_spin_reset:

Document all parameters, here add @fd: description.

Regards,
Kamil

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
