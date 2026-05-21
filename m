Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48527CD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAF410E49A;
	Thu, 21 May 2026 11:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBdzwVBW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D363F10E49A
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779364603; x=1810900603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3GQhHrUlZK6zmdy3sqZ+QoFHU1ym1ZVkZhaDgGPyls8=;
 b=UBdzwVBWfnKDMkGwFP7QLG1zL0PmbEx0mO6eHUGDyomsFreiHJWNm1WF
 UGA/iiBdt4wrSFxeXBjZVpw5l6ph964eWQZgfReUFwXj10NNcC3leGo36
 yXffoZfTLXwZI5/O8+w43TvBeWt3OTrKqwCZ464zGEOjeW0Q9Z5kvf85f
 Qge7po+J3/syEPsvbIpRnROm2GqtnUIltCYsP06Fafaa+/4QxEAyTEqhg
 anIdszMiGLcXbmJuedxOeDfoMu+F+JZpmx3DL8iu429DxJmuF0A0K6WkQ
 Sw7TsrLxjxPmtbmzKoc7GELWKQ8g11ZdL1lU2HG+3NjFUzF4z/eUCMoQt w==;
X-CSE-ConnectionGUID: hMATzmJFRC6PQMglOyTNBw==
X-CSE-MsgGUID: Rfa9pa/WSOy8MqFrYKpOLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="82857916"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="82857916"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:56:43 -0700
X-CSE-ConnectionGUID: 5Dez2GzGREyWNDKGxLmH0g==
X-CSE-MsgGUID: uiRtKKtQToeIWwK+NLk+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="236255220"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:56:42 -0700
Date: Thu, 21 May 2026 13:56:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/2] lib/intel_batchbuffer: assert on accessing prefetch
 area
Message-ID: <20260521115640.jzhmq7tyozzwmhsn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20260521-ibb_fixes2-v1-0-7094a6ff3520@intel.com>
 <20260521-ibb_fixes2-v1-1-7094a6ff3520@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-ibb_fixes2-v1-1-7094a6ff3520@intel.com>
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

Hi Andrzej,
On 2026-05-21 at 13:32:19 +0200, Andrzej Hajda wrote:
> On batchbuffer allocation library adds 4k padding to the buffer to avoid
> prefetch errors. To avoid batchbuffer overflow existing asserts should
> compare against requested buffer size (usable_size), instead of allocated
> buffer size. Otherwise we risk prefetch errors.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/intel_batchbuffer.c | 3 ++-
>  lib/intel_batchbuffer.h | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 17b2b8625d4e..ec0a7108b1f7 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -917,6 +917,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
>  	ibb->devid = intel_get_drm_devid(fd);
>  	ibb->gen = intel_gen(ibb->devid);
>  	ibb->ctx = ctx;
> +	ibb->usable_size = size;
>  
>  	ibb->fd = fd;
>  	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
> @@ -2931,7 +2932,7 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
>  
>  	intel_bb_ptr_align(ibb, align);
>  	offset = intel_bb_offset(ibb);
> -	igt_assert_lt(offset + bytes, ibb->size);
> +	igt_assert_lte(offset + bytes, ibb->usable_size);
>  
>  	subdata = intel_bb_ptr(ibb);
>  	memcpy(subdata, data, bytes);
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index d0a7c8dc7250..06d0baf888f0 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -255,6 +255,7 @@ struct intel_bb {
>  	bool enforce_relocs;
>  	uint32_t devid;
>  	uint32_t handle;
> +	uint32_t usable_size;
>  	uint32_t size;
>  	uint32_t *batch;
>  	uint32_t *ptr;
> @@ -363,7 +364,7 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
>  
>  static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
>  {
> -	igt_assert(offset < ibb->size);
> +	igt_assert(offset <= ibb->usable_size);

Can you use here igt_assert_lte?

>  
>  	return ((uint8_t *) ibb->batch + offset);
>  }
> @@ -372,7 +373,7 @@ static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
>  {
>  	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
>  
> -	igt_assert(intel_bb_offset(ibb) <= ibb->size);
> +	igt_assert(intel_bb_offset(ibb) <= ibb->usable_size);

Same here.

>  }
>  
>  static inline void intel_bb_ptr_add(struct intel_bb *ibb, uint32_t offset)
> @@ -407,7 +408,7 @@ static inline void intel_bb_out(struct intel_bb *ibb, uint32_t dword)
>  	*ibb->ptr = dword;
>  	ibb->ptr++;
>  
> -	igt_assert(intel_bb_offset(ibb) <= ibb->size);
> +	igt_assert(intel_bb_offset(ibb) <= ibb->usable_size);

Same here.

With above fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  }
>  
>  void intel_bb_set_pxp(struct intel_bb *ibb, bool new_state,
> 
> -- 
> 2.54.0
> 
