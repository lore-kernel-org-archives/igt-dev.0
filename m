Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DF8C54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 11:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9CC10F9E4;
	Tue, 19 Mar 2024 11:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxuyC80M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3442010F9E4
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710847308; x=1742383308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+o2KZPzxlgNvOR2nta7gKeO5NWHHf5j7XdE/Jia2Vgk=;
 b=BxuyC80MSUrqOUfW2YRtKIrrbi9s2Z094Og5jkwgyN0ac+0uDZSqFrjU
 K0jxAAEGxoPWJUjzZflqoMyQskyYH18EIwvEybBU2qcJqnyEeWM1q0TGg
 Thy7vxUbzH9jN2PgenZTz5HMvfDWKfaSR8Ouprmdvvh5RUicS9sXwRlr8
 BZn0g0MGlUtd9EO2jv5Pl0QCcR06rxPL4SEVsX/SgVN1clCfTGXBHGBaM
 kGFG+OXSEmrjX2BuPPlrrX8d8jU8Ma69XIck3BezlljP3gzwY2bagQpHB
 QSpYSeswGGLrE02o7U7SBE+8OEaDVwuprVDlbUY4wQIPQBaKFXAG/XXdD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16252609"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="16252609"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 04:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="13826567"
Received: from unknown (HELO localhost) ([10.245.246.227])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 04:21:46 -0700
Date: Tue, 19 Mar 2024 12:21:44 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_spin: Add support to store/write ctx
 time stamps
Message-ID: <20240319112144.svqnwr4lrfikbm5c@zkempczy-mobl2>
References: <20240315050438.21245-1-sai.gowtham.ch@intel.com>
 <20240315050438.21245-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315050438.21245-2-sai.gowtham.ch@intel.com>
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

On Fri, Mar 15, 2024 at 10:34:37AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> support to Store or write ctx time stamps when a spinner is
> triggers, which makes user to understand if spinner is still
> submitting workload to a context.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/xe/xe_spin.c | 12 ++++++++++++
>  lib/xe/xe_spin.h |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 1ca54ea19..b73e72633 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -72,6 +72,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>  	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
>  	uint64_t ticks_delta_addr = opts->addr + offsetof(struct xe_spin, ticks_delta);
>  	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
> +	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, time_stamp);
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
> +		spin->batch[b++] = MI_STORE_REGISTER_MEM | MI_SRM_CS_MMIO | 2;
> +		spin->batch[b++] = CS_GPR(NOW_TS);
> +		spin->batch[b++] = timestamp_addr;
> +		spin->batch[b++] = timestamp_addr >> 32;
> +	}
> +
>  	if (opts->ctx_ticks) {
>  		spin->batch[b++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_CS_MMIO;
>  		spin->batch[b++] = CS_GPR(NOW_TS) + 4;
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 5c8c45143..5af2ded0b 100644
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
> @@ -38,6 +39,7 @@ struct xe_spin {
>  	uint32_t start;
>  	uint32_t end;
>  	uint32_t ticks_delta;
> +	uint32_t time_stamp;

Rename it to timestamp, then:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  };
>  
>  igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
> -- 
> 2.39.1
> 
