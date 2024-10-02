Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1D0CF6D3B
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 15:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285AF10E76E;
	Wed,  2 Oct 2024 15:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyXz11tB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C4010E76C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727884246; x=1759420246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MrA2Ba4M8lh6/m60ovCPrZZ6p5bS6EMeR1/wbt8bx/E=;
 b=TyXz11tB9xuIqf72ZuHzu26s90YZ10NINqB97b+78ZIfnc/54P9mMXUs
 6olEUBeTiGqVN0n2Z2kOqqVfBPlTQzKTnpUfCzpvI7iTUiYwoEsyc4a0l
 +5eeIX18EnMm/j4REDse7AmS3KEagyLeBfvyFcgpedAvwFXS48OAQAbgH
 O3p98AACDj4sBksj3C4huwn9xA5oXa9h1jrKJg4i/4M+hA6J0dH18TbHB
 +sdBRQq/hFQIXb4q2TJfZb9oA0tsMXYMqvgaTLICJrHc/vs+uOzotXFon
 Z53R/Ektilx4hzEBSn2w+OowC/jWBWqD2T4KkHlHTXRlq0oNfstuZt75d w==;
X-CSE-ConnectionGUID: 28/h1MG4Q1Oyte35Pj5MIg==
X-CSE-MsgGUID: xg0wk+zES7Whc+WJ8KfvEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44519193"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="44519193"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 08:50:46 -0700
X-CSE-ConnectionGUID: 2pWWAUPFTuqI4Rhi8Cz+zA==
X-CSE-MsgGUID: eBkSS9c9Qj6jNy3Gtpk3Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="78899795"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 08:50:45 -0700
Date: Wed, 2 Oct 2024 17:50:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests: Shut gcc up abput _Atomic(uint64_t)
 alignment
Message-ID: <20241002155041.kdw5gclimpt6nfll@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
 <20240927163307.10159-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927163307.10159-2-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-09-27 at 19:33:06 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 

There is a typo in subject, I would also prefer 'Fix' so:

[PATCH i-g-t 2/3] tests: Fix gcc warnings about _Atomic(uint64_t) alignment

> x86-32 gcc keeps complaining about some alignment ABI change:
> "note: the alignment of ‘_Atomic long long unsigned int’ fields changed in GCC 11.1"
> 
> State the alignment explicitly to make gcc shut up.

s/to make gcc shut up/to silence gcc/

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  tests/dumb_buffer.c           | 2 +-
>  tests/intel/gem_create.c      | 2 +-
>  tests/intel/gem_mmap_offset.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index e1c18c70b09b..dd237467d3f6 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -242,7 +242,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
>  }
>  
>  struct thread_clear {
> -	_Atomic(uint64_t) max;
> +	_Atomic(uint64_t) max __attribute__((aligned(8)));

From checkpatch.pl: prefer __aligned(8)

With or without this __aligned(8) change (and with above subject
and description fixed):

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	uint64_t page_size;
>  	int timeout;
>  	int fd;
> diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
> index ca39a8b64a62..f0749d288dcf 100644
> --- a/tests/intel/gem_create.c
> +++ b/tests/intel/gem_create.c
> @@ -206,7 +206,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
>  }
>  
>  struct thread_clear {
> -	_Atomic(uint64_t) max;
> +	_Atomic(uint64_t) max __attribute__((aligned(8)));
>  	struct drm_i915_gem_memory_class_instance region;
>  	int timeout;
>  	int i915;
> diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
> index c1a9811ff9d1..3f499abedbbb 100644
> --- a/tests/intel/gem_mmap_offset.c
> +++ b/tests/intel/gem_mmap_offset.c
> @@ -716,7 +716,7 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
>  }
>  
>  struct thread_clear {
> -	_Atomic(uint64_t) max;
> +	_Atomic(uint64_t) max __attribute__((aligned(8)));
>  	struct drm_i915_gem_memory_class_instance region;
>  	int timeout;
>  	int i915;
> -- 
> 2.45.2
> 
