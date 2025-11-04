Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017AECCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 09:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C3F10E257;
	Tue,  4 Nov 2025 09:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUKC1w+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFA210E257
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762250222; x=1793786222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HeegDT6eXivu/PnDPswYpmWXhLbduksEfH53S+9Hil8=;
 b=JUKC1w+zydcJyW1/QX6Io4mRWfU37QufwkqdrMt5jV3aNgYr3sZWt2TR
 rK3Id6pKEyxlhPn+rT4TjzhvoIdbKJ9wJX9mdfbvQJC2pqOhlx7iL0zsw
 Mc+P4ICbc6GhOIpB9OQls4qwGTvDrVxzP9z6XbqlWd2c2xJ9RrxlXzsdL
 7CjIIBJsZuWcIolLYZyh6w0VHoKUk4scAVc2HBwqGrJLiHh1PFawixrmz
 ZLAAgIIzjMAPt1qONnzrnQ8hBdty7lY629UrsCuXth40Iqd1x8S0mssJ5
 MwrMSHJEki6uIhBdTl/sHo8kRiqaOur9VeNyJDYQV5mwgo7k0cR8wt0Pj g==;
X-CSE-ConnectionGUID: vxFHuHK/RWeKu4iME6ecRg==
X-CSE-MsgGUID: y9jX7S30TMyZ4Yv0ujJDzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64225282"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64225282"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:57:02 -0800
X-CSE-ConnectionGUID: IRfJiFN6RmOMvI/cZ7uRYA==
X-CSE-MsgGUID: u93+TFKyQ2i48WRAbvq6Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187267518"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:57:00 -0800
Date: Tue, 4 Nov 2025 10:56:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t 1/3] lib/xe/xe_spin: Introduce xe_spin_reset
Message-ID: <20251104095658.ie5x5ptnamc3pykv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
References: <20251104055129.3826274-1-soham.purkait@intel.com>
 <20251104055129.3826274-2-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104055129.3826274-2-soham.purkait@intel.com>
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
On 2025-11-04 at 11:21:27 +0530, Soham Purkait wrote:
> libify spin reset enabling reuse for Xe driver

/slibify/Create new function xe_spin_reset()/

I assume it is a common pattern elsewhere,
so also write that down (in which tests you will use it).

Regards,
Kamil

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
