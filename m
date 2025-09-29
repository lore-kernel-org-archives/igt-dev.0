Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CA2CAC5B5
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 14:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C811010E448;
	Mon, 29 Sep 2025 14:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSThgcXs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05E210E448
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759157924; x=1790693924;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bZdKA1Gbm09dtKEX1mj2MiXMnUQyL6OMtBEcQ6qZjX8=;
 b=eSThgcXsh3IDXNmSVeGuBzjx1VcJ9KJ8vxA6P1mbXr5TNbEkYxxDNn+/
 u+9y1Bteirhr17Uzr2uS1IZpnyOXj9gwg9ghUVvnHNIwGGUN5oqxWDK+0
 aaVk75YCz3wrkr/sE2o1dliH/Qzj4hcRBdwdnc+15lXX85hRLthILPDT0
 Bc0mu/A/ssfkkv0cFF1Jl6aPp7v5NqNMEMoABn/fg+ne5hqTVR27F3Bji
 a5Y65TD+Z2f1Ghxw+xO76Y4Yiw2BEBMYMjWtxgbhtKIb4P1BVdreh7KV8
 zgZkSWCGjidy+O+UUZ4WlOA/tHC+dtJZQ1PRjmqoVqmo5JG0FKFr0IFbU Q==;
X-CSE-ConnectionGUID: GADTws7KTZSAUQBn44EvUg==
X-CSE-MsgGUID: mkoErZxCQPuqSRW4PGbhPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="60612042"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="60612042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 07:58:43 -0700
X-CSE-ConnectionGUID: c1XQ+aShTqWzjM/wLh6ulw==
X-CSE-MsgGUID: HnPb0V3LRJWYzG8+FfUhOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177380570"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.245.245.231])
 ([10.245.245.231])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 07:58:41 -0700
Message-ID: <478b0f10-0e1e-4b4e-bb94-554c0ff08493@intel.com>
Date: Mon, 29 Sep 2025 15:58:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_mmap: Fix truncation of visible VRAM
 size
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250929142523.525117-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250929142523.525117-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29/09/2025 15:25, Marcin Bernatowicz wrote:
> xe_visible_vram_size() returns a 64-bit value. Storing it in 32-bit
> truncated sizes above 4 GiB and led to false positives.
> 
> Fixes: c93b4e6ff2f3 ("tests/xe/mmap: sanity check small-bar")
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>   tests/intel/xe_mmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
> index 9b87a9534..79c611f52 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -291,7 +291,7 @@ static void trap_sigbus(uint32_t *ptr)
>   static void test_small_bar(int fd)
>   {
>   	size_t page_size = xe_get_default_alignment(fd);
> -	uint32_t visible_size = xe_visible_vram_size(fd, 0);
> +	uint64_t visible_size = xe_visible_vram_size(fd, 0);

Out of curiosity, did you actually hit this issue on some real config? 
Typically you get 256M, if you ever see small-bar. I think you can get 
larger values, but I don't think I have ever seen anything as large as > 4G.

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   	uint32_t bo;
>   	uint64_t mmo;
>   	uint32_t *map;

