Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF8606A326
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q0aUDT7S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC9310E153;
	Tue,  3 Nov 2026 12:55:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E2710E153
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793710449; x=1825246449;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SqMxalazlh+1njaK5G3tess/2HkAAlwA8+gyb/fp4fU=;
 b=Q0aUDT7SAe8ciOhTSb/uwkzCEh0n1r+8uKTXWXvahXyyswyzQ2vk/EwH
 LtALMGsAexwEqfxIYRUPBvKgjZsb9ogNK/5c4x1/WpHcqssiAwijhjezi
 JfSEu2a8JzSZZqrjGVFTLYFMLCGxZsxqcyCcWZWSxmcSu/G1kI2R/gNHv
 1OMppGGcSEC/KSwfp4ySvc51Qmhb9rIWtLI5dqHF/H4yHqcpHaghfXf+r
 9Z1D+pafpi9siNnFmbskjMhUCCy91CV+yeAzanuVVi7q/81IizgGqCofw
 ZVdHF5vizLMkNiNED8CsWC5BlLaw5UQH+6pi6zCodPeMyLr3OA2FAOAd2 A==;
X-CSE-ConnectionGUID: MWiDLQrRSTiOejQHmbiBgQ==
X-CSE-MsgGUID: 8oVDQYCiTrKjrQ2NZDTdcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2312843"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2312843"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:54:08 -0800
X-CSE-ConnectionGUID: sRRqqIfeR7KpHQZCYy1bIA==
X-CSE-MsgGUID: JwKFC+wdT5ySjH3gu682eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6743018"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:54:07 -0800
Date: Tue, 3 Nov 2026 13:54:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, alex.zuo@intel.com, 
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com
Subject: Re: [PATCH] intel-ci: Block more render tests on CRI
Message-ID: <ydnxt6hteurhl6qept33rzvyxkp6tlgvwel6vr6nbcek4bny5f@hopal4g5tdtu>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, igt-dev@lists.freedesktop.org,
 alex.zuo@intel.com, 
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com
References: <20261102230854.89148-1-jonathan.cavitt@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102230854.89148-1-jonathan.cavitt@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jonathan,
On 2026-11-03 at 07:08:54 +0800, Jonathan Cavitt wrote:
> CRI does not expose a render engine, so the tests
> xe_pat@pat-index-auto@render and xe_oa@unprivileged-single-ctx-counters
> should be blocklisted, as they will hit their skip conditions
> regardless.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 41328186cc..254654422f 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -23,6 +23,8 @@ igt@xe_peer2peer@.*
>  # Valid skip: No render engine support on CRI
>  ##################################################################
>  igt@.*render.*
> +igt@xe_pat@pat-index-auto@render

Dynamic sub-subtest should just avoid being executed, e.g. check
conditions before starting @render.

Regards,
Kamil

> +igt@xe_oa@unprivileged-single-ctx-counters
>  ##################################################################
>  # Valid skip: PAT index tests targeting older/different platforms
>  ##################################################################
> -- 
> 2.43.0
> 
