Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701F6CAC597
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 12:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2075F10E46E;
	Mon, 15 Sep 2025 12:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wl/WhsPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E6A10E46E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757938133; x=1789474133;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7vU/RH7eOumM89bXZ8fXYO3acPCSibRUfYjcq5cKkwI=;
 b=Wl/WhsPMLBeaA9uDgrQ+N3MU5vJVJs+DUjyo+FLOYI6nfBxsExXb4NZJ
 /fIto0mzJXCGdbz1wkhGdhrPoLlvhEdiOMm5a3HBDeV7SLiHfkSjB7Dkb
 gOnbhWrVAfDQG/wvBaFFzwAeljdo3gVyLiIQ6CKQiTAhFvWyYt3gs5Me0
 UD1Y5xcuolrWh1bEf1O9goL1LgoWNK/aWkr6kZEZncuOqT6TP+GqjdQfm
 uopUJuu3pRKxxL4gC1Ragak6VG8ujOcl/Dj7AHrYMsWquWkyer3m2lnLz
 eqvcSnSOliSWSWNHLoknjKXXpfFi31eXn6RuC0a6crVmiVn1Rj1bg6IUh g==;
X-CSE-ConnectionGUID: i1I29/ORQ1y3gOkSoFbGag==
X-CSE-MsgGUID: R0BlGx9MSiCiY3fY15kbfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="70437744"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="70437744"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:08:53 -0700
X-CSE-ConnectionGUID: PZWBvny7RayPDPCgwLpiNA==
X-CSE-MsgGUID: /xKAJBF5SKubrwABJNcuPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="175413202"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:08:50 -0700
Date: Mon, 15 Sep 2025 14:08:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: pravalika.gurram@intel.com
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH v6 2/2] intel-ci: Blocklist compression PAT index for LNL
Message-ID: <20250915120829.ghqdzoe3wz3kl5vp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 pravalika.gurram@intel.com, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com, himal.prasad.ghimiray@intel.com
References: <20250915105057.1468276-1-pravalika.gurram@intel.com>
 <20250915105057.1468276-3-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250915105057.1468276-3-pravalika.gurram@intel.com>
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

Hi pravalika.gurram,
On 2025-09-15 at 16:20:57 +0530, pravalika.gurram@intel.com wrote:
> From: Pravalika Gurram <pravalika.gurram@intel.com>
> 
> Madvise does not support compression on LNL.
> Therefore, compression-related PAT index
> test cases have been blocklisted for this platform.
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe.lnl.core.blocklist.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> index 1e69170d8..3a21d7263 100644
> --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> @@ -83,3 +83,9 @@ igt@xe_live_ktest@xe_eudebug
>  igt@xe_oa@oa-tlb-invalidate
>  igt@xe_oa@unprivileged-single-ctx-counters
>  ##################################################################
> +# Expected fail as per the current behaviour compression
> +# for madvise needs to skipped on LNL
> +##################################################################
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-.*
> +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-.*
> +##################################################################
> -- 
> 2.34.1
> 
