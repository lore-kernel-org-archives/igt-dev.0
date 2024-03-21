Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139B7C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 09:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9596410E532;
	Thu, 21 Mar 2024 09:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eaECkT/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2756310E535
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 09:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711015058; x=1742551058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fU9TyGEosTOFYkR01ShSB413Gpa6AwPKdnGmh4wNYtU=;
 b=eaECkT/McHKg7nI7iJFd+y2UjsewUJveo9bLf8A9N9BdrlPIFKdSRnsx
 +i6Ej2pYYStWLjTe6yNiz17YMfxXnHJDzaQWRSWZm5vURdNlhsCNFEa7E
 CTVEt8FrDANxkjp2tNYr5HAlhvOFW0BKEFKaeYtto7/ZX59fsW1fTuScP
 14mnkukSRTTPV0Qc9mI9gBIiodrED8h54M9OaiZUSCW/UgHd/bSJ3mSKE
 aOCpfaC78PGE4ijpTEAXTz6L0epFzRyyKFvt0OSKi1OolNpqihYdptJ91
 pBKElvARSp0uXwBSTjfQ+FkjPuKg7uCfH07O3BxVrUTcEK7wELo+6Dc6+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5932296"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5932296"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14513044"
Received: from unknown (HELO localhost) ([10.245.246.249])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 02:57:34 -0700
Date: Thu, 21 Mar 2024 10:57:33 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/xe/xe_spin: Add support to store/write ctx
 time
Message-ID: <20240321095733.h6dq5ededs25jc3p@zkempczy-mobl2>
References: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
 <20240320155430.11877-3-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320155430.11877-3-sai.gowtham.ch@intel.com>
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

On Wed, Mar 20, 2024 at 09:24:29PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> support to Store or write ctx time stamps when a spinner is
> triggers, which makes user to understand if spinner is still
> submitting workload to a context.

Maybe:

"Store timestamp on demand in the spinner to allow user code verify
is it still running."?

Rest is ok, with above commit msg fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/xe/xe_spin.c | 12 ++++++++++++
>  lib/xe/xe_spin.h |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 1ca54ea19..2c9b5848a 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -72,6 +72,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
>  	uint64_t ticks_delta_addr = opts->addr + offsetof(struct xe_spin, ticks_delta);
>  	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
> +	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, timestamp);
>  	int b = 0;
>  
>  	spin->start = 0;
> @@ -98,6 +99,17 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	if (opts->preempt)
>  		spin->batch[b++] = (0x5 << 23);
>  
> +	if (opts->write_timestamp) {
> +		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
> +		spin->batch[b++] = CTX_TIMESTAMP;
> +		spin->batch[b++] = CS_GPR(NOW_TS);
> +
> +		spin->batch[b++] = MI_STORE_REGISTER_MEM_GEN8 | MI_SRM_CS_MMIO;
> +		spin->batch[b++] = CS_GPR(NOW_TS);
> +		spin->batch[b++] = timestamp_addr;
> +		spin->batch[b++] = timestamp_addr >> 32;
> +	}
> +
>  	if (opts->ctx_ticks) {
>  		spin->batch[b++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_CS_MMIO;
>  		spin->batch[b++] = CS_GPR(NOW_TS) + 4;
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 87b7c1716..d65adb05c 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -29,6 +29,7 @@ struct xe_spin_opts {
>  	uint64_t addr;
>  	bool preempt;
>  	uint32_t ctx_ticks;
> +	bool write_timestamp;
>  };
>  
>  /* Mapped GPU object */
> @@ -39,6 +40,7 @@ struct xe_spin {
>  	uint32_t end;
>  	uint32_t ticks_delta;
>  	uint64_t exec_sync;
> +	uint32_t timestamp;
>  };
>  
>  igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
> -- 
> 2.39.1
> 
