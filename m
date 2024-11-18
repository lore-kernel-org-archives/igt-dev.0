Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6679D4921B
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 13:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DBE10E4B8;
	Mon, 18 Nov 2024 13:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxdybquR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5415510E4B8
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731935163; x=1763471163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y2NB7SkRfNr4QZDalZuk2GzoBVRpo1ZgMTFfsl6f/zA=;
 b=cxdybquR8LzlHhd/LEhfVQ2UAfYEe0dQ7TyfZTOrUE+n5ycaH/Qrj9lW
 +gmXpGFxjiGC75idXOHYU12ieDHiaSriiJKKk39kxFR6xXFp2THV9Ue3o
 mDuTU+1bfyiv2bpeiLMWBsgH5pzHHIm0npZlsPh5n4xyxJOopolPrf2AO
 Ag9T/Qh/WBXyJ5wQnhieaFlHpusaEJP3PyZuXYjJSiLRElFuN6AOO8z1J
 TsnGEZw7x6qqfq7J5ZZhwlEujyD8AidmkGwqGM1R0W6Lj8aIaCN91x4eU
 oyCZZx4D6y3Kn2zC8WOx/Xu2pCPzAsvEh7AOe39tItYNYH3CXWB+oqiIC w==;
X-CSE-ConnectionGUID: TKfys3t/T/KML6UPwMu98g==
X-CSE-MsgGUID: 0CoVj9v2SniRm3djA42Ygw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49323514"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="49323514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 05:06:02 -0800
X-CSE-ConnectionGUID: IjgYcRiQRpehn1q01rV/8Q==
X-CSE-MsgGUID: fvpAeQOrTnWbxzxTFS39og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89369056"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 05:06:01 -0800
Date: Mon, 18 Nov 2024 14:05:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel-ci: Block all gem_exec_fair tests
Message-ID: <20241118130558.ksvdb4cr3jszzp5p@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20241118111528.4190241-1-katarzyna.piecielska@intel.com>
 <20241118111528.4190241-2-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118111528.4190241-2-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-11-18 at 11:15:28 +0000, Katarzyna Piecielska wrote:
> As i915 schedules is not going to be improved there is no need to
> execute gem_exec_fair tests. For now let's keep them for future
> reference.
> 
> Ref:
> https://gitlab.freedesktop.org/drm/intel/issues/2842
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12786
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/blacklist.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index cfc5491d5..d0b39111c 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -29,7 +29,7 @@ igt@gem_evict_alignment(@.*)?
>  igt@gem_evict_everything(@.*)?
>  igt@gem_exec_big@(?!.*single).*
>  igt@gem_exec_capture@many-.*
> -igt@gem_exec_fair@(?!.*basic).*
> +igt@gem_exec_fair(@.*)?
>  igt@gem_exec_fence@.*hang.*
>  igt@gem_exec_flush@(?!.*basic).*
>  igt@gem_exec_latency(@.*)?
> -- 
> 2.34.1
> 
