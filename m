Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6334FC79F99
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 10:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1181D10E748;
	Mon,  7 Sep 2026 10:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3U+iVju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EC810E75A
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788775696; x=1820311696;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o1C194xGP6KkxASFLjymddEhatrAvY+ktmfmifQvyZA=;
 b=B3U+iVjuVTw1USBIr7XETMFjrsZNrfqaZSum/LNJZl+tkYp7+q63DMLD
 zTC7VTHZ9sJ8ZzL7I8E+KI7ITeSeolJi99lOsj8lKTx45D3cwreLYg05p
 0E7y6UPeRKTAN9wYRQScPLvf0HDjy57nJReWiPU3uadTNV/7oeP6El+Rt
 pDRP/Q3SThFW905+8jyY0xJRuJHpU7KlgXusOT39iVuy/AURIiZUiT6GZ
 EltXO0jYvqnhTiAz4wcmEU/jhhQ6EIWxGUV+UtbGmAd2/D4h0t7uj/dnm
 XYwMHqO3XUaRux0M/d7x0G3THi0iZAwd9/of0RKUmqIzFNjY72EQouCp1 Q==;
X-CSE-ConnectionGUID: 5m+sQQO6TcWS6KOawtkl0Q==
X-CSE-MsgGUID: 8P3nolpkRKCFGf7F35vLgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106693710"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="106693710"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:08:16 -0700
X-CSE-ConnectionGUID: /7fdD1j/SeG5pixRtxYe0w==
X-CSE-MsgGUID: g5Av4yFIQdWG2ev9Aj6e+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270633607"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 03:08:15 -0700
Date: Mon, 7 Sep 2026 12:07:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH] tests/intel/xe_exec_reset: fix mixed-engine reset stress
 to use actual GT engines
Message-ID: <20260907100755.sgjgnwapnsmbycxb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com
References: <20260907095105.312933-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907095105.312933-1-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2026-09-07 at 09:51:05 +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> This patch fixes the mixed-engine reset stress subtest by selecting only
> engine class/instance pairs that are actually exposed by the target GT
> instead of using a hardcoded class list with engine instance 0.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> Suggested-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>

Suggested-by should be before s-o-b.

> 
> I talked with Gajendra and he suggested this change to me, but I made
> a mistake and added his s-o-b instead of suggested-by, so resending
> this with correct tags

This should be after '---' line, it could be corrected at merge, LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

As it was already tested and you only corrected description,
I will merge it.

Regards,
Kamil


> ---
>  tests/intel/xe_exec_reset.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 34232f433..e12279d23 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -702,17 +702,20 @@ static void bo_ctx_create(int fd, int gt, uint64_t addr, size_t bo_size,
>  static void fill_mixed_engine(struct gt_thread_data *t, int iter,
>  			      struct drm_xe_engine_class_instance *instance)
>  {
> -	const uint16_t classes[] = {
> -		DRM_XE_ENGINE_CLASS_COPY,
> -		DRM_XE_ENGINE_CLASS_RENDER,
> -		DRM_XE_ENGINE_CLASS_COMPUTE,
> -		DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> -		DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	};
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance engines[64];
> +	int n = 0;
> +
> +	xe_for_each_engine(t->fd, hwe) {
> +		if (hwe->gt_id != t->gt)
> +			continue;
> +		engines[n++] = *hwe;
> +		if (n == ARRAY_SIZE(engines))
> +			break;
> +	}
>  
> -	instance->gt_id = t->gt;
> -	instance->engine_instance = 0;
> -	instance->engine_class = classes[(iter + t->id) % ARRAY_SIZE(classes)];
> +	igt_assert_f(n > 0, "GT %d exposes no engines\n", t->gt);
> +	*instance = engines[(iter + t->id) % n];
>  }
>  
>  static void pressure_bo_create(int fd, uint32_t vm, int gt,
> -- 
> 2.43.0
> 
