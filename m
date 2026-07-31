Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C836C5516F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 15:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3446E10E208;
	Fri, 31 Jul 2026 15:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ix1pztCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E76710F2EC
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785513178; x=1817049178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Lh2RrCQdl/G4KCLPvMlIVScMXSKUXe7yrts0KwfDOdg=;
 b=Ix1pztCTeZ/CXiitNM6j9MfggSJPf2E97Il5z+8FcwqYBozzzGc3xsye
 7ag3GSiOR0SaYf0YOGKvQAOi4DH0nK6gmgA6w2NpeRiJfiR7Ewc0FtR0p
 wj3tjAvtHCrlEVOA9G65mgKiyqZv3E8kQ8rkcuOVWV1tawu260TO61u1O
 QAYQI7Tog8JD6Dxf447UpVegSLSEx3bgujSGIOkBBBz4OCP8b8CzIlGfk
 W5LtLpeQhPeMaGrWI9k7uBdzvpF/yPKuGjQbMnAGD5VoIjmhUah77Up1R
 sJtUbJyoQcR2D6Q7NxzO1MS9FefG/o/Hb+2AGTaS075hEqewU3Fe3syTO g==;
X-CSE-ConnectionGUID: 5B5KY2RqRZmrjZXaxzcmHQ==
X-CSE-MsgGUID: CYv2/YEtTGaUki7kQ5sjuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96800044"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="96800044"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 08:52:57 -0700
X-CSE-ConnectionGUID: zwi5CPy4Qcucjc5FnGl8pA==
X-CSE-MsgGUID: eSYDgafOSDKI5ehad2z9vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="262568012"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 08:52:55 -0700
Date: Fri, 31 Jul 2026 17:52:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, adam.miszczak@linux.intel.com, 
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t 1/3] lib/xe/xe_spin: fix premature batch exit on BO
 resubmission
Message-ID: <vpllas2hk4ovunzzkzffxzbnjbkeykhhn2lol4eoyp35xtvxgx@fbpo5om7hbkp>
References: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
 <20260731141806.890207-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731141806.890207-2-marcin.bernatowicz@linux.intel.com>
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

On Fri, Jul 31, 2026 at 04:18:04PM +0200, Marcin Bernatowicz wrote:
> COND_BBE reads ticks_delta from memory. When the same BO is resubmitted,
> COND_BBE can read the value left by the previous batch(elapsed >= ctx_ticks
> at that batch's exit), satisfying the exit condition on the very first loop
> iteration before any new elapsed time is stored.
> 
> Write sentinel 0 to ticks_delta at batch start and use
> MI_SEMAPHORE_WAIT to poll until it is visible in memory before entering
> the loop. This guarantees COND_BBE cannot read the stale value from the
> previous batch.
> 
> Also switch from inverted ticks_delta logic (STOREINV + ~ctx_ticks) to
> direct elapsed ticks (STORE + MAD_LT_IDD + ctx_ticks) for readability.
> The pad loop between SRM and COND_BBE is removed as it does not help.
> 
> Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/xe/xe_spin.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 874310789..2863d2163 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -52,7 +52,6 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	uint64_t start_addr = opts->addr + offsetof(struct xe_spin, start);
>  	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
>  	uint64_t ticks_delta_addr = opts->addr + offsetof(struct xe_spin, ticks_delta);
> -	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
>  	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, timestamp);
>  	int b = 0;
>  	uint32_t devid;
> @@ -77,6 +76,18 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	spin->batch[b++] = start_addr >> 32;
>  	spin->batch[b++] = 0xc0ffee;
>  
> +	if (opts->ctx_ticks) {
> +		/* Write sentinel and wait until it is visible in memory before loop. */
> +		spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +		spin->batch[b++] = ticks_delta_addr;
> +		spin->batch[b++] = ticks_delta_addr >> 32;
> +		spin->batch[b++] = 0;
> +		spin->batch[b++] = MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
> +		spin->batch[b++] = 0;
> +		spin->batch[b++] = ticks_delta_addr;
> +		spin->batch[b++] = ticks_delta_addr >> 32;
> +	}
> +

Great, it is more reliable than resetting ticks_delta outside spinner code.

>  	loop_addr = opts->addr + b * sizeof(uint32_t);
>  
>  	if (opts->preempt)
> @@ -101,12 +112,12 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  		spin->batch[b++] = opts->use_queue_timestamp ? QUEUE_TIMESTAMP : CTX_TIMESTAMP;
>  		spin->batch[b++] = CS_GPR(NOW_TS);
>  
> -		/* delta = now - start; inverted to match COND_BBE */
> +		/* delta = now - start */
>  		spin->batch[b++] = MI_MATH(4);
>  		spin->batch[b++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(NOW_TS));
>  		spin->batch[b++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(START_TS));
>  		spin->batch[b++] = MI_MATH_SUB;
> -		spin->batch[b++] = MI_MATH_STOREINV(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
> +		spin->batch[b++] = MI_MATH_STORE(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
>  
>  		/* Save delta for reading by COND_BBE */
>  		spin->batch[b++] = MI_STORE_REGISTER_MEM_GEN8 | MI_SRM_CS_MMIO;
> @@ -114,17 +125,9 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  		spin->batch[b++] = ticks_delta_addr;
>  		spin->batch[b++] = ticks_delta_addr >> 32;
>  
> -		/* Delay between SRM and COND_BBE to post the writes */
> -		for (int n = 0; n < 8; n++) {
> -			spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> -			spin->batch[b++] = pad_addr;
> -			spin->batch[b++] = pad_addr >> 32;
> -			spin->batch[b++] = 0xc0ffee;
> -		}
> -
> -		/* Break if delta [time elapsed] > ns */
> -		spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
> -		spin->batch[b++] = ~(opts->ctx_ticks);
> +		/* Break if delta [time elapsed] >= ns */
> +		spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | MAD_LT_IDD | 2;
> +		spin->batch[b++] = opts->ctx_ticks;

And this is easier to read.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		spin->batch[b++] = ticks_delta_addr;
>  		spin->batch[b++] = ticks_delta_addr >> 32;
>  	}
> -- 
> 2.43.0
> 
