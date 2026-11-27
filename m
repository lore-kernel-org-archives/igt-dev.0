Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A4606A329
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DSYOAENj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FB610E58E;
	Fri, 27 Nov 2026 13:28:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9E210E597
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795786055; x=1827322055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JMDLgbE92VUx9siAMoIsINOFLK0G2eGrJrms4bSRDD4=;
 b=DSYOAENjqskE85F7fbFxiJwbYEMvO5CH2cE7/apfLZXNPzL2FMvrx3BB
 PaQfxRTY99O9VvYGkMgnsYqoPln2IJYK8NEh5jX7i3EXhMLsQ5uESv/r4
 TgBRpbtZv0O/Ly5hSRTijj1xVmNC1H1q4wSc6G+MfmeNcemrY8ibgnSP9
 6jH1Lz0QLVzEoVJk5hnRgpMIk87KTToPuCT3k8rWvOF/ZGqrP7/yniwXa
 ccWXBr+vHCPaKmeureODhO5qr5HjcedjopCQ4VijpGtEmWYKBUBsi+Ucu
 +ReHtX43W5CooFWRqZu4uxbmnJ76bP8k3oB0eQdLsYqS5VvWcwGuIAryx w==;
X-CSE-ConnectionGUID: suZVUDI3SOK/4raW9wW28A==
X-CSE-MsgGUID: 4kLqGQ/tTqOtpH804GgtCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4688286"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4688286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:27:34 -0800
X-CSE-ConnectionGUID: eL/ScK0zTvi9ZtXme3TbXQ==
X-CSE-MsgGUID: ZQpgehS6QNWmCYThsjZbrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12817373"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:27:33 -0800
Date: Fri, 27 Nov 2026 14:27:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com, 
 himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t v2] intel-ci: Update blocklist for CRI core
Message-ID: <torhq53c5gvglyr4rqpquog5le5fw2w46pdbnyvlbp6ntkmpak@lyfv5bze7ebm>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com, 
 himanshu.girotra@intel.com
References: <20261127122818.5410-1-venkateswara.rao.muppidi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261127122818.5410-1-venkateswara.rao.muppidi@intel.com>
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

Hi Venkateswara,
On 2026-11-27 at 17:58:18 +0530, Venkateswara Rao Muppidi wrote:
> Add two more valid skips to the CRI core blocklist:
> 
> - xe_evict@evict(-beng)?-large-multi-vm(-cm)?: bo_size is 3/8 of VRAM,
>   which exceeds the usable system memory on CRI. The working set size
>   evaluates to zero and the test skips.
> - xe_survivability@runtime-survivability: csc_hw_err debugfs support is
>   not currently required on CRI, so the test is skipped.
> 
> V2:
> CPU-bind implementation replaced the legacy GPU-bind mechanism on CRI,
> so the test is not applicable.
> 
> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 6b77523d6..2a708e50e 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -76,3 +76,17 @@ igt@xe_mmap@small-bar
>  ##################################################################
>  igt@xe_vm@single-op-map-mirror-over-bound
>  ##################################################################
> +#Valid Skip: bo_size (3/8 of VRAM) exceeds usable system
> +# memory -> ws==0 -> skip
> +##################################################################
> +igt@xe_evict@evict(?:-beng)?-large-multi-vm(?:-cm)?
> +##################################################################
> +# Valid Skip: csc_hw_err debugfs support is currently not required
> +##################################################################
> +igt@xe_survivability@runtime-survivability
> +##################################################################
> +#Valid Skip: CPU-bind implementation replaced legacy GPU-bind
> +# mechanism
> +##################################################################
> +igt@xe_vm@bind-array-enobufs
> +##################################################################
> -- 
> 2.43.0
> 
